{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "github@philipgardner.com";
    userName = "Philip Gardner";
    signing = {
      key = "A3A0431D96695C25";
      signByDefault = true;
    };
    aliases = {
      a = "add";
      c = "commit";
      ca = "commit --amend";
      can = "commit --amend --no-edit";
      cl = "clone";
      cm = "commit -m";
      co = "checkout";
      cob = "checkout -b";
      cp = "cherry-pick";
      cpx = "cherry-pick -x";
      d = "diff";
      f = "fetch";
      fo = "fetch origin";
      fu = "fetch upstream";
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
      lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
      pl = "pull";
      pr = "pull -r";
      ps = "push";
      psf = "push -f";
      rb = "rebase";
      rbi = "rebase -i";
      r = "remote";
      ra = "remote add";
      rr = "remote rm";
      rv = "remote -v";
      rs = "remote show";
      st = "status";
      contributors = "shortlog --summary --numbered";
      tags = "tag -l";
      branches = "branch -a";
      remotes = "remote -v";
      fuck = "reset HEAD --hard";
    };
    extraConfig = {
      apply = {
        whitespace = "fix";
      };
      core = {
        whitespace = "space-before-tab,indent-with-non-tab,trailing-space";
      };
      credential = {
        helper = "osxkeychain";
      };
      help = {
        autoCorrect = "1";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      }
    };
  };
}
