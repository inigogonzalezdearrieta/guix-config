(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp))

(home-environment
  ;; Packages installed in the home profile.
  (packages
   (list
    emacs-pgtk ;; With Wayland support
    nano))

  (services
   (append
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
    
     ;; Dotfiles automatically created by Guix.
     (service home-files-service-type
           `((".guile" ,%default-dotguile)
             (".Xdefaults" ,%default-xdefaults)))
             
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
        ,(local-file "emacs.d/early-init.el")))))
      %base-home-services)))
