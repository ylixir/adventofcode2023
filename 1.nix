/*
Copyright © 2023 Jon "ylixir" Allen <adventofcode2023@ylixir.io>
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.
*/

# nix-instantiate --eval 1.nix --arg value 1
/*
$ nix-instantiate --eval 1.nix --argstr value "$(cat 1.example)"
$ nix-instantiate --eval 1.nix --argstr value "$(cat 1.input)"
*/

with builtins;
with (import <nixpkgs> {});
let
  inherit (lib.strings) splitString toInt;
  inherit (lib.lists) fold;
  lines = splitString "\n";
  killWords = replaceStrings ["zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"] ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9"];
  firstDigit = s: head (match "[^0-9]*([0-9]).*" s);
  lastDigit = s: head (match ".*([0-9])[^0-9]*" s);
  # leading zeros can cause issues with "toInt" and "toIntBase10" isn't working
  coord = s: toInt(firstDigit s)*10 + toInt(lastDigit s);
  coords = s: map (l: coord (killWords l)) (lines s);
  coordSum = s: fold add 0 (coords s);
in
{value}: coordSum value
