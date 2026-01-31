;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               top-level.asd                              
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1990 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     R.W. Oldford 1991.
;;; 
;;;
;;;----------------------------------------------------------------------------

(asdf:defsystem "top-level"
    :serial t
    :components 
    ((:module "top-level"
        :pathname "top-level/"
        :components
        ((:quail-source-file "quail-top-level-read" :if-feature (:not :sbcl-linux))
               ;(:quail-source-file  "top-level-sblx")
               (:quail-source-file "top-level-pc" :if-feature :aclpc-linux)
               (:quail-source-file "infix") 
               (:quail-source-file "top-level" :if-feature (:not :sbcl-linux))
               ;; the following allows execution of forms from within an edit
               ;; window *when* the Quail top-level loop is running.
               (:quail-source-file "editor-sblx" :if-feature :sbcl-linux)
               (:quail-source-file "editor-mcl" :if-feature :ccl-1.11)
               (:quail-source-file "editor-pc" :if-feature :aclpc-linux)
               (:quail-source-file "quail-menu" :if-feature (:not :sbcl-linux))
               (:quail-source-file "quail-plot-menu" :if-feature (:not :sbcl-linux))
               (:quail-source-file "quail-menubar-sblx" :if-feature :sbcl-linux)
               (:quail-source-file "quail-menu-sblx" :if-feature :sbcl-linux) ;07NOV2024
               (:quail-source-file "plots-menu-sblx" :if-feature :sbcl-linux) ;07NOV2024
               (:quail-source-file "canvas-menu-sblx" :if-feature :sbcl-linux) ;07NOV2024
               (:quail-source-file "quail-plots-menus-sblx" :if-feature :sbcl-linux) ;07NOV2024
               (:quail-source-file "quail-plots-canvas-menus-sblx" :if-feature :sbcl-linux) ;07NOV2024
               (:quail-source-file "change-menu-bar-sblx" :if-feature :sbcl-linux) ;07NOV2024
               ;(:quail-source-file "quail-menubar-sblx")
               (:quail-source-file "quail-menubar-pc" :if-feature :aclpc-linux)  
               ))
    ))

