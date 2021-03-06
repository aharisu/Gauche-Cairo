
(use sdl)
(use cairo)

(define screen #f)
(define surface #f)
(define cr #f)

(define (wait-quit-key)
  (unless (let proc-event ([event (sdl-poll-event)])
          (and event
            (or
              (eq? (ref event 'type) SDL_QUIT)
              (and (eq? (ref event 'type) SDL_KEYUP) (eq? (ref (ref event 'keysym) 'sym) SDLK_ESCAPE))
              (proc-event (sdl-poll-event)))))
    (sdl-delay 33)
    (wait-quit-key)))

(define (main args)
  (sdl-init SDL_INIT_VIDEO)

  (sdl-wm-set-caption "My Cairo Sample" #f)
  (set! screen (sdl-set-video-mode 256 256 32 SDL_SWSURFACE))

  (set! surface (cairo-image-surface-create-for-data
                  (slot-ref screen 'pixels)
                  CAIRO_FORMAT_ARGB32
                  (slot-ref screen 'w)
                  (slot-ref screen 'h)
                  (slot-ref screen 'pitch)))
  (set! cr (cairo-create surface))

  (sdl-fill-rect screen #f #xffffffff)
  (draw)
  (sdl-update-rect screen 0 0 0 0)

  (wait-quit-key)
  (sdl-quit))


