{
  description = "Bitwig 6 Beta FHS Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.buildFHSEnv {
        name = "bitwig-studio";

        targetPkgs = pkgs: with pkgs; [
          # Context for the fix:
          cairo
          xorg.xcbutilcursor # Replaces invalid 'cursor'
          xorg.xcbutilwm     # Adds missing icccm lib
          dbus

          # Core dependencies
          alsa-lib
          # cursor

          fontconfig
          freetype
          gdk-pixbuf
          glib
          gtk3
          libglvnd
          libxkbcommon
          pipewire
          vulkan-loader
          zlib

          # for file dialog
          pango
          harfbuzz
          at-spi2-atk

          # X11 libs
          xorg.libX11
          xorg.libXcursor
          xorg.libXext
          xorg.libXrandr
          xorg.libxcb
          xorg.xcbutil
          xorg.xcbutilimage
          xorg.xcbutilrenderutil
        ];

        runScript = "bash -c 'exec ./opt/bitwig-studio/bitwig-studio \"$@\"'";
      };
    };
}



#run with
# nix run . -- -c "./opt/bitwig-studio/bitwig-studio"
