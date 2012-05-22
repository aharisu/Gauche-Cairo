(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (let* ([image (cairo-image-surface-create-from-png "data/lenna.png")]
         [w (cairo-image-surface-get-width image)]
         [h (cairo-image-surface-get-height image)]
         [pattern (cairo-pattern-create-for-surface image)])
    (cairo-pattern-set-extend pattern CAIRO_EXTEND_REPEAT)

    (cairo-translate cr 128 128)
    (cairo-rotate cr (/ 3.14 4))
    (cairo-scale cr (/ 1 (sqrt 2)) (/ 1 (sqrt 2)))
    (cairo-translate cr -128 -128)

    (let1 matrix (cairo-matrix-init-scale (* (/ w 256) 5) (* (/ h 256) 5))
      (cairo-pattern-set-matrix pattern matrix)
      (cairo-set-source cr pattern))

    (cairo-rectangle cr 0 0 256 256)
    (cairo-fill cr)))


