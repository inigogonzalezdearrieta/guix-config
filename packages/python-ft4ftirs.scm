(use-modules (guix packages)
	     (guix download)
	     (guix git-download)
	     (guix build-system pyproject)
	     (guix licenses)
	     (gnu packages python)
	     (gnu packages python-xyz)
	     (gnu packages python-science))

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
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-brukeropusreader python-numpy
                             python-pandas python-scipy))
    (home-page "https://github.com/jongablop/ft4ftirs")
    (synopsis "A package for processing FTIR interferograms.")
    (description
     "This package provides a package for processing FTIR interferograms.")
    (license gpl3)))

python-ft4ftirs
