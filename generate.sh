#! /bin/bash
run() {
  echo "$*"
  eval "$*"
}
find -type f -path '*-*/*/*.ebuild' | while read ebuild
do
  if [ $ebuild -nt $(dirname $ebuild)/Manifest ]
  then
    run rm -f $(dirname $ebuild)/Manifest
    run "sudo ebuild $ebuild digest"
  fi
done
run "echo -n > profiles/categories"
find .  -maxdepth 1 -type d -name '*-*' -printf '%f\n' | sort -u | while read dir
do
  run "echo $dir >> profiles/categories"
done
