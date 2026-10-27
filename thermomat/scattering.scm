;; Custom module for electromagnetic scattering packages.
;; License: GPL-3.0.
;; Copyright © 2026 Inigo Gonzalez de Arrieta <inigo.gonzalezdearrieta@ehu.eus>

(define-module (scattering)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses)
		#:prefix license:)
  #:use-module (guix gexp)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages mpi))

(define-public mstm
  (package
    (name "mstm")
    (version "4.0-inigogonzalezdearrieta")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/inigogonzalezdearrieta/MSTM")
	     (commit "07831064f00d218ab65bf902dfa6858fa4c9cae5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wygqjvdwzzbrlrjckjvc81n02ic3ac9wcsm23csqqyrwzp6gbz4"))))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
		       (delete 'configure) ;; No configure in the Makefile.
		       ;; Change installation directory.
		       (add-before 'install 'fix-install-paths
				   (lambda _
				     (substitute* "Makefile"
						  (("sudo ") "")
						  (("/usr/local") #$output))))
		       (add-before 'install 'make-bin-dir
				   (lambda _
				     (mkdir-p (string-append #$output "/bin"))))
		       )))
    (build-system gnu-build-system)
    (native-inputs (list gfortran))
    (inputs (list mpich))
    (home-page "https://github.com/inigogonzalezdearrieta/MSTM")
    (synopsis "Multiple Sphere T Matrix code.")
    (description
     "Multiple Sphere T Matrix code (originally developed by Daniel
Mackowski and Michael Mishchenko, forked by Iñigo González de Arrieta)")
    (license license:expat)))
