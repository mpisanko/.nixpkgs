{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  packageOverrides = pkgs_: with pkgs_;
    let jdk = openjdk10; in {

    bash-config = import ./bash-config {
      inherit (pkgs) stdenv fzf; inherit jdk;
    };
    my-vim = import ./vim-config { inherit pkgs ; };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        bash-config

        nix-repl
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
        gitg
        meld
        tig

        firefoxWrapper
        jq

        jdk
        leiningen
        boot
        maven
        idea.idea-community

        python36
        gcc

        nim
        ponyc

        python36Packages.glances

        python36Packages.docker_compose
        vagrant
        ansible2

        libreoffice
        vlc
        hexchat
        
        slack
        spotify
      ];
    };
  };
}
