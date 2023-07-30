{ pkgs, ... }: {
  programs = {
    rbenv.enable = true;
  };

  home.file = {
    ".railsrc".source = ./config/railsrc;
    ".rubocop.yml".source = ./config/rubocop.yml;
    ".solargraph.yml".source = ./config/solargraph.yml;
    ".erb-lint.yml".source = ./config/erb-lint.yml;
  };

  home.packages = with pkgs; [
    gnumake # for building gems
    (hiPrio bundler) # hiPrio cause ruby_3_2 brings it as well

    (ruby_3_2.withPackages (ps:
      with ps; [
        jekyll
        ffi
        # webrick
        terminal-table
        # google-protobuf
        # sass-embedded
        jekyll-sass-converter
      ])) # includes ruby_3_2 and gems
  ];
}
