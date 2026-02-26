;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                               mouse-sblx.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Copyright (c) Statistical Computing Laboratory
;;;                University of Waterloo
;;;                Canada.
;;;  This file is part of the Window-Basics package intended to provide a uniform
;;;  window environment for Common Lisp programming.
;;;  
;;;  For copyright information and history, see window-basics-copyright.lisp
;;;  Authors:
;;;     H.A. Chipman 1991
;;;     C.B. Hurley 1989-1991
;;;     J.A. McDonald 1988-89
;;;     R.W. Oldford 1989-1996
;;;     J.O. Pedersen 1988-89
;;;    G.W. Bennett 1996
;;;     
;;;==========================================================================
;;;    - created to provide
;;;      uniform three-button mouse interaction
;;;      left   
;;;      middle
;;;      right
;;;      Each key can also be modified by either the shift-key or the
;;;      control-key.
;;;  NOTES:
;;;  For the purposes of PCs with only L and R buttons (eg laptops)
;;;  meta-L or meta-R have been defined to function as a middle
;;;  button. meta-  corresponds to alt-  on PCs.
;;;      
;;;===========================================================================
(in-package :wb)
;;;;;;;;;;;;;;;;;;;;;;
;;;  Redefining shadowed symbols  SEE DEFPACKAGE
;;;(shadow '(mouse-down-p shift-key-p control-key-p)) ;now in window-basics-package.lsp 01SEP2021

;;; A version which takes an argument
;(defun mouse-down-p (canvas) 
;  (let* ((pointer (port-pointer (find-port)))
;         (sheet (pointer-sheet pointer))
;         (state (pointer-button-state pointer)))
;    (and (typep sheet canvas)
;         (not (zerop (logand state clim:+pointer-left-button+ ))))))


;;; The following seems to work as the version with (window) as argument above
;;; At least it passes the drag stuff
;;; It still seems a bit odd NOT to have that argument to narrow when things are triggered.
(defun mouse-down-p ()
  (let* ((pointer (port-pointer (find-port)))
         (state (pointer-button-state pointer)))
    (not (zerop (logand state clim:+pointer-left-button+)))))

(defun shift-key-p ()
     "Tests whether a shift key is being held down."
     (if (eql (port-modifier-state (find-port)) +shift-key+)
      T nil))

  
(defun control-key-p ()
  "Tests whether a control key is being held down."
  (if (eql (port-modifier-state (find-port)) +control-key+)
    T nil))



(eval-when (:compile-toplevel :load-toplevel :execute) (export  '(mouse-down-p shift-key-p control-key-p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-when (:compile-toplevel :load-toplevel :execute) (export '(mouse-state mouse-position mouse-x mouse-y
          screen-mouse-position screen-mouse-x screen-mouse-y)))


(defun mouse-state ()
  (let ((result (pointer-button-state (port-pointer (find-port)))))
    (cond ((eql result +pointer-left-button+)
      (setf result :left))
    ((eql result +pointer-middle-button+)
      (setf result :middle))
    ((eql result +pointer-right-button+)
      (setf result :right))
    (t (setf result :none)))
  result
  ))


 (defun mouse-position (canvas)
      (let* ((mp (get-frame-pane canvas 'host-pane))
       (coord-list (multiple-value-list (stream-pointer-position mp)))) ;(stream-cursor-position mp)))) ;18JAN2025
        (make-position (first coord-list) (host-to-canvas-y canvas (second coord-list))))) ;15DEC2024
  ;(h-draw:make-point (first coord-list) (host-to-canvas-y canvas (second coord-list)))))          

(defun mouse-x (canvas)
  (position-x (mouse-position canvas)) ;15DEC2024
     ;(h-draw:point-x (mouse-position canvas))
     )

(defun mouse-y (canvas)
  (position-y (mouse-position canvas)) ;15DEC2024
      ;(h-draw:point-y (mouse-position canvas))
      )

;;;========================================================================================
;;; mouse position in screen coordinates, cbh
;;;========================================================================================
(defun screen-mouse-position ()
     "Returns position of mouse in screen coords."
     (let ((pointer-pos
     (multiple-value-list (pointer-position (port-pointer (find-port))))))
     (make-position (first pointer-pos) (second pointer-pos))
    ))
    
(defun screen-mouse-x ()
     (position-x (screen-mouse-position)))
(defun screen-mouse-y ()
     (position-y (screen-mouse-position)))
