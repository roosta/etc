# PARAM=(--textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e \
#        --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 \
#        --separatorcolor=22222260 --insidevercolor=0000001c \
#        --ringwrongcolor=00000055 --insidewrongcolor=0000001c)

PARAM=(--textcolor=FCE8C3FF --insidecolor=ffffff00 --ringcolor=2D2B28FF \
       --linecolor=1C1B19ff --keyhlcolor=98BC37FF --ringvercolor=00000000 \
       --separatorcolor=1C1B19ff --insidevercolor=0000001c \
       --ringwrongcolor=FF3128ff --insidewrongcolor=0000001c \
       --bshlcolor=F75341ff --blur)

# try to use a forked version of i3lock with prepared parameters
if ! i3lock -n "${PARAM[@]}" -c "#1c1b19" > /dev/null 2>&1; then
    # We have failed, lets get back to stock one
    i3lock -n -i "$IMAGE"
fi
