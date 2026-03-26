;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "python-numba"
        "python-pyqt"
        "mpich"
        "python-tqdm"
        "python-nbconvert"
        "python-scipy"
        "gcc-toolchain"
        "python-pip"
        "python-sympy"
        "pandoc"
        "lapack"
        "python-black"
        "python-pandas"
        "python-matplotlib"
        "python-numpy"
        "make"
        "gfortran-toolchain"
        "gsl"
        "openblas"
        "python-wrapper"
        "fftw"
        "python"
        "python-epc"
        "python-jedi"))
