;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                           doc-vars.lisp                               
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; copyright (c) 1992 statistical computing laboratory, university of waterloo
;;;
;;;
;;;  authors:
;;;     r.w. oldford 1992.
;;;
;;;
;;;----------------------------------------------------------------------------

;;;----------------------------------------------------------------------------
;;;
;;;  A collection of useful constants and variables.
;;;
;;;----------------------------------------------------------------------------


(in-package :quail-kernel)

#-:use-define-const(defconstant +CLtL+
  "Guy L. Steele, Jr. (1990) \"Common Lisp: The Language (second edition).\" ~
   Digital Press."
  "Most recent reference for the language definition of Common Lisp.")

#+:use-define-const(qk::define-constant +CLtL+
                     "Guy L. Steele, Jr. (1990) \"Common Lisp: The Language (second edition).\" ~
                     Digital Press."
                     "Most recent reference for the language definition of Common Lisp."
                     )
