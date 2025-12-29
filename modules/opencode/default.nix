{ config, pkgs, lib, ... }:

{
  programs.opencode = {
    enable = true;
    
    # Custom agents
    agents.rust-reviewer = ./agent/rust-reviewer.md;
    
    # Custom commands
    commands.review-rust = ./command/review-rust.md;
  };

  # Skills don't have a programs.opencode option, so use home.file
  home.file.".config/opencode/skill/idiomatic-rust/SKILL.md".source = 
    ./skill/idiomatic-rust/SKILL.md;
}
