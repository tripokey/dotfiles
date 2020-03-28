self: super:
{
  polychromatic = let
    version = "2020-03-10";
    polychromatic_src = self.stdenv.mkDerivation {
      name = "polychromatic-src";

      src = self.fetchFromGitHub {
        owner = "polychromatic";
        repo = "polychromatic";
        rev = "783ab1d28022fe6f71f4b8455ebf08e2fef005cd";
        sha256 = "0bk2f4ay4k4hrrq82c76rnmdjcn20973kkzn3xx2kb5wj6aqxa5y";
      };

      buildCommand = ''
        mkdir -p $out
        cp -r $src/* $out

        cat <<EOF > $out/setup.py
#!${super.pkgs.python37}
from distutils.core import setup
import glob

data_files = []

directories = glob.glob('data/**/', recursive=True)
for directory in directories:
  files = glob.glob(directory+'*.*')
  data_files.append(('bin/' + directory, files))

directories = glob.glob('install/**/', recursive=True)
for directory in directories:
  files = glob.glob(directory+'*.svg')
  data_files.append(('bin/' + directory, files))

setup(
  name = 'polychromatic',
  version = '${version}',
  packages = [
    'pylib',
  ],
  data_files = data_files,
  scripts = [
    'polychromatic-controller',
    'polychromatic-tray-applet',
    ],
)
EOF
        chmod +x $out/setup.py
      '';
    };
  in self.pkgs.python37Packages.buildPythonPackage {
    pname = "polychromatic";
    version = "${version}";

    propagatedBuildInputs = with self.pkgs; [
      python37Packages.openrazer
      python37Packages.distro
      python37Packages.pygobject3
      python37Packages.setproctitle
      python37Packages.requests
      libappindicator
      lessc
      imagemagick
      webkit
      gtk3
      gobjectIntrospection
      wrapGAppsHook
    ];

    src = "${polychromatic_src}";

    doCheck = false;
  };
}
