
(SDEFUN |MSET;elt| ((|t| |Table| S (|Integer|)) (|s| S) ($ |Integer|))
        (SPROG ((|a| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |a| (SPADCALL |s| |t| (QREFELT $ 10)))
                    (EXIT (COND ((QEQCAR |a| 1) 0) ('T (QCDR |a|))))))) 

(SDEFUN |MSET;empty;$;2| (($ $)) (CONS 0 (SPADCALL (QREFELT $ 11)))) 

(SDEFUN |MSET;multiset;$;3| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;dictionary;$;4| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;set;$;5| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;construct;L$;6| ((|l| |List| S) ($ $))
        (SPROG
         ((|n| (|Integer|)) (#1=#:G410 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 11))) (LETT |n| 0)
              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL |t| |e| (+ (|MSET;elt| |t| |e| $) 1)
                              (QREFELT $ 17))
                    (EXIT (LETT |n| (+ |n| 1))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |n| |t|))))) 

(SDEFUN |MSET;multiset;L$;7| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 19))) 

(SDEFUN |MSET;dictionary;L$;8| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 19))) 

(SDEFUN |MSET;set;L$;9| ((|l| |List| S) ($ $)) (SPADCALL |l| (QREFELT $ 19))) 

(SDEFUN |MSET;multiset;S$;10| ((|s| S) ($ $))
        (SPADCALL (LIST |s|) (QREFELT $ 19))) 

(SDEFUN |MSET;convert;$If;11| ((|ms| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|multiset| (QREFELT $ 26))
               (SPADCALL (SPADCALL |ms| (QREFELT $ 27)) (QREFELT $ 28)))
         (QREFELT $ 30))) 

(SDEFUN |MSET;members;$L;12| ((|ms| $) ($ |List| S))
        (SPADCALL (QCDR |ms|) (QREFELT $ 32))) 

