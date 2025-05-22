{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    telegram-desktop
    alacritty
    wofi
    
    # Coding stuff
    gnumake
    gcc
    nodejs
    vscode

    # CLI utils
    file
    lsd
    fzf
    btop
    tgpt
    dfc
    tree
    wget
    git
    htop
    nix-index
    unzip
    ffmpeg
    ranger
    zip
    ntfs3g
    swww
    openssl
    vim
    libnotify
    neofetch
    onefetch
    nh
    nix-output-monitor
    nvd
   
    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    mako

    # WMs and stuff
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    waybar
    libsForQt5.qt5.qtwayland
    qt6.qtwayland

    # Sound
    pipewire
    pulseaudio
    pamixer

    # Gaming
    steam
    lutris

    # GPU stuff 
    amdvlk

    # Screenshotting
    grim
    slurp

    # Theming
    bibata-cursors
    (catppuccin-gtk.override {
      accents = [ "pink" ]; # You can specify multiple accents here to output multiple themes
      size = "compact";
      tweaks = [ "rimless" "black" ]; # You can also specify multiple tweaks here
      variant = "macchiato";
  })

    # Other
    home-manager
    udiskie
  ];

  fonts.packages = with pkgs; [
  # Bitmap
    cozette 
    gohufont 
  # Standard
    jetbrains-mono
    mononoki
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Mononoki" ]; })
  ];
}
