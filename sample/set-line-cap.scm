
(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-set-line-width cr 30)

  (cairo-set-line-cap cr CAIRO_LINE_CAP_BUTT) ;default
  (cairo-move-to cr 64 50)
  (cairo-line-to cr 64 200)
  (cairo-stroke cr)

  (cairo-set-line-cap cr CAIRO_LINE_CAP_ROUND)
  (cairo-move-to cr 128 50)
  (cairo-line-to cr 128 200)
  (cairo-stroke cr)

  (cairo-set-line-cap cr CAIRO_LINE_CAP_SQUARE)
  (cairo-move-to cr 192 50)
  (cairo-line-to cr 192 200)
  (cairo-stroke cr)

  ;;draw helping lines
  (cairo-set-source-rgb cr 1 0.2 0.2)
  (cairo-set-line-width cr 2.56)
  (cairo-move-to cr 64 50)
  (cairo-line-to cr 64 200)
  (cairo-move-to cr 128 50)
  (cairo-line-to cr 128 200)
  (cairo-move-to cr 192 50)
  (cairo-line-to cr 192 200)
  (cairo-stroke cr)

  )

