
(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (let1 pat (cairo-pattern-create-linear 0 0 0 256)
    (cairo-pattern-add-color-stop-rgba pat 1 0 0 0 1)
    (cairo-pattern-add-color-stop-rgba pat 0 1 1 1 1)
    (cairo-rectangle cr 0 0 256 256)
    (cairo-set-source cr pat)
    (cairo-fill cr))

  (let1 pat (cairo-pattern-create-radial 115.2 102.4 25.6
                                         102.4 102.4 128)
    (cairo-pattern-add-color-stop-rgba pat 0 1 1 1 1)
    (cairo-pattern-add-color-stop-rgba pat 1 0 0 0 1)
    (cairo-set-source cr pat)
    (cairo-arc cr 128 128 76.8 0 (* 3.14 2))
    (cairo-fill cr))
  )
