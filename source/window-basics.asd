;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;                               window-basics.asd                             
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;; Copyright (c) 1991 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     R.W. Oldford 1991 - 1992.
;;;     G.W. Bennett 2017.
;;;
;;;--------------------------------------------------------------------------------
;;; THIS IS THE SBCL FILE

(asdf:defsystem "window-basics"
   :serial t
   :components
   ((:module "window-basics"
      :pathname "window-basics/"
      :components
      ((:quail-source-file "window-basics-package")

         (:module "startup"
            :pathname "startup/"
            :components
            ((:quail-source-file "restore")
             ;;(:quail-source-file (wb-add-system-extension "restore"))
             ;;<-- use quail's restore fns instead
             (:quail-source-file "debug"))
            )

         (:module "macros"
            :pathname "macros/"
            :components
            ((:quail-source-file "macros-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "macros-pc" :if-feature :aclpc-linux)
              (:quail-source-file "operations-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "operations-pc" :if-feature :aclpc-linux)
              (:quail-source-file "operations")
              (:quail-source-file "positions")
              (:quail-source-file "display-mode"))
            )

         (:module "host"
            :pathname "host/"
            :components
            ((:quail-source-file "host-draw-package")
              (:quail-source-file "host-system-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "host-system-pc" :if-feature :aclpc-linux)
              (:quail-source-file "host-draw-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "host-draw-pc" :if-feature :aclpc-linux)
              (:quail-source-file "scrolling-window-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "scrolling-window-pc" :if-feature :aclpc-linux)
              (:quail-source-file "host-menu-canvas-sblx" :if-feature :sbcl-linux)
            ;(:quail-source-file"test-color-menu" :if-feature ) ;; NEW 15OCT2024 to test replacement
            (:quail-source-file "host-menu-canvas-pc" :if-feature :aclpc-linux)
            (:quail-source-file "host-window-sblx" :if-feature :sbcl-linux)
            (:quail-source-file "host-window-pc" :if-feature :aclpc-linux)
            (:quail-source-file "host-fonts-sblx" :if-feature :sbcl-linux)
            (:quail-source-file "host-fonts-pc" :if-feature :aclpc-linux)
            )
            )

         (:module "region"
            :pathname "region/"
            :components
            ((:quail-source-file "region")))

         (:module "transforms"
            :pathname "transforms/"
            :components
            ((:quail-source-file "list-transforms"))
             ;;(:quail-source-file integer-affine-transforms)
             )

         (:module "color"
            :pathname "color/"
            :components
            ((:quail-source-file "color-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "color-pc" :if-feature :aclpc-linux)   
              (:quail-source-file "color")
              (:quail-source-file "color-table")
              (:quail-source-file "color-mixin-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "color-mixin-pc" :if-feature :aclpc-linux)
              )
            ;:depends-on ("window-basics/macros")
            )

         (:module "fonts"
            :pathname "fonts/"
            :components
            ((:quail-source-file "font")
              (:quail-source-file "default-fonts-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "default-fonts-pc" :if-feature :aclpc-linux)
              (:quail-source-file "font-mixin-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "font-mixin-pc" :if-feature :aclpc-linux)
              )
            ;:depends-on ("window-basics/macros")
            )

         (:module "pen"
            :pathname "pen/"
            :components
            ((:quail-source-file "pen")
             ;; Following contains only a list of legal pen-ops ... never used.
             ;; (:quail-source-file (wb-add-system-extension "pen"))
             (:quail-source-file "pen-mixin"))
            )

         (:module "bitmap"
            :pathname "bitmap/"
            :components
            ((:quail-source-file "bitmap-sblx" :if-feature :sbcl-linux) ;; stubbed 11MAR2022  gwb
               (:quail-source-file "bitmap-pc" :if-feature :aclpc-linux)
             (:quail-source-file "bitmap") ;; stubbed 11MAR2022  gwb
   ;          ;(:quail-source-file "cursor-sblx" :if-feature )
   ;          (:quail-source-file "cursor-pc" :if-feature :aclpc-linux)
             (:quail-source-file "shades")
             (:quail-source-file "shades-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "shades-pc" :if-feature :aclpc-linux)
   ;          ;(:quail-source-file "cursor")
             (:quail-source-file "patterns"))
            ;:depends-on ("window-basics/pen" "window-basics/macros")
            )


         (:module "monitor"
            :pathname "monitor/"
            :components
            ((:quail-source-file "screen-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "screen-pc" :if-feature :aclpc-linux)
              (:quail-source-file "screen")
              (:quail-source-file "device-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "device-pc" :if-feature :aclpc-linux)
              (:quail-source-file "device")
              )
            )

         (:module "mouse"
            :pathname "mouse/"
            :components
            ((:quail-source-file "mouse-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "mouse-pc" :if-feature :aclpc-linux)
              (:quail-source-file "button-default")
              (:quail-source-file "canvas-button")
              (:quail-source-file "mouse")
              (:quail-source-file "canvas-button-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "canvas-button-pc" :if-feature :aclpc-linux))
            )

         (:module "menus"
            :pathname "menus/"
            :components
            ((:quail-source-file "menu-canvas")     
             (:quail-source-file "menu-canvas-sblx" :if-feature :sbcl-linux) ;does nothing
             (:quail-source-file "menu-canvas-pc" :if-feature :aclpc-linux)
             (:quail-source-file "menu")
             (:quail-source-file "menu-sblx" :if-feature :sbcl-linux) ;stub version 07MAR2022
             (:quail-source-file "menu-pc" :if-feature :aclpc-linux)
             ;(:quail-source-file "quail-plots-canvas-menus-sblx" :if-feature ) ;NEW 01SEP2024
             )
            )

         (:module "prompt"
            :pathname "prompt/"
            :components
            ((:quail-source-file "dialog-items-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "dialog-items-pc" :if-feature :aclpc-linux)
             (:quail-source-file "dialog-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "dialog-pc" :if-feature :aclpc-linux)
             (:quail-source-file "prompt-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "prompt-pc" :if-feature :aclpc-linux)
             (:quail-source-file "pick-one-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "pick-one-pc" :if-feature :aclpc-linux)
             (:quail-source-file "check-items-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "check-items-pc" :if-feature :aclpc-linux)
             (:quail-source-file "collect-input-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "collect-input-pc" :if-feature :aclpc-linux))
            )

         (:module "redisplay"
            :pathname "redisplay/"
            :components
            ((:quail-source-file "canvas-ops-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "canvas-ops-pc" :if-feature :aclpc-linux)
             (:quail-source-file "canvas-redisplay")
             (:quail-source-file "canvas-redisplay-sblx" :if-feature :sbcl-linux) ; 27AUG2021
             (:quail-source-file "canvas-redisplay-pc" :if-feature :aclpc-linux))
            )

         (:module "postscript"
            :pathname "postscript/"
            :components
            ((:quail-source-file "postscript-canvas")
               (:quail-source-file "ps-font-sblx" :if-feature :sbcl-linux) ;30AUG2021
             ;(:quail-source-file "ps-font")
             (:quail-source-file "ps-file")
             (:quail-source-file "ps-draw")
             (:quail-source-file "ps-strings")
             (:quail-source-file "ps-prompt")
             (:quail-source-file "canvas-to-ps"))
            ;:depends-on ("window-basics/macros")
            )


         (:module "canvas"
            :pathname "canvas/"
            :components
            ((:quail-source-file "canvas")
              (:quail-source-file "bw-canvas-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "bw-canvas-pc" :if-feature :aclpc-linux)
              (:quail-source-file "color-canvas-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "color-canvas-ops-sblx" :if-feature :sbcl-linux) ;;New 28AUG2021
             (:quail-source-file "color-canvas-pc" :if-feature :aclpc-linux)
             (:quail-source-file "make-canvas")
             (:quail-source-file "key-event")
             (:quail-source-file "key-event-sblx" :if-feature :sbcl-linux)
             (:quail-source-file "key-event-pc" :if-feature :aclpc-linux))
            )


         (:module "draw"
            :pathname "draw/"
            :components
            ((:quail-source-file "draw")
              (:quail-source-file "draw-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "draw-pc" :if-feature :aclpc-linux)
             (:quail-source-file "strings-sblx" :if-feature :sbcl-linux) ;DONE! 22 November 2019
             (:quail-source-file "strings-pc" :if-feature :aclpc-linux)
             (:quail-source-file "strings")
             (:quail-source-file "erase")
             )
            ;:depends-on ("window-basics/macros" "window-basics/pen" "window-basics/fonts" "window-basics/host")
            )


         (:module "canvas-regions"
            :pathname "canvas-regions/"
            :components
            (;;(:quail-source-file (wb-add-system-extension "canvas-regions"))
              (:quail-source-file "canvas-regions" :if-feature :sbcl-linux)
              (:quail-source-file "clip-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "clip-pc" :if-feature :aclpc-linux)
              (:quail-source-file "clip")
             (:quail-source-file "drag-sblx" :if-feature :sbcl-linux) ;07MAR2022 test
             (:quail-source-file "drag-pc" :if-feature :aclpc-linux)
             )
            ;:depends-on ("window-basics/macros" "window-basics/pen")
            )

         (:module "hardcopy"
            :pathname "hardcopy/"
            :components
            ((:quail-source-file "canvas-export-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "canvas-export-pc" :if-feature :aclpc-linux)
              (:quail-source-file "hardcopy-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "hardcopy-pc" :if-feature :aclpc-linux))
            )

         (:module "fast-graphics"
            :pathname "fast-graphics/"
            :components
            ((:quail-source-file "point-defs-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "point-defs-pc" :if-feature :aclpc-linux)
              (:quail-source-file "points-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "points-pc" :if-feature :aclpc-linux)
              (:quail-source-file "symbols-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "symbols-pc"  :if-feature :aclpc-linux)
              (:quail-source-file "lines-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "lines-pc" :if-feature :aclpc-linux)
              (:quail-source-file "rotate")) 
            ;:depends-on ("window-basics/macros" "window-basics/pen")
            )

         (:module "surface"
            :pathname "surface/"
            :components
            ((:quail-source-file "surface-rotate")
              (:quail-source-file "surface-update")
              (:quail-source-file "show-lines")
              (:quail-source-file "hide-lines")
              (:quail-source-file "surface-fill"))
            )


         (:module "start-windows"
            :pathname "start-windows/"
            :components
            ((:quail-source-file "start-windows-sblx" :if-feature :sbcl-linux)
              (:quail-source-file "start-windows-pc" :if-feature :aclpc-linux)
              ))

         ))
))