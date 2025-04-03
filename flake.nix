{
  description = "A very basic flake";

  outputs = { self, nixpkgs, }: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    devShells.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux;
      mkShell {
        buildInputs = [
          vscode-langservers-extracted
          live-server
          nodePackages.browser-sync
          tailwindcss-language-server
        ];
      };
  };
}
