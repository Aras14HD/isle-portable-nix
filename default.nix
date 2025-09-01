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
    rev = "78ee45296bb0b465c42f15eda3d4537564579a76";
    sha256 = "sha256-RXZte9lQyUl3ymMEvj4Uyl7eBdnW9dyTwa5aKw138mw=";
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
