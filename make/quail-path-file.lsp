;;; This is ~/RESERVE/quail-from-git/Quail/make/quail-path-file.lsp
;;; Holding the definition on quail-path from Quail97/Make/quail-make-1.lsp
;;; Updated to include :sbcl

(in-package :clim-user)

(defun path-quail ()
  #+(or :sbcl :ccl :acl)  (translate-logical-pathname "q:")
  #+:excl "before-q:Quail;")