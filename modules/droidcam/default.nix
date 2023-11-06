{ kernel
, config
, ...
}:
let
  v4l2loopback-dc = config.boot.kernelPackages.callPackage ./loopback-dc.nix { };
  # droidcam = pkgs.callPackage ./droidcam.nix { };
in
{
  boot.extraModulePackages = [ v4l2loopback-dc ];
  programs.droidcam.enable = true;
  # environment.systemPackages = [ droidcam ];
}
