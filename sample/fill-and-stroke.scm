(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-move-to cr 128 25.6)
  (cairo-line-to cr 230.4 230.4)
  (cairo-rel-line-to cr -102.4 0)
  (cairo-curve-to cr 51.2 230.4 51.2 128.0 128 128)
  (cairo-close-path cr)

  (cairo-move-to cr 64.0 25.6)
  (cairo-rel-line-to cr 51.2 51.2)
  (cairo-rel-line-to cr -51.2 51.2)
  (cairo-rel-line-to cr -51.2 -51.2)
  (cairo-close-path cr)

  (cairo-set-line-width cr 10)
  (cairo-set-source-rgb cr 0 0 1)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 0 0 0)
  (cairo-stroke cr)

  )
