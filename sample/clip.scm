(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-arc cr 128 128 76.9 0 (* 2 3.14))
  (cairo-clip cr)

  (cairo-new-path cr) ;current path is not consumed by cairo-clip
  (cairo-rectangle cr 0 0 256 256)
  (cairo-fill cr)

  (cairo-set-source-rgb cr 0 1 0)
  (cairo-move-to cr 0 0)
  (cairo-line-to cr 256 256)
  (cairo-move-to cr 256 0)
  (cairo-line-to cr 0 256)
  (cairo-set-line-width cr 10)
  (cairo-stroke cr))
