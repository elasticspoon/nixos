{ bundlerApp }:
bundlerApp {
  pname = "standard";
  gemdir = ./.;
  exes = [ "standardrb" ];
}
