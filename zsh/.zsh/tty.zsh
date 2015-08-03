
#!/bin/sh
# ┌───────────────────────────────┐
# │░█░█░█▀█░█▀█░█▀█░░░▀█▀░▀█▀░█░█░│
# │░█▀█░█▀█░█░█░█▀█░░░░█░░░█░░░█░░│
# │░▀░▀░▀░▀░▀░▀░▀░▀░░░░▀░░░▀░░░▀░░│
# └───────────────────────────────┘

# add color scheme "hana" for linux console
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P02b2b2b
  \e]P1a8334d
  \e]P2a5c261
  \e]P3e7a83f
  \e]P43c589e
  \e]P56f5b94
  \e]P62f8b46
  \e]P7e0d4c9
  \e]P8473444
  \e]P9c55d66
  \e]PA8fb977
  \e]PBe4d849
  \e]PC57839f
  \e]PDb6b3eb
  \e]PE519f50
  \e]PFf9f7f3
  "
  # get rid of artifacts
  clear
fi
