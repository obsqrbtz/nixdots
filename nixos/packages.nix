{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.7" "python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    telegram-desktop
    alacritty
    wofi
    discord
    gparted
    
    # Coding stuff
    gnumake
    gcc
    nodejs
    vscode
    jetbrains.rider
    python
    (python3.withPackages (ps: with ps; [ requests ]))

    # CLI utils
    file
    lsd
    fzf
    btop
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
    lxqt.lxqt-policykit
    libnotify
    neofetch
    onefetch

    # GUI utils
    feh
    dmenu
   
    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    mako

    # WMs and stuff
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    waybar
    libsForQt5.qt5.qtwayland
    qt6.qtwayland

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    amdvlk

    # Screenshotting
    scrot
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
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
