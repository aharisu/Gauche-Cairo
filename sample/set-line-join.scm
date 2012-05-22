
(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-set-line-width cr 40.96)
  (cairo-move-to cr 76.8 84.48)
  (cairo-rel-line-to cr 51.2 -51.2)
  (cairo-rel-line-to cr 51.2 51.2)
  (cairo-set-line-join cr CAIRO_LINE_JOIN_MITER)
  (cairo-stroke cr)

  (cairo-move-to cr 76.8 161.28)
  (cairo-rel-line-to cr 51.2 -51.2)
  (cairo-rel-line-to cr 51.2 51.2)
  (cairo-set-line-join cr CAIRO_LINE_JOIN_BEVEL)
  (cairo-stroke cr)

  (cairo-move-to cr 76.8 238.08)
  (cairo-rel-line-to cr 51.2 -51.2)
  (cairo-rel-line-to cr 51.2 51.2)
  (cairo-set-line-join cr CAIRO_LINE_JOIN_ROUND)
  (cairo-stroke cr)
  )
