# Run only on login
if status --is-login
    # https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VDPAU
    set -gx VDPAU_DRIVER radeonsi
end
