
(SDEFUN |DIRPROD;coerce;$V;1| ((|z| $) ($ |Vector| R))
        (SPADCALL |z| (QREFELT $ 9))) 

(SDEFUN |DIRPROD;coerce;R$;2| ((|r| R) ($ $)) (MAKEARR1 (QREFELT $ 6) |r|)) 

(PUT '|DIRPROD;parts;$L;3| '|SPADreplace| 'VEC2LIST) 

(SDEFUN |DIRPROD;parts;$L;3| ((|x| $) ($ |List| R)) (VEC2LIST |x|)) 

(SDEFUN |DIRPROD;directProduct;V$;4| ((|z| |Vector| R) ($ $))
        (COND
         ((SPADCALL |z| (QREFELT $ 6) (QREFELT $ 16))
          (SPADCALL |z| (QREFELT $ 9)))
         ('T (|error| "Not of the correct length")))) 

(SDEFUN |DIRPROD;same?| ((|z| $) ($ |Boolean|))
        (SPROG ((|z1| (R)))
               (SEQ
                (LETT |z1|
                      (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19))
                                (QREFELT $ 20)))
                (EXIT
                 (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR $ |z1|)) |z|
                           (QREFELT $ 23)))))) 

(SDEFUN |DIRPROD;same?!0| ((|x| NIL) ($$ NIL))
        (PROG (|z1| $)
          (LETT |z1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |z1| (QREFELT $ 21)))))) 

