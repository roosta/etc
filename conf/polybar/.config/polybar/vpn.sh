tunnel=$(ip link show|awk '/(tun|pon)/{print substr($2, 1, 4)}')
if [[ ! -z $tunnel ]]; then
  echo "VPN %{F#98BC37 T5}%{F- T-}"
else
  echo "VPN %{F#F75341 T5}%{F- T-}"
fi
