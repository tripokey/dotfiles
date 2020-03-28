{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      steam lutris polychromatic
    ];

    file.openrazerconfig = {
      text = ''
        [General]
        # Verbose logging (logs debug messages - lotsa spam)
        verbose_logging = True


        [Startup]
        # Set the sync effects flag to true so any assignment of effects will work across devices
        sync_effects_enabled = True

        # Turn off the devices when the systems screensaver kicks in
        devices_off_on_screensaver = True

        # Mouse battery notifier
        mouse_battery_notifier = True


        [Statistics]
        # Collects number of keypresses per hour per key used to generate a heatmap
        key_statistics = True
      '';

      target = ".config/openrazer/razer.conf";
    };
  };
}
