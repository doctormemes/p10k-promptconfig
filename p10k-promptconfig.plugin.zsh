# This file handles P10K themes if $P10K_PROMPT is set in .zshrc
# To use a certain p10k theme, set $P10K_PROMPT to name of theme in .zshrc
# To install a new theme, create a file and save it as `.<theme_name>.zsh` in the directory you keep your .zsh files (either your home directory or your $ZDOTDIR directory)
if [[ "$ZSH_THEME" = "powerlevel10k/powerlevel10k" ]]; then # plugin is only useful if using powerlevel10k theme
    if [[ ! -z "$ZDOTDIR" ]]; then # ZDOTDIR variable is set, can use it
        if [[ -f "$ZDOTDIR/.$P10K_PROMPT.zsh" ]]; then
            source $ZDOTDIR/.$P10K_PROMPT.zsh
        else
            if [[ -f "$ZDOTDIR/.p10k.zsh" ]]; then
                source $ZDOTDIR/.p10k.zsh
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
    else # ZDOTDIR is not set, will use user's home directory
        if [[ -f "~/.$P10K_PROMPT.zsh" ]]; then
            source ~/.$P10K_PROMPT.zsh
        else
            if [[ -f "~/.p10k.zsh" ]]; then
                source ~/.p10k.zsh
            else
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
fi
