;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               new-math.asd                               
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1990 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     M.E.Lewis 1991.
;;;     G.W.Bennett 2017. 2026
;;;
;;;----------------------------------------------------------------------------


(asdf:defsystem "new-math"
    :serial t
      :components 
      ((:module "new-math"
        :pathname "new-math/"
        :components
      ((:quail-source-file "new-math-package")
               (:quail-source-file "new-math")
               (:quail-source-file "num-array-math")
               (:quail-source-file "init-new-math")))))
