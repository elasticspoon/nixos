{ bundlerApp }:
bundlerApp {
  pname = "erb-formatter";
  gemdir = ./.;
  exes = [ "erb-format" ];
}
