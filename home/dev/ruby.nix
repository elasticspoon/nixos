{ pkgs, ... }:
let
  standardrb = pkgs.callPackage ../../pkgs/standard { };
  gems = standardrb.gems;
in
{
  #TODO: add to fix this to work across nix and ubuntu
  home.file = {
    ".railsrc".source = ./config/railsrc;
    # ".config/rubocop/config.yml".source = ./config/rubocop.yml;
    ".config/rubocop/config.yml".text = ''
      require:
        - rubocop-performance

      inherit_from:
        - ${gems.standard}/lib/ruby/gems/3.1.0/gems/standard-${gems.standard.version}/config/ruby-3.2.yml
        - ${gems.standard-performance}/lib/ruby/gems/3.1.0/gems/standard-performance-${gems.standard-performance.version}/config/base.yml
    '';
    # ".solargraph.yml".source = ./config/solargraph.yml;
    ".erb-lint.yml".source = ./config/erb-lint.yml;
    ".irbrc".source = ./config/irbrc;
  };

  home.packages = with pkgs; [
    gnumake # for building neovim gem deps
    bundix

    (ruby_3_2.withPackages (ps:
      with ps; [
        standardrb
        #TODO: remove theses two dependencies
        solargraph
        rubocop-performance
      ])) # includes ruby_3_2 and gems
  ];
}
