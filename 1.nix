/*
Copyright © 2023 Jon "ylixir" Allen <adventofcode2023@ylixir.io>
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.
*/

# nix-instantiate --eval 1.nix --arg value 1

with builtins;
let testFunc = n: n+1; in
{value}: testFunc value
