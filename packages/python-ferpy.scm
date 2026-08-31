;; Manual setup.
(use-modules (guix packages)
             (guix download)
             (guix git-download)
             (guix build-system python)
             (guix licenses)
             (gnu packages python)
	     (gnu packages python-xyz)
	     (gnu packages python-science)
	     (gnu packages python-build))

;; Generated from guix import pypi and manually edited.

(define-public python-ferpy
  (package
    (name "python-ferpy")
    (version "0.1.18")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jongablop/ferpy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15jagvnb8ixbm7innispfmbpj0lcb1kjldkzdfzpha19wlcrq0ff"))))
    (arguments
     '(#:tests? #f))
    (build-system python-build-system)
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-matplotlib python-pandas))
    (home-page "https://github.com/jongablop/ferpy")
    (synopsis "A Python implementation of the FER data structure.")
    (description
     "This package provides a Python implementation of the FER data structure.")
    (license gpl3)))

;; The name of the package must be called at the end of the script.
python-ferpy
