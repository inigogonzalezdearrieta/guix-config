;; Custom module for spectroscopy packages.
;; License: GPL-3.0.
;; Copyright © 2026 Inigo Gonzalez de Arrieta <inigo.gonzalezdearrieta@ehu.eus>

(define-module (spectroscopy)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-build))

;; Modules are imported from PyPI and tweaked.
;; Check their integrity from the parent directory with:
;; guix build -L thermomat/ python-<package>

(define-public python-ferpy
  (package
    (name "python-ferpy")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jongablop/ferpy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dcqxmhi5mlbhwaxisflhfpdpva11kq3dfcx2vpx2gxkbj6rpak9"))))
    (arguments
     '(#:tests? #f))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-matplotlib python-pandas))
    (home-page "https://github.com/jongablop/ferpy")
    (synopsis "A Python implementation of the FER data structure.")
    (description
     "This package provides a Python implementation of the FER data structure.")
    (license license:gpl3)))

(define-public python-brukeropusreader
  (package
    (name "python-brukeropusreader")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "brukeropusreader" version))
       (sha256
        (base32 "1q50yihfz96h4rypv061ms7plf4pjsak5dq2ywzan46p81zrsc61"))))
     (arguments
      '(#:tests? #f))
    (build-system python-build-system)
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-numpy python-scipy))
    (home-page "https://github.com/qedsoftware/brukeropusreader")
    (synopsis "Bruker OPUS File Reader")
    (description "Bruker OPUS File Reader.")
    (license license:lgpl3)))

(define-public python-ft4ftirs
  (package
    (name "python-ft4ftirs")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jongablop/ft4ftirs")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rv43khfwdp36m0w57f85n5r2i87yqx2ggacx0ajsqcjkjpqi41m"))))
    (arguments
     '(#:tests? #f))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-brukeropusreader python-numpy
                             python-pandas python-scipy))
    (home-page "https://github.com/jongablop/ft4ftirs")
    (synopsis "A package for processing FTIR interferograms.")
    (description
     "This package provides a package for processing FTIR interferograms.")
    (license license:gpl3)))
