{
  stdenv,
  fetchgit,
  pkg-config,
  cmake,
  lib,
  sdl3,
  iniparser,
  python311,
  glew,
  qt6,
}:

stdenv.mkDerivation {
  pname = "isle-portable";
  version = "0.0.2";

  src = fetchgit {
    url = "https://github.com/isledecomp/isle-portable.git";
    rev = "f2b6188d898256b041c9c3f843f4e12e3b465698";
    sha256 = "sha256-ASLjeek5zRZG21ydqOsO3300KdIwFwVGYKo+pbrweUQ=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    pkg-config
    cmake
  ];

  buildInputs = [ sdl3 iniparser python311 glew qt6.qtbase qt6.wrapQtAppsHook ];

  preConfigure = ''
    cmakeFlagsArray+=(
      "-DDOWNLOAD_DEPENDENCIES=OFF"
    )
  '';
  

  meta = with lib; {
    description = "A protable Lego Island decomp";
    longDescription = ''
        The portable version allows running Lego Island natively
    '';

    homepage = "https://github.com/isledecomp/isle-portable";

    license = licenses.unfree;

    mainProgram = "isle";

    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };

}
