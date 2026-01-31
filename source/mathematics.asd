;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               mathematics.asd     
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1992 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     R.W. Oldford 1992.
;;;     G.W.Bennett 2018, 2026
;;;
;;;--------------------------------------------------------------------------------
        
(asdf:defsystem "mathematics"
    :serial t
   :components
   ((:module "mathematics"
    :pathname "mathematics/"
    :components
   ((:module "special-functions"
             :components
             ((:quail-source-file "log-gamma")
              (:quail-source-file "continued-fraction")
              (:quail-source-file "complete-beta")
              (:quail-source-file "incomplete-gamma")
              (:quail-source-file "incomplete-beta")
              (:quail-source-file "error-function")
              ))

    (:module "combinatorics"
             :components
             ((:quail-source-file "factorial")
              (:quail-source-file "choose")
              (:quail-source-file "factor")
              ))

    (:module "functions"
             :components ((:quail-source-file "fn")
                    
      ;(:quail-source-file "surface")
                          )
             )
    #|
    (:module borel-sets
             :source-pathname (path-borel-sets)
             :binary-pathname (bin (path-borel-sets))
             :components ((:quail-source-file "utility")
	                  (:quail-source-file "borel-special")
                          (:quail-source-file "set-collections")
                          (:quail-source-file "borel-sets")
	                  (:quail-source-file "borel-sets2")
	                  (:quail-source-file "borel-functions")
                          (:quail-source-file "borel-special2")
                          (:quail-source-file "borel-sets-methods")
	                  (:quail-source-file "memberp-methods")
	                  (:quail-source-file "insidep-methods")
			  (:quail-source-file "copy-methods")
			  (:quail-source-file "disjoint-sets-p-methods")
	 		  (:quail-source-file "simplify-methods")
			  (:quail-source-file "set-union-methods")
			  (:quail-source-file "set-intersection-methods")
			  (:quail-source-file "set-complement-methods")
                          )
             )
    (:module measures
             :source-pathname (path-measures)
             :binary-pathname (bin (path-measures))
             :components ((:quail-source-file "measure")
                          (:quail-source-file "measure-generics")
                          (:quail-source-file "lebesgue-measure")
                          (:quail-source-file "counting-measure")
                          (:quail-source-file "finite-measure")
                          (:quail-source-file "probability-measure")
                          )
             )
    |#

    (:module "calculus"
             :components ((:quail-source-file "numerical-deriv")
                          (:quail-source-file "simplify")
                          (:quail-source-file "deriv")
                          (:quail-source-file "simpsons")
                          )
             )

    (:module "root-finders"
             :components ((:quail-source-file "newton")
                          (:quail-source-file "illinois")
                          )
             )
     #|
    (:module graphics
             :source-pathname (path-math-graphics)
             :binary-pathname (bin (path-math-graphics))
             :components ((:quail-source-file "surface-view")
                          (:quail-source-file "surface-plot")
                          (:quail-source-file "rotate-surface")
                          )
             )
    |#
    ))
   ))