# Run only on login
if status --is-login
    # https://docs.trunk.io/docs/usage-data#can-i-disable-usage-data
    set -gx TRUNK_MIXPANEL off
end
