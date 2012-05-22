(add-load-path "." :relative)
(load "main.scm")

(define (draw)

  (let ([x 25.6]
        [y 128]
        [x1 102.4]
        [y1 230.4]
        [x2 153.6]
        [y2 25.6]
        [x3 230.4]
        [y3 128.0])

    (cairo-move-to cr x y)
    (cairo-curve-to cr x1 y1 x2 y2 x3 y3)
    (cairo-set-line-width cr 10)
    (cairo-stroke cr)

    (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
    (cairo-set-line-width cr 6)
    (cairo-move-to cr x y)
    (cairo-line-to cr x1 y1)
    (cairo-move-to cr x2 y2)
    (cairo-line-to cr x3 y3)
    (cairo-stroke cr)
  ))
