(add-load-path "." :relative)
(load "main.scm")

(define (draw)
  (cairo-select-font-face cr "Sans" 
                          CAIRO_FONT_SLANT_NORMAL CAIRO_FONT_WEIGHT_NORMAL)
  (cairo-set-font-size cr 52)
  (let* ([text "cairo"]
         [extents (cairo-text-extents cr text)]
         [x (- 128 (+ (/ (slot-ref extents 'width) 2) (slot-ref extents 'x-bearing)))]
         [y (- 128 (+ (/ (slot-ref extents 'height) 2) (slot-ref extents 'y-bearing)))])
    (cairo-move-to cr x y)
    (cairo-show-text cr text)

    ;;draw helping lines
    (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
    (cairo-set-line-width cr 6)
    (cairo-arc cr x y 10 0 (* 3.14 2))
    (cairo-fill cr)
    (cairo-move-to cr 128 0)
    (cairo-rel-line-to cr 0 256)
    (cairo-move-to cr 0 128)
    (cairo-rel-line-to cr 256 0)
    (cairo-stroke cr)))