(SDEFUN |MSET;coerce;$Of;13| ((|ms| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|item| #1=(|OutputForm|))
          (|n| (|Integer|)) (|ex| #1#) (#2=#:G422 NIL) (|e| NIL)
          (|colon| (|OutputForm|)) (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |l| NIL) (LETT |t| (QCDR |ms|))
              (LETT |colon| (SPADCALL " : " (QREFELT $ 36)))
              (SEQ (LETT |e| NIL) (LETT #2# (SPADCALL |t| (QREFELT $ 32))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ex| (SPADCALL |e| (QREFELT $ 37)))
                        (LETT |n| (|MSET;elt| |t| |e| $))
                        (LETT |item|
                              (COND
                               ((SPADCALL |n| 1 (QREFELT $ 39))
                                (SPADCALL
                                 (LIST (SPADCALL |n| (QREFELT $ 40)) |colon|
                                       |ex|)
                                 (QREFELT $ 41)))
                               ('T |ex|)))
                        (EXIT (LETT |l| (CONS |item| |l|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT $ 42)))))) 

(SDEFUN |MSET;duplicates;$L;14|
        ((|ms| $)
         ($ |List|
          (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
        (SPROG
         ((|ld|
           (|List|
            (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
          (#1=#:G426 NIL) (|n| (|Integer|)) (#2=#:G432 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |ld| NIL) (LETT |t| (QCDR |ms|))
              (SEQ (LETT |e| NIL) (LETT #2# (SPADCALL |t| (QREFELT $ 32))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |n| (|MSET;elt| |t| |e| $)) 1
                                 (QREFELT $ 39))
                       (LETT |ld|
                             (CONS
                              (CONS |e|
                                    (PROG1 (LETT #1# |n|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#)))
                              |ld|))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ld|)))) 

(SDEFUN |MSET;extract!;$S;15| ((|ms| $) ($ S))
        (SPROG ((|n| (|Integer|)) (|e| (S)) (|t| (|Table| S (|Integer|))))
               (SEQ
                (COND
                 ((SPADCALL |ms| (QREFELT $ 47))
                  (|error| "extract: Empty multiset"))
                 (#1='T
                  (SEQ (PROGN (RPLACA |ms| (- (QCAR |ms|) 1)) (QCAR |ms|))
                       (LETT |t| (QCDR |ms|))
                       (LETT |e| (QCAR (SPADCALL |t| (QREFELT $ 49))))
                       (SEQ (LETT |n| (|MSET;elt| |t| |e| $))
                            (EXIT
                             (COND
                              ((SPADCALL |n| 1 (QREFELT $ 39))
                               (SPADCALL |t| |e| (- |n| 1) (QREFELT $ 17)))
                              (#1# (SPADCALL |e| |t| (QREFELT $ 50))))))
                       (EXIT |e|))))))) 

(SDEFUN |MSET;inspect;$S;16| ((|ms| $) ($ S))
        (QCAR (SPADCALL (QCDR |ms|) (QREFELT $ 49)))) 

(SDEFUN |MSET;insert!;S2$;17| ((|e| S) (|ms| $) ($ $))
        (SEQ (PROGN (RPLACA |ms| (+ (QCAR |ms|) 1)) (QCAR |ms|))
             (SPADCALL (QCDR |ms|) |e| (+ (|MSET;elt| (QCDR |ms|) |e| $) 1)
                       (QREFELT $ 17))
             (EXIT |ms|))) 

(SDEFUN |MSET;member?;S$B;18| ((|e| S) (|ms| $) ($ |Boolean|))
        (SPADCALL |e| (SPADCALL (QCDR |ms|) (QREFELT $ 32)) (QREFELT $ 54))) 

(SDEFUN |MSET;empty?;$B;19| ((|ms| $) ($ |Boolean|)) (EQL (QCAR |ms|) 0)) 

(SDEFUN |MSET;#;$Nni;20| ((|ms| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G449 NIL))
               (PROG1 (LETT #1# (QCAR |ms|))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |MSET;count;S$Nni;21| ((|e| S) (|ms| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G451 NIL))
               (PROG1 (LETT #1# (|MSET;elt| (QCDR |ms|) |e| $))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |MSET;remove!;S$I$;22| ((|e| S) (|ms| $) (|max| |Integer|) ($ $))
        (SPROG ((|n| (|Integer|)) (|t| (|Table| S (|Integer|))))
               (SEQ
                (COND ((ZEROP |max|) (SPADCALL |e| |ms| (QREFELT $ 59)))
                      (#1='T
                       (SEQ (LETT |t| (QCDR |ms|))
                            (COND
                             ((SPADCALL |e| (SPADCALL |t| (QREFELT $ 32))
                                        (QREFELT $ 54))
                              (SEQ (LETT |n| (|MSET;elt| |t| |e| $))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |n| |max| (QREFELT $ 60))
                                      (SEQ (SPADCALL |e| |t| (QREFELT $ 50))
                                           (EXIT
                                            (PROGN
                                             (RPLACA |ms| (- (QCAR |ms|) |n|))
                                             (QCAR |ms|)))))
                                     ((SPADCALL |max| 0 (QREFELT $ 39))
                                      (SEQ
                                       (SPADCALL |t| |e| (- |n| |max|)
                                                 (QREFELT $ 17))
                                       (EXIT
                                        (PROGN
                                         (RPLACA |ms| (- (QCAR |ms|) |max|))
                                         (QCAR |ms|)))))
                                     (#1#
                                      (SEQ (LETT |n| (+ |n| |max|))
                                           (EXIT
                                            (COND
                                             ((SPADCALL |n| 0 (QREFELT $ 39))
                                              (SEQ
                                               (SPADCALL |t| |e| (- |max|)
                                                         (QREFELT $ 17))
                                               (EXIT
                                                (PROGN
                                                 (RPLACA |ms|
                                                         (- (QCAR |ms|) |n|))
                                                 (QCAR |ms|))))))))))))))
                            (EXIT |ms|))))))) 

(SDEFUN |MSET;remove!;M$I$;23|
        ((|p| |Mapping| (|Boolean|) S) (|ms| $) (|max| |Integer|) ($ $))
        (SPROG
         ((#1=#:G474 NIL) (|n| (|Integer|)) (#2=#:G475 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ
          (COND ((ZEROP |max|) (SPADCALL |p| |ms| (QREFELT $ 63)))
                ('T
                 (SEQ (LETT |t| (QCDR |ms|))
                      (SEQ (LETT |e| NIL)
                           (LETT #2# (SPADCALL |t| (QREFELT $ 32))) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |e| |p|)
                               (SEQ (LETT |n| (|MSET;elt| |t| |e| $))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |n| |max| (QREFELT $ 60))
                                       (SEQ (SPADCALL |e| |t| (QREFELT $ 50))
                                            (EXIT
                                             (PROGN
                                              (RPLACA |ms| (- (QCAR |ms|) |n|))
                                              (QCAR |ms|)))))
                                      ((SPADCALL |max| 0 (QREFELT $ 39))
                                       (SEQ
                                        (SPADCALL |t| |e| (- |n| |max|)
                                                  (QREFELT $ 17))
                                        (EXIT
                                         (PROGN
                                          (RPLACA |ms| (- (QCAR |ms|) |max|))
                                          (QCAR |ms|)))))
                                      ('T
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |n| (+ |n| |max|))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |n| 0
                                                           (QREFELT $ 39))
                                                 (PROGN
                                                  (LETT #1#
                                                        (SEQ
                                                         (SPADCALL |t| |e|
                                                                   (- |max|)
                                                                   (QREFELT $
                                                                            17))
                                                         (EXIT
                                                          (PROGN
                                                           (RPLACA |ms|
                                                                   (-
                                                                    (QCAR |ms|)
                                                                    |n|))
                                                           (QCAR |ms|)))))
                                                  (GO #3=#:G468)))))))
                                        #3# (EXIT #1#))))))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ms|))))))) 

(SDEFUN |MSET;remove;S$I$;24| ((|e| S) (|ms| $) (|max| |Integer|) ($ $))
        (SPADCALL |e| (SPADCALL |ms| (QREFELT $ 65)) |max| (QREFELT $ 61))) 

(SDEFUN |MSET;remove;M$I$;25|
        ((|p| |Mapping| (|Boolean|) S) (|ms| $) (|max| |Integer|) ($ $))
        (SPADCALL |p| (SPADCALL |ms| (QREFELT $ 65)) |max| (QREFELT $ 64))) 

(SDEFUN |MSET;remove!;S2$;26| ((|e| S) (|ms| $) ($ $))
        (SPROG ((|t| (|Table| S (|Integer|))))
               (SEQ (LETT |t| (QCDR |ms|))
                    (COND
                     ((SPADCALL |e| (SPADCALL |t| (QREFELT $ 32))
                                (QREFELT $ 54))
                      (SEQ
                       (PROGN
                        (RPLACA |ms| (- (QCAR |ms|) (|MSET;elt| |t| |e| $)))
                        (QCAR |ms|))
                       (EXIT (SPADCALL |e| |t| (QREFELT $ 50))))))
                    (EXIT |ms|)))) 

(SDEFUN |MSET;remove!;M2$;27| ((|p| |Mapping| (|Boolean|) S) (|ms| $) ($ $))
        (SPROG ((#1=#:G489 NIL) (|e| NIL) (|t| (|Table| S (|Integer|))))
               (SEQ (LETT |t| (QCDR |ms|))
                    (SEQ (LETT |e| NIL)
                         (LETT #1# (SPADCALL |t| (QREFELT $ 32))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |e| |p|)
                             (SEQ
                              (PROGN
                               (RPLACA |ms|
                                       (- (QCAR |ms|) (|MSET;elt| |t| |e| $)))
                               (QCAR |ms|))
                              (EXIT (SPADCALL |e| |t| (QREFELT $ 50))))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ms|)))) 

(SDEFUN |MSET;select!;M2$;28| ((|p| |Mapping| (|Boolean|) S) (|ms| $) ($ $))
        (SPADCALL (CONS #'|MSET;select!;M2$;28!0| |p|) |ms| (QREFELT $ 63))) 

(SDEFUN |MSET;select!;M2$;28!0| ((|s1| NIL) (|p| NIL))
        (NULL (SPADCALL |s1| |p|))) 

(SDEFUN |MSET;removeDuplicates!;2$;29| ((|ms| $) ($ $))
        (SPROG
         ((#1=#:G500 NIL) (|e| NIL) (|l| (|List| S))
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (QCDR |ms|)) (LETT |l| (SPADCALL |t| (QREFELT $ 32)))
              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |t| |e| 1 (QREFELT $ 17))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACA |ms| (LENGTH |l|)) (QCAR |ms|)) (EXIT |ms|)))) 

(SDEFUN |MSET;insert!;S$Nni$;30|
        ((|e| S) (|ms| $) (|more| |NonNegativeInteger|) ($ $))
        (SEQ (PROGN (RPLACA |ms| (+ (QCAR |ms|) |more|)) (QCAR |ms|))
             (SPADCALL (QCDR |ms|) |e|
                       (+ (|MSET;elt| (QCDR |ms|) |e| $) |more|)
                       (QREFELT $ 17))
             (EXIT |ms|))) 

(SDEFUN |MSET;map!;M2$;31| ((|f| |Mapping| S S) (|ms| $) ($ $))
        (SPROG
         ((#1=#:G509 NIL) (|e| NIL) (|t1| (|Table| S (|Integer|)))
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (QCDR |ms|)) (LETT |t1| (SPADCALL (QREFELT $ 11)))
              (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |t| (QREFELT $ 32))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL |t1| (SPADCALL |e| |f|) (|MSET;elt| |t| |e| $)
                              (QREFELT $ 17))
                    (EXIT (SPADCALL |e| |t| (QREFELT $ 50))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACD |ms| |t1|) (QCDR |ms|)) (EXIT |ms|)))) 

(SDEFUN |MSET;map;M2$;32| ((|f| |Mapping| S S) (|ms| $) ($ $))
        (SPADCALL |f| (SPADCALL |ms| (QREFELT $ 65)) (QREFELT $ 72))) 

(SDEFUN |MSET;parts;$L;33| ((|m| $) ($ |List| S))
        (SPROG
         ((|l| (|List| S)) (#1=#:G517 NIL) (|i| NIL) (#2=#:G516 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |l| NIL) (LETT |t| (QCDR |m|))
              (SEQ (LETT |e| NIL) (LETT #2# (SPADCALL |t| (QREFELT $ 32))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #1# (|MSET;elt| |t| |e| $)) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ (EXIT (LETT |l| (CONS |e| |l|))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |l|)))) 

(SDEFUN |MSET;union;3$;34| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((#1=#:G523 NIL) (|e| NIL) (#2=#:G522 NIL)
          (|t2| #3=(|Table| S (|Integer|))) (|t1| #3#)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 11))) (LETT |t1| (QCDR |m1|))
              (LETT |t2| (QCDR |m2|))
              (SEQ (LETT |e| NIL) (LETT #2# (SPADCALL |t1| (QREFELT $ 32)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |t| |e| (|MSET;elt| |t1| |e| $)
                               (QREFELT $ 17))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |t2| (QREFELT $ 32)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |t| |e|
                               (+ (|MSET;elt| |t2| |e| $)
                                  (|MSET;elt| |t| |e| $))
                               (QREFELT $ 17))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (+ (QCAR |m1|) (QCAR |m2|)) |t|))))) 

(SDEFUN |MSET;intersect;3$;35| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((|n| (|Integer|)) (|m| (|Integer|)) (#1=#:G529 NIL) (|e| NIL)
          (|t2| #2=(|Table| S (|Integer|))) (|t1| #2#)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 11))) (LETT |t1| (QCDR |m1|))
              (LETT |t2| (QCDR |m2|)) (LETT |n| 0)
              (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |t1| (QREFELT $ 32)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |m|
                          (MIN (|MSET;elt| |t1| |e| $)
                               (|MSET;elt| |t2| |e| $)))
                    (EXIT
                     (COND
                      ((SPADCALL |m| 0 (QREFELT $ 39))
                       (SEQ
                        (LETT |m|
                              (+ (|MSET;elt| |t1| |e| $)
                                 (|MSET;elt| |t2| |e| $)))
                        (SPADCALL |t| |e| |m| (QREFELT $ 17))
                        (EXIT (LETT |n| (+ |n| |m|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |n| |t|))))) 

(SDEFUN |MSET;difference;3$;36| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((|n| (|Integer|)) (|k2| #1=(|Integer|)) (|k1| #1#) (#2=#:G535 NIL)
          (|e| NIL) (|t2| #3=(|Table| S (|Integer|))) (|t1| #3#)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 11))) (LETT |t1| (QCDR |m1|))
              (LETT |t2| (QCDR |m2|)) (LETT |n| 0)
              (SEQ (LETT |e| NIL) (LETT #2# (SPADCALL |t1| (QREFELT $ 32)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |k1| (|MSET;elt| |t1| |e| $))
                        (LETT |k2| (|MSET;elt| |t2| |e| $))
                        (EXIT
                         (COND
                          ((SPADCALL |k1| 0 (QREFELT $ 39))
                           (COND
                            ((EQL |k2| 0)
                             (SEQ (SPADCALL |t| |e| |k1| (QREFELT $ 17))
                                  (EXIT (LETT |n| (+ |n| |k1|))))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 12)))
                     ('T (CONS |n| |t|))))))) 

(SDEFUN |MSET;symmetricDifference;3$;37| ((|m1| $) (|m2| $) ($ $))
        (SPADCALL (SPADCALL |m1| |m2| (QREFELT $ 76))
                  (SPADCALL |m2| |m1| (QREFELT $ 76)) (QREFELT $ 74))) 

(SDEFUN |MSET;=;2$B;38| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G545 NIL) (#2=#:G547 NIL) (#3=#:G549 NIL) (|e| NIL)
          (#4=#:G546 NIL) (#5=#:G548 NIL) (|t2| #6=(|Table| S (|Integer|)))
          (|t1| #6#))
         (SEQ
          (EXIT
           (COND ((SPADCALL (QCAR |m1|) (QCAR |m2|) (QREFELT $ 78)) NIL)
                 ('T
                  (SEQ (LETT |t1| (QCDR |m1|)) (LETT |t2| (QCDR |m2|))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL)
                              (LETT #5# (SPADCALL |t1| (QREFELT $ 32))) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |e| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 78))
                                  (PROGN
                                   (LETT #4#
                                         (PROGN (LETT #2# NIL) (GO #7=#:G544)))
                                   (GO #8=#:G539))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
                        #8# (EXIT #4#))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL)
                              (LETT #3# (SPADCALL |t2| (QREFELT $ 32))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 78))
                                  (PROGN
                                   (LETT #1# (PROGN (LETT #2# NIL) (GO #7#)))
                                   (GO #9=#:G541))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                        #9# (EXIT #1#))
                       (EXIT 'T)))))
          #7# (EXIT #2#)))) 

(SDEFUN |MSET;<;2$B;39| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G556 NIL) (#2=#:G557 NIL) (#3=#:G558 NIL) (|e| NIL)
          (|t2| #4=(|Table| S (|Integer|))) (|t1| #4#))
         (SEQ
          (EXIT
           (COND ((>= (QCAR |m1|) (QCAR |m2|)) NIL)
                 ('T
                  (SEQ (LETT |t1| (QCDR |m1|)) (LETT |t2| (QCDR |m2|))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL)
                              (LETT #3# (SPADCALL |t1| (QREFELT $ 32))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 39))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL) (GO #5=#:G555)))
                                   (GO #6=#:G552))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #1#))
                       (EXIT (< (QCAR |m1|) (QCAR |m2|)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |MSET;subset?;2$B;40| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G565 NIL) (#2=#:G566 NIL) (#3=#:G567 NIL) (|e| NIL)
          (|t2| #4=(|Table| S (|Integer|))) (|t1| #4#))
         (SEQ
          (EXIT
           (COND ((SPADCALL (QCAR |m1|) (QCAR |m2|) (QREFELT $ 39)) NIL)
                 ('T
                  (SEQ (LETT |t1| (QCDR |m1|)) (LETT |t2| (QCDR |m2|))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL)
                              (LETT #3# (SPADCALL |t1| (QREFELT $ 32))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 39))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL) (GO #5=#:G564)))
                                   (GO #6=#:G561))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #1#))
                       (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MSET;<=;2$B;41| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPADCALL |m1| |m2| (QREFELT $ 81))) 

(DECLAIM (NOTINLINE |Multiset;|)) 

(DEFUN |Multiset| (#1=#:G575)
  (SPROG NIL
         (PROG (#2=#:G576)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Multiset|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Multiset;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Multiset|)))))))))) 

(DEFUN |Multiset;| (|#1|)
  (SPROG ((#1=#:G574 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Multiset| DV$1))
          (LETT $ (GETREFV 90))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))))))
          (|haddProp| |$ConstructorCache| '|Multiset| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 16))
          (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)))
               (|augmentPredVector| $ 32))
          (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
               (|augmentPredVector| $ 64))
          (AND (|HasCategory| |#1| '(|BasicType|)) #1#
               (|augmentPredVector| $ 128))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |count| (|Integer|))
                              (|:| |table| (|Table| |#1| (|Integer|)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 31
                      (CONS (|dispatchFunction| |MSET;convert;$If;11|) $))))
          $))) 

(MAKEPROP '|Multiset| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| 16 '"failed") (|Table| 6 16) (0 . |search|)
              (6 . |table|) |MSET;empty;$;2| |MSET;multiset;$;3|
              |MSET;dictionary;$;4| |MSET;set;$;5| (|Integer|) (10 . |setelt!|)
              (|List| 6) |MSET;construct;L$;6| |MSET;multiset;L$;7|
              |MSET;dictionary;L$;8| |MSET;set;L$;9| |MSET;multiset;S$;10|
              (|Symbol|) (|InputForm|) (17 . |convert|) |MSET;parts;$L;33|
              (22 . |convert|) (|List| $) (27 . |convert|) (32 . |convert|)
              (37 . |keys|) |MSET;members;$L;12| (|String|) (|OutputForm|)
              (42 . |message|) (47 . |coerce|) (|Boolean|) (52 . >)
              (58 . |coerce|) (63 . |hconcat|) (68 . |brace|)
              |MSET;coerce;$Of;13| (|Record| (|:| |entry| 6) (|:| |count| 56))
              (|List| 44) |MSET;duplicates;$L;14| |MSET;empty?;$B;19|
              (|Record| (|:| |key| 6) (|:| |entry| 16)) (73 . |inspect|)
              (78 . |remove!|) |MSET;extract!;$S;15| |MSET;inspect;$S;16|
              |MSET;insert!;S2$;17| (84 . |member?|) |MSET;member?;S$B;18|
              (|NonNegativeInteger|) |MSET;#;$Nni;20| |MSET;count;S$Nni;21|
              |MSET;remove!;S2$;26| (90 . <=) |MSET;remove!;S$I$;22|
              (|Mapping| 38 6) |MSET;remove!;M2$;27| |MSET;remove!;M$I$;23|
              (96 . |copy|) |MSET;remove;S$I$;24| |MSET;remove;M$I$;25|
              |MSET;select!;M2$;28| |MSET;removeDuplicates!;2$;29|
              |MSET;insert!;S$Nni$;30| (|Mapping| 6 6) |MSET;map!;M2$;31|
              |MSET;map;M2$;32| |MSET;union;3$;34| |MSET;intersect;3$;35|
              |MSET;difference;3$;36| |MSET;symmetricDifference;3$;37|
              (101 . ~=) |MSET;=;2$B;38| |MSET;<;2$B;39| |MSET;subset?;2$B;40|
              |MSET;<=;2$B;41| (|Mapping| 6 6 6) (|Equation| 6) (|List| 84)
              (|Mapping| 38 6 6) (|SingleInteger|) (|HashState|)
              (|Union| 6 '"failed"))
           '#(~= 107 |union| 113 |symmetricDifference| 131 |subset?| 137
              |size?| 143 |set| 149 |select!| 158 |select| 164 |sample| 170
              |removeDuplicates!| 174 |removeDuplicates| 179 |remove!| 184
              |remove| 210 |reduce| 236 |parts| 257 |multiset| 262 |more?| 276
              |min| 282 |members| 287 |member?| 292 |max| 298 |map!| 309 |map|
              315 |less?| 321 |latex| 327 |intersect| 332 |inspect| 338
              |insert!| 343 |hashUpdate!| 356 |hash| 362 |find| 367 |extract!|
              373 |every?| 378 |eval| 384 |eq?| 410 |empty?| 416 |empty| 421
              |duplicates| 425 |difference| 430 |dictionary| 442 |count| 451
              |copy| 463 |convert| 468 |construct| 473 |coerce| 478 |any?| 483
              >= 489 > 495 = 501 <= 507 < 513 |#| 519)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(NIL NIL |DictionaryOperations&| |BagAggregate&|
                     |SetAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Aggregate&| |SetCategory&| |Evalable&| NIL NIL
                     |PartialOrder&| NIL |BasicType&| NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|MultisetAggregate| 6) (|MultiDictionary| 6)
                      (|DictionaryOperations| 6) (|BagAggregate| 6)
                      (|SetAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|SetCategory|)
                      (|Evalable| 6) (|Type|) (|finiteAggregate|)
                      (|PartialOrder|) (|CoercibleTo| 35) (|BasicType|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6)
                      (|ConvertibleTo| 25))
                   (|makeByteWordVec2| 89
                                       '(2 9 8 6 0 10 0 9 0 11 3 9 16 0 6 16 17
                                         1 25 0 24 26 1 18 25 0 28 1 25 0 29 30
                                         1 0 25 0 31 1 9 18 0 32 1 35 0 34 36 1
                                         6 35 0 37 2 16 38 0 0 39 1 16 35 0 40
                                         1 35 0 29 41 1 35 0 29 42 1 9 48 0 49
                                         2 9 8 6 0 50 2 18 38 6 0 54 2 16 38 0
                                         0 60 1 0 0 0 65 2 16 38 0 0 78 2 0 38
                                         0 0 1 2 0 0 0 0 74 2 0 0 6 0 1 2 0 0 0
                                         6 1 2 0 0 0 0 77 2 0 38 0 0 81 2 0 38
                                         0 56 1 0 0 0 15 1 0 0 18 22 2 6 0 62 0
                                         68 2 6 0 62 0 1 0 0 0 1 1 0 0 0 69 1 8
                                         0 0 1 2 8 0 6 0 59 2 6 0 62 0 63 3 0 0
                                         6 0 16 61 3 0 0 62 0 16 64 2 8 0 6 0 1
                                         2 6 0 62 0 1 3 0 0 6 0 16 66 3 0 0 62
                                         0 16 67 4 8 6 83 0 6 6 1 3 6 6 83 0 6
                                         1 2 6 6 83 0 1 1 6 18 0 27 1 0 0 6 23
                                         1 0 0 18 20 0 0 0 13 2 0 38 0 56 1 1 7
                                         6 0 1 1 6 18 0 33 2 8 38 6 0 55 1 7 6
                                         0 1 2 6 6 86 0 1 2 5 0 71 0 72 2 0 0
                                         71 0 73 2 0 38 0 56 1 1 0 34 0 1 2 0 0
                                         0 0 75 1 0 6 0 52 3 0 0 6 0 56 70 2 0
                                         0 6 0 53 2 0 88 88 0 1 1 0 87 0 1 2 0
                                         89 62 0 1 1 0 6 0 51 2 6 38 62 0 1 3 1
                                         0 0 18 18 1 2 1 0 0 84 1 3 1 0 0 6 6 1
                                         2 1 0 0 85 1 2 0 38 0 0 1 1 0 38 0 47
                                         0 0 0 12 1 0 45 0 46 2 0 0 0 6 1 2 0 0
                                         0 0 76 1 0 0 18 21 0 0 0 14 2 8 56 6 0
                                         58 2 6 56 62 0 1 1 0 0 0 65 1 2 25 0
                                         31 1 0 0 18 19 1 0 35 0 43 2 6 38 62 0
                                         1 2 0 38 0 0 1 2 0 38 0 0 1 2 0 38 0 0
                                         79 2 0 38 0 0 82 2 0 38 0 0 80 1 6 56
                                         0 57)))))
           '|lookupComplete|)) 
