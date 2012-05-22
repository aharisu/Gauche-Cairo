(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-arc cr 128 128 76.8 0 (* 2 3.14))
  (cairo-clip cr)
  (cairo-new-path cr) ;path not consumed by clip()

  (let* ([image (cairo-image-surface-create-from-png "data/lenna.png")]
         [w (cairo-image-surface-get-width image)]
         [h (cairo-image-surface-get-height image)])
    (cairo-scale cr (/ 256 w) (/ 256 h))
    (cairo-set-source-surface cr image 0 0)
    (cairo-paint cr)))
