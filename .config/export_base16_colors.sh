#!/bin/sh

for i in `sh ~/.config/base16-shell/colortest | sed -n 's/\(.*\)\(base[^ ]*\) \([^ ]*\)\(.*\)/\2#\3/p'`;do
  export ${i:0:6}=${i:6}
done
