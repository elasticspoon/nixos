{ pkgs, ... }:
let
  # standard-performance =
  #   pkgs.callPackage
  #     ({ buildRubyGem
  #      , ruby_3_2
  #      ,
  #      }:
  #       buildRubyGem rec {
  #         name = "standard-performance-${version}";
  #         inherit ruby_3_2;
  #         gemName = "standard-performance";
  #         version = "1.1.2";
  #         source = {
  #           sha256 = "5dc40a4dc9fbf4b6dc96aa5629c064186f7c810fbeabed3df51d94696701c3c4";
  #         };
  #       })
  #     { };
  # standardrb =
  #   pkgs.callPackage
  #     ({ buildRubyGem
  #      , ruby_3_2
  #      ,
  #      }:
  #       buildRubyGem rec {
  #         name = "standard-${version}";
  #         inherit ruby_3_2;
  #         gemName = "standard";
  #         version = "1.30.1";
  #         rubyVersion = "3.2";
  #         source = {
  #           sha256 = "dd4378691541af8a416bdf78afa99b7cf0186833291bdffd16745af959f1c834";
  #         };
  #       })
  #     { };
  standardrb = pkgs.callPackage ../../pkgs/standard { };
  # rubocop =
  #   pkgs.callPackage
  #     ({ buildRubyGem
  #      , ruby
  #      ,
  #      }:
  #       buildRubyGem rec {
  #         name = "rubocop-${version}";
  #         inherit ruby;
  #         gemName = "rubocop";
  #         source = {
  #           remotes = [ "https://rubygems.org" ];
  #           sha256 = "a9860af191f6d51696de9ece6ca8c072643ee6c04af4310242b13e642b11ef91";
  #           type = "gem";
  #         };
  #         version = "1.52.0";
  #       })
  #     { };
in
{
  home.file = {
    ".railsrc".source = ./config/railsrc;
    ".config/rubocop/config.yml".source = ./config/rubocop.yml;
    # ".config/rubocop/config.yml".text = ''
    #   require:
    #     - rubocop-performance
    #
    #   inherit_from:
    #     - ${standardrb}/lib/ruby/gems/3.1.0/gems/standard-${standardrb.version}/config/ruby-${standardrb.rubyVersion}.yml
    #     - ${standard-performance}/lib/ruby/gems/3.1.0/gems/standard-performance-${standard-performance.version}/config/base.yml
    # '';
    # ".solargraph.yml".source = ./config/solargraph.yml;
    ".erb-lint.yml".source = ./config/erb-lint.yml;
    ".irbrc".source = ./config/irbrc;
  };

  home.packages = with pkgs; [
    gnumake # for building neovim gem deps
    bundix
    # standardrb
    # ruby_3_2
    #
    (ruby_3_2.withPackages (ps:
      with ps; [
        standardrb
        solargraph
      ])) # includes ruby_3_2 and gems
  ];
}
