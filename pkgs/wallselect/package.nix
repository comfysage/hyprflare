{
  lib,
  stdenvNoCC,
  makeWrapper,
  scdoc,
  coreutils,
  libnotify,
  rofi-wayland,
}: let
  name = "wallselect";
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
        rofi-wayland
      ]}"
    '';

    meta = with lib; {
      description = "quick wallpaper selector";
      license = licenses.mit;
      platforms = platforms.unix;
      maintainers = with maintainers; [comfysage];
      mainProgram = name;
    };
  }
