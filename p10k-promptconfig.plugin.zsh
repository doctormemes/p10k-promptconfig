# This file handles P10K themes if $P10K_PROMPT is set in .zshrc
# To use a certain p10k theme, set $P10K_PROMPT to name of theme in .zshrc
# To install a new theme, create a file and save it as `THEME_NAME`.zsh in P10K-themes
if [[ -n $P10K_PROMPT && $ZSH_THEME = "powerlevel10k/powerlevel10k" ]]; then
    if [ -f "$ZDOTDIR/.$P10K_PROMPT.zsh" ]; then
        source "$ZDOTDIR/.$P10K_PROMPT.zsh"
    else
        echo "$POWERLEVEL10K file not found. Trying to use .p10k.zsh file instead...\n"
        if [ -f $ZDOTDIR/.p10k.zsh ]; then
            source $ZDOTDIR/.p10k.zsh
        else # notify user and ask to run p10k configure to generate .p10k.zsh file.
            echo ".p10k.zsh file not found."
            while true; do
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