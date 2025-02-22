{
  pkgs,
  config,
  ...
}: {
  services = {
    autorandr.enable = true;
    xserver ={
      enable = true;
        displayManager = {
          defaultSession = "none+awesome";
          lightdm = {
            enable = true;
            
            greeters.gtk = {
                enable = true;
                theme = {
                    package = pkgs.orchis-theme;
                    name = "Orchis-Grey-Dark-Compact";
                };
                cursorTheme = {
                  package = pkgs.vanilla-dmz;
                  name = "DMZ (Black)";
                };
                indicators = ["~session" "--spacer" "~power"];
            };
          };
        };
        ######################################################
        windowManager.awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks
            luadbi-mysql
          ];
        };
      };
    };



}
