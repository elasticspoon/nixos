{
  pkgs,
  config,
  ...
}: {
  programs = {
    rbenv.enable = true;
  };

  home.packages = with pkgs; [
    gnumake # for building gems
    (hiPrio bundler) # hiPrio cause ruby_3_2 brings it as well
    ruby_3_2
  ];

}
