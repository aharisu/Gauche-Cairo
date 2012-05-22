(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-select-font-face cr "Sans" 
                          CAIRO_FONT_SLANT_NORMAL CAIRO_FONT_WEIGHT_NORMAL)
  (cairo-set-font-size cr 100)
  (let* ([text "cairo"]
         [extents (cairo-text-extents cr text)]
         [x 25]
         [y 150])
    (cairo-move-to cr x y)
    (cairo-show-text cr text)

    ;;draw helping lines
    (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
    (cairo-set-line-width cr 6)
    (cairo-arc cr x y 10 0 (* 3.14 2))
    (cairo-fill cr)
    (cairo-move-to cr x y)
    (cairo-rel-line-to cr 0 (- (slot-ref extents 'height)))
    (cairo-rel-line-to cr (slot-ref extents 'width) 0)
    (cairo-rel-line-to cr (slot-ref extents 'x-bearing) (- (slot-ref extents 'y-bearing)))
    (cairo-stroke cr)))

