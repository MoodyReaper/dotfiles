# Run only on login
if status --is-login
  # https://wiki.archlinux.org/title/GNOME/Keyring#Setup_gcr
  # set SSH_AUTH_SOCK as $XDG_RUNTIME_DIR/gcr/ssh
  set -gx SSH_AUTH_SOCK (echo $XDG_RUNTIME_DIR/gcr/ssh)
end
