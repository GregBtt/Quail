;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               statistics.asd                              
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1992 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     D.G. Anglin 1992.
;;;     R.W. Oldford 1992.
;;;
;;;
;;;--------------------------------------------------------------------------------

(asdf:defsystem "statistics"
    :serial t
    :components
    ((:module "statistics"
        :pathname "statistics/"
        :components
        ((:module "basic-statistics"
            :pathname "basic-statistics/"
            :components
            ((:quail-source-file "summary-statistics")
              (:quail-source-file "sweep")))
        
        (:module "stat-graphics"
            :pathname "stat-graphics/"
            :components
            ((:quail-source-file "projection-trace")
              (:quail-source-file "qq-plot")
              ;; --> split between Views and Stat-Sessions (:quail-source-file "display")
              (:quail-source-file "display-probability")
              (:quail-source-file "stem")
              (:quail-source-file "hue-light-view")
              (:quail-source-file "imagel")
              (:quail-source-file "image")
              )
            )
        
        (:module "models"
            :pathname "models/"
            :components ((:quail-source-file "parse")
              (:quail-source-file "formula-reduce")
              (:quail-source-file "additive-formula-semantics")
              (:quail-source-file "formula-object")
              (:quail-source-file "factor")
              (:quail-source-file "contrasts")
              (:quail-source-file "response-matrix")
              (:quail-source-file "data-object")
              (:quail-source-file "data-frame")
                          ;;(:quail-source-file "fn")   ---> gone to Mathematics directory
                          (:quail-source-file "link")
                          (:quail-source-file "family")
                          (:quail-source-file "weight-fn")
                          (:quail-source-file "model-object")
                          (:quail-source-file "model-frame")
                          (:quail-source-file "fit")
                          (:quail-source-file "deviance")
                          (:quail-source-file "residuals")
                          (:quail-source-file "model-matrix")
                          (:quail-source-file "gam")
                          (:quail-source-file "gamfit-1") ;; temporary name, probably
                          (:quail-source-file "glm")
                          (:quail-source-file "least-squares-mixin")
                          (:quail-source-file "linear-model")
                          (:quail-source-file "lsfit")
                          ;; (:quail-source-file "models-topic-doc")
                          (:quail-source-file "new-terms")
                          ;;(:quail-source-file "display") << has wb:
                          )
            )
        
        (:module "stat-sessions"
            :pathname "stat-sessions/"
            :components
            ((:quail-source-file "response-session"))
            )
        
        ))
    ))