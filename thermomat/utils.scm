;; Custom module for utilities needed in other thermomat modules.
;; License: GPL-3.0.
;; Copyright © 2026 Inigo Gonzalez de Arrieta <inigo.gonzalezdearrieta@ehu.eus>

(define-module (utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build))

(define-public python-ruamel-yaml
  (package
    (name "python-ruamel-yaml")
    (version "0.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ruamel_yaml" version))
       (sha256
        (base32 "14qrqcjrpvncsinmgwyil4nsrka63zv0p3xzisbgz7l44z6ndssk"))))
    (arguments
     '(#:tests? #f))
    (build-system python-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://sourceforge.net/p/ruamel-yaml/code/ci/default/tree/")
    (synopsis
     "ruamel.yaml is a YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order")
    (description
     "ruamel.yaml is a YAML parser/emitter that supports roundtrip preservation of
comments, seq/map flow style, and map key order.")
    (license license:expat) ;; Also known as MIT license.
    ))
