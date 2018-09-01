
;; read code form right to left
; 1. make range of number
; 2. filter number with that are multiples of 3 or 5
; NOW: we have a list
; 3. apply summation on it
(apply +
       (filter (lambda (x) (or (= (remainder x 3) 0) (= (remainder x 5) 0)))
               (range 0 1000 1)))
