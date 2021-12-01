## Bash

## Emacs

Use 26.3

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
(menu-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
```
