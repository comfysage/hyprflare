{
  lib,
  stdenvNoCC,
  makeWrapper,
  scdoc,
  coreutils,
  libnotify,
  cliphist,
  rofi-wayland,
}: let
  name = "quickhist";
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
        cliphist
        rofi-wayland
      ]}"
    '';

    meta = with lib; {
      description = "";
      license = licenses.mit;
      platforms = platforms.unix;
      maintainers = with maintainers; [comfysage];
      mainProgram = name;
    };
  }
