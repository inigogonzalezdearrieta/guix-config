(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu home services xdg)
             (gnu services)
	     (gnu packages emacs)
	     (gnu packages text-editors)
             (guix gexp))

(home-environment
  ;; Packages installed in the home profile.
  (packages
   (list
    emacs
    nano))

  (services
   (list
    ;; Bash configuration
    (service home-bash-service-type
             (home-bash-configuration
	      (guix-defaults? #t)
	      (environment-variables '(("EDITOR" . "nano")))))

    ;; Manually configured aliases
    (simple-service
     'bash-aliases-config
     home-files-service-type
     `((".bash_aliases" ,(local-file "dotfiles/bash_aliases"))))

    ;; Nano configuration
    (simple-service
     'nanorc-config
     home-files-service-type
     `((".nanorc" ,(local-file "dotfiles/nanorc"))))

    ;; Emacs configuration directory
    (simple-service
     'emacs-config
     home-files-service-type
     `((".emacs.d/init.el"
         ,(local-file "emacs.d/init.el"))
       (".emacs.d/early-init.el"
        ,(local-file "emacs.d/early-init.el")))))))
