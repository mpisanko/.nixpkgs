{stdenv, fzf, jdk}:

stdenv.mkDerivation rec {
  name = "bash-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    substitute $src/bashrc $out/userHome/.bashrc \
      --subst-var-by fzf_src ${fzf.src}
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by jdk ${jdk}
  '';
}
