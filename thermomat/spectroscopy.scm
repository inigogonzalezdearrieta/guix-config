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
       (method url-fetch)
       (uri (pypi-uri "ferpy" version))
       (sha256
        (base32 "0vn5pq988cq007zvap8nm74d346895nyj2lja5mfsyhid54rzpn1"))))
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
       (method url-fetch)
       (uri (pypi-uri "ft4ftirs" version))
       (sha256
        (base32 "0ddsxqxh4hx3r151kvwdfjvdwcqn0my9ij4fi4vnwvg7s7g02x3m"))))
    (arguments
     '(#:tests? #f))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-setuptools-scm))
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
       (method url-fetch)
       (uri (pypi-uri "hairl_fer_py" version))
       (sha256
        (base32 "0vhxm2dqmhr00502sbd5500xkl8rfqnsv9j1kdbmyldz40z00j3i"))))
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
