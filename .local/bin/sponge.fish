#!/usr/bin/env fish
set temp (mktemp)
function trap-exit --on-process-exit %self
  rm "$temp"
end
cat >"$temp"
cat "$temp"
