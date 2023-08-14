{ pkgs, ... }: {
  home.file = {
    ".railsrc".source = ./config/railsrc;
    # ".rubocop.yml".source = ./config/rubocop.yml;
    # ".solargraph.yml".source = ./config/solargraph.yml;
    ".erb-lint.yml".source = ./config/erb-lint.yml;
    ".irbrc".source = ./config/irbrc;
  };

  home.packages = with pkgs; [
    gnumake # for building neovim gem deps
    bundix
    #
    (ruby_3_2.withPackages (ps:
      with ps; [
        jekyll
        solargraph
      ])) # includes ruby_3_2 and gems
  ];
}
