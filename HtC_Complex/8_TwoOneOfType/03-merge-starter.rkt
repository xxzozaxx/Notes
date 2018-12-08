#lang htdp/bsl
(require test-engine/racket-tests)

;; merge-starter.rkt
;; =================

;; Problem:
;; Design the function merge. It consumes two lists of numbers, which it assumes are
;; each sorted in ascending order. It produces a single list of all the numbers,
;; also sorted in ascending order.
;; Your solution should explicitly show the cross product of type comments table,
;; filled in with the values in each case. Your final function should have a cond
;; with 3 cases. You can do this simplification using the cross product table by
;; recognizing that there are subtly equal answers.
;; Hint: Think carefully about the values of both lists. You might see a way to
;; change a cell content so that 2 cells have the same value.

;; listOfInt, listOfInt -> listOfInt
;; produce a sorted list of both sorted list A, B

;; l s t A
;;l|            |
;;s|   empty    |   lstB
;;t|------------|-------------
;;B|   lstA     |  work
;; |            |

(check-expect (merge empty empty) empty)
(check-expect (merge (list 1) empty) (list 1))
(check-expect (merge empty (list 1)) (list 1))
(check-expect (merge (list 1) (list 2)) (list 1 2))
(check-expect (merge (list 1 2) (list 3 4)) (list 1 2 3 4))
(check-expect (merge (list 1 3) (list 2 4)) (list 1 2 3 4))
(check-expect (merge (list 3 4) (list 1 2)) (list 1 2 3 4))
(check-expect (merge (list 2 4) (list 1 3)) (list 1 2 3 4))

(define (merge lstA lstB)
  (cond [(empty? lstA) lstB]
        [(empty? lstB) lstA]
        [else (if (> (first lstA) (first lstB))
                  (cons (first lstB) (merge lstA (rest lstB)))
                  (cons (first lstA) (merge (rest lstA) lstB)))]))

(test)
