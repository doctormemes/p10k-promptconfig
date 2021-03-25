#!/bin/zsh

# To use a certain p10k theme, set $P10K_PROMPT to name of theme in .zshrc
# (e.g. `P10K_PROMPT="theme"` to use the theme file: `.theme.zsh`)
# To install a new p10k prompt theme, create a file with the theme settings you want
# Save it as `.<theme_name>.zsh` in the directory with your .zsh files (most likely the same directory with your .zshrc file)

[ -v ZDOTDIR ] && local BASE_DIR="$ZDOTDIR" || local BASE_DIR="$HOME"

# plugin is only useful if using powerlevel10k theme and if $P10K_PROMPT is set
if [[ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" && -n "$P10K_PROMPT" ]]; then
    if [ -f "$BASE_DIR/.$P10K_PROMPT.zsh" ]; then
        source $BASE_DIR/.$P10K_PROMPT.zsh
    else
        if [ -f "$BASE_DIR/.p10k.zsh" ]; then
            source $BASE_DIR/.p10k.zsh
            echo "[p10k-promptconfig]: \".$P10K_PROMPT.zsh\" file not found!"
            echo "[p10k-promptconfig]: \".p10k.zsh\" file found, will fallback to using it for now"
            echo "[p10k-promptconfig]: To disable this message, correctly set P10K_PROMPT variable in .zshrc (set P10K_PROMPT=\"p10k\" in .zshrc to use \".p10k.zsh\" without seeing this message)"
        else # notify user and ask to run p10k configure to generate .p10k.zsh file.
            while true; do
                echo "[p10k-promptconfig]: \".$P10K_PROMPT.zsh\" file not found!"
                echo "[p10k-promptconfig]: .p10k.zsh file not found!"
                echo "[p10k-promptconfig]: Run command p10k configure to generate one?"
                echo "[Y/n]: "
                read -rsk 1 yn
                case $yn in
                [Yy]* )
                    p10k configure
                    break;;
                [Nn]* )
                    echo "[p10k-promptconfig]: Okay, exiting..."
                    break;;
                * )
                    ;;
                esac
            done
        fi
    fi
fi

unset BASE_DIR
