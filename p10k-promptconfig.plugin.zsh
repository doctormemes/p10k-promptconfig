# This plugin handles P10K themes if $P10K_PROMPT is set in .zshrc
# To use a certain p10k theme, set $P10K_PROMPT to name of theme in .zshrc (e.g. P10K_PROMPT="theme" to use the theme file named `.theme.zsh`)
# To install a new p10k prompt theme, create a file with p10k theme settings
# Save it as `.<theme_name>.zsh` in the directory with your .zsh files (most likely the same directory with your .zshrc file)

[ -v ZDOTDIR ] && BASE_DIR="$ZDOTDIR" || BASE_DIR="$HOME"

# plugin is only useful if using powerlevel10k theme and if $P10K_PROMPT is set
if [[ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" && -n "$P10K_PROMPT" ]]; then
    if [ -f "$BASE_DIR/.$P10K_PROMPT.zsh" ]; then
        source $BASE_DIR/.$P10K_PROMPT.zsh
    else
        if [ -f "$BASE_DIR/.p10k.zsh" ]; then
            source $BASE_DIR/.p10k.zsh
        else # notify user and ask to run p10k configure to generate .p10k.zsh file.
            while true; do
                echo ".p10k.zsh file not found."
                echo "Run p10k configure to generate one?"
                echo "[Y/n]: "
                read -rsk 1 yn
                case $yn in
                [Yy]* )
                    p10k configure
                    break;;
                [Nn]* )
                    echo "Okay, exiting..."
                    break;;
                * )
                    ;;
                esac
            done
        fi
    fi
fi
