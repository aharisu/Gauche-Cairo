(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-set-dash cr #f64(50 10 10 10) -50)
  (cairo-set-line-width cr 10)

  (cairo-move-to cr 128 25.6)
  (cairo-line-to cr 230.4 230.4)
  (cairo-rel-line-to cr -102.4 0)
  (cairo-curve-to cr 51.2 230.4 51.2 128 128 128)
  (cairo-stroke cr))
