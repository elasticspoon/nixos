#
#  Bluetooth
#
{ pkgs, ... }: {
  systemd.services.bluetoothspoof = {
    description = "spoof the bluetooth mac-address";
    wantedBy = [ "default.target" ];

    #this ensures the system is finished loading so that the system can find btmgmt. i had it on a different target and the service failed (can't find the command)
    after = [ "default.target" ];

    script = ''
      #you must turn off bluetooth before spoofing the mac-address
      ${pkgs.bluez}/bin/btmgmt power off &&

      #spoof the address here with your own custom address
      ${pkgs.bluez}/bin/btmgmt public-addr CE:CE:CE:CE:CE:CE

      #optional: turn bluetooth on
      ${pkgs.bluez}/bin/btmgmt power on
    '';
    path = with pkgs; [
      bluez
    ];

    #the service (script) runs once and closes; it requires root since were dealing with hardware (permission denied w/ reg user)
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
