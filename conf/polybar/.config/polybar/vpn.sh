vpn=$(pgrep -x openvpn)
if [[ -n $vpn ]]; then
  echo "%{F#2D2B28 B#00000000 T4}%{B- F- T-}%{F#519F50 B#2D2B28} VPN %{F- B-}%{F#2D2B28 B#00000000 T4}%{F- B- T-}"
else
  echo "%{F#2D2B28 B#00000000 T4}%{B- F- T-}%{F#F75341 B#2D2B28} VPN %{F- B-}%{F#2D2B28 B#00000000 T4}%{F- B- T-}"
fi
