# Home Manager configuration for user "hanov".
# This manages user packages, dotfiles, program settings, etc.
# Activate together with the system via `sudo nixos-rebuild switch --flake .#nixos`
#
# See: https://nix-community.github.io/home-manager/

{ config, pkgs, ... }:

{
  # Basic user info (required)
  home.username = "hanov";
  home.homeDirectory = "/home/hanov";

  # Packages that are personal / GUI / user-specific.
  # These were previously in systemPackages in configuration.nix.
  home.packages = with pkgs; [
    # Browsers & editors
    floorp-bin
    vscodium
    zed-editor
    kdePackages.kate

    # Media & productivity
    mpv
    strawberry
    jellyfin-mpv-shim
    obsidian

    # Communication & sync
    telegram-desktop
    signal-desktop
    vesktop
    syncthing
    bitwarden-desktop
    zoom-us
    rustdesk-flutter

    # Gaming related (user space)
    mangohud
    protonup-ng

    # Tools & misc personal
    qbittorrent
    mission-center
    github-desktop
    woeusb
    openfortivpn
    lazygit

    # Git credential helper (used by the git config below)
    git-credential-manager
  ];

  # Git configuration (moved here from system-level programs.git).
  # This is the proper place for per-user git settings and credentials.
  programs.git = {
    enable = true;

    # Uncomment and fill these if desired:
    # userName = "Your Name";
    # userEmail = "you@example.com";

    settings = {
      credential.helper = "manager";
      credential."https://github.com".username = "ilianvo";
      credential.credentialStore = "cache";
    };
  };

  # Example of other useful program modules you can enable/configure:
  # programs.bash.enable = true;
  # programs.kitty.enable = true;
  # programs.firefox.enable = true;  # (you also have it enabled at system level)

  # You can manage arbitrary files in $HOME declaratively:
  # home.file.".config/example/config.toml".text = ''
  #   key = "value"
  # '';

  # This value determines the Home Manager release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It is perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man home-configuration.nix or on https://nix-community.github.io/home-manager/).
  home.stateVersion = "26.05"; # Did you read the comment?
}
