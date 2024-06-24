{ ... }: {
  services = {
    syncthing = {
      enable = true;
    #   overrideDevices = true;
    #   overrideFolders = true;
    #   user = "bandito";
    #   # group = "users";
    #   relay.enable = false;
    #   dataDir = "/home/bandito/Sync";
    #   configDir = "/home/bandito/.config/syncthing";
    #
    #   settings = {
    #     devices = {
    #       "laptop" = {
    #         id = "A6CVZED-CXVT737-D2ZS7GQ-6D3HIF4-2J6LQNQ-SZL3LRQ-VOQSF4V-W4EB2AA";
    #         name = "NixOS Laptop";
    #       };
    #       "Pixel 6a" = {
    #         id = "EO5PL2Y-WNWNWAM-4QGGDVB-5A47DHC-SJKOZVP-KSG4DLE-JXKIJDY-C2TJ3QS";
    #         name = "Pixel 6a";
    #         introducer = true;
    #       };
    #       "Windows Desktop" = {
    #         id = "UO6UO5Z-OEMYAAX-EKKFBTX-XI6WP2T-5F25BDW-PMM7KV5-TTAYTAX-ZDGOJQZ";
    #       };
    #       "Yuri Tablet" = {
    #         id = "6XMICIS-L2QSUCF-LQ2CAY4-HXR4SMU-YCDTJVI-3DNBVC4-VLKAPRB-SNB7UQM";
    #       };
    #       "Ubuntu VM" = {
    #         id = "MDEBSUS-6CJPFZY-32PZKO2-TMKG6BD-K4JAORO-SFE3PVV-47MXES2-SJ3IEAS";
    #       };
    #       "desktop" = {
    #         id = "YYLQEUI-MMEPEY3-HEP2E3A-JRUVVBF-QJRAWWI-QF3CKKF-HVZG6IN-HTXAUAV";
    #         name = "NixOS Desktop";
    #       };
    #     };
    #
    #     folders = {
    #       "Misc" = {
    #         id = "a2bre-qfgy9";
    #         devices = [ "Pixel 6a" "Windows Desktop" "Yuri Tablet" "Ubuntu VM" "laptop" "desktop" ];
    #         path = "/home/bandito/Sync/Misc";
    #         label = "Misc Shared";
    #       };
    #       "Obsidian" = {
    #         id = "s00ud-8co1w";
    #         devices = [ "Pixel 6a" "Windows Desktop" "Yuri Tablet" "Ubuntu VM" "laptop" "desktop" ];
    #         path = "/home/bandito/Sync/Notes";
    #         label = "Obsidian";
    #       };
    #       "PDF" = {
    #         id = "ta3z3-6zyk0";
    #         devices = [ "Pixel 6a" "Windows Desktop" "Yuri Tablet" "Ubuntu VM" "laptop" "desktop" ];
    #         path = "/home/bandito/Sync/PDF";
    #         label = "PDF Notes";
    #       };
    #     };
    #   };
    # };
  };
}
