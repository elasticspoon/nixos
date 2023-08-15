{ pkgs, ... }:
let
  standardrb = pkgs.callPackage ../../pkgs/standard { };
in
{
  #TODO: add to fix this to work across nix and ubuntu
  home.file = {
    ".railsrc".source = ./config/railsrc;
    # ".config/rubocop/config.yml".source = ./config/rubocop.yml;
    ".config/rubocop/config.yml".text = ''
      AllCops:
        DisabledByDefault: true
    '';
    ".solargraph.yml".source = ./config/solargraph.yml;
    ".erb-lint.yml".source = ./config/erb-lint.yml;
    ".irbrc".source = ./config/irbrc;
  };

  home.packages = with pkgs; [
    gnumake # for building neovim gem deps
    bundix

    (ruby_3_2.withPackages (ps:
      with ps; [
        standardrb
        solargraph
      ])) # includes ruby_3_2 and gems
  ];
}
