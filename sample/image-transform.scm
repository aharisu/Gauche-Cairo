(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (let* ([image (cairo-image-surface-create-from-png "data/lenna.png")]
         [w (cairo-image-surface-get-width image)]
         [h (cairo-image-surface-get-height image)])
    (cairo-translate cr 128 128)
    (cairo-rotate cr (/ (* 45 3.14) 180))
    (cairo-scale cr (/ 256 w) (/ 256 h))
    (cairo-translate cr (* -0.5 w) (* -0.5 h))

    (cairo-set-source-surface cr image 0 0)
    (cairo-paint cr)))
