;; This is an operating system configuration.
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Import modules and services.
(use-modules (gnu))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (locale "en_US.utf8")
  (timezone "Europe/Madrid")
  (keyboard-layout (keyboard-layout "es"))
  (host-name "U108557")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "inigo")
                  (comment "Inigo Gonzalez de Arrieta")
                  (group "users")
                  (home-directory "/home/inigo")
                  (supplementary-groups '("netdev" "audio" "video")))
                %base-user-accounts))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service gnome-desktop-service-type)

                 ;; To configure OpenSSH, pass an 'openssh-configuration'
                 ;; record as a second argument to 'service' below.
                 (service openssh-service-type
                 	(openssh-configuration
                 	 (permit-root-login #f)
                 	 (password-authentication? #f)))
		 ;; Other services.
		 (service nftables-service-type)
                 (service cups-service-type)
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout keyboard-layout)))
		 ;; Set up a signed substitute server for nonguix.
		 (simple-service 'nonguix-substitutes guix-service-type
                             (guix-extension
                               (substitute-urls (list "https://substitutes.nonguix.org"))
                               (authorized-keys (list (local-file "./signing-key.pub"))))))
           ;; This is the default list of services we
           ;; are appending to.
           %desktop-services))
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/sda"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "2d80ef46-1725-4c64-8327-ba282398fdd4")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "f8f26ea4-de22-418c-a663-e4902102c311"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
