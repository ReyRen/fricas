
(SDEFUN |JBC-;m2r;LL;1|
        ((|mi| |List| (|NonNegativeInteger|)) ($ |List| (|PositiveInteger|)))
        (SPROG
         ((|k| (|PositiveInteger|)) (|ri| (|List| (|PositiveInteger|)))
          (#1=#:G416 NIL) (|j| NIL) (#2=#:G415 NIL) (|i| NIL))
         (SEQ (LETT |ri| NIL) (LETT |k| 1)
              (SEQ (LETT |i| NIL) (LETT #2# |mi|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #1# |i|) G190
                         (COND ((|greater_SI| |j| #1#) (GO G191)))
                         (SEQ (EXIT (LETT |ri| (CONS |k| |ri|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |k| (+ |k| 1))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ri|)))) 

(SDEFUN |JBC-;r2m;LL;2|
        ((|ri| |List| (|PositiveInteger|)) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G420 NIL) (|i| NIL) (|mi| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |mi| (SPADCALL (SPADCALL (QREFELT $ 8)) 0 (QREFELT $ 17)))
              (SEQ (LETT |i| NIL) (LETT #1# |ri|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| (QREFELT $ 9) (QREFELT $ 19))
                       (|error| "Improper multi-index"))
                      ('T
                       (SPADCALL |mi| |i|
                                 (+ 1 (SPADCALL |mi| |i| (QREFELT $ 21)))
                                 (QREFELT $ 22))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |mi|)))) 

(SDEFUN |JBC-;allRepeated;LL;3|
        ((|mu| |List| (|NonNegativeInteger|))
         ($ |List| (|List| (|PositiveInteger|))))
        (SPROG
         ((|res| (|List| (|List| (|PositiveInteger|))))
          (|tmp| (|List| (|List| (|PositiveInteger|)))) (#1=#:G421 NIL)
          (|nu| (|List| (|NonNegativeInteger|))) (#2=#:G445 NIL) (|i| NIL)
          (#3=#:G446 NIL) (|k| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #3# |mu|) (LETT |i| 1)
                   (LETT #2# (QREFELT $ 9)) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                         (PROGN (LETT |k| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (ZEROP |k|))
                       (SEQ (LETT |nu| (SPADCALL |mu| (QREFELT $ 24)))
                            (SPADCALL |nu| |i|
                                      (PROG1 (LETT #1# (- |k| 1))
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 22))
                            (LETT |tmp| (SPADCALL |nu| (QREFELT $ 26)))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL
                                              (CONS #'|JBC-;allRepeated;LL;3!0|
                                                    (VECTOR $ |i|))
                                              |tmp| (QREFELT $ 29))
                                             (QREFELT $ 30)))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (COND ((NULL |res|) (LIST NIL)) ('T |res|)))))) 

(SDEFUN |JBC-;allRepeated;LL;3!0| ((|x| NIL) ($$ NIL))
        (PROG (|i| $)
          (LETT |i| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G438 NIL))
                   (SPADCALL
                    (PROG1 (LETT #1# |i|)
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #1#))
                    |x| (QREFELT $ 27))))))) 

(SDEFUN |JBC-;repeatedIndex;SL;4| ((|jv| S) ($ |List| (|PositiveInteger|)))
        (SPADCALL (SPADCALL |jv| (QREFELT $ 32)) (QREFELT $ 33))) 

(SDEFUN |JBC-;class;LNni;5|
        ((|l| |List| (|NonNegativeInteger|)) ($ |NonNegativeInteger|))
        (SPROG ((|res| (|PositiveInteger|)) (#1=#:G451 NIL) (|i| NIL))
               (SEQ (LETT |res| 1)
                    (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL)
                               (NULL (ZEROP |i|)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |res| (+ |res| 1))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |JBC-;class;SNni;6| ((|jv| S) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38)) 0)
         ('T (SPADCALL (SPADCALL |jv| (QREFELT $ 32)) (QREFELT $ 39))))) 

(SDEFUN |JBC-;order;SNni;7| ((|jv| S) ($ |NonNegativeInteger|))
        (SPROG ((|sum| (|NonNegativeInteger|)) (#1=#:G458 NIL) (|i| NIL))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |jv| (QREFELT $ 37)) '|Deriv|
                            (QREFELT $ 38))
                  0)
                 ('T
                  (SEQ (LETT |sum| 0)
                       (SEQ (LETT |i| NIL)
                            (LETT #1# (SPADCALL |jv| (QREFELT $ 32))) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT |sum| (+ |sum| |i|))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |sum|))))))) 

(SDEFUN |JBC-;dimJ;2Nni;8|
        ((|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G460 NIL))
               (SPADCALL (QREFELT $ 11)
                         (PROG1
                             (LETT #1#
                                   (SPADCALL (+ |q| (QREFELT $ 9))
                                             (QREFELT $ 9) (QREFELT $ 42)))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT $ 43)))) 

(SDEFUN |JBC-;dimS;2Nni;9|
        ((|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G463 NIL))
               (SPADCALL (QREFELT $ 11)
                         (PROG1
                             (LETT #1#
                                   (SPADCALL (- (+ |q| (QREFELT $ 9)) 1)
                                             (- (QREFELT $ 9) 1)
                                             (QREFELT $ 42)))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT $ 43)))) 

(SDEFUN |JBC-;X;S;10| (($ S)) (SPADCALL 1 (QREFELT $ 46))) 

(SDEFUN |JBC-;U;S;11| (($ S)) (SPADCALL 1 (QREFELT $ 48))) 

(SDEFUN |JBC-;P;LS;12| ((|lo| |List| (|NonNegativeInteger|)) ($ S))
        (SPADCALL 1 |lo| (QREFELT $ 50))) 

(SDEFUN |JBC-;P;PiNniS;13|
        ((|up| |PositiveInteger|) (|lo| |NonNegativeInteger|) ($ S))
        (SPADCALL |up| (LIST |lo|) (QREFELT $ 52))) 

(SDEFUN |JBC-;P;NniS;14| ((|lo| |NonNegativeInteger|) ($ S))
        (SPADCALL 1 (LIST |lo|) (QREFELT $ 52))) 

(SDEFUN |JBC-;P;PiLS;15|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ S))
        (SPROG
         ((|lop| (|List| (|PositiveInteger|))) (#1=#:G471 NIL) (#2=#:G476 NIL)
          (|i| NIL))
         (SEQ
          (COND
           ((EQUAL (SPADCALL (QREFELT $ 55)) '|Multi|)
            (SPADCALL |up| |lo| (QREFELT $ 52)))
           ('T
            (SEQ (LETT |lop| NIL)
                 (SEQ (LETT |i| NIL) (LETT #2# |lo|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND ((ZEROP |i|) (|error| "Improper multi-index"))
                              ('T
                               (LETT |lop|
                                     (CONS
                                      (PROG1 (LETT #1# |i|)
                                        (|check_subtype2| (> #1# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                      |lop|))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL |up| (NREVERSE |lop|) (QREFELT $ 56))))))))) 

(SDEFUN |JBC-;Pr;PiLS;16|
        ((|up| |PositiveInteger|) (|lo| |List| (|PositiveInteger|)) ($ S))
        (SPADCALL |up| (SPADCALL |lo| (QREFELT $ 58)) (QREFELT $ 52))) 

(SDEFUN |JBC-;coerce;SOf;17| ((|jv| S) ($ |OutputForm|))
        (SPADCALL (SPADCALL |jv| (QREFELT $ 60)) (QREFELT $ 62))) 

(SDEFUN |JBC-;dimJ;2Nni;18|
        ((|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (#1=#:G485 NIL) (#2=#:G489 NIL)
          (|qq| NIL) (|oldJV| (|Vector| (|NonNegativeInteger|)))
          (#3=#:G480 NIL))
         (SEQ
          (COND
           ((< |q| (SPADCALL (QREFELT $ 66) (QREFELT $ 70)))
            (SEQ (LETT |res| (QAREF1O (QREFELT $ 66) (+ (QREFELT $ 69) |q|) 1))
                 (EXIT
                  (COND ((SPADCALL |res| 0 (QREFELT $ 71)) |res|)
                        (#4='T
                         (SEQ
                          (LETT |res|
                                (SPADCALL (QREFELT $ 11)
                                          (PROG1
                                              (LETT #3#
                                                    (SPADCALL
                                                     (+ |q| (QREFELT $ 9))
                                                     (QREFELT $ 9)
                                                     (QREFELT $ 42)))
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                          (QREFELT $ 43)))
                          (QSETAREF1O (QREFELT $ 66) (+ (QREFELT $ 69) |q|)
                                      |res| 1)
                          (EXIT |res|)))))))
           (#4#
            (SEQ (LETT |oldJV| (SPADCALL (QREFELT $ 66) (QREFELT $ 72)))
                 (SETELT $ 66 (SPADCALL (+ |q| 1) 0 (QREFELT $ 65)))
                 (SEQ (LETT |qq| (QREFELT $ 69))
                      (LETT #2#
                            (-
                             (+ (QREFELT $ 69)
                                (SPADCALL |oldJV| (QREFELT $ 70)))
                             1))
                      G190 (COND ((> |qq| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1O (QREFELT $ 66) |qq|
                                    (QAREF1O |oldJV| |qq| 1) 1)))
                      (LETT |qq| (+ |qq| 1)) (GO G190) G191 (EXIT NIL))
                 (LETT |res|
                       (SPADCALL (QREFELT $ 11)
                                 (PROG1
                                     (LETT #1#
                                           (SPADCALL (+ |q| (QREFELT $ 9))
                                                     (QREFELT $ 9)
                                                     (QREFELT $ 42)))
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 43)))
                 (QSETAREF1O (QREFELT $ 66) (+ (QREFELT $ 69) |q|) |res| 1)
                 (EXIT |res|))))))) 

(SDEFUN |JBC-;dimS;2Nni;19|
        ((|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (#1=#:G496 NIL) (#2=#:G500 NIL)
          (|qq| NIL) (|oldSV| (|Vector| (|NonNegativeInteger|)))
          (#3=#:G491 NIL))
         (SEQ
          (COND
           ((< |q| (SPADCALL (QREFELT $ 67) (QREFELT $ 70)))
            (SEQ (LETT |res| (QAREF1O (QREFELT $ 67) (+ (QREFELT $ 69) |q|) 1))
                 (EXIT
                  (COND ((SPADCALL |res| 0 (QREFELT $ 71)) |res|)
                        (#4='T
                         (SEQ
                          (LETT |res|
                                (SPADCALL (QREFELT $ 11)
                                          (PROG1
                                              (LETT #3#
                                                    (SPADCALL
                                                     (- (+ |q| (QREFELT $ 9))
                                                        1)
                                                     (- (QREFELT $ 9) 1)
                                                     (QREFELT $ 42)))
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                          (QREFELT $ 43)))
                          (QSETAREF1O (QREFELT $ 67) (+ (QREFELT $ 69) |q|)
                                      |res| 1)
                          (EXIT |res|)))))))
           (#4#
            (SEQ (LETT |oldSV| (SPADCALL (QREFELT $ 67) (QREFELT $ 72)))
                 (SETELT $ 67 (SPADCALL (+ |q| 1) 0 (QREFELT $ 65)))
                 (SEQ (LETT |qq| (QREFELT $ 69))
                      (LETT #2#
                            (-
                             (+ (QREFELT $ 69)
                                (SPADCALL |oldSV| (QREFELT $ 70)))
                             1))
                      G190 (COND ((> |qq| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1O (QREFELT $ 67) |qq|
                                    (QAREF1O |oldSV| |qq| 1) 1)))
                      (LETT |qq| (+ |qq| 1)) (GO G190) G191 (EXIT NIL))
                 (LETT |res|
                       (SPADCALL (QREFELT $ 11)
                                 (PROG1
                                     (LETT #1#
                                           (SPADCALL
                                            (- (+ |q| (QREFELT $ 9)) 1)
                                            (- (QREFELT $ 9) 1)
                                            (QREFELT $ 42)))
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 43)))
                 (QSETAREF1O (QREFELT $ 67) (+ (QREFELT $ 69) |q|) |res| 1)
                 (EXIT |res|))))))) 

(SDEFUN |JBC-;differentiate;SPiU;20|
        ((|jv| S) (|i| |PositiveInteger|) ($ |Union| S "0"))
        (SPROG
         ((|nind| (|List| (|PositiveInteger|)))
          (|rind| (|List| (|PositiveInteger|)))
          (|mind| (|List| (|NonNegativeInteger|))) (|jt| (|Symbol|)))
         (SEQ
          (COND
           ((SPADCALL |i| (QREFELT $ 9) (QREFELT $ 19))
            (|error| "Improper upper index"))
           (#1='T
            (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 37)))
                 (EXIT
                  (COND ((EQUAL |jt| '|Const|) (CONS 1 "0"))
                        ((EQUAL |jt| '|Indep|)
                         (COND
                          ((EQL (SPADCALL |jv| (QREFELT $ 73)) |i|)
                           (CONS 0 (|spadConstant| $ 12)))
                          (#1# (CONS 1 "0"))))
                        ((EQUAL (SPADCALL (QREFELT $ 55)) '|Multi|)
                         (SEQ (LETT |mind| (SPADCALL |jv| (QREFELT $ 32)))
                              (SPADCALL |mind| |i|
                                        (+
                                         (SPADCALL |mind|
                                                   (+ (- |i| 1)
                                                      (SPADCALL |mind|
                                                                (QREFELT $
                                                                         74)))
                                                   (QREFELT $ 21))
                                         1)
                                        (QREFELT $ 22))
                              (EXIT
                               (CONS 0
                                     (SPADCALL (SPADCALL |jv| (QREFELT $ 73))
                                               |mind| (QREFELT $ 52))))))
                        (#1#
                         (SEQ (LETT |rind| (SPADCALL |jv| (QREFELT $ 75)))
                              (EXIT
                               (COND
                                ((NULL |rind|)
                                 (CONS 0
                                       (SPADCALL (SPADCALL |jv| (QREFELT $ 73))
                                                 (LIST |i|) (QREFELT $ 56))))
                                (#1#
                                 (SEQ (LETT |nind| NIL)
                                      (SEQ G190
                                           (COND
                                            ((OR (NULL (NULL (NULL |rind|)))
                                                 (NULL
                                                  (SPADCALL
                                                   (|SPADfirst| |rind|) |i|
                                                   (QREFELT $ 19))))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |nind|
                                                  (CONS (|SPADfirst| |rind|)
                                                        |nind|))
                                            (EXIT (LETT |rind| (CDR |rind|))))
                                           NIL (GO G190) G191 (EXIT NIL))
                                      (LETT |nind|
                                            (SPADCALL (NREVERSE |nind|)
                                                      (CONS |i| |rind|)
                                                      (QREFELT $ 76)))
                                      (EXIT
                                       (CONS 0
                                             (SPADCALL
                                              (SPADCALL |jv| (QREFELT $ 73))
                                              |nind|
                                              (QREFELT $ 56)))))))))))))))))) 

(SDEFUN |JBC-;derivativeOf?;2SL;21|
        ((|jv1| S) (|jv2| S) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (#1=#:G518 NIL)
          (#2=#:G524 NIL) (#3=#:G525 NIL) (|i1| NIL) (#4=#:G526 NIL) (|i2| NIL)
          (|jt| (|Symbol|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |jv1| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38))
             NIL)
            (#5='T
             (SEQ (LETT |jt| (SPADCALL |jv2| (QREFELT $ 37)))
                  (COND
                   ((SPADCALL |jt| '|Deriv| (QREFELT $ 38))
                    (COND ((SPADCALL |jt| '|Dep| (QREFELT $ 38)) (EXIT NIL)))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |jv1| (QREFELT $ 73))
                               (SPADCALL |jv2| (QREFELT $ 73)) (QREFELT $ 79))
                     NIL)
                    (#5#
                     (SEQ (LETT |res| NIL)
                          (SEQ (LETT |i2| NIL)
                               (LETT #4# (SPADCALL |jv2| (QREFELT $ 32)))
                               (LETT |i1| NIL)
                               (LETT #3# (SPADCALL |jv1| (QREFELT $ 32))) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |i1| (CAR #3#)) NIL)
                                     (ATOM #4#)
                                     (PROGN (LETT |i2| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((< |i1| |i2|)
                                   (PROGN (LETT #2# NIL) (GO #6=#:G523)))
                                  ('T
                                   (LETT |res|
                                         (CONS
                                          (PROG1 (LETT #1# (- |i1| |i2|))
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          |res|))))))
                               (LETT #3#
                                     (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                               (GO G190) G191 (EXIT NIL))
                          (EXIT (NREVERSE |res|))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |JBC-;integrateIfCan;SPiU;22|
        ((|jv| S) (|i| |PositiveInteger|) ($ |Union| S "failed"))
        (SPROG
         ((|rind| (|List| (|PositiveInteger|))) (|pos| (|Integer|))
          (#1=#:G530 NIL) (|mi| (|NonNegativeInteger|))
          (|mind| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |i| (QREFELT $ 9) (QREFELT $ 19))
            (|error| "Improper upper index"))
           ((SPADCALL (SPADCALL |jv| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38))
            (CONS 1 "failed"))
           ((EQUAL (SPADCALL (QREFELT $ 55)) '|Multi|)
            (SEQ (LETT |mind| (SPADCALL |jv| (QREFELT $ 32)))
                 (LETT |pos| (+ (- |i| 1) (SPADCALL |mind| (QREFELT $ 74))))
                 (LETT |mi| (SPADCALL |mind| |pos| (QREFELT $ 81)))
                 (EXIT
                  (COND ((ZEROP |mi|) (CONS 1 "failed"))
                        (#2='T
                         (SEQ
                          (SPADCALL |mind| |pos|
                                    (PROG1 (LETT #1# (- |mi| 1))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT $ 22))
                          (EXIT
                           (CONS 0
                                 (SPADCALL (SPADCALL |jv| (QREFELT $ 73))
                                           |mind| (QREFELT $ 52))))))))))
           (#2#
            (SEQ (LETT |rind| (SPADCALL |jv| (QREFELT $ 75)))
                 (LETT |pos| (SPADCALL |i| |rind| (QREFELT $ 82)))
                 (EXIT
                  (COND
                   ((< |pos| (SPADCALL |rind| (QREFELT $ 83)))
                    (CONS 1 "failed"))
                   (#2#
                    (SEQ (LETT |rind| (SPADCALL |rind| |pos| (QREFELT $ 84)))
                         (EXIT
                          (CONS 0
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 73)) |rind|
                                          (QREFELT $ 56)))))))))))))) 

(SDEFUN |JBC-;integrate;SPiS;23| ((|jv| S) (|i| |PositiveInteger|) ($ S))
        (SPROG ((|ji| (|Union| S "failed")))
               (SEQ (LETT |ji| (SPADCALL |jv| |i| (QREFELT $ 87)))
                    (EXIT
                     (COND
                      ((QEQCAR |ji| 1) (|error| "Integration not possible"))
                      ('T (QCDR |ji|))))))) 

(SDEFUN |JBC-;weight;SNni;24| ((|jv| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|PositiveInteger|)) (|pos| (|PositiveInteger|))
          (#1=#:G550 NIL) (|i| NIL) (|t| (|Symbol|)))
         (SEQ (LETT |t| (SPADCALL |jv| (QREFELT $ 37)))
              (EXIT
               (COND ((EQUAL |t| '|Const|) 0)
                     ((EQUAL |t| '|Indep|) (SPADCALL |jv| (QREFELT $ 73)))
                     ((EQUAL |t| '|Dep|)
                      (* (+ (QREFELT $ 9) 1) (SPADCALL |jv| (QREFELT $ 73))))
                     ('T
                      (SEQ (LETT |pos| (+ (QREFELT $ 9) 1))
                           (LETT |res|
                                 (* |pos| (SPADCALL |jv| (QREFELT $ 73))))
                           (SEQ (LETT |i| NIL)
                                (LETT #1# (SPADCALL |jv| (QREFELT $ 75))) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |i| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |pos| (* |pos| (+ (QREFELT $ 9) 1)))
                                     (EXIT
                                      (LETT |res| (+ |res| (* |i| |pos|)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |JBC-;one?;SB;25| ((|jv| S) ($ |Boolean|))
        (EQUAL (SPADCALL |jv| (QREFELT $ 37)) '|Const|)) 

(SDEFUN |JBC-;=;2SB;26| ((|jv1| S) (|jv2| S) ($ |Boolean|))
        (SPROG ((|t1| (|Symbol|)))
               (SEQ (LETT |t1| (SPADCALL |jv1| (QREFELT $ 37)))
                    (EXIT
                     (COND
                      ((EQUAL |t1| '|Const|)
                       (EQUAL (SPADCALL |jv2| (QREFELT $ 37)) '|Const|))
                      ((EQUAL |t1| '|Indep|)
                       (COND
                        ((EQUAL (SPADCALL |jv2| (QREFELT $ 37)) '|Indep|)
                         (EQL (SPADCALL |jv1| (QREFELT $ 73))
                              (SPADCALL |jv2| (QREFELT $ 73))))
                        (#1='T NIL)))
                      (#1#
                       (COND
                        ((EQL (SPADCALL |jv1| (QREFELT $ 73))
                              (SPADCALL |jv2| (QREFELT $ 73)))
                         (SPADCALL (SPADCALL |jv1| (QREFELT $ 32))
                                   (SPADCALL |jv2| (QREFELT $ 32))
                                   (QREFELT $ 91)))
                        (#1# NIL)))))))) 

(SDEFUN |JBC-;<;2SB;27| ((|jv1| S) (|jv2| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G562 NIL) (#2=#:G563 NIL) (|i1| NIL) (#3=#:G564 NIL) (|i2| NIL)
          (|o2| #4=(|NonNegativeInteger|)) (|o1| #4#) (|t2| #5=(|Symbol|))
          (|t1| #5#))
         (SEQ
          (EXIT
           (SEQ (LETT |t1| (SPADCALL |jv1| (QREFELT $ 37)))
                (LETT |t2| (SPADCALL |jv2| (QREFELT $ 37)))
                (EXIT
                 (COND ((EQUAL |t2| '|Const|) NIL) ((EQUAL |t1| '|Const|) 'T)
                       ((EQUAL |t1| '|Indep|)
                        (COND
                         ((EQUAL |t2| '|Indep|)
                          (< (SPADCALL |jv1| (QREFELT $ 73))
                             (SPADCALL |jv2| (QREFELT $ 73))))
                         (#6='T 'T)))
                       ((EQUAL |t1| '|Dep|)
                        (COND ((EQUAL |t2| '|Indep|) NIL)
                              ((EQUAL |t2| '|Dep|)
                               (< (SPADCALL |jv1| (QREFELT $ 73))
                                  (SPADCALL |jv2| (QREFELT $ 73))))
                              (#6# 'T)))
                       (#6#
                        (COND
                         ((OR (EQUAL |t2| '|Indep|) (EQUAL |t2| '|Dep|)) NIL)
                         ('T
                          (SEQ (LETT |o1| (SPADCALL |jv1| (QREFELT $ 93)))
                               (LETT |o2| (SPADCALL |jv2| (QREFELT $ 93)))
                               (EXIT
                                (COND
                                 ((EQL |o1| |o2|)
                                  (SEQ
                                   (SEQ (LETT |i2| NIL)
                                        (LETT #3#
                                              (SPADCALL |jv2| (QREFELT $ 32)))
                                        (LETT |i1| NIL)
                                        (LETT #2#
                                              (SPADCALL |jv1| (QREFELT $ 32)))
                                        G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |i1| (CAR #2#)) NIL)
                                              (ATOM #3#)
                                              (PROGN
                                               (LETT |i2| (CAR #3#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |i1| |i2| (QREFELT $ 94))
                                            (PROGN
                                             (LETT #1#
                                                   (SPADCALL |i1| |i2|
                                                             (QREFELT $ 71)))
                                             (GO #7=#:G561))))))
                                        (LETT #2#
                                              (PROG1 (CDR #2#)
                                                (LETT #3# (CDR #3#))))
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (< (SPADCALL |jv1| (QREFELT $ 73))
                                       (SPADCALL |jv2| (QREFELT $ 73))))))
                                 (#6# (< |o1| |o2|))))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |JBC-;>;2SB;28| ((|jv1| S) (|jv2| S) ($ |Boolean|))
        (SPADCALL |jv2| |jv1| (QREFELT $ 96))) 

(SDEFUN |JBC-;variables;NniL;29| ((|q| |NonNegativeInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G599 NIL) (#2=#:G616 NIL) (|i| NIL) (#3=#:G615 NIL)
          (#4=#:G596 NIL) (#5=#:G614 NIL) (#6=#:G613 NIL) (JV (|List| S))
          (#7=#:G580 NIL) (#8=#:G612 NIL) (|k| NIL) (#9=#:G611 NIL) (|ind| NIL)
          (|IndList| (|List| (|List| (|PositiveInteger|))))
          (|OIndList| (|List| (|List| (|PositiveInteger|))))
          (|NIndList| (|List| (|List| (|PositiveInteger|)))) (#10=#:G574 NIL)
          (#11=#:G610 NIL) (|j| NIL) (#12=#:G609 NIL) (#13=#:G608 NIL)
          (|qq| NIL) (#14=#:G571 NIL) (#15=#:G607 NIL) (#16=#:G569 NIL)
          (#17=#:G606 NIL) (#18=#:G605 NIL) (#19=#:G567 NIL) (#20=#:G604 NIL))
         (SEQ
          (COND
           ((ZEROP |q|)
            (PROGN
             (LETT #20# NIL)
             (SEQ (LETT |i| (QREFELT $ 9)) G190 (COND ((< |i| 1) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #20#
                          (CONS
                           (SPADCALL
                            (PROG1 (LETT #19# |i|)
                              (|check_subtype2| (> #19# 0) '(|PositiveInteger|)
                                                '(|NonNegativeInteger|) #19#))
                            (QREFELT $ 46))
                           #20#))))
                  (LETT |i| (+ |i| -1)) (GO G190) G191
                  (EXIT (NREVERSE #20#)))))
           ('T
            (SEQ
             (LETT |OIndList|
                   (PROGN
                    (LETT #18# NIL)
                    (SEQ (LETT |i| 1) (LETT #17# (QREFELT $ 9)) G190
                         (COND ((|greater_SI| |i| #17#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #18#
                                 (CONS
                                  (LIST
                                   (PROG1 (LETT #16# |i|)
                                     (|check_subtype2| (> #16# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #16#)))
                                  #18#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #18#)))))
             (LETT |IndList|
                   (PROGN
                    (LETT #15# NIL)
                    (SEQ (LETT |i| (QREFELT $ 9)) G190
                         (COND ((< |i| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #15#
                                 (CONS
                                  (LIST
                                   (PROG1 (LETT #14# |i|)
                                     (|check_subtype2| (> #14# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #14#)))
                                  #15#))))
                         (LETT |i| (+ |i| -1)) (GO G190) G191
                         (EXIT (NREVERSE #15#)))))
             (SEQ (LETT |qq| 2) (LETT #13# |q|) G190
                  (COND ((|greater_SI| |qq| #13#) (GO G191)))
                  (SEQ (LETT |NIndList| NIL)
                       (SEQ (LETT |ind| NIL) (LETT #12# |OIndList|) G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |ind| (CAR #12#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |j| (|SPADfirst| |ind|))
                                   (LETT #11# (QREFELT $ 9)) G190
                                   (COND ((> |j| #11#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |NIndList|
                                           (CONS
                                            (CONS
                                             (PROG1 (LETT #10# |j|)
                                               (|check_subtype2| (> #10# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #10#))
                                             |ind|)
                                            |NIndList|))))
                                   (LETT |j| (+ |j| 1)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
                       (LETT |OIndList| (REVERSE |NIndList|))
                       (EXIT
                        (LETT |IndList|
                              (SPADCALL |NIndList| |IndList| (QREFELT $ 30)))))
                  (LETT |qq| (|inc_SI| |qq|)) (GO G190) G191 (EXIT NIL))
             (LETT JV NIL)
             (SEQ (LETT |ind| NIL) (LETT #9# |IndList|) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |ind| (CAR #9#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |k| 1) (LETT #8# (QREFELT $ 11)) G190
                         (COND ((|greater_SI| |k| #8#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT JV
                                 (CONS
                                  (SPADCALL
                                   (PROG1 (LETT #7# |k|)
                                     (|check_subtype2| (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #7#))
                                   |ind| (QREFELT $ 56))
                                  JV))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))))
                  (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL
               (SPADCALL
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (QREFELT $ 9)) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #4# |i|)
                                  (|check_subtype2| (> #4# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #4#))
                                (QREFELT $ 46))
                               #6#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT $ 11)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i|)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT $ 48))
                               #3#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                (QREFELT $ 99))
               JV (QREFELT $ 99))))))))) 

(SDEFUN |JBC-;variables;NniPiL;30|
        ((|q| |NonNegativeInteger|) (|c| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((JV (|List| S)) (#1=#:G626 NIL) (#2=#:G638 NIL) (|k| NIL)
          (#3=#:G637 NIL) (|ind| NIL)
          (|OIndList| (|List| (|List| (|PositiveInteger|))))
          (|NIndList| (|List| (|List| (|PositiveInteger|)))) (#4=#:G620 NIL)
          (#5=#:G636 NIL) (|j| NIL) (#6=#:G635 NIL) (#7=#:G634 NIL) (|qq| NIL)
          (#8=#:G617 NIL) (#9=#:G633 NIL) (|i| NIL) (#10=#:G632 NIL))
         (SEQ
          (COND ((ZEROP |q|) NIL)
                ('T
                 (SEQ
                  (LETT |OIndList|
                        (PROGN
                         (LETT #10# NIL)
                         (SEQ (LETT |i| |c|) (LETT #9# (QREFELT $ 9)) G190
                              (COND ((> |i| #9#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #10#
                                      (CONS
                                       (LIST
                                        (PROG1 (LETT #8# |i|)
                                          (|check_subtype2| (> #8# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #8#)))
                                       #10#))))
                              (LETT |i| (+ |i| 1)) (GO G190) G191
                              (EXIT (NREVERSE #10#)))))
                  (SEQ (LETT |qq| 2) (LETT #7# |q|) G190
                       (COND ((|greater_SI| |qq| #7#) (GO G191)))
                       (SEQ (LETT |NIndList| NIL)
                            (SEQ (LETT |ind| NIL) (LETT #6# |OIndList|) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |ind| (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |j| (|SPADfirst| |ind|))
                                        (LETT #5# (QREFELT $ 9)) G190
                                        (COND ((> |j| #5#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |NIndList|
                                                (CONS
                                                 (CONS
                                                  (PROG1 (LETT #4# |j|)
                                                    (|check_subtype2| (> #4# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #4#))
                                                  |ind|)
                                                 |NIndList|))))
                                        (LETT |j| (+ |j| 1)) (GO G190) G191
                                        (EXIT NIL))))
                                 (LETT #6# (CDR #6#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |OIndList| (NREVERSE |NIndList|))))
                       (LETT |qq| (|inc_SI| |qq|)) (GO G190) G191 (EXIT NIL))
                  (LETT JV NIL)
                  (SEQ (LETT |ind| NIL) (LETT #3# |OIndList|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |ind| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| 1) (LETT #2# (QREFELT $ 11)) G190
                              (COND ((|greater_SI| |k| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT JV
                                      (CONS
                                       (SPADCALL
                                        (PROG1 (LETT #1# |k|)
                                          (|check_subtype2| (> #1# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #1#))
                                        |ind| (QREFELT $ 56))
                                       JV))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT JV))))))) 

(DECLAIM (NOTINLINE |JetBundleCategory&;|)) 

(DEFUN |JetBundleCategory&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|JetBundleCategory&| DV$1))
          (LETT $ (GETREFV 104))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 66 (SPADCALL 1 (QREFELT $ 11) (QREFELT $ 65)))
          (QSETREFV $ 67 (SPADCALL 1 (QREFELT $ 11) (QREFELT $ 65)))
          (QSETREFV $ 69 (SPADCALL (QREFELT $ 66) (QREFELT $ 68)))
          $))) 

(MAKEPROP '|JetBundleCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . |numIndVar|) '|nn| (4 . |numDepVar|) '|mm| (8 . |One|)
              (|List| 7) (|List| 16) |JBC-;m2r;LL;1| (|NonNegativeInteger|)
              (12 . |new|) (|Boolean|) (18 . >) (|Integer|) (24 . |elt|)
              (30 . |setelt!|) |JBC-;r2m;LL;2| (37 . |copy|) (|List| 13)
              (42 . |allRepeated|) (47 . |cons|) (|Mapping| 13 13) (53 . |map|)
              (59 . |concat!|) |JBC-;allRepeated;LL;3| (65 . |multiIndex|)
              (70 . |m2r|) |JBC-;repeatedIndex;SL;4| |JBC-;class;LNni;5|
              (|Symbol|) (75 . |type|) (80 . ~=) (86 . |class|)
              |JBC-;class;SNni;6| |JBC-;order;SNni;7| (91 . |binomial|)
              (97 . *) |JBC-;dimJ;2Nni;18| |JBC-;dimS;2Nni;19| (103 . X)
              |JBC-;X;S;10| (108 . U) |JBC-;U;S;11| (113 . P) |JBC-;P;LS;12|
              (119 . |Pm|) |JBC-;P;PiNniS;13| |JBC-;P;NniS;14|
              (125 . |getNotation|) (129 . |Pr|) |JBC-;P;PiLS;15| (135 . |r2m|)
              |JBC-;Pr;PiLS;16| (140 . |name|) (|OutputForm|) (145 . |coerce|)
              |JBC-;coerce;SOf;17| (|Vector| 16) (150 . |new|) '|dimJV|
              '|dimSV| (156 . |minIndex|) '|mn| (161 . |#|) (166 . >)
              (172 . |copy|) (177 . |index|) (182 . |minIndex|)
              (187 . |repeatedIndex|) (192 . |concat!|) (|Union| $ '"0")
              |JBC-;differentiate;SPiU;20| (198 . ~=)
              |JBC-;derivativeOf?;2SL;21| (204 . |qelt|) (210 . |position|)
              (216 . |minIndex|) (221 . |delete|) (|Union| $ '"failed")
              |JBC-;integrateIfCan;SPiU;22| (227 . |integrateIfCan|)
              |JBC-;integrate;SPiS;23| |JBC-;weight;SNni;24| |JBC-;one?;SB;25|
              (233 . =) |JBC-;=;2SB;26| (239 . |order|) (244 . ~=)
              |JBC-;<;2SB;27| (250 . <) |JBC-;>;2SB;28| (|List| 6)
              (256 . |concat!|) (|List| $) |JBC-;variables;NniL;29|
              |JBC-;variables;NniPiL;30| (|Expression| 20))
           '#(|weight| 262 |variables| 267 |repeatedIndex| 278 |r2m| 283
              |order| 288 |one?| 293 |m2r| 298 |integrateIfCan| 303 |integrate|
              309 |dimS| 315 |dimJ| 320 |differentiate| 325 |derivativeOf?| 331
              |coerce| 337 |class| 342 |allRepeated| 352 X 357 U 361 |Pr| 365 P
              371 > 393 = 399 < 405)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|dimS|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|dimJ|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|variables|
                                 ((|List| |#1|) (|NonNegativeInteger|)
                                  (|PositiveInteger|)))
                                T)
                              '((|variables|
                                 ((|List| |#1|) (|NonNegativeInteger|)))
                                T)
                              '((P (|#1| (|NonNegativeInteger|))) T)
                              '((P
                                 (|#1| (|PositiveInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((P (|#1| (|List| (|NonNegativeInteger|)))) T)
                              '((U (|#1|)) T) '((X (|#1|)) T)
                              '((|one?| ((|Boolean|) |#1|)) T)
                              '((|Pr|
                                 (|#1| (|PositiveInteger|)
                                  (|List| (|PositiveInteger|))))
                                T)
                              '((P
                                 (|#1| (|PositiveInteger|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((U (|#1| (|PositiveInteger|))) T)
                              '((X (|#1| (|PositiveInteger|))) T)
                              '((|integrate| (|#1| |#1| (|PositiveInteger|)))
                                T)
                              '((|integrateIfCan|
                                 ((|Union| |#1| "failed") |#1|
                                  (|PositiveInteger|)))
                                T)
                              '((|derivativeOf?|
                                 ((|List| (|NonNegativeInteger|)) |#1| |#1|))
                                T)
                              '((|differentiate|
                                 ((|Union| |#1| "0") |#1| (|PositiveInteger|)))
                                T)
                              '((|weight| ((|NonNegativeInteger|) |#1|)) T)
                              '((|order| ((|NonNegativeInteger|) |#1|)) T)
                              '((|class| ((|NonNegativeInteger|) |#1|)) T)
                              '((|class|
                                 ((|NonNegativeInteger|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|allRepeated|
                                 ((|List| (|List| (|PositiveInteger|)))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|m2r|
                                 ((|List| (|PositiveInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|r2m|
                                 ((|List| (|NonNegativeInteger|))
                                  (|List| (|PositiveInteger|))))
                                T)
                              '((|repeatedIndex|
                                 ((|List| (|PositiveInteger|)) |#1|))
                                T)
                              '((|coerce| ((|Expression| (|Integer|)) |#1|)) T)
                              '((> ((|Boolean|) |#1| |#1|)) T)
                              '((< ((|Boolean|) |#1| |#1|)) T)
                              '((|coerce| ((|OutputForm|) |#1|)) T)
                              '((= ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 102
                                            '(0 6 7 8 0 6 7 10 0 6 0 12 2 14 0
                                              16 16 17 2 7 18 0 0 19 2 14 16 0
                                              20 21 3 14 16 0 20 16 22 1 14 0 0
                                              24 1 6 25 14 26 2 13 0 7 0 27 2
                                              25 0 28 0 29 2 25 0 0 0 30 1 6 14
                                              0 32 1 6 13 14 33 1 6 36 0 37 2
                                              36 18 0 0 38 1 6 16 14 39 2 20 0
                                              0 0 42 2 16 0 7 0 43 1 6 0 7 46 1
                                              6 0 7 48 2 6 0 7 14 50 2 6 0 7 14
                                              52 0 6 36 55 2 6 0 7 13 56 1 6 14
                                              13 58 1 6 36 0 60 1 36 61 0 62 2
                                              64 0 16 16 65 1 64 20 0 68 1 64
                                              16 0 70 2 16 18 0 0 71 1 64 0 0
                                              72 1 6 7 0 73 1 14 20 0 74 1 6 13
                                              0 75 2 13 0 0 0 76 2 7 18 0 0 79
                                              2 14 16 0 20 81 2 13 20 7 0 82 1
                                              13 20 0 83 2 13 0 0 20 84 2 6 85
                                              0 7 87 2 14 18 0 0 91 1 6 16 0 93
                                              2 16 18 0 0 94 2 6 18 0 0 96 2 98
                                              0 0 0 99 1 0 16 0 89 2 0 100 16 7
                                              102 1 0 100 16 101 1 0 13 0 34 1
                                              0 14 13 23 1 0 16 0 41 1 0 18 0
                                              90 1 0 13 14 15 2 0 85 0 7 86 2 0
                                              0 0 7 88 1 0 16 16 45 1 0 16 16
                                              44 2 0 77 0 7 78 2 0 14 0 0 80 1
                                              0 61 0 63 1 0 16 0 40 1 0 16 14
                                              35 1 0 25 14 31 0 0 0 47 0 0 0 49
                                              2 0 0 7 13 59 1 0 0 16 54 1 0 0
                                              14 51 2 0 0 7 16 53 2 0 0 7 14 57
                                              2 0 18 0 0 97 2 0 18 0 0 92 2 0
                                              18 0 0 95)))))
           '|lookupComplete|)) 
