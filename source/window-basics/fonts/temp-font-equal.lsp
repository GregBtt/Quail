;;; This is ~/RESERVE/quail-from-git/Quail/source/window-basics/fonts/temp-font-equal.lsp
;;; Holding a version of canvas-font-equail which just reutrns T

(in-package :wb)

(defun canvas-font-equal (font1 font2)
  "Tests whether font1 and font2 represent the same canvas-font."
  #|
  (flet ((sort-font-list (font)
           (list
            (canvas-font-name font)
            (canvas-font-size font)
            (canvas-font-transfer-mode font)
            (sort (canvas-font-style font)
                  #'(lambda (x y)
                      (< (position x (canvas-font-styles))
                         (position y (canvas-font-styles))))))))
    (equal (sort-font-list (copy-canvas-font font1))
           (sort-font-list (copy-canvas-font font2))))
           |#
           T
  )

