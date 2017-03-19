vpn=$(pgrep -x openvpn)
if [[ -n $vpn ]]; then
  echo "%{F#2D2B28 B#00000000 T4}%{B- F- T-}%{F#FCE8C3 B#2D2B28} VPN  Con %{F- B-}%{F#2D2B28 B#00000000 T4}%{F- B- T-}"
else
  echo "%{F#F75341 B#00000000 T4}%{B- F- T-}%{F#FCE8C3 B#F75341} VPN  Dis %{F- B-}%{F#F75341 B#00000000 T4}%{F- B- T-}"
fi
