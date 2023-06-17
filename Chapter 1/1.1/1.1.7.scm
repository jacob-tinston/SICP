;;(define (good-enough? guess x)
;;  (< (abs (- (square guess) x)) 0.001))

;; when finding the sqrt of very small numbers (such as 0.0001), the square differs from the radicand by less than 0.001 most of the time, making it inaccurate.
;; when finding the sqrt of large numbers, it may not reach a point where it's less than 0.001 because machines can't represent small differences between large numbers.


;; gets the average of 2 numbers
(define (average x y) 
  (/ (+ x y) 2))

;; returns the average of the guess and the final value divided by the guess
(define (improve guess x)
  (average guess (/ x guess)))

;; returns true if the absolute value of taking the original value from the square of the guess is less than 0.001
(define (good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) (* guess 0.0001)))

; if the guess is good enough, it returns the guess, otherwise it calls itself with a new guess
(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (begin
        (display guess)
        (newline)
        (sqrt-iter (improve guess x) guess x)))
      )

;; starts iterating to find a square root with 1 being the first guess
(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

(sqrt 200000000000)


;; improved:

; (define (good-enough? guess last-guess x)
;   (< (abs (- guess last-guess)) 0.001))

;; this new method has improved calculations of very large numbers, however doesn't fair so well for minute numbers.
;; this is because 
