
(SDEFUN |FLASORT;quickSort;M2V;1|
        ((|l| |Mapping| (|Boolean|) S S) (|r| V) ($ V))
        (|FLASORT;QuickSort| |l| |r| (SPADCALL |r| (QREFELT $ 9))
         (SPADCALL |r| (QREFELT $ 10)) $)) 

(SDEFUN |FLASORT;siftUp|
        ((|l| |Mapping| (|Boolean|) S S) (|r| V) (|i| |Integer|)
         (|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G398 NIL) (|j| #2=(|Integer|)) (|k| #2#) (|t| (S)))
               (SEQ (LETT |t| (SPADCALL |r| |i| (QREFELT $ 13)))
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ G190
                            (COND
                             ((NULL
                               (<
                                (LETT |j|
                                      (+ (SPADCALL 2 |i| (QREFELT $ 15)) 1))
                                |n|))
                              (GO G191)))
                            (SEQ
                             (SEQ (LETT |k| (+ |j| 1))
                                  (EXIT
                                   (COND
                                    ((< |k| |n|)
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |r| |j| (QREFELT $ 13))
                                        (SPADCALL |r| |k| (QREFELT $ 13)) |l|)
                                       (LETT |j| |k|)))))))
                             (EXIT
                              (COND
                               ((SPADCALL |t| (SPADCALL |r| |j| (QREFELT $ 13))
                                          |l|)
                                (SEQ
                                 (SPADCALL |r| |i|
                                           (SPADCALL |r| |j| (QREFELT $ 13))
                                           (QREFELT $ 16))
                                 (SPADCALL |r| |j| |t| (QREFELT $ 16))
                                 (EXIT (LETT |i| |j|))))
                               ('T
                                (PROGN
                                 (LETT #1# |$NoValue|)
                                 (GO #3=#:G395))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #3# (EXIT #1#)))))) 

(SDEFUN |FLASORT;heapSort;M2V;3|
        ((|l| |Mapping| (|Boolean|) S S) (|r| V) ($ V))
        (SPROG ((|k| NIL) (|n| (|Integer|)))
               (SEQ
                (COND
                 ((NULL (ZEROP (SPADCALL |r| (QREFELT $ 9))))
                  (|error| "not implemented"))
                 ('T
                  (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 18)))
                       (SEQ (LETT |k| (- (ASH |n| -1) 1)) G190
                            (COND ((< |k| 0) (GO G191)))
                            (SEQ (EXIT (|FLASORT;siftUp| |l| |r| |k| |n| $)))
                            (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |k| (- |n| 1)) G190
                            (COND ((< |k| 1) (GO G191)))
                            (SEQ (SPADCALL |r| 0 |k| (QREFELT $ 20))
                                 (EXIT (|FLASORT;siftUp| |l| |r| 0 |k| $)))
                            (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                       (EXIT |r|))))))) 

(SDEFUN |FLASORT;partition|
        ((|l| |Mapping| (|Boolean|) S S) (|r| V) (|i| |Integer|)
         (|j| |Integer|) (|k| |Integer|) ($ |Integer|))
        (SPROG ((|s| (S)) (|t| (S)) (|x| (S)))
               (SEQ (LETT |x| (SPADCALL |r| |k| (QREFELT $ 13)))
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |i| |j| (QREFELT $ 23))) (GO G191)))
                         (SEQ (LETT |t| (SPADCALL |r| |i| (QREFELT $ 13)))
                              (SEQ G190
                                   (COND
                                    ((NULL (SPADCALL |t| |x| |l|)) (GO G191)))
                                   (SEQ (LETT |i| (+ |i| 1))
                                        (EXIT
                                         (LETT |t|
                                               (SPADCALL |r| |i|
                                                         (QREFELT $ 13)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |s| (SPADCALL |r| |j| (QREFELT $ 13)))
                              (SEQ G190
                                   (COND
                                    ((NULL (SPADCALL |x| |s| |l|)) (GO G191)))
                                   (SEQ (LETT |j| (- |j| 1))
                                        (EXIT
                                         (LETT |s|
                                               (SPADCALL |r| |j|
                                                         (QREFELT $ 13)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((SPADCALL |i| |j| (QREFELT $ 23))
                                 (SEQ (SPADCALL |r| |i| |s| (QREFELT $ 16))
                                      (SPADCALL |r| |j| |t| (QREFELT $ 16))
                                      (LETT |i| (+ |i| 1))
                                      (EXIT (LETT |j| (- |j| 1))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (+ |j| 1))))) 

(SDEFUN |FLASORT;QuickSort|
        ((|l| |Mapping| (|Boolean|) S S) (|r| V) (|i| |Integer|)
         (|j| |Integer|) ($ V))
        (SPROG ((|k| (|Integer|)) (#1=#:G431 NIL) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |n| (- |j| |i|))
                           (COND
                            ((EQL |n| 1)
                             (COND
                              ((SPADCALL (SPADCALL |r| |j| (QREFELT $ 13))
                                         (SPADCALL |r| |i| (QREFELT $ 13)) |l|)
                               (SPADCALL |r| |i| |j| (QREFELT $ 20))))))
                           (EXIT
                            (COND
                             ((< |n| 2) (PROGN (LETT #1# |r|) (GO #2=#:G430)))
                             ('T
                              (SEQ
                               (LETT |k|
                                     (|FLASORT;partition| |l| |r| |i| |j|
                                      (+ |i| (ASH |n| -1)) $))
                               (EXIT
                                (COND
                                 ((< (- |k| |i|) (- |j| |k|))
                                  (SEQ
                                   (|FLASORT;QuickSort| |l| |r| |i| (- |k| 1)
                                    $)
                                   (EXIT (LETT |i| |k|))))
                                 ('T
                                  (SEQ (|FLASORT;QuickSort| |l| |r| |k| |j| $)
                                       (EXIT (LETT |j| (- |k| 1))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |FLASORT;shellSort;M2V;6|
        ((|l| |Mapping| (|Boolean|) S S) (|r| V) ($ V))
        (SPROG
         ((|g| (|Integer|)) (|j| (|Integer|)) (#1=#:G441 NIL) (|i| NIL)
          (|n| (|Integer|)) (|m| (|Integer|)))
         (SEQ (LETT |m| (SPADCALL |r| (QREFELT $ 9)))
              (LETT |n| (SPADCALL |r| (QREFELT $ 10))) (LETT |g| 1)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |g| (- |n| |m|) (QREFELT $ 23)))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |g| (+ (SPADCALL 3 |g| (QREFELT $ 15)) 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |g| (QUOTIENT2 |g| 3))
              (SEQ G190
                   (COND ((NULL (SPADCALL |g| 0 (QREFELT $ 24))) (GO G191)))
                   (SEQ
                    (SEQ (LETT |i| (+ |m| |g|)) (LETT #1# |n|) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ (LETT |j| (- |i| |g|))
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND
                                        ((>= |j| |m|)
                                         (SPADCALL
                                          (SPADCALL |r| (+ |j| |g|)
                                                    (QREFELT $ 13))
                                          (SPADCALL |r| |j| (QREFELT $ 13))
                                          |l|))
                                        ('T NIL)))
                                      (GO G191)))
                                    (SEQ
                                     (SPADCALL |r| |j| (+ |j| |g|)
                                               (QREFELT $ 20))
                                     (EXIT (LETT |j| (- |j| |g|))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |g| (QUOTIENT2 |g| 3))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(DECLAIM (NOTINLINE |FiniteLinearAggregateSort;|)) 

(DEFUN |FiniteLinearAggregateSort| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FiniteLinearAggregateSort| DV$1 DV$2))
          (LETT $ (GETREFV 26))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteLinearAggregateSort| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (|Mapping| 22 6 6)
              |FLASORT;quickSort;M2V;1| (10 . |qelt|) (|PositiveInteger|)
              (16 . *) (22 . |qsetelt!|) (|NonNegativeInteger|) (29 . |#|)
              (|Void|) (34 . |swap!|) |FLASORT;heapSort;M2V;3| (|Boolean|)
              (41 . <=) (47 . >) |FLASORT;shellSort;M2V;6|)
           '#(|shellSort| 53 |quickSort| 59 |heapSort| 65) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|quickSort|
                                 (|#2| (|Mapping| (|Boolean|) |#1| |#1|) |#2|))
                                T)
                              '((|heapSort|
                                 (|#2| (|Mapping| (|Boolean|) |#1| |#1|) |#2|))
                                T)
                              '((|shellSort|
                                 (|#2| (|Mapping| (|Boolean|) |#1| |#1|) |#2|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 25
                                            '(1 7 8 0 9 1 7 8 0 10 2 7 6 0 8 13
                                              2 8 0 14 0 15 3 7 6 0 8 6 16 1 7
                                              17 0 18 3 7 19 0 8 8 20 2 8 22 0
                                              0 23 2 8 22 0 0 24 2 0 7 11 7 25
                                              2 0 7 11 7 12 2 0 7 11 7 21)))))
           '|lookupComplete|)) 
