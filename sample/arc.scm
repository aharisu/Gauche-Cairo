(add-load-path "." :relative)
(load "main.scm")

(define (draw)

  (let ([xc 128]
        [yc 128]
        [radius 100]
        [angle1 (* 45 (/ 3.14 180))]
        [angle2 (* 180 (/ 3.14 180))])
    (cairo-set-line-width cr 10)
    (cairo-arc cr xc yc radius angle1 angle2)
    (cairo-stroke cr)

    (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
    (cairo-set-line-width cr 6.0)

    (cairo-arc cr xc yc 10 0 (* 2 3.14))
    (cairo-fill cr)

    (cairo-arc cr xc yc radius angle1 angle1)
    (cairo-line-to cr xc yc)
    (cairo-arc cr xc yc radius angle2 angle2)
    (cairo-line-to cr xc yc)
    (cairo-stroke cr))

  )
