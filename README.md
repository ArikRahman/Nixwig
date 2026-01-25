Working Bitwig 6 functionality with Nix!

Tested with Bitwig 6 beta 9 on NixOS.

Simply run with

nix run . -- -c "./opt/bitwig-studio/bitwig-studio"

Setup instructions:

1. Extract bitwig-studio-6.0-beta-9.deb
2. Extract data.tar.zst
3. Should see opt and usr folders. place flake.nix and flake.lock in the folder containg opt and usr. 
4. Run the above nix command.
