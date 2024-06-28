{
  lib,
  stdenvNoCC,
  makeWrapper,
  scdoc,
  coreutils,
  libnotify,
  playerctl,
}: let
  name = "playercontrol";
in
  stdenvNoCC.mkDerivation {
    pname = name;
    version = "0.1";

    src = ./.;

    nativeBuildInputs = [
      makeWrapper
    ];

    buildInputs = [
      scdoc
    ];

    makeFlags = ["PREFIX=$(out)"];

    postInstall = ''
      wrapProgram $out/bin/${name} --prefix PATH ':' \
        "${lib.makeBinPath [
        coreutils
        libnotify
        playerctl
      ]}"
    '';

    meta = with lib; {
      description = "playerctl helper script";
      license = licenses.mit;
      platforms = platforms.unix;
      maintainers = with maintainers; [comfysage];
      mainProgram = name;
    };
  }
