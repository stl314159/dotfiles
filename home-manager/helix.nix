{lib, pkgs, ...}:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
        }
        {
          name = "markdown";
          language-servers = [
            "markdown-oxide"
            "ltex-ls"
          ];
        }
      ];
      language-server = {
        nixd.command = "${pkgs.nixd}/bin/nixd";
        markdown-oxide.command = "${pkgs.markdown-oxide}/bin/markdown-oxide";
        ltex-ls.command = "${pkgs.ltex-ls}/bin/ltex-ls";
      };
    };
    settings = {
      theme = "kanagawa-dragon";
      editor = {
        color-modes = true;
        cursorline = true;
        file-picker = {
          hidden = false;
        };
        line-number = "relative";
        lsp = { display-inlay-hints = true; };
        rulers = [ 80 ];
        soft-wrap = {
          enable = false;
          wrap-at-text-width = true;
        };
        true-color = true;
        whitespace.render = "all";
      };
      keys = {
        normal = {
          space = {
            W = ":toggle-option soft-wrap.enable";
            q = ":reflow";
          };
        };
        select = {
          space = {
            q = ":reflow";
          };
        };
        insert = {
          C-c   = "normal_mode";
          "C-[" = "normal_mode";
        };
      };
    };
  };
}
