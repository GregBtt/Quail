;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               linear.asd                            
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1994 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     Michael E. Lewis 1991.
;;;     R.W. Oldford 1994.
;;;
;;;
;;;--------------------------------------------------------------------------------

(asdf:defsystem "linear"
    :serial t
    :components
    ((:module "linear"
        :pathname "linear/"
  :components  ((:quail-source-file "misc-defs")
               (:quail-source-file "pivot")
               (:quail-source-file "linpack-macros")
               (:quail-source-file "dasum")
               (:quail-source-file "daxpy")
               (:quail-source-file "dchdc")
               (:quail-source-file "dcopy")
               (:quail-source-file "ddot")
               (:quail-source-file "dgeco")
               (:quail-source-file "dgedi")
               (:quail-source-file "dgefa")
               (:quail-source-file "dgels")
               (:quail-source-file "dgesl")
               (:quail-source-file "dnrm2")
               (:quail-source-file "dpoco")
               (:quail-source-file "dpodi")
               (:quail-source-file "dpofa")
               (:quail-source-file "dposl")
               (:quail-source-file "dqrdc")
               (:quail-source-file "dqrls")
               (:quail-source-file "dqrsl")
               (:quail-source-file "drot")
               (:quail-source-file "drotg")
               (:quail-source-file "dscal")
               (:quail-source-file "dsico")
               (:quail-source-file "dsidi")
               (:quail-source-file "dsifa")
               (:quail-source-file "dsisl")
               (:quail-source-file "dsvdc")
               (:quail-source-file "dswap")
               (:quail-source-file "dtrco")
               (:quail-source-file "dtrdi")
               (:quail-source-file "dtrls")
               (:quail-source-file "dtrsl")
               (:quail-source-file "dpbco")
               (:quail-source-file "dpbfa")
               (:quail-source-file "dpbsl")
               (:quail-source-file "dpbdi")
               (:quail-source-file "dgbco")
               (:quail-source-file "dgbfa")
               (:quail-source-file "dgbsl")
               (:quail-source-file "dgbdi")
               (:quail-source-file "idamax")
               (:quail-source-file "jacobi")
               (:quail-source-file "linpack")
               (:quail-source-file "table-mixin")
               (:quail-source-file "matrix-decomposition")
               (:quail-source-file "diagonal")
               (:quail-source-file "triangular")
               (:quail-source-file "qr-decomposition")
               (:quail-source-file "lu-decomposition")
               (:quail-source-file "cholesky-decomposition")
               (:quail-source-file "sv-decomposition")
               (:quail-source-file "eigen-decomposition")
               (:quail-source-file "inverse")
               (:quail-source-file "identity-matrix")
               (:quail-source-file "solve")
               (:quail-source-file "qr-solution")
               (:quail-source-file "lin-binary-methods")
               (:quail-source-file "rank")
               (:quail-source-file "condition-number")
               (:quail-source-file "determinant")
               (:quail-source-file "trace")
               (:quail-source-file "matrix-sqrt")
               (:quail-source-file "apply-weight")
               ))
    ))
