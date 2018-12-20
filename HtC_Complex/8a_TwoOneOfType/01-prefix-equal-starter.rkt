#lang htdp/bsl
(require test-engine/racket-tests)

;; prefix-equal-starter.rkt
;; =================
;; Data Definitions:

;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings

(define LS0 empty)
(define LS1 (cons "a" empty))
(define LS2 (cons "a" (cons "b" empty)))
(define LS3 (cons "c" (cons "b" (cons "a" empty))))

#;
(define (fn-for-los los)
(cond [(empty? los) (...)]
[else
(... (first los)
(fn-for-los (rest los)))]))

;; ==========
;; Functions:

;; ListOfString ListOfString -> Boolean
;; produce true if lstA is a prefix of lstB
(check-expect (isPrefix empty empty) true)
(check-expect (isPrefix (list "x" ) empty) false)
(check-expect (isPrefix  (list "x" ) (list "x" )) true)
(check-expect (isPrefix (list "x") (list "x")) true)
(check-expect (isPrefix (list "x" "y") (list "x" "y")) true)
(check-expect (isPrefix (list "y" ) (list "x" )) false)
(check-expect (isPrefix (list "y" "x") (list "x" "y")) false)
(check-expect (isPrefix (list "x" ) (list "y" )) false)

;; (define (isPrefix losA losB)
;;   (cond [(empty? los) (...)]
;;         [else
;;          (... (first los)
;;               (fn-for-los (rest los)))]))
(define (isPrefix lstA lstB)
  (cond [(empty? lstA) true]
        [(empty? lstB) false]
        [else (and (string=? (first lstA)
                             (first lstB))
                   (isPrefix (rest lstA) (rest lstB)))]))

(test)