(SDEFUN |DIRPROD;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G399 NIL) (#2=#:G400 NIL) (#3=#:G401 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G398)))
                              (GO #5=#:G396))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G406 NIL) (#2=#:G407 NIL) (#3=#:G408 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G405)))
                              (GO #5=#:G403))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G413 NIL) (#2=#:G414 NIL) (#3=#:G415 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G412)))
                              (GO #5=#:G410))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;9| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G420 NIL) (#2=#:G421 NIL) (#3=#:G422 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #3# (QREFELT $ 6)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF1O |x| |i| 1) (QAREF1O |y| |i| 1)
                                        (QREFELT $ 21)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G419)))
                              (GO #5=#:G417))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;$R;10| ((|z| $) ($ R))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT $ 6) 0))
           (COND
            ((|DIRPROD;same?| |z| $)
             (EXIT
              (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20)))))))
         (EXIT (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;$U;11| ((|z| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT $ 6) 0))
           (COND
            ((|DIRPROD;same?| |z| $)
             (EXIT
              (CONS 0
                    (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19))
                              (QREFELT $ 20))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi$;12| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((L (|List| R)) (#1=#:G436 NIL) (|p| (|Integer|)) (#2=#:G441 NIL)
          (|i| NIL) (#3=#:G435 NIL) (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28))) (LETT |p| (- |n| 1))
              (LETT L
                    (LIST
                     (SPADCALL
                      (PROG1 (LETT #3# (+ (REM |p| N) 1))
                        (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                          '(|Integer|) #3#))
                      (QREFELT $ 30))))
              (SEQ (LETT |i| 2) (LETT #2# (QREFELT $ 6)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |p| (QUOTIENT2 |p| N))
                        (EXIT
                         (LETT L
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #1# (+ (REM |p| N) 1))
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 30))
                                L))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL L (QREFELT $ 31)))))) 

(SDEFUN |DIRPROD;random;$;13| (($ $))
        (SPROG ((#1=#:G444 NIL) (#2=#:G446 NIL) (|i| NIL) (#3=#:G445 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT $ 33)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DIRPROD;lookup;$Pi;14| ((|x| $) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G448 NIL) (L (|Integer|)) (#2=#:G451 NIL) (|i| NIL)
          (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)))
              (LETT L
                    (-
                     (SPADCALL (SPADCALL |x| 1 (QREFELT $ 20)) (QREFELT $ 35))
                     1))
              (SEQ (LETT |i| 2) (LETT #2# (QREFELT $ 6)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT L
                           (-
                            (+ (* L N)
                               (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                         (QREFELT $ 35)))
                            1))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (+ L 1))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))))) 

(SDEFUN |DIRPROD;Zero;$;15| (($ $)) (SPADCALL (QREFELT $ 6) (QREFELT $ 37))) 

(SDEFUN |DIRPROD;*;3$;16| ((|u| $) (|v| $) ($ $))
        (SPADCALL (ELT $ 39) |u| |v| (QREFELT $ 41))) 

(SDEFUN |DIRPROD;subtractIfCan;2$U;17| ((|u| $) (|v| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G466 NIL) (|c| (|Union| R "failed")) (#2=#:G467 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT $ 44))
                (SEQ (LETT |i| 1) (LETT #2# (QREFELT $ 6)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                                      (QREFELT $ 46)))
                      (EXIT
                       (COND
                        ((QEQCAR |c| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #3=#:G465)))
                        ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT $ 9))))))
          #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;One;$;18| (($ $))
        (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 48))) 

(SDEFUN |DIRPROD;recip;$U;19| ((|z| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G479 NIL) (|u| (|Union| R #1#)) (#3=#:G480 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT $ 50))
                (SEQ (LETT |i| 1) (LETT #3# (QREFELT $ 6)) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL (SPADCALL |z| |i| (QREFELT $ 51))
                                      (QREFELT $ 52)))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #2# (CONS 1 "failed")) (GO #4=#:G478)))
                        ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT $ 9))))))
          #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;unitVector;Pi$;20| ((|i| |PositiveInteger|) ($ $))
        (SPROG ((|v| ($)))
               (SEQ (LETT |v| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43)))
                    (SPADCALL |v| |i| (|spadConstant| $ 48) (QREFELT $ 54))
                    (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2$B;21| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G487 NIL) (|b| (R)) (|a| (R)) (#2=#:G488 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T) (GO #3=#:G486)))
                              ((< |b| |a|) (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G493 NIL) (|b| (R)) (|a| (R)) (#2=#:G494 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T) (GO #3=#:G492)))
                              ((< |b| |a|) (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G499 NIL) (|b| (R)) (|a| (R)) (#2=#:G500 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T) (GO #3=#:G498)))
                              ((< |b| |a|) (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G505 NIL) (|b| (R)) (|a| (R)) (#2=#:G506 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((SPADCALL |a| |b| (QREFELT $ 57))
                               (PROGN (LETT #1# 'T) (GO #3=#:G504)))
                              ((SPADCALL |b| |a| (QREFELT $ 57))
                               (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;sup;3$;25| ((|x| $) (|y| $) ($ $))
        (SPADCALL (ELT $ 58) |x| |y| (QREFELT $ 41))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct| (&REST #1=#:G529)
  (SPROG NIL
         (PROG (#2=#:G530)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DirectProduct|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|)))))))))) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G520 NIL) (#2=#:G521 NIL) (#3=#:G522 NIL) (#4=#:G523 NIL)
    (#5=#:G524 NIL) (#6=#:G525 NIL) (#7=#:G526 NIL) (#8=#:G527 NIL)
    (#9=#:G528 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2))
    (LETT $ (GETREFV 85))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Field|))
                                             (|HasCategory| |#2| '(|SemiRng|))
                                             (|HasCategory| |#2|
                                                            '(|AbelianGroup|))
                                             (|HasCategory| |#2|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #9#
                                                   (|HasCategory| |#2|
                                                                  '(|OrderedSet|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #9#)
                                             (|HasCategory| |#2|
                                                            '(|unitsKnown|))
                                             (LETT #8#
                                                   (|HasCategory| |#2|
                                                                  '(|CommutativeRing|)))
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                             (|HasCategory| |#2| '(|Ring|))
                                             (|HasCategory| |#2| '(|Monoid|))
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (LETT #7#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|)))
                                             (OR #7#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #9#)
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#2|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #6#
                                                   (|HasCategory| |#2|
                                                                  '(|DifferentialRing|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #8# #6#
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #8# #6#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (|HasCategory| |#2|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#2|)))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#2|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (OR #7# #9#)
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (AND #6#
                                                  (|HasCategory| |#2|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #5#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianMonoid|)))
                                             (AND #5#
                                                  (|HasCategory| |#2|
                                                                 '(|Monoid|)))
                                             (AND #5#
                                                  (|HasCategory| |#2|
                                                                 '(|SemiRng|)))
                                             (LETT #4#
                                                   (|HasCategory| |#2|
                                                                  '(|CancellationAbelianMonoid|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5# #4#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #4#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5# #4# #8# #6#
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (LETT #3#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiGroup|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #3#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2| '(|Monoid|))
                                              #3#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5#
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              #4# #8# #6#
                                              (|HasCategory| |#2| '(|Field|))
                                              #7#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #9#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5# #4# #8# #6#
                                              (|HasCategory| |#2| '(|Field|))
                                              #7#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #9#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR #5#
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (|HasCategory| |#2|
                                                            '(|CoercibleTo|
                                                              (|OutputForm|)))
                                             (LETT #2#
                                                   (AND
                                                    (|HasCategory| |#2|
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    (|HasCategory| |#2|
                                                                   '(|SetCategory|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #3#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #2#)
                                             (OR #2#
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                             (LETT #1#
                                                   (AND
                                                    (|HasCategory| |#2|
                                                                   '(|RetractableTo|
                                                                     (|Fraction|
                                                                      (|Integer|))))
                                                    (|HasCategory| |#2|
                                                                   '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|)))
                                              #1# #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #3#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #1#)))))
    (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 281474976710656))
    (AND #9# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 562949953421312))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 1125899906842624))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR #5#
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Field|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #4#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| $ 36028797018963968))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;6|) $)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;7|) $)))
        ((|domainEqual| |#2| (|PositiveInteger|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;8|) $)))
        ('T (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;9|) $))))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |DIRPROD;retract;$R;10|) $))
       (QSETREFV $ 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;$U;11|) $)))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 32 (CONS (|dispatchFunction| |DIRPROD;index;Pi$;12|) $))
       (QSETREFV $ 34 (CONS (|dispatchFunction| |DIRPROD;random;$;13|) $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |DIRPROD;lookup;$Pi;14|) $)))))
    (COND
     ((|testBitVector| |pv$| 29)
      (QSETREFV $ 38
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;Zero;$;15|) $ 38)))))
    (COND
     ((|testBitVector| |pv$| 36)
      (QSETREFV $ 42 (CONS (|dispatchFunction| |DIRPROD;*;3$;16|) $))))
    (COND
     ((|testBitVector| |pv$| 32)
      (PROGN
       (QSETREFV $ 44 (MAKEARR1 |#1| (|spadConstant| $ 43)))
       (QSETREFV $ 47
                 (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2$U;17|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV $ 49
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;One;$;18|) $ 49)))
       (QSETREFV $ 50 (MAKEARR1 |#1| (|spadConstant| $ 48)))
       (QSETREFV $ 53 (CONS (|dispatchFunction| |DIRPROD;recip;$U;19|) $)))))
    (COND
     ((|testBitVector| |pv$| 29)
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 55
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi$;20|)
                        $))))))
    (COND
     ((|testBitVector| |pv$| 5)
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV $ 56 (CONS (|dispatchFunction| |DIRPROD;<;2$B;21|) $)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV $ 56 (CONS (|dispatchFunction| |DIRPROD;<;2$B;22|) $)))
       ((|domainEqual| |#2| (|PositiveInteger|))
        (QSETREFV $ 56 (CONS (|dispatchFunction| |DIRPROD;<;2$B;23|) $)))
       ('T (QSETREFV $ 56 (CONS (|dispatchFunction| |DIRPROD;<;2$B;24|) $))))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 59 (CONS (|dispatchFunction| |DIRPROD;sup;3$;25|) $))))
    $))) 

(MAKEPROP '|DirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 7) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |copy|) |DIRPROD;coerce;$V;1| |DIRPROD;coerce;R$;2|
              (|List| 7) |DIRPROD;parts;$L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . |size?|) |DIRPROD;directProduct;V$;4|
              (|Integer|) (11 . |minIndex|) (16 . |elt|) (22 . =)
              (|Mapping| 14 7) (28 . |every?|) (34 . =) (40 . |retract|)
              (|Union| 7 '"failed") (45 . |retractIfCan|) (50 . |size|)
              (|PositiveInteger|) (54 . |index|) (59 . |vector|) (64 . |index|)
              (69 . |random|) (73 . |random|) (77 . |lookup|) (82 . |lookup|)
              (87 . |zero|) (92 . |Zero|) (96 . *) (|Mapping| 7 7 7)
              (102 . |map|) (109 . *) (115 . |Zero|) '|tmp0|
              (|Union| $ '"failed") (119 . |subtractIfCan|)
              (125 . |subtractIfCan|) (131 . |One|) (135 . |One|) '|tmp1|
              (139 . |qelt|) (145 . |recip|) (150 . |recip|) (155 . |setelt!|)
              (162 . |unitVector|) (167 . <) (173 . <) (179 . |sup|)
              (185 . |sup|) (|Equation| 7) (|List| 60) (|Matrix| 18)
              (|Matrix| $) (|Record| (|:| |mat| 62) (|:| |vec| (|Vector| 18)))
              (|Vector| $) (|Symbol|) (|List| 66) (|List| 15)
              (|Union| 70 '#1="failed") (|Fraction| 18) (|Union| 18 '#1#)
              (|Mapping| 14 7 7) (|Void|) (|Mapping| 7 7) (|OutputForm|)
              (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 80) (|:| |vec| 5)) (|Matrix| 7)
              (|SingleInteger|) (|String|) (|HashState|) (|List| 18))
           '#(~= 191 |zero?| 197 |unitVector| 202 |swap!| 207 |sup| 214
              |subtractIfCan| 220 |smaller?| 226 |size?| 232 |size| 238
              |setelt!| 242 |sample| 249 |rightRecip| 253 |rightPower| 258
              |retractIfCan| 270 |retract| 285 |reducedSystem| 300 |recip| 322
              |random| 327 |qsetelt!| 331 |qelt| 338 |parts| 344 |opposite?|
              349 |one?| 355 |more?| 360 |minIndex| 366 |min| 371 |members| 382
              |member?| 387 |maxIndex| 393 |max| 398 |map!| 415 |map| 421
              |lookup| 427 |less?| 432 |leftRecip| 438 |leftPower| 443 |latex|
              455 |indices| 460 |index?| 465 |index| 471 |hashUpdate!| 476
              |hash| 482 |first| 487 |fill!| 492 |every?| 498 |eval| 504 |eq?|
              530 |enumerate| 536 |entry?| 540 |entries| 546 |empty?| 551
              |empty| 556 |elt| 560 |dot| 573 |directProduct| 579 |dimension|
              584 |differentiate| 588 |count| 638 |copy| 650 |convert| 655
              |commutator| 660 |coerce| 666 |characteristic| 696 |associator|
              700 |any?| 707 |antiCommutator| 713 |annihilate?| 719 ^ 725
              |Zero| 737 |One| 741 D 745 >= 795 > 801 = 807 <= 813 < 819 / 825
              - 831 + 842 * 848 |#| 884)
           'NIL
           (CONS
            (|makeByteWordVec2| 48
                                '(0 8 11 11 8 8 11 16 17 18 20 1 11 20 10 2 8 9
                                  4 11 13 0 9 2 4 2 13 20 3 4 4 34 11 12 0 6 33
                                  12 14 38 19 0 15 38 35 0 0 37 8 40 21 0 0 0 0
                                  37 47 5 7 8 14 39 21 48 44))
            (CONS
             '#(|DirectProductCategory&| NIL |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| |Algebra&| |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |VectorSpace&| NIL |Rng&| |Module&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL NIL NIL
                |IndexedAggregate&| |OrderedSet&| |AbelianMonoid&|
                |MagmaWithUnit&| |Finite&| NIL |NonAssociativeSemiRng&|
                |HomogeneousAggregate&| NIL |Magma&| |AbelianSemiGroup&|
                |Aggregate&| |EltableAggregate&| |Evalable&| NIL |SetCategory&|
                |FullyRetractableTo&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|CommutativeRing|)
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|Algebra| $$) (|Algebra| 7) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 18) (|PartialDifferentialRing| 66)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 7) (|SemiRing|)
                 (|Rng|) (|Module| 7) (|SemiRng|) (|Module| $$)
                 (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|OrderedCancellationAbelianMonoid|)
                 (|RightModule| $$) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|IndexedAggregate| 18 7) (|OrderedSet|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 7)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 18 7) (|Evalable| 7) (|CommutativeStar|)
                 (|SetCategory|) (|FullyRetractableTo| 7) (|Type|)
                 (|finiteAggregate|) (|CoercibleTo| (|Vector| 7))
                 (|Eltable| 18 7) (|InnerEvalable| 7 7) (|CoercibleTo| 75)
                 (|PartialOrder|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 77) (|BasicType|) (|RetractableTo| 7)
                 (|RetractableTo| 70) (|RetractableTo| 18))
              (|makeByteWordVec2| 84
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 1 7 29 0 35 1 0 29 0 36 1 5 0 15 37
                                    0 0 0 38 2 7 0 0 0 39 3 8 0 40 0 0 41 2 0 0
                                    0 0 42 0 7 0 43 2 7 45 0 0 46 2 0 45 0 0 47
                                    0 7 0 48 0 0 0 49 2 0 7 0 18 51 1 7 45 0 52
                                    1 0 45 0 53 3 8 7 0 18 7 54 1 0 0 29 55 2 0
                                    14 0 0 56 2 7 14 0 0 57 2 7 0 0 0 58 2 0 0
                                    0 0 59 2 56 14 0 0 1 1 53 14 0 1 1 30 0 29
                                    55 3 52 73 0 18 18 1 2 4 0 0 0 59 2 54 45 0
                                    0 47 2 25 14 0 0 1 2 0 14 0 15 16 0 14 15 1
                                    3 52 7 0 18 7 1 0 0 0 1 1 12 45 0 1 2 12 0
                                    0 15 1 2 36 0 0 29 1 1 46 69 0 1 1 43 71 0
                                    1 1 21 26 0 27 1 46 70 0 1 1 43 18 0 1 1 21
                                    7 0 25 1 26 62 63 1 2 26 64 63 65 1 2 11 79
                                    63 65 1 1 11 80 63 1 1 12 45 0 53 0 14 0 34
                                    3 52 7 0 18 7 1 2 0 7 0 18 51 1 49 12 0 13
                                    2 53 14 0 0 1 1 12 14 0 1 2 0 14 0 15 1 1
                                    24 18 0 19 1 50 7 0 1 2 5 0 0 0 1 1 49 12 0
                                    1 2 51 14 7 0 1 1 24 18 0 1 1 50 7 0 1 2 49
                                    7 72 0 1 2 5 0 0 0 1 2 52 0 74 0 1 2 0 0 74
                                    0 1 1 14 29 0 36 2 0 14 0 15 1 1 12 45 0 1
                                    2 12 0 0 15 1 2 36 0 0 29 1 1 21 82 0 1 1 0
                                    84 0 1 2 0 14 18 0 1 1 14 0 29 32 2 21 83
                                    83 0 1 1 21 81 0 1 1 24 7 0 1 2 52 0 0 7 1
                                    2 49 14 22 0 23 3 22 0 0 12 12 1 2 22 0 0
                                    60 1 3 22 0 0 7 7 1 2 22 0 0 61 1 2 0 14 0
                                    0 1 0 14 78 1 2 51 14 7 0 1 1 0 12 0 1 1 0
                                    14 0 1 0 0 0 1 3 0 7 0 18 7 1 2 0 7 0 18 20
                                    2 31 7 0 0 1 1 0 0 5 17 0 1 76 1 2 27 0 0
                                    15 1 1 27 0 0 1 3 28 0 0 66 15 1 3 28 0 0
                                    67 68 1 2 28 0 0 66 1 2 28 0 0 67 1 3 11 0
                                    0 74 15 1 2 11 0 0 74 1 2 51 15 7 0 1 2 49
                                    15 22 0 1 1 0 0 0 1 1 14 77 0 1 2 11 0 0 0
                                    1 1 46 0 70 1 1 45 0 18 1 1 42 75 0 1 1 8 0
                                    0 1 1 21 0 7 11 1 0 5 0 10 0 11 15 1 3 11 0
                                    0 0 0 1 2 49 14 22 0 1 2 2 0 0 0 1 2 11 14
                                    0 0 1 2 12 0 0 15 1 2 36 0 0 29 1 0 53 0 38
                                    0 12 0 49 2 27 0 0 15 1 1 27 0 0 1 3 28 0 0
                                    66 15 1 3 28 0 0 67 68 1 2 28 0 0 66 1 2 28
                                    0 0 67 1 3 11 0 0 74 15 1 2 11 0 0 74 1 2 5
                                    14 0 0 1 2 5 14 0 0 1 2 56 14 0 0 24 2 5 14
                                    0 0 1 2 5 14 0 0 56 2 1 0 0 7 1 1 55 0 0 1
                                    2 55 0 0 0 1 2 41 0 0 0 1 2 55 0 18 0 1 2
                                    53 0 15 0 1 2 41 0 29 0 1 2 36 0 0 0 42 2
                                    36 0 7 0 1 2 36 0 0 7 1 1 49 15 0 1)))))
           '|lookupComplete|)) 
