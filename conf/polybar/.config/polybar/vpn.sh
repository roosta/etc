vpn=$(pgrep -x openvpn)
if [[ -n $vpn ]]; then
  echo "%{B#00000000 F#FCE8C3 T3}%{B- F- T-}%{F#FCE8C3 B#2D2B28} VPN  Con %{F- B-}%{F#2D2B28 B#FCE8C3 T3}%{F- B- T-}"
else
  echo "%{B#F75341 F#2D2B28}%{F-} VPN  Dis "
fi
