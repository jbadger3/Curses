#!/bin/bash

find Sources/Cncurses/include -name '*.h' -exec sed -i ''  's/__NCURSES_H/__CNCURSES_H/g' {} \;
find Sources/Cncurses/include -name '*.h' -exec sed -i '' -E -e "s/<(.*(`find . -name '*.h' -exec basename {} \; |  paste -sd "|" -`))>/\"\1\"/g"  {} \;
