;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;;                               views.asd
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;;
;;; Copyright (c) 1991 Statistical Computing Laboratory, University of Waterloo
;;;
;;;
;;;  Authors:
;;;     C. Hurley
;;;     R.W. Oldford 1991.
;;;
;;;
;;;--------------------------------------------------------------------------------

(asdf:defsystem "views"
   :serial t
   :components
   ((:module "views"
      :pathname "views/"
      :components
      ((:quail-source-file "views-package")

   (:module "views-macros"
      :pathname "views-macros/"
      :components
      ((:quail-source-file "region")
        (:quail-source-file "draw-macros")
        (:quail-source-file "linkbounds-macros")))
   
   (:module "utilities"
      :pathname "utilities/"
      :components
      ((:quail-source-file "fasttrans")
             (:quail-source-file "title-menu")
             (:quail-source-file "class-info")
             (:quail-source-file "function-info")
             (:quail-source-file "stats")
             )
            ;:depends-on ("views/views-macros")
            )

   (:module "views-data"
      :pathname "views-data/"
      :components
      ((:quail-source-file "data")
        (:quail-source-file "simple-case-object")
        (:quail-source-file "dataset")
        (:quail-source-file "mway-dataset") 
        (:quail-source-file "data-lists")
        (:quail-source-file "data-ref-arrays")
        (:quail-source-file "dataset-class")
        (:quail-source-file "mlevel-dataset")
        (:quail-source-file "data-subsets")
        (:quail-source-file "prompt-data")
        ))

   (:module "views-general"
      :pathname "views-general/"
      :components
      ((:quail-source-file "special-vars")
        (:quail-source-file "draw-styles")
        (:quail-source-file "draw-style-mixins")
        (:quail-source-file "button-mixin" )
        (:quail-source-file "linkbounds")
        (:quail-source-file "view-generics")
        (:quail-source-file "view-def" )
        (:quail-source-file "view-ops" )
        (:quail-source-file "layer" )
        (:quail-source-file "view-window")
        (:quail-source-file "abstract-views" )
        (:quail-source-file "make-views" )
        (:quail-source-file "make-view-constructors")
        (:quail-source-file "display")
        )
            ;:depends-on ("views/views-macros")
            )

   (:module "odd-clone"  ;; out 11NOV2024 hoping things are caught by the clone module below.
      :pathname "odd-clone/"
      :components              ;; see the log -ALL2- 
      ((:quail-source-file "clone")         ;; put back with clone.lsp in module clone modified to exclude these contents
         ))                    ;; MOVED below view-general to get defclass in view-generics 05MAR2025()

   (:module "views-mixins"
      :pathname "views-mixins/"
      :components
      ( (:quail-source-file "brush" )
       (:quail-source-file "angled-brush" )
       (:quail-source-file "lines-mixin")
       (:quail-source-file "mixin" ) 
       (:quail-source-file "link-table" )
       (:quail-source-file "link" )
       (:quail-source-file "tic-mixin")
       (:quail-source-file "bordered-view-mixin"))
            ;:depends-on ("views/views-macros")
            )

   (:module "controls"
      :pathname "controls/"
      :components
      ((:quail-source-file "button-control")
       (:quail-source-file "control-button")
       (:quail-source-file "elliptical-button")
       (:quail-source-file "rounded-button")
       (:quail-source-file "signpost-button")
       (:quail-source-file "prompt-widget")
       (:quail-source-file "slider")
       (:quail-source-file "double-slider")
       (:quail-source-file "range-slider"))
            ;:depends-on ("views/views-macros")
            )

   (:module "simple-views"
      :pathname "simple-views/"
      :components
      ((:quail-source-file "label")
       (:quail-source-file "point-symbol")
             ;(:quail-source-file "bar"  )
             (:quail-source-file "pie"  )
             (:quail-source-file "line-segment")
             (:quail-source-file "function-view")
             (:quail-source-file "line" )
             (:quail-source-file "text-view" )
             (:quail-source-file "numerical-label")
             (:quail-source-file "key-input")
             (:quail-source-file "editable-text")
             )
            ;:depends-on ("views/views-macros")
            ) 

   (:module "dview-def"
      :pathname "dview-def/"
      :components
      ((:quail-source-file "d-view-mixins"  )
        (:quail-source-file "d-view-defs"  )
        (:quail-source-file "d-view" )
        (:quail-source-file "d-view-menus" )
        (:quail-source-file "change-var" )
        (:quail-source-file "change-cases" )
        (:quail-source-file "text-link" ))
            ;:depends-on ("views/views-macros")
            )

   (:module "d-views"
      :pathname "d-views/"
      :components
      ((:quail-source-file "one-per-case")
        (:quail-source-file "point-cloud")
        (:quail-source-file "fitted-line")
        (:quail-source-file "simple-lines")
        (:quail-source-file "lines" )
        (:quail-source-file "histogram")
        (:quail-source-file "boxplot")
        (:quail-source-file "axis")
        (:quail-source-file "grid-view")
        (:quail-source-file "smooth")
             ;;(:quail-source-file "barchart")
             ;;(:quail-source-file "fringe-view")
             (:quail-source-file "interval-view")
             (:quail-source-file "line-segments-per-case")
             (:quail-source-file "moving-cloud-mixin" )
             (:quail-source-file "rotation")
             (:quail-source-file "rotating-lines")
             )
            ;:depends-on ("views/views-macros")
            )

   (:module "layout"
      :pathname "layout/"
      :components
      ((:quail-source-file "view-layers")
        (:quail-source-file "view-layout")
        (:quail-source-file "grid-layout")
        (:quail-source-file "batch-layout")
        (:quail-source-file "1d-layout")
        (:quail-source-file "pairs-layout")
        (:quail-source-file "xy-layout")
        (:quail-source-file "case-layout")
        (:quail-source-file "barchart")
        (:quail-source-file "table")
        )
            ;:depends-on ("views/views-macros")
            )

   (:module "plots"
      :pathname "plots/"
      :components
      ((:quail-source-file "plot-mixins")
        (:quail-source-file "plot" )
        (:quail-source-file "plot-d" )
        (:quail-source-file "grid-plot")
        (:quail-source-file "rotating-plot")
        (:quail-source-file "bar-plot")
        (:quail-source-file "overlay-plots" )
        (:quail-source-file "make-plots" ))
            ;:depends-on ("views/views-macros")
            )

   (:module "scroll"
      :pathname "scroll/"
      :components
      ((:quail-source-file "arrow")
        (:quail-source-file "scroll-bar")
        (:quail-source-file "scrollable-view-mixin" )
        (:quail-source-file "display-list")
        (:quail-source-file "scrolling-display"))
            ;:depends-on ("views/views-macros")
            )

   (:module "prompt-plot"
      :pathname "prompt-plot/"
      :components
      ((:quail-source-file "prompt-selections")
        (:quail-source-file "single-plot")
        (:quail-source-file "group-plot")
             ;; (:quail-source-file "prompt-projection-trace" )
             (:quail-source-file "prompt-plot")
             (:quail-source-file "prompt-plot-menu"))
      )

   (:module "clone"
      :pathname "clone/"
      :components
      ((:quail-source-file "clone")
        (:quail-source-file "copy")
        (:quail-source-file "combine-args")))

   (:module "display"
      :pathname "display/"
      :components
      ((:quail-source-file "display-methods")
        (:quail-source-file "display-data")
        (:quail-source-file "signposts-methods")
        ))

   (:module "other"
      :pathname "other/"
      :components
      ((:quail-source-file "connected-points")
        ))
   
   )
)))
