(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-move-to cr 50 75)
  (cairo-line-to cr 200 75)

  (cairo-move-to cr 50 125)
  (cairo-line-to cr 200 125)

  (cairo-move-to cr 50 175)
  (cairo-line-to cr 200 175)

  (cairo-set-line-width cr 30)
  (cairo-set-line-cap cr CAIRO_LINE_CAP_ROUND)
  (cairo-stroke cr)

  )
