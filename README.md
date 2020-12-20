## Bash

## Emacs

Use 24.5

M-x menu-bar-open

Make sure `goimports` is in `~/go/bin/goimports`.

```
mkdir .emacs.d
mkdir .emacs.d/auto-save-list
```

Example `~/.emacs`:

```
(load "~/config/emacs.el")

(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(fontsize . 13))
(add-to-list 'default-frame-alist '(font . "-apple-Menlo-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1"))
```
