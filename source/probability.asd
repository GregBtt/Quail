;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               probability.asd                              
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1993 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     R.W. Oldford 1993.
;;;
;;;
;;;--------------------------------------------------------------------------------


(asdf:defsystem "probability"
    :serial t
    :components
    ((:module "probability"
        :pathname "probability/"
        :components
        ((:module "generators"
            :pathname "generators/"
            :components
            ((:quail-source-file "random")
              (:quail-source-file "system")
              (:quail-source-file "congruential")
              (:quail-source-file "default")
              ))
        
        (:module "distributions"
            :pathname "distributions/"
            :components
            ((:quail-source-file "prob-measure")
              (:quail-source-file "findlimits")
              (:quail-source-file "discrete-dist")
              (:quail-source-file "bisection")
              (:quail-source-file "continuous-dist")
              (:quail-source-file "location-scale")
              (:quail-source-file "beta")
              (:quail-source-file "uniform")
              (:quail-source-file "prob-methods")
              (:quail-source-file "gamma")
              (:quail-source-file "exponential")
              (:quail-source-file "chi-squared")
              (:quail-source-file "student")
              (:quail-source-file "gaussian")
              (:quail-source-file "cauchy")
              (:quail-source-file "binomial")
              (:quail-source-file "bernoulli")
              (:quail-source-file "negative-binomial")
              (:quail-source-file "geometric")
              (:quail-source-file "hypergeometric") ;;; <---- fix simultaneous setting
              (:quail-source-file "discrete-uniform")
              (:quail-source-file "poisson")
              (:quail-source-file "finite-mixture")
              (:quail-source-file "data-prob")
              (:quail-source-file "pareto")
              (:quail-source-file "weibull")
              (:quail-source-file "F-dist")
              (:quail-source-file "K-dist")
              (:quail-source-file "init-dist")
              ))
        (:module "random"
            :pathname "random/"
            :components
            ((:quail-source-file "permute")))
        
        
        ))
    ))