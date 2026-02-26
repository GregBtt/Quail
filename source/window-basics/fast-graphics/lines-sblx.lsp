;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                              lines-sblx.lsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Copyright (c) Statistical Computing Laboratory
;;;                University of Waterloo
;;;                Canada.
;;;  This file is an addition to Window-basics for moving pointclouds
;;;  
;;;  Authors:
;;;     H.A. Chipman 1991
;;;     C.B. Hurley 1991 George Washington University
;;;     R.W. Oldford 1992
;;;     G.W. Bennett 1996
;;;     
;;;     
;;;--------------------------------------------------------------------

(in-package :wb)
(eval-when (:compile-toplevel :load-toplevel :execute) (export  '(canvas-draw-lines canvas-erase-lines canvas-move-lines)))

;; coords are lists with even length (s1 e1 s2 e2...) where s1 and e1 are the start
;; and end of the first line

(defun draw-fw-lines (canvas coords &key (width 1)
                             invisible?
                             color
                             erase? &allow-other-keys)
  "Draws or erases colored fixed width lines"
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (let ((mp (clim:get-frame-pane canvas 'host-pane)))
    (with-drawing-options (mp :ink color :line-thickness width)
                          (loop 
                            for (xs ys) fixnum in coords by #'cddr
                            for (xe ye) fixnum in (cdr coords) by #'cddr
                            for i in invisible?
                            unless i
                            do 
                            (if erase?
                                (fast-erase-line canvas xs ys xe ye)
                                (fast-draw-line canvas xs  ys xe  ye)))
                          )
    ))

;;;
(defun xor-move-fw-lines (canvas old-coords new-coords
                                 &key (width 1) color  &allow-other-keys )
  "Moves colored fixed width lines~
  Results with color background are undefined"
  ;(declare 
  ;         (optimize (speed 3) (safety 0)
  ;                   (space 0) (compilation-speed 0)))
  (let* ((mp (clim:get-frame-pane canvas 'host-pane))
         (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
    (loop 
      for (sx1 sy1 ) fixnum in old-coords by #'cddr 
      for (ex1 ey1 ) fixnum in (cdr old-coords) by #'cddr 
      for (sx2 sy2 ) fixnum in new-coords by #'cddr 
      for (ex2 ey2 ) fixnum in (cdr new-coords) by #'cddr 
      do 
      (with-drawing-options (mp :ink mpbg :line-thickness width)     
                            (fast-erase-line canvas sx1 sy1 ex1 ey1))
      (with-drawing-options (mp :ink color :line-thickness width)
                            (fast-draw-line canvas sx2  sy2 ex2 ey2))
      )
    ))

;;;
;;; Since clim has no xor (above) drawing mode or other drawing modes
;;; test-move-fw-lines is just a call to xor-move-fw-lines
(defun move-fw-lines (canvas old-coords new-coords
                             &key (width 1) color &allow-other-keys )
  "Moves colored fixed width lines"
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (xor-move-fw-lines canvas old-coords new-coords :width width :color color))
;;;
(defun draw-multi-color-lines (canvas coords &key (width 1) color invisible? 
                                      erase? &allow-other-keys)
  "Draws or erases lines with varying color."
  (declare (ignorable invisible?))
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  ;(declare (type fixnum width) (ignorable invisible?))
  (let* ((mp (clim:get-frame-pane canvas 'host-pane))
         (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
    (loop 
      for (xs ys ) fixnum in coords by #'cddr
      for (xe ye ) fixnum in (cdr coords) by #'cddr
      for c in color
      do 
      (if erase?
          (with-drawing-options (mp :ink mpbg :line-thickness width)
                                (fast-erase-line canvas xs ys xe ye))
          (with-drawing-options (mp :ink c :line-thickness width)
                                (fast-draw-line canvas xs ys xe ye))
          )
      )
    ))

;;;
;;; There is no xor- in clim .. regular code
(defun xor-move-multi-color-lines (canvas old-coords new-coords
                                          &key (width 1) color 
                                          invisible? &allow-other-keys )
  "Moves lines with varying color.  ~
  Results with color background are undefined."
  (declare (ignorable invisible?))
  ;(declare 
  ;         (optimize (speed 3) (safety 0)
  ;                   (space 0) (compilation-speed 0)))
  ;(declare (type fixnum width) (ignorable invisible?))
  (let* ((mp (clim:get-frame-pane canvas 'host-pane))
         (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
    (loop 
      for (sx1 sy1 ) fixnum in old-coords by #'cddr 
      for (ex1 ey1 ) fixnum in (cdr old-coords) by #'cddr 
      for (sx2 sy2 ) fixnum in new-coords by #'cddr 
      for (ex2 ey2 ) fixnum in (cdr new-coords) by #'cddr 
      for c in color
      do
      (with-drawing-options (mp :ink mpbg :line-thickness width)
                            (fast-erase-line canvas sx1 sy1 ex1 ey1))
      (with-drawing-options (mp :ink c :line-thickness width)
                            (fast-draw-line canvas sx2 sy2 ex2 ey2))
      )
    ))

;;;
(defun move-multi-color-lines (canvas old-coords new-coords
                                      &key (width 1)
                                      color rgb-color? &allow-other-keys )
  "Moves lines with varying color."
  (declare (ignorable rgb-color?))
  ;(declare 
  ;         (optimize (speed 3) (safety 0)
  ;                   (space 0) (compilation-speed 0)))
  ;(declare (type fixnum width) 
  ;         (ignore rgb-color?))
  (let* ((mp (clim:get-frame-pane canvas 'host-pane))
         (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
    (loop 
      for (sx1 sy1 ) fixnum in old-coords by #'cddr 
      for (ex1 ey1 ) fixnum in (cdr old-coords) by #'cddr 
      for (sx2 sy2 ) fixnum in new-coords by #'cddr 
      for (ex2 ey2 ) fixnum in (cdr new-coords) by #'cddr 
      for c in color
      do 
      (with-drawing-options (mp :ink mpbg :line-thickness width)
                            (fast-erase-line canvas sx1 sy1 ex1 ey1))
      (with-drawing-options (mp :ink c :line-thickness width)
                            (fast-draw-line canvas sx2 sy2 ex2 ey2))
      )
    ))

;;; 
(defun draw-multi-color-&-width-lines (canvas coords &key width color 
                                              invisible? erase? &allow-other-keys)
  "Draws or erases lines with varying color and width."
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (declare (ignorable invisible?))
  (let ((mp (clim:get-frame-pane canvas 'host-pane))
        (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
    (loop
      for (xs ys ) fixnum in coords by #'cddr
      for (xe ye ) fixnum in (cdr coords) by #'cddr          
      for w in width 
      for c in color
      do 
      (if erase?
          (with-drawing-options (mp :ink mpbg :line-thickness w)
                                (fast-erase-line canvas xs ys xe ye))
          (with-drawing-options (mp :ink c :line-thickness w)
                                (fast-draw-line canvas xs ys xe ye))
          )
      )
    )
  )

;;;
;;; Thers is no xor so regular code
(defun xor-move-multi-color-&-width-lines (canvas old-coords new-coords
                                                  &key width color &allow-other-keys )
  "Moves lines with varying color and width~
  Results with color background are undefined."
  ;(declare 
  ;         (optimize (speed 3) (safety 0)
  ;                   (space 0) (compilation-speed 0)))
  (let* ((mp (clim:get-frame-pane  canvas 'host-pane))
         (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
    (loop
      for (sx1 sy1 ) fixnum in old-coords by #'cddr 
      for (ex1 ey1 ) fixnum in (cdr old-coords) by #'cddr 
      for (sx2 sy2 ) fixnum in new-coords by #'cddr 
      for (ex2 ey2 ) fixnum in (cdr new-coords) by #'cddr 
      for w in width 
      for c in color
      do
      (with-drawing-options (mp :ink mpbg :line-thickness w)
                            (fast-erase-line canvas sx1 sy1 ex1 ey1))
      (with-drawing-options (mp :ink c :line-thickness w)
                            (fast-draw-line canvas sx2 sy2 ex2 ey2))
      )
    ))

;;;
;;; the following is just a call to the previous
(defun move-multi-color-&-width-lines
  (canvas old-coords new-coords  &key width color rgb-color? &allow-other-keys )
  "Moves lines with varying color and width"
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (declare (ignorable rgb-color?))
  (xor-move-multi-color-&-width-lines canvas old-coords new-coords :width width
                                      :color color))


;;;
(defun canvas-draw-lines (canvas coords
                                 &key (width 1) (erase? nil)
                                 color
                                 invisible?
                                 &allow-other-keys )
  "Draws or erases lines "
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (if (and  color (listp color))
      (if (and width (listp width))
          (draw-multi-color-&-width-lines canvas coords :width width :color color :erase? erase?
                                          :invisible? invisible?)
          (draw-multi-color-lines canvas coords :width width :color color :erase? erase?
                                  :invisible? invisible?))
      (draw-fw-lines canvas coords
                     :width (if (listp width ) (car  width) width)
                     :color (if (listp color ) (car  color) color) 
                     :erase? erase?
                     :invisible invisible?)
      ))

;;;
(defun canvas-erase-lines (canvas coords
                                  &key (width 1) 
                                  color
                                  &allow-other-keys )
  "Erases lines "
  (declare ;(optimize (speed 3) (safety 0)
           ;                 (space 0) (compilation-speed 0))
                            (inline canvas-draw-lines))
  (canvas-draw-lines canvas coords :width width :color color :erase? t))

;;;
(defun canvas-move-lines (canvas old-coords new-coords
                                 &key (width 1)  (rgb-color? nil)
                                 color 
                                 &allow-other-keys )
  "Moves lines "
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (if (and  color (listp color))
      (if (and width (listp width))
          (move-multi-color-&-width-lines canvas old-coords new-coords
                                          :width width 
                                          :color (if (and (colored-canvas-p canvas) (not rgb-color? ))
                                                     (rgb-colors color)
                                                     color))
          (move-multi-color-lines canvas old-coords new-coords
                                  :width width 
                                  :color (if (and (colored-canvas-p canvas) (not rgb-color? ))
                                             (rgb-colors color)
                                             color)))
      (move-fw-lines canvas old-coords new-coords
                     :width (if (listp width ) (car  width)) 
                     :color (if (listp color ) (car  color))) ;<<== compiler used clim:color
      )
  )

;;;
(defun canvas-draw-axes (canvas axes  &key (width 1) (erase? nil)
                                color)
  "Draws or erases  axes"
  ;(declare 
  ;         (optimize (speed 3) (safety 0)
  ;                   (space 0) (compilation-speed 0)))
  (when axes
    ;(let* ((mp (get-frame-pane canvas 'host-pane))
    ;  (mpbg (medium-background (get-frame-pane canvas 'host-pane))))
    (if erase?
        (draw-fw-lines canvas axes :color color :width width :erase? t)
        (draw-fw-lines canvas axes :color color :width width ))
    ;)
    ))

;;;
(defun canvas-erase-axes (canvas axes
                                 &key (width 1) 
                                 color) 
  "Erases axes "
  (declare ;(optimize (speed 3) (safety 0)
           ;                 (space 0) (compilation-speed 0))
                             (inline canvas-draw-axes))
  (canvas-draw-axes canvas axes :width width :color color :erase? t))

;;;
(declaim (sb-ext:maybe-inline canvas-move-axes)) ;15DEC2024
(defun canvas-move-axes (canvas old-axes new-axes
                                &key (width 1)  
                                color 
                                &allow-other-keys )
  "Moves axes "
  ;(declare (optimize (speed 3) (safety 0)
  ;                          (space 0) (compilation-speed 0)))
  (when old-axes
    (let* ((mp (clim:get-frame-pane canvas 'host-pane))
           (mpbg (medium-background (clim:get-frame-pane canvas 'host-pane))))
      (loop 
        for (sx1 sy1 ) fixnum in old-axes by #'cddr 
        for (ex1 ey1 ) fixnum in (cdr old-axes) by #'cddr 
        for (sx2 sy2 ) fixnum in new-axes by #'cddr 
        for (ex2 ey2 ) fixnum in (cdr new-axes) by #'cddr 
        do 
        (with-drawing-options (mp :ink mpbg :line-thickness width)     
                              (fast-erase-line canvas sx1 sy1 ex1 ey1))
        (with-drawing-options (mp :ink color :line-thickness width)
                              (fast-draw-line canvas sx2  sy2 ex2 ey2))
        )
      )))
   