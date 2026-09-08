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
	      (bashrc (list (local-file "dotfiles/bashrc"
                                                     "bashrc")))
	      (bash-logout (list (local-file "dotfiles/bash_logout"
                                               "bash_logout")))
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
        ,(local-file "emacs.d/early-init.el"))))

    ;; Systemd services configuration
    (simple-service
     'systemd-services-config
     home-files-service-type
     `((".config/systemd/user/emacs.service"
         ,(local-file "systemd/emacs.service")))))))
