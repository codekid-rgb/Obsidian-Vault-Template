{
  description = "Eugene's Obsidian life vault — farm, shop, faith, and daily accountability";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            git
            claude-code
          ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
            obsidian
          ];

          shellHook = ''
            echo ""
            echo "Vault ready."
            echo "  claude      — open Claude Code in this vault"
            echo "  /daily      — create today's note"
            echo "  /morning    — morning brief"
            echo "  /evening    — evening debrief"
            echo "  /weekly     — Sunday review"
            ${pkgs.lib.optionalString pkgs.stdenv.isLinux
              ''echo "  obsidian    — open vault in Obsidian"''}
            ${pkgs.lib.optionalString pkgs.stdenv.isDarwin
              ''echo "  Note: on macOS install Obsidian from obsidian.md (not in nixpkgs)"''}
            echo ""
          '';
        };
      }
    );
}
