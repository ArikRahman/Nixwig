# Run Bitwig Studio via Nix
run:
    nix run . -- -c "./opt/bitwig-studio/bitwig-studio"

# Alias in case you prefer typing 'just bitwig'
bitwig: run
