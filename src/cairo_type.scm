;;;
;;; cairo_type.scm
;;;
;;; MIT License
;;; Copyright 2012 aharisu
;;; All rights reserved.
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a copy
;;; of this software and associated documentation files (the "Software"), to deal
;;; in the Software without restriction, including without limitation the rights
;;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;;; copies of the Software, and to permit persons to whom the Software is
;;; furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in all
;;; copies or substantial portions of the Software.
;;;
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;;; SOFTWARE.
;;;
;;;
;;; aharisu
;;; foo.yobina@gmail.com
;;;

(add-load-path ".")
(load "cv_struct_generator")

(use file.util)

(define (main args)
  (gen-type (simplify-path (path-sans-extension (car args)))
            structs 
            foreign-pointer
            (lambda () ;;prologue
              (cgen-extern "//cairo header")
              (cgen-extern "//pre defined header")
              (cgen-extern "#include<cairo.h>")
              (cgen-extern "
                           typedef struct cairo_glyph_list {
                           cairo_glyph_t* list;
                           int num;
                           }cairo_glyph_list_t;

                           typedef struct cairo_text_cluster_list {
                           cairo_text_cluster_t* list;
                           int num;
                           }cairo_text_cluster_list_t;

                           ")
              (cgen-extern "")
              (cgen-body "
                         static void finalize_cairo_glyph_list(cairo_glyph_list_t* l)
                         {
                          cairo_glyph_free(l->list);
                         }

                         static void finalize_cairo_text_cluster_list(cairo_text_cluster_list_t* l)
                         {
                          cairo_text_cluster_free(l->list);
                         }
                         ")
              )
            (lambda () ;;epilogue
              ))
              0)


;;sym-name sym-scm-type pointer? finalize-name finalize-ref
(define structs 
  '(
    (cairo_matrix_t <cairo-matrix> #f #f "")
    (cairo_rectangle_t <cairo-rectangle> #f #f "")
    (cairo_glyph_t <cairo-glyph> #f #f "")
    (cairo_text_cluster_t <cairo-text-cluster> #f #f "")
    (cairo_text_extents_t <cairo-text-extents> #f #f "")
    (cairo_font_extents_t <cairo-font-extents> #f #f "")
    ))

;;sym-name sym-scm-type pointer? finalize finalize-ref 
(define foreign-pointer 
  '(
    (cairo_scaled_font_t <cairo-scaled-font> #t #f "")
    (cairo_font_options_t <cairo-font-options> #t "cairo_font_options_destroy" "")

    (cairo_glyph_list_t <cairo-glyph-list> #t "finalize_cairo_glyph_list" "")
    (cairo_text_cluster_list_t <cairo-text-cluster-list> #t "finalize_cairo_text_cluster_list" "")

    (cairo_font_face_t <cairo-font-face> #t #f "")
    (cairo_surface_t <cairo-surface> #t "cairo_surface_destroy" "")
    (cairo_t <cairo> #t #f "")
    (cairo_pattern_t <cairo-pattern> #t "cairo_pattern_destroy" "")
    ))
