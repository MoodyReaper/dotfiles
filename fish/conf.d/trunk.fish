# Run only on login
if status --is-login
    # https://docs.trunk.io/reference/usage-data
    set -gx TRUNK_MIXPANEL off
end
