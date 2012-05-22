(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-select-font-face cr "Sans" 
                          CAIRO_FONT_SLANT_NORMAL CAIRO_FONT_WEIGHT_BOLD)
  (cairo-set-font-size cr 90)

  (cairo-move-to cr 10 135)
  (cairo-show-text cr "Hello")

  (cairo-move-to cr 70 165)
  (cairo-text-path cr "void")
  (cairo-set-source-rgb cr 0.5 0.5 1)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 0 0 0)
  (cairo-set-line-width cr 2.56)
  (cairo-stroke cr)

  (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
  (cairo-arc cr 10 135 5.12 0 (* 2 3.14))
  (cairo-close-path cr)
  (cairo-arc cr 70 165 5.12 0 (* 2 3.14))
  (cairo-fill cr)
  )

