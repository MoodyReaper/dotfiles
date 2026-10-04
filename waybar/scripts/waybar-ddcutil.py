#!/usr/bin/env python3

# TODO: finish

import json
import subprocess  # nosec B404: This utility intentionally invokes ddcutil.


def main() -> None:
    # The command is fixed, takes no user input, and runs without a shell.
    value = subprocess.run(  # nosec B603: Fixed executable and arguments; no shell or user input.
        ["/usr/bin/ddcutil", "getvcp", "10"], check=True, stdout=subprocess.PIPE, text=True
    ).stdout
    percentage = value.split(":")[1].split(",")[0].split("=")[1].strip()
    print(json.dumps({"percentage": int(percentage)}))


if __name__ == "__main__":
    main()
