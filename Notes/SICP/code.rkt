;;; Simple code
;; (define balance 100)
;; (define (withdraw amount)
;;   (if (>= balance amount)
;;       (begin (set! balance (- balance amount))
;;              balance)
;;       "Insufficient Funds"))

;;; simple maker 
;; (define (make-withdraw balance)
;;   (λ (amount)
;;     (if (>= balance amount)
;;         (begin (set! balance (- balance amount))
;;                balance)
;;         "Insufficient Funds")))

;;; make a `Object' with 2 functions, withdraw and deposit
(define (make-acc balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Err"))
  (define (deposit amount)
    (set! balance (+ balance amount))
          balance)
  (define (dispatch method)
    (cond [(eq? method 'withdraw) withdraw]
          [(eq? method 'deposit) deposit]
          [else "Err"]))
  dispatch)
