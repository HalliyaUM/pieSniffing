{
  description = "A USB sniffer firmware for the Raspberry Pi Pico.";

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      # Import the component parts of the flake
      imports = [
        ./nix/shell.nix # Development shell
      ];

      # Define the platforms to be supported by this flake
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}
