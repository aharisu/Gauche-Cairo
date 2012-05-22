
(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (let* ([x 25.6]
         [y 25.6]
         [width 204.8]
         [height 204.8]
         [aspect 1]
         [corner-radius (/ height 10)]
         [radius (/ corner-radius aspect)]
         [degrees (/ 3.14 180)])
    (cairo-new-sub-path cr)
    (cairo-arc cr (- (+ x width) radius) (+ y radius) radius
               (* -90 degrees) 0)
    (cairo-arc cr (- (+ x width) radius) (- (+ y height) radius) radius
               0 (* 90 degrees))
    (cairo-arc cr (+ x radius) (- (+ y height) radius) radius
               (* 90 degrees) (* 180 degrees))
    (cairo-arc cr (+ x radius) (+ y radius) radius
               (* 180 degrees) (* 270 degrees))
    (cairo-close-path cr)

    (cairo-set-source-rgb cr 0.5 0.5 1)
    (cairo-fill-preserve cr)
    (cairo-set-source-rgba cr 0.5 0 0 0.5)
    (cairo-set-line-width cr 10)
    (cairo-stroke cr))
  )
