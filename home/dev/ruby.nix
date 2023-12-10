{ pkgs, ... }:
let
  standardrb = pkgs.callPackage ../../pkgs/standard { };
  grpc-tools = pkgs.callPackage ../../pkgs/grpc-tools { };
  erb-format = pkgs.callPackage ../../pkgs/erb-format { };
in
{
  #TODO: add to fix this to work across nix and ubuntu
  home.file = {
    ".railsrc".source = ./config/railsrc;
    ".bundle/config".source = ./config/bundle.config;
    # ".prettierrc.js".source = ./config/prettierrc.js;
    # ".config/rubocop/config.yml".source = ./config/rubocop.yml;
    ".config/rubocop/config.yml".text = with standardrb.gems; ''
      require:
        - rubocop-performance

      inherit_from:
        - ${standard}/lib/ruby/gems/3.1.0/gems/standard-${standard.version}/config/ruby-3.2.yml
        - ${standard-performance}/lib/ruby/gems/3.1.0/gems/standard-performance-${standard-performance.version}/config/base.yml
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
        erb-format
        grpc-tools
        #TODO: remove theses two dependencies
        solargraph
        rubocop-performance
      ])) # includes ruby_3_2 and gems
  ];
}
