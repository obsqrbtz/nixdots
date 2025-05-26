{
  programs.git = {
    enable = true;
    userName  = "Daniel Dada";
    userEmail = "doesdeos@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      credential.helper = "store";
    };
  };
}
