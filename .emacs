(require 'cl)

(setq coq-prog-args (quote ("-I" "cpdt/src")))
(setq inhibit-startup-screen t)
(setq wakatime-api-key (getenv "WAKATIME_KEY"))
(setq wakatime-cli-path "/usr/local/bin/wakatime")

(add-to-list 'load-path "~/.emacs.d/elpa/wakatime-mode-20161019.602/")
(require 'wakatime-mode)
(global-wakatime-mode)

(setq column-number-mode t)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'auto-mode-alist '("\.scala" . scala-mode)) 
(add-to-list 'auto-mode-alist '("\.sbt\'" . scala-mode))

;;fix for latex
(add-to-list 'auto-mode-alist '("\.tex" . latex-mode))

;;GLSL
(add-to-list 'auto-mode-alist '("\.glsl.*$" . glsl-mode))

;;hooks for haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;;-- Tuareg mode -----------------------------------------
;;Add Tuareg to your search path
(add-to-list 'load-path
 (expand-file-name "~/.emacs.d/elpa/tuareg-20161218.1138"))
(require 'tuareg)
(add-to-list 'auto-mode-alist '("\\.ml[ily]?$" . tuareg-mode))

;; -- Tweaks for OS X -------------------------------------
;; Tweak for problem on OS X where Emacs.app doesn't run the right
;; init scripts when invoking a sub-shell
(cond
 ((eq window-system 'ns) ; macosx
  ;; Invoke login shells, so that .profile or .bash_profile is read
  (setq shell-command-switch "-lc")))

;; -- opam and utop setup --------------------------------
;; Setup environment variables using opam
(dolist
    (var (car (read-from-string
	       (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))
;; Update the emacs path
(setq exec-path (split-string (getenv "PATH") path-separator))
;; Update the emacs load path
(push (concat (getenv "OCAML_TOPLEVEL_PATH")
	      "/../../share/emacs/site-lisp") load-path)
;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
;;----------------------------------------------------------

;;Only indent with spaces-----------------------------------
(setq-default indent-tabs-mode nil)
;;----------------------------------------------------------

;;JS mode---------------------------------------------------
(setq js-indent-level 2)
;;----------------------------------------------------------

;;Python mode-----------------------------------------------
(setq-default python-indent-offset 2)
(setq python-indent-offset 2)
;;----------------------------------------------------------

;;Wakatime--------------------------------------------------
(load-library "wakatime-mode")
(global-wakatime-mode)
;;----------------------------------------------------------


