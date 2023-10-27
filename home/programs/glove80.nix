{ pkgs, ... }: {
  # imports = [
  # ];

  home.packages = with pkgs; [
    udisks
  ];

  home.file.".config/bash/scripts/flash-glove80.sh".source = ./scripts/flash-glove80.sh;

  # programs = {
  # };

  # services = {
  # };
}
