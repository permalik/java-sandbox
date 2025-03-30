{
  description = "java_curricula";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = false;
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.alejandra
            pkgs.temurin-bin
            pkgs.scala_2_13
            pkgs.scala
            pkgs.sbt
            pkgs.pkgs.clojure
          ];

          shellHook = ''
            export JAVA_HOME=${pkgs.temurin-bin}/lib/openjdk
            # export PATH=$JAVA_HOME/bin:$PATH
            # Custom Prompt
            export PS1="\n\[\e[1;32m\][devshell](java) \w\n❯ \[\e[0m\]"
          '';
        };
      }
    );
}
