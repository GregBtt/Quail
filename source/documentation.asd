;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               documentation.asd                             
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1991 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     R.W. Oldford 1991.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(asdf:defsystem "documentation"
    :serial t
    :components 
    ((:module "documentation"
        :pathname "documentation/"
        :components
   ((:quail-source-file "documentation-path") ;07JAN2020
    (:quail-source-file "inform-user")
    (:quail-source-file "edit-file")
    (:quail-source-file "doc-vars")
    (:quail-source-file "doc-utility")
    (:quail-source-file "documentation")
    (:quail-source-file "doc-type")
    (:quail-source-file "utility-args")
    (:quail-source-file "doc")
    (:quail-source-file "write-doc")
    (:quail-source-file "format-ext")
    (:quail-source-file "format-doc")
    (:quail-source-file "topic")
    (:quail-source-file "install-topics")
    (:quail-source-file "generate-topic")
    (:quail-source-file "format-tree")
    (:quail-source-file "documentation-string")
    (:quail-source-file "make-doc")
    (:quail-source-file "document-topics")
    (:quail-source-file "auto-topics")
    (:quail-source-file "help")
    (:quail-source-file "tex-basic")
    (:quail-source-file "write-tex")
    (:quail-source-file "tex-ext")
    (:quail-source-file "doc-tex-index")
    (:quail-source-file "write-tex-doc")
    (:quail-source-file "document-symbols")
    (:quail-source-file "tex-doc-symbols")
    (:quail-source-file "track-new-symbols")
    (:quail-source-file "header-box")
    (:quail-source-file "help-window")
                ;(:quail-source-file "header-box")
                (:quail-source-file "doc-display-lists")
                ;(:quail-source-file "help-window")
                (:quail-source-file "help-sub-views")
                (:quail-source-file "help-view")
                (:quail-source-file "help-display")
                (:quail-source-file "doc-index")
                ))))
