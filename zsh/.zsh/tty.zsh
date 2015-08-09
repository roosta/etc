
#!/bin/sh
# ┌───────────────────────────────┐
# │░█░█░█▀█░█▀█░█▀█░░░▀█▀░▀█▀░█░█░│
# │░█▀█░█▀█░█░█░█▀█░░░░█░░░█░░░█░░│
# │░▀░▀░▀░▀░▀░▀░▀░▀░░░░▀░░░▀░░░▀░░│
# └───────────────────────────────┘

# add color scheme "sweetlove" for linux console
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P04a3637
  \e]P1d17b49
  \e]P27b8748
  \e]P3af865a
  \e]P4535c5c
  \e]P5775759
  \e]P66d715e
  \e]P7c0b18b
  \e]P8402e2e
  \e]P9ac5d2f
  \e]PA647035
  \e]PB8f6840
  \e]PC444b4b
  \e]PD614445
  \e]PE585c49
  \e]PF978965
  "
  # get rid of artifacts
  clear
fi
