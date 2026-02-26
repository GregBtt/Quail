;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               quail-kernel.asd                               
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1990 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     Greg Anglin 1989, 1990, 1991.
;;;     R.W. Oldford 1989 +
;;;     Bob White
;;;     Greg Bennett 2017, 2026
;;;
;;;
;;;----------------------------------------------------------------------------

(asdf:defsystem "quail-kernel"
  :serial t
  :components
  ((:module "quail-kernel"
    :pathname "quail-kernel/"
    :components
    ((:quail-source-file "quail-kernel-package")
     (:quail-source-file "quail-locks")
     (:quail-source-file "quail-kernel-system-sblx" :if-feature :sbcl)
     (:quail-source-file "quail-kernel-system-ccl"  :if-feature :ccl-1.11)
     (:quail-source-file "quail-kernel-system-pc"   :if-feature :aclpc-linux)

     (:module "mop"
      :pathname "mop/"              ; <- note: relative to quail-kernel/
      :components
      ((:quail-source-file "mop-sblx" :if-feature :sbcl)
       (:quail-source-file "mop-ccl"  :if-feature :ccl-1.11)
       (:quail-source-file "mop-pc"   :if-feature :aclpc-linux)

       (:quail-source-file "mixin-to-quail")

       (:quail-source-file "function-info-sblx" :if-feature :sbcl)
       (:quail-source-file "function-info-ccl"  :if-feature :ccl-1.11)
       (:quail-source-file "function-info-pc"   :if-feature :aclpc-linux)))

      (:module "basic"
         :pathname "basic/"
         :components ((:quail-source-file "defmethod-multi")
           (:quail-source-file "special-vars")
           (:quail-source-file "synonym")
           (:quail-source-file "seq")
           (:quail-source-file "tree")
           (:quail-source-file "search-tree")
           (:quail-source-file "utility"
             :depends-on ("special-vars"))
           (:quail-source-file "utility-sblx" :if-feature :sbcl)
           (:quail-source-file "utility-ccl" :if-feature :ccl-1.11)
           (:quail-source-file "utility-pc" :if-feature :aclpc-linux)
           (:quail-source-file "seq-utilities")
           (:quail-source-file "symbols")
           (:quail-source-file "quail-object")
           (:quail-source-file "proto-mixin")
           (:quail-source-file "open-mixin")
           (:quail-source-file "return-class")
           (:quail-source-file "make-result")
           (:quail-source-file "defconstant" :if-feature :sbcl)))

      (:module "io"
         :pathname "io/"
         :components ((:quail-source-file "quail-io")
           (:quail-source-file "quail-file")
           (:quail-source-file "scan")
           (:quail-source-file "slots")
           (:quail-source-file "save-sblx" :if-feature :sbcl)
           (:quail-source-file "save-ccl" :if-feature :ccl-1.11)
           (:quail-source-file "save-pc" :if-feature :aclpc-linux)
           (:quail-source-file "restore")
           ;; (:file (add-system-extension "restore"))
                                     )
         ;:depends-on ("quail-kernel/basic")
         )

      (:module "ref"
         :pathname "ref/"
         :components ((:quail-source-file "ref-object")
           (:quail-source-file "eref")
           (:quail-source-file "ref")
           (:quail-source-file "indices")
           (:quail-source-file "ref-if")
           (:quail-source-file "ref-eq")
           (:quail-source-file "setf-ref")
           (:quail-source-file "sel")
           (:quail-source-file "with-ref")
           (:quail-source-file "number-of-elements")
           (:quail-source-file "number-of-slices")
           (:quail-source-file "subscript-utility")
           (:quail-source-file "row-major-ops")
           (:quail-source-file "column-major-ops")
           ;; this wasn't doing anything anywhere ... dga 94 03
         ;; (:file "ref-behavior")
                                     )
         ;:depends-on ("quail-kernel/basic" "quail-kernel/io")
         )

      (:module "math"
         :pathname "math/"
         :components ((:quail-source-file "extended-ops" :if-feature (:not (:or :sbcl :ccl-1.11)))
           (:quail-source-file "extended-ops-sblx" :if-feature :sbcl)
           (:quail-source-file "extended-ops-ccl" :if-feature :ccl-1.11)
           (:quail-source-file "extended-ops-pc" :if-feature :aclpc-linux)
           (:quail-source-file "matrix-multiply")) 
         ;:depends-on ("quail-kernel/basic" "quail-kernel/io" "quail-kernel/ref")
         )

      (:module "array"
         :pathname "array/"
         :components ((:quail-source-file "map-element")
           (:quail-source-file "map-slices")
           (:quail-source-file "array")
           (:quail-source-file "ref-array")
           (:quail-source-file "mk-array")
           (:quail-source-file "copy-dispatch")
           (:quail-source-file "num-array")
           (:quail-source-file "ones-array")
           (:quail-source-file "matrix")
           (:quail-source-file "file-matrix")
           (:quail-source-file "collapse")
           (:quail-source-file "tp")
           (:quail-source-file "glue")
           (:quail-source-file "slice")
           (:quail-source-file "sort-object"
             :depends-on ("slice"))
           (:quail-source-file "sort")
           (:quail-source-file "sort-position"
             :depends-on ("slice"))
           (:quail-source-file "ranks")
           (:quail-source-file "order")
           (:quail-source-file "remove-slices")
           (:quail-source-file "find-slices")
           (:quail-source-file "count-slices"
             :depends-on ("slice"))
           (:quail-source-file "substitute-slices")
           (:quail-source-file "replace-slices")
           (:quail-source-file "slice-positions")
           (:quail-source-file "reduce-slices")
           )
         ;:depends-on ("quail-kernel/basic" "quail-kernel/io" "quail-kernel/ref" "quail-kernel/math")
         ))

)))

