{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_;
    let jdk = openjdk; in {

    bash-config = import ./bash-config {
      inherit (pkgs) stdenv fzf jdk;
    };
    my-vim = import ./vim-config { inherit pkgs ; };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        bash-config

        nix-prefetch-scripts
        nixpkgs-lint
        nox

        fzf
        ripgrep

        my-vim
        emacs

        telnet
        bind
        netcat-openbsd

        powerline-fonts

        gnumake

        tree

        git
        git-radar
        meld
        tig

        jq

        jdk
        clojure
        leiningen
        boot
        maven

        gcc

        ponyc

        vagrant
        ansible2

      ];
    };
  };
}
