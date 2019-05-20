#lang htdp/bsl

;; fs-starter.rkt


;; Date-def
(define-struct elt (name data subs))
;; ele is (make-elt String Integer listOfElement)
;; interp. An element in the file system, with name and either data or subs
;;         If data is 0, then subs is considered to be list of sub element
;;         If data is not 0, then subs is ignored

;; listOfElement is one of:
;;   - empty
;;   - (cons Element listOfElement)
;; interp. A list of file system Elements

;;; NOTE
;; what is going here is listOfElement is self-refernce (SR) to itself. which make it arbitrary.
;; and listOfElement has may be Element and Element has a listOfElement so they are mutural-refernce (MR). and this make it mutural refernce cycle, in addition to SR cycle, This Sturcture has a 2-dimention arbitrary, Deep dimention and long dimention.

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))

#;
(define (fn-for-element e)
(... (elt-name e)                ;String
(elt-data e)                ;Int
(fn-for-loe (elt-subs e)))) ; listOfElement


#;
(define (fn-for-loe loe)
(cond [(empty? loe) ()]
[else
(... (fn-for-element (first loe)) ;Element
(fn-for-loe (rest loe)))]))  ;listOfElement

;;Functions

;; Consumes Element and produce the sum of all the file data in tree
;; Element -> Integer
;; listOfElement -> Integer
;; produce the summ of all the data in element (and its subs)
(check-expect (sum-data--element F1) 1)
(check-expect (sum-data--loe empty) 0)
(check-expect (sum-data--element D5) 3)
(check-expect (sum-data--element D4) (+ 1 2))
(check-expect (sum-data--element D6) (+ 1 2 3))

                                        ; stubs
;;(define (sum-data--element e) 0)
;;(define (sum-data--loe) 0)

(define (sum-data--element e)
  (if (zero? (elt-data e))
      (sum-data--loe (elt-subs e))
      (elt-data e))) ; listOfElement

(define (sum-data--loe e)
  (cond [(empty? e) 0]
        [else
         (+ (sum-data--element (first e)) ;Element
            (sum-data--loe (rest e)))]))   ;listOfElement

;; Function2
;; Consumes elements and produce list of names of all the elements in the tree

;; Elements -> listOfString
;; listOfElement -> listOfString
;; produce the list of the names of all elements of the tree

(check-expect (all-names--loe empty) empty)
(check-expect (all-names--element F1) (list "F1"))
(check-expect (all-names--element D5) (list "D5" "F3"))
(check-expect (all-names--element D4) (list "D4" "F1" "F2"))
(check-expect (all-names--loe (list D4 D5)) (append (list "D4" "F1" "F2") (list "D5" "F3")))
(check-expect (all-names--element D6) (cons "D6" (append (list "D4" "F1" "F2") (list "D5" "F3"))))

                                        ;stubs
;;(define (all-names--element e) empty)
;;(define (all-names--loe loe) empty)

(define (all-names--element e)
  (cons (elt-name e)                ;String
        (all-names--loe (elt-subs e)))) ; listOfElement


(define (all-names--loe loe)
  (cond [(empty? loe) empty]
        [else
         (append (all-names--element (first loe)) ;Element
                 (all-names--loe (rest loe)))]))  ;listOfElement

;; Function3
;; Consume String and Element and produce the data of the element with the same name ortherwise produce false

;; String, Element -> Integer || False
;; Stirng, listOfElement -> Integer || False
;; search the given tree for an element with given name if found; False otherwise
(check-expect (find--loe "F3" empty) false)
(check-expect (find--loe "F2" (cons F1 (cons F2 empty))) 2)
(check-expect (find--loe "F3" (cons F1 (cons F2 empty))) false)
(check-expect (find--element "F3" F1) false)
(check-expect (find--element "F3" F3) 3)
(check-expect (find--element "F3" D4) false)
(check-expect (find--element "F1" D4) 1)
(check-expect (find--element "F2" D4) 2)
(check-expect (find--element "D4" D4) 0)
(check-expect (find--element "D6" D6) 0)
(check-expect (find--element "F1" D6) 1)
(check-expect (find--element "F3" D6) 3)

                                        ;stubs
;; (define (find--element n e) false)
;; (define (find--loe n e) false)

(define (find--element n e)
  (if (string=? n (elt-name e))                ;String
      (elt-data e)                ;Int
      (find--loe n (elt-subs e)))) ; listOfElement


(define (find--loe n loe)
  (cond [(empty? loe) false]
        [else
         (if (not (false? (find--element n (first loe)))) ;is it in first loa
             (find--element n (first loe))
             (find--loe n (rest loe)))]))  ;Produce Int || false


(test)
