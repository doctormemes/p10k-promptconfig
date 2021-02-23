# p10k-promptconfig plugin

This plugin adds the ability to easily switch between Powerlevel10k prompt theme config files by defining the P10K_PROMPT variable in your .zshrc file. Make sure whatever theme file you're using has a . in front of the name and the .zsh extension, like so:

**FILE NAME:**

.docstheme.zsh

**DEFINE THE P10K_PROMPT VARIABLE IN .zshrc:**

P10K_PROMPT="docstheme"

To use it, add `p10k-promptconfig` to the plugins array in your zshrc file:

```zsh
plugins=(... p10k-promptconfig)
```
