{ pkgs, lib, ...}:
{
    programs.zathura = {
        enable = true;
        options = {
            default-fg = "#4C4F69";
            default-bg = "#EFF1F5";

            completion-bg = "#CCD0DA";
            completion-fg = "#4C4F69";
            completion-highlight-bg	= "#575268";
            completion-highlight-fg	= "#4C4F69";
            completion-group-bg	= "#CCD0DA";
            completion-group-fg	= "#1E66F5";

            statusbar-fg = "#4C4F69";
            statusbar-bg = "#CCD0DA";

            notification-bg = "#CCD0DA";
            notification-fg = "#4C4F69";
            notification-error-bg = "#CCD0DA";
            notification-error-fg = "#D20F39";
            notification-warning-bg	= "#CCD0DA";
            notification-warning-fg	= "#FAE3B0";

            inputbar-fg	= "#4C4F69";
            inputbar-bg = "#CCD0DA";

            recolor-lightcolor = "#EFF1F5";
            recolor-darkcolor = "#4C4F69";

            index-fg = "#4C4F69";
            index-bg = "#EFF1F5";
            index-active-fg	= "#4C4F69";
            index-active-bg	= "#CCD0DA";

            render-loading-bg = "#EFF1F5";
            render-loading-fg = "#4C4F69";

            highlight-color = "#575268";
            highlight-fg = "#EA76CB";
            highlight-active-color = "#EA76CB";
        };
    };
}
