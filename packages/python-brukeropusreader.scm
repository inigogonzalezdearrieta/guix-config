;; The project does not have a proper list of dependencies.
;; Manual setup.
(use-modules (guix packages)
             (guix download)
             (guix build-system python)
             (guix licenses)
             (gnu packages python)
	     (gnu packages python-xyz)
	     (gnu packages python-science)
	     (gnu packages python-build))

;; Generated from guix import pypi and manually edited.

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
    (license lgpl3)))

;; The name of the package must be called at the end of the script.
python-brukeropusreader
