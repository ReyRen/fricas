
(SDEFUN |SCACHE;expandCache| ((|x| S) ($ |Void|))
        (SPROG ((#1=#:G397 NIL) (|k| NIL) (|ocache| (|PrimitiveArray| S)))
               (SEQ
                (COND
                 ((EQL (QREFELT $ 8) (QREFELT $ 9))
                  (SEQ (LETT |ocache| (QREFELT $ 7))
                       (SETELT $ 8
                               (+ (SPADCALL 2 (QREFELT $ 8) (QREFELT $ 12))
                                  10))
                       (SETELT $ 7 (MAKEARR1 (QREFELT $ 8) |x|))
                       (EXIT
                        (SEQ (LETT |k| 0) (LETT #1# (- (QREFELT $ 9) 1)) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (QSETAREF1 (QREFELT $ 7) |k|
                                          (QAREF1 |ocache| |k|))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))))
                (EXIT (SPADCALL (QREFELT $ 14)))))) 

(SDEFUN |SCACHE;insertBefore| ((|l| |NonNegativeInteger|) (|x| S) ($ |Void|))
        (SPROG ((#1=#:G401 NIL) (|k| NIL) (|vscan| (|PrimitiveArray| S)))
               (SEQ (|SCACHE;expandCache| |x| $) (LETT |vscan| (QREFELT $ 7))
                    (SEQ (LETT |k| 0) (LETT #1# (- (- (QREFELT $ 9) |l|) 1))
                         G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |vscan| (- (QREFELT $ 9) |k|)
                                      (QAREF1 |vscan|
                                              (- (- (QREFELT $ 9) |k|) 1)))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |vscan| |l| |x|)
                    (SETELT $ 9 (+ (QREFELT $ 9) 1))
                    (EXIT (SPADCALL (QREFELT $ 14)))))) 

(SDEFUN |SCACHE;shiftCache|
        ((|l| |NonNegativeInteger|) (|n| |NonNegativeInteger|) ($ |Void|))
        (SPROG
         ((|x| (S)) (#1=#:G406 NIL) (|k| NIL) (|vscan| (|PrimitiveArray| S)))
         (SEQ (LETT |vscan| (QREFELT $ 7))
              (SEQ (LETT |k| |l|) (LETT #1# (- (QREFELT $ 9) 1)) G190
                   (COND ((> |k| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |vscan| |k|))
                        (EXIT
                         (SPADCALL |x| (+ |n| (SPADCALL |x| (QREFELT $ 15)))
                                   (QREFELT $ 16))))
                   (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 14)))))) 

(SDEFUN |SCACHE;clearCache;V;4| (($ |Void|))
        (SPROG
         ((|x| (S)) (#1=#:G411 NIL) (|k| NIL) (|vscan| (|PrimitiveArray| S)))
         (SEQ (LETT |vscan| (QREFELT $ 7))
              (SEQ (LETT |k| 0) (LETT #1# (- (QREFELT $ 9) 1)) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |vscan| |k|))
                        (EXIT (SPADCALL |x| 0 (QREFELT $ 16))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SETELT $ 7 (MAKE-ARRAY 0)) (SETELT $ 8 0) (SETELT $ 9 0)
              (EXIT (SPADCALL (QREFELT $ 14)))))) 

(SDEFUN |SCACHE;insertAtEnd| ((|x| S) ($ |Void|))
        (SEQ (|SCACHE;expandCache| |x| $)
             (QSETAREF1 (QREFELT $ 7) (QREFELT $ 9) |x|)
             (SETELT $ 9 (+ (QREFELT $ 9) 1)) (EXIT (SPADCALL (QREFELT $ 14))))) 

(SDEFUN |SCACHE;linearSearch;SMU;6|
        ((|x| S) (|equal?| |Mapping| (|Boolean|) S) ($ |Union| S "failed"))
        (SPROG
         ((#1=#:G429 NIL) (|k| (|Integer|)) (|vscan| (|PrimitiveArray| S))
          (|y| (S)))
         (SEQ
          (EXIT
           (SEQ (LETT |k| 0)
                (SEQ G190 (COND ((NULL (< |k| (QREFELT $ 9))) (GO G191)))
                     (SEQ (LETT |vscan| (QREFELT $ 7))
                          (LETT |y| (QAREF1 |vscan| |k|))
                          (EXIT
                           (COND
                            ((SPADCALL |y| |equal?|)
                             (SEQ
                              (SPADCALL |x| (SPADCALL |y| (QREFELT $ 15))
                                        (QREFELT $ 16))
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 0 |y|))
                                (GO #2=#:G428)))))
                            ('T
                             (SEQ (LETT |vscan| (QREFELT $ 7))
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (NULL (EQ |y| (QAREF1 |vscan| |k|))))
                                         (GO G191)))
                                       (SEQ (EXIT (LETT |k| (+ |k| 1)))) NIL
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT (LETT |k| (+ |k| 1))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #1# (CONS 1 "failed")) (GO #2#)))))
          #2# (EXIT #1#)))) 

(SDEFUN |SCACHE;enterInCache;SMS;7|
        ((|x| S) (|equal?| |Mapping| (|Boolean|) S) ($ S))
        (SPROG ((|res| (|Union| S "failed")))
               (SEQ (LETT |res| (SPADCALL |x| |equal?| (QREFELT $ 20)))
                    (EXIT
                     (COND ((QEQCAR |res| 0) (QCDR |res|))
                           ('T
                            (SEQ
                             (SPADCALL |x| (+ 1 (QREFELT $ 9)) (QREFELT $ 16))
                             (|SCACHE;insertAtEnd| |x| $) (EXIT |x|)))))))) 

(SDEFUN |SCACHE;enterInCache;SMS;8|
        ((|x| S) (|triage| |Mapping| (|Integer|) S S) ($ S))
        (SPROG
         ((#1=#:G455 NIL) (|pos| (|NonNegativeInteger|)) (#2=#:G461 NIL)
          (|l| #3=(|Integer|)) (|m| #4=(|Integer|)) (|i| #5=(|Integer|))
          (|i0| #5#) (|l0| #3#) (|vscan| (|PrimitiveArray| S))
          (|cp| (|Integer|)) (|y| (S)) (|has_vm| (|Boolean|)) (|vm| (S))
          (|vl| (S)) (|m0| #4#))
         (SEQ
          (EXIT
           (SEQ (LETT |vscan| (QREFELT $ 7)) (LETT |l| -1)
                (LETT |m| (QREFELT $ 9)) (LETT |m0| |m|)
                (EXIT
                 (COND
                  ((ZEROP (QREFELT $ 9))
                   (SEQ (SPADCALL |x| 1024 (QREFELT $ 16))
                        (|SCACHE;insertAtEnd| |x| $)
                        (EXIT (PROGN (LETT #2# |x|) (GO #6=#:G460)))))
                  (#7='T
                   (SEQ
                    (SEQ G190 (COND ((NULL (< (+ |l| 1) |m|)) (GO G191)))
                         (SEQ (LETT |m0| (QREFELT $ 9))
                              (COND
                               ((NULL (< |l| 0))
                                (LETT |vl| (QAREF1 |vscan| |l|))))
                              (LETT |has_vm| NIL)
                              (COND
                               ((< |m| |m0|)
                                (SEQ (LETT |vm| (QAREF1 |vscan| |m|))
                                     (EXIT (LETT |has_vm| 'T)))))
                              (LETT |i| (ASH (+ |l| |m|) -1))
                              (LETT |cp|
                                    (SPADCALL |x|
                                              (LETT |y| (QAREF1 |vscan| |i|))
                                              |triage|))
                              (EXIT
                               (COND
                                ((ZEROP |cp|)
                                 (SEQ
                                  (SPADCALL |x| (SPADCALL |y| (QREFELT $ 15))
                                            (QREFELT $ 16))
                                  (EXIT (PROGN (LETT #2# |y|) (GO #6#)))))
                                ('T
                                 (SEQ (LETT |vscan| (QREFELT $ 7))
                                      (COND
                                       ((NULL (< |l| 0))
                                        (COND
                                         ((NULL (EQ |vl| (QAREF1 |vscan| |l|)))
                                          (SEQ (LETT |l0| |l|)
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (NULL
                                                        (EQ |vl|
                                                            (QAREF1 |vscan|
                                                                    |l|))))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT |l| (+ |l| 1))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL))
                                               (LETT |i| (- (+ |i| |l|) |l0|))
                                               (EXIT
                                                (LETT |m|
                                                      (- (+ |m| |l|)
                                                         |l0|))))))))
                                      (COND
                                       ((NULL (EQ |y| (QAREF1 |vscan| |i|)))
                                        (SEQ (LETT |i0| |i|)
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (NULL
                                                      (EQ |y|
                                                          (QAREF1 |vscan|
                                                                  |i|))))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT (LETT |i| (+ |i| 1))))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (LETT |m|
                                                    (- (+ |m| |i|) |i0|))))))
                                      (COND
                                       (|has_vm|
                                        (COND
                                         ((NULL (EQ |vm| (QAREF1 |vscan| |m|)))
                                          (SEQ G190
                                               (COND
                                                ((NULL
                                                  (NULL
                                                   (EQ |vm|
                                                       (QAREF1 |vscan| |m|))))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT (LETT |m| (+ |m| 1))))
                                               NIL (GO G190) G191
                                               (EXIT NIL))))))
                                      (EXIT
                                       (COND ((< |cp| 0) (LETT |m| |i|))
                                             ('T (LETT |l| |i|)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |m| (QREFELT $ 9))
                       (SEQ
                        (SPADCALL |x|
                                  (+
                                   (SPADCALL (QAREF1 |vscan| (- |m| 1))
                                             (QREFELT $ 15))
                                   1024)
                                  (QREFELT $ 16))
                        (|SCACHE;insertAtEnd| |x| $)
                        (EXIT (PROGN (LETT #2# |x|) (GO #6#)))))
                      (#7#
                       (SEQ
                        (LETT |pos|
                              (COND ((< |l| 0) 0)
                                    (#7#
                                     (SPADCALL (QAREF1 |vscan| |l|)
                                               (QREFELT $ 15)))))
                        (EXIT
                         (|SCACHE;insertInCache|
                          (PROG1 (LETT #1# (+ |l| 1))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          |x| |pos| $))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |SCACHE;insertInCache|
        ((|before| |NonNegativeInteger|) (|x| S) (|pos| |NonNegativeInteger|)
         ($ S))
        (SPROG ((#1=#:G463 NIL) (|y| (S)))
               (SEQ (LETT |y| (QAREF1 (QREFELT $ 7) |before|))
                    (COND
                     ((EQL (+ |pos| 1) (SPADCALL |y| (QREFELT $ 15)))
                      (|SCACHE;shiftCache| |before| 1024 $)))
                    (SPADCALL |x|
                              (+ |pos|
                                 (QUOTIENT2
                                  (PROG1
                                      (LETT #1#
                                            (- (SPADCALL |y| (QREFELT $ 15))
                                               |pos|))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  2))
                              (QREFELT $ 16))
                    (|SCACHE;insertBefore| |before| |x| $) (EXIT |x|)))) 

(DECLAIM (NOTINLINE |SortedCache;|)) 

(DEFUN |SortedCache| (#1=#:G466)
  (SPROG NIL
         (PROG (#2=#:G467)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SortedCache|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SortedCache;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SortedCache|)))))))))) 

(DEFUN |SortedCache;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SortedCache| DV$1))
          (LETT $ (GETREFV 24))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SortedCache| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (MAKE-ARRAY 0))
          (QSETREFV $ 8 0)
          (QSETREFV $ 9 0)
          $))) 

(MAKEPROP '|SortedCache| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|cache| '|cache_size|
              '|cache_use| (|PositiveInteger|) (|NonNegativeInteger|) (0 . *)
              (|Void|) (6 . |void|) (10 . |position|) (15 . |setPosition|)
              |SCACHE;clearCache;V;4| (|Union| 6 '#1="failed")
              (|Mapping| (|Boolean|) 6) |SCACHE;linearSearch;SMU;6|
              |SCACHE;enterInCache;SMS;7| (|Mapping| (|Integer|) 6 6)
              |SCACHE;enterInCache;SMS;8|)
           '#(|linearSearch| 21 |enterInCache| 27 |clearCache| 39) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|clearCache| ((|Void|))) T)
                                   '((|enterInCache|
                                      (|#1| |#1| (|Mapping| (|Boolean|) |#1|)))
                                     T)
                                   '((|linearSearch|
                                      ((|Union| |#1| #1#) |#1|
                                       (|Mapping| (|Boolean|) |#1|)))
                                     T)
                                   '((|enterInCache|
                                      (|#1| |#1|
                                       (|Mapping| (|Integer|) |#1| |#1|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 23
                                            '(2 11 0 10 0 12 0 13 0 14 1 6 11 0
                                              15 2 6 13 0 11 16 2 0 18 6 19 20
                                              2 0 6 6 19 21 2 0 6 6 22 23 0 0
                                              13 17)))))
           '|lookupComplete|)) 