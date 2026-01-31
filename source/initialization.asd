;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               initialization.asd                              
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

(asdf:defsystem "initialization"
    :serial t
    :components
    ((:module "initialization"
        :pathname "initialization/"
  :components ((:quail-source-file "update-special-vars") ;; contains vw:
               ;(:quail-source-file "synonyms") ;; 17NOV2024 contents moved to quail-kernel/basic/synonym.lsp
               ;; no longer supported
               ;; (:quail-source-file (add-system-extension "ffenv-std"))
               (:quail-source-file "load-quail-init")
               ;; a temporary way to deal with this ...
               (:quail-source-file "release-path")
               (:quail-source-file "release") ;<< contains vw:
               (:quail-source-file "restore-sblx")
               (:quail-source-file "restored-lisp-functions") ;<< some undefined functions invoked
               (:quail-source-file "export-syms-from-quail") ;<< contains wb:
               (:quail-source-file "views-init") ;<< contains vw:
               (:quail-source-file "redefine-quail-io") ;<< contains wb:
               ))
    ))
          
