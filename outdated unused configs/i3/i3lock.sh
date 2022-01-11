#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
INSIDE='#676E7D'
DEFAULT='#2F343F'
TEXT='#F3F3F3'
WRONG='#E53935'
VERIFYING='#757575'
TYPE='#676E7D'

FONT='Noto Sans Regular'

i3lock \
--insidever-color=$INSIDE    \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$INSIDE  \
--ringwrong-color=$WRONG     \
\
--inside-color=$INSIDE       \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--modif-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$TYPE          \
--bshl-color=$WRONG          \
\
--time-font=$FONT            \
--date-font=$FONT            \
--layout-font=$FONT          \
--verif-font=$FONT           \
--wrong-font=$FONT           \
--greeter-font=$FONT         \
\
--time-size=42               \
\
\
--date-pos=tx:ty+50          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--radius=120                 \
--ring-width=13              \
--time-str="%H:%M:%S"        \
--date-str="%A"              \
--keylayout 2                \
--composite                  \
--nofork                     \