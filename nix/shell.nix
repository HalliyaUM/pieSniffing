# This is a flake-parts module that is responsible for providing the development
# shell with the necessary tooling
{
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    system,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "pie-sniffing-dev";
      packages = with pkgs; [
        ## C tooling
        clang # Compiler
        clang-tools # Gives you clangd, clang-format, etc.

        ## Nix tooling
        nil # Nix LSP
        statix # Linter
        deadnix # Dead-code checker
        alejandra # Formatter
      ];
    };
  };
}
