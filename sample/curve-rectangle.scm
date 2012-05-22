(add-load-path "." :relative)
(load "main.scm")

(define (draw)

  (let ([x0 25.6]
        [y0 25.6]
        [width 204.8]
        [height 204.8]
        [radius 204.8])
    (let ([x1 (+ x0 width)]
          [y1 (+ y0 height)])
      (if (< (/ width 2) radius)
        (if (< (/ height 2) radius)
          (begin
            (cairo-move-to cr x0 (/ (+ y0 y1) 2))
            (cairo-curve-to cr x0 y0 x0 y0 (/ (+ x0 x1) 2) y0)
            (cairo-curve-to cr x1 y0 x1 y0 x1 (/ (+ y0 y1) 2))
            (cairo-curve-to cr x1 y1 x1 y1 (/ (+ x1 x0) 2) y1)
            (cairo-curve-to cr x0 y1 x0 y1 x0 (/ (+ y0 y1) 2)))
          (begin
            (rcairo-move-to cr x0 y0 radius)
            (cairo-curve-to cr x0 y0 x0 y0 (/ (+ x0 x1) 2) y0)
            (cairo-curve-to cr x1 y0 x1 y0 x1 (+ y radius))
            (cairo-line-to cr x1 (- y1 radius))
            (cairo-curve-to cr x1 y1 x1 y1 (/ (+ x1 x0) 2) y1)
            (cairo-curve-to cr x0 y1 x0 y1 x0 (- y1 radius))))
        (if (< (/ height 2) radius)
          (begin
            (cairo-move-to cr x0 (/ (+ y0 y1) 2))
            (cairo-curve-to cr x0 y0 x0 y0 (+ x0 radius) y0)
            (cairo-line-to cr (- x1 radius) y0)
            (cairo-curve-to cr x1 y0 x1 y0 x1 (/ (+ y0 y1) 2))
            (cairo-curve-to cr x1 y1 x1 y1 (- x1 radius) y1)
            (cairo-line-to cr (+ x0 radius) y1)
            (cairo-curve-to cr x0 y1 x0 y1 x0 (/ (+ y0 y1) 2)))
          (begin
            (cairo-move-to cr x0 (+ y0 radius))
            (cairo-curve-to cr x0 y0 x0 y0 (+ x0 radius) y0)
            (cairo-line-to cr (- x1 radius) y0)
            (cairo-curve-to cr x1 y0 x1 y0 x1 (+ y0 radius))
            (cairo-line-to cr x1 (- y1 radius))
            (cairo-curve-to cr x1 y1 x1 y1 (- x1 radius) y1)
            (cairo-line-to cr (+ x0 radius) y1)
            (cairo-curve-to cr x0 y1 x0 y1 x0 (- y1 radius)))))))
  (cairo-close-path cr)

  (cairo-set-source-rgb cr 0.5 0.5 1)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgba cr 0.5 0 0 0.5)
  (cairo-set-line-width cr 10)
  (cairo-stroke cr))

