;;; This is ~/RESERVE/quail-from-git/Quail/make/quail-asdf-files.lsp
;;; Holding the definition of an asdf class for quail source files

(in-package :asdf)

(defclass quail-source-file (cl-source-file)
  ((type :initform "lsp")))
