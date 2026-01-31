;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               quail-user.asd                               
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
;;;     Greg Bennett 2017
;;;
;;;
;;;----------------------------------------------------------------------------

(asdf:defsystem "quail-user"
    :serial t
        :components ((:quail-source-file "quail-user-package")
            ))