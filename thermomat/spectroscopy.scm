;; Custom module for spectroscopy packages.
;; License: GPL-3.0.
;; Copyright © 2026 Inigo Gonzalez de Arrieta <inigo.gonzalezdearrieta@ehu.eus>
;; OPUS is a trademark of Bruker. Use of the mark does not imply endorsement or affiliation.

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
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages jupyter)
  #:use-module (gnu packages time)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-check)
  #:use-module (utils))

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

(define-public python-hairl-fer-py
  (package
    (name "python-hairl-fer-py")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jongablop/hairl-fer-py")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1whwbv74d1h2irvazfr23yvv96vfnw11i8xd7dj7azpfwlq5w98s"))))
    (arguments
     '(#:tests? #f))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-brukeropusreader
                             python-ferpy
                             python-ft4ftirs
                             python-matplotlib
                             python-numpy
                             python-pandas
                             python-pytz
                             python-pyyaml
                             python-ruamel-yaml
                             python-scipy))
    (native-inputs (list python-ipykernel python-pytest ruff
                         python-setuptools python-setuptools-scm))
    (home-page "https://github.com/jongablop/hairl-fer-py")
    (synopsis
     "Emissivity processing for the HAIRL emissometer, on the FER data model")
    (description
     "Emissivity processing for the HAIRL emissometer, on the FER data model.")
    (license license:gpl3+)))
