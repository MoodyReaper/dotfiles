#!/usr/bin/env python3
# mypy: ignore-errors

import argparse
import json
import logging
import signal
import sys
from typing import TYPE_CHECKING

import gi

if TYPE_CHECKING:
    from types import FrameType

gi.require_version("Playerctl", "2.0")
from gi.repository import GLib, Playerctl  # noqa: E402

logger = logging.getLogger(__name__)


def write_output(text: str, player: Playerctl.Player) -> None:
    logger.info("Writing output")

    output = {
        "text": text,
        "class": "custom-" + player.props.player_name,
        "alt": player.props.player_name,
    }

    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


def on_play(
    player: Playerctl.Player,
    _status: Playerctl.PlaybackStatus,
    manager: Playerctl.PlayerManager,
) -> None:
    logger.info("Received new playback status")
    on_metadata(player, player.props.metadata, manager)


def on_metadata(
    player: Playerctl.Player,
    metadata: GLib.Variant,
    _manager: Playerctl.PlayerManager,
) -> None:
    logger.info("Received new metadata")
    track_info = ""

    if (
        player.props.player_name == "spotify"
        # GLib.Variant requires membership tests against its keys.
        and "mpris:trackid" in metadata.keys()  # noqa: SIM118
        and ":ad:" in player.props.metadata["mpris:trackid"]
    ):
        track_info = "AD PLAYING"
    elif player.get_artist() != "" and player.get_title() != "":
        track_info = f"{player.get_artist()} - {player.get_title()}"
    else:
        track_info = player.get_title()

    if player.props.status != "Playing" and track_info:
        track_info = " " + track_info
    write_output(track_info, player)


def on_player_appeared(
    manager: Playerctl.PlayerManager,
    player: Playerctl.PlayerName | None,
    selected_player: str | None = None,
) -> None:
    if player is not None and (selected_player is None or player.name == selected_player):
        init_player(manager, player)
    else:
        logger.debug("New player appeared, but it's not the selected player, skipping")


def on_player_vanished(_manager: Playerctl.PlayerManager, _player: Playerctl.Player) -> None:
    logger.info("Player has vanished")
    sys.stdout.write("\n")
    sys.stdout.flush()


def init_player(manager: Playerctl.PlayerManager, name: Playerctl.PlayerName) -> None:
    logger.debug("Initialize player: %s", name.name)
    player = Playerctl.Player.new_from_name(name)
    player.connect("playback-status", on_play, manager)
    player.connect("metadata", on_metadata, manager)
    manager.manage_player(player)
    on_metadata(player, player.props.metadata, manager)


def signal_handler(_sig: int, _frame: FrameType | None) -> None:
    logger.debug("Received signal to stop, exiting")
    sys.stdout.write("\n")
    sys.stdout.flush()
    # loop.quit()
    sys.exit(0)


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    # Increase verbosity with every occurrence of -v
    parser.add_argument("-v", "--verbose", action="count", default=0)

    # Define for which player we're listening
    parser.add_argument("--player")

    return parser.parse_args()


def main() -> None:
    arguments = parse_arguments()

    # Initialize logging
    logging.basicConfig(
        stream=sys.stderr,
        level=logging.DEBUG,
        format="%(name)s %(levelname)s %(message)s",
    )

    # Logging is set by default to WARN and higher.
    # With every occurrence of -v it's lowered by one
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    # Log the sent command line arguments
    logger.debug("Arguments received %s", vars(arguments))

    manager = Playerctl.PlayerManager()
    loop = GLib.MainLoop()

    manager.connect("name-appeared", lambda *args: on_player_appeared(*args, arguments.player))
    manager.connect("player-vanished", on_player_vanished)

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    signal.signal(signal.SIGPIPE, signal.SIG_DFL)

    for player in manager.props.player_names:
        if arguments.player is not None and arguments.player != player.name:
            logger.debug("%s is not the filtered player, skipping it", player.name)
            continue

        init_player(manager, player)

    loop.run()


if __name__ == "__main__":
    main()
