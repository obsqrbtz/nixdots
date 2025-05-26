{ config, pkgs, ... }:
{
  networking.wireguard.interfaces = {
    wg0 = {
      privateKeyFile = "~/wg/timeweb/private_key";
      ips = [ "10.8.0.3/24" ];

      peers = [
        {
          publicKey = "zhA5ve2B4Mc93iG3s3TY2Z0kQDm/EkXu+dLNSsm7JRU=";
          endpoint = "45.139.77.74:51820";
          allowedIPs = [ "0.0.0.0/0" ];
          persistentKeepalive = 0;
        }
      ];
    };
  };
}
