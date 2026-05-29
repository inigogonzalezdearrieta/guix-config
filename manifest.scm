;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(define python-packages
  (list
   "python"
   "python-wrapper"
   "python-numpy"
   "python-pandas"
   "python-scipy"
   "python-matplotlib"
   "python-black"
   "python-epc"
   "python-jedi"
   "python-numba"
   "python-nbconvert"
   "python-tqdm"
   "python-sympy"
   )
  )

(define gnu-packages
  (list
   "gcc-toolchain"
   "gfortran-toolchain"
   "make"
   )
  )

(define libraries
  (list
   "mpich"
   "lapack"
   "openblas"
   "gsl"
   )
  )

(define other-packages
  (list
   "pandoc"
   )
  )

(specifications->manifest
 (append
  ;; manual-packages ; TO-DO
  python-packages
  gnu-packages
  libraries
  other-packages
  )
 )
