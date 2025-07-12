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
    rev = "7c91a14875751ca1c3571ae35825040000178129";
    sha256 = "sha256-hR21TIJc4lzioigvJb4L+/CkQob9f5lVqRNMYDsbjZk=";
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
