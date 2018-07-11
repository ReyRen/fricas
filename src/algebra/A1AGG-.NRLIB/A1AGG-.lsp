
(SDEFUN |A1AGG-;parts;AL;1| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G423 NIL) (|i| NIL) (#2=#:G422 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 9)))
                      (LETT #1# (SPADCALL |x| (QREFELT $ 10))) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT $ 11)) #2#))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |A1AGG-;sort!;M2A;2| ((|f| |Mapping| (|Boolean|) S S) (|a| A) ($ A))
        (SPADCALL |f| |a| (QREFELT $ 16))) 

(SDEFUN |A1AGG-;any?;MAB;3|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Boolean|))
        (SPROG ((#1=#:G432 NIL) (#2=#:G433 NIL) (#3=#:G434 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                         (LETT #3# (SPADCALL |a| (QREFELT $ 10))) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G431)))
                              (GO #5=#:G428))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;every?;MAB;4|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Boolean|))
        (SPROG ((#1=#:G439 NIL) (#2=#:G440 NIL) (#3=#:G441 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                         (LETT #3# (SPADCALL |a| (QREFELT $ 10))) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G438)))
                              (GO #5=#:G436))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;position;MAI;5|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Integer|))
        (SPROG ((#1=#:G446 NIL) (#2=#:G447 NIL) (#3=#:G448 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                         (LETT #3# (SPADCALL |a| (QREFELT $ 10))) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# |i|) (GO #4=#:G445)))
                              (GO #5=#:G443))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (- (SPADCALL |a| (QREFELT $ 9)) 1))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;find;MAU;6|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Union| S "failed"))
        (SPROG ((#1=#:G459 NIL) (#2=#:G460 NIL) (#3=#:G461 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                         (LETT #3# (SPADCALL |a| (QREFELT $ 10))) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2#
                                           (CONS 0
                                                 (SPADCALL |a| |i|
                                                           (QREFELT $ 11))))
                                     (GO #4=#:G458)))
                              (GO #5=#:G453))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;count;MANni;7|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |NonNegativeInteger|))
        (SPROG ((|n| (|NonNegativeInteger|)) (#1=#:G466 NIL) (|i| NIL))
               (SEQ (LETT |n| 0)
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                         (LETT #1# (SPADCALL |a| (QREFELT $ 10))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                             (LETT |n| (+ |n| 1))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |A1AGG-;map!;M2A;8| ((|f| |Mapping| S S) (|a| A) ($ A))
        (SPROG ((#1=#:G471 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                     (LETT #1# (SPADCALL |a| (QREFELT $ 10))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |a| |i|
                                 (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                                           |f|)
                                 (QREFELT $ 27))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))) 

(SDEFUN |A1AGG-;setelt!;AUs2S;9|
        ((|a| A) (|s| |UniversalSegment| (|Integer|)) (|x| S) ($ S))
        (SPROG ((#1=#:G478 NIL) (|k| NIL) (|h| (|Integer|)) (|l| (|Integer|)))
               (SEQ (LETT |l| (SPADCALL |s| (QREFELT $ 31)))
                    (LETT |h|
                          (COND
                           ((SPADCALL |s| (QREFELT $ 32))
                            (SPADCALL |s| (QREFELT $ 33)))
                           ('T (SPADCALL |a| (QREFELT $ 10)))))
                    (COND
                     ((OR (< |l| (SPADCALL |a| (QREFELT $ 9)))
                          (SPADCALL |h| (SPADCALL |a| (QREFELT $ 10))
                                    (QREFELT $ 34)))
                      (EXIT (|error| "index out of range"))))
                    (SEQ (LETT |k| |l|) (LETT #1# |h|) G190
                         (COND ((> |k| #1#) (GO G191)))
                         (SEQ (EXIT (SPADCALL |a| |k| |x| (QREFELT $ 27))))
                         (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |A1AGG-;reduce;MAS;10| ((|f| |Mapping| S S S) (|a| A) ($ S))
        (SPROG ((|r| (S)) (#1=#:G484 NIL) (|k| NIL) (|m| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |a| (QREFELT $ 36))
                  (|error| "cannot reduce an empty aggregate"))
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL |a| (LETT |m| (SPADCALL |a| (QREFELT $ 9)))
                                   (QREFELT $ 11)))
                   (SEQ (LETT |k| (+ |m| 1))
                        (LETT #1# (SPADCALL |a| (QREFELT $ 10))) G190
                        (COND ((> |k| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |r|
                                (SPADCALL |r| (SPADCALL |a| |k| (QREFELT $ 11))
                                          |f|))))
                        (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT |r|))))))) 

(SDEFUN |A1AGG-;reduce;MA2S;11|
        ((|f| |Mapping| S S S) (|a| A) (|identity| S) ($ S))
        (SPROG ((#1=#:G488 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| (SPADCALL |a| (QREFELT $ 9)))
                     (LETT #1# (SPADCALL |a| (QREFELT $ 10))) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |identity|
                             (SPADCALL |identity|
                                       (SPADCALL |a| |k| (QREFELT $ 11))
                                       |f|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |identity|)))) 

(SDEFUN |A1AGG-;reduce;MA3S;12|
        ((|f| |Mapping| S S S) (|a| A) (|identity| S) (|absorber| S) ($ S))
        (SPROG ((#1=#:G492 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| (SPADCALL |a| (QREFELT $ 9)))
                     (LETT #1# (SPADCALL |a| (QREFELT $ 10))) G190
                     (COND
                      ((OR (> |k| #1#)
                           (NULL
                            (SPADCALL |identity| |absorber| (QREFELT $ 40))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |identity|
                             (SPADCALL |identity|
                                       (SPADCALL |a| |k| (QREFELT $ 11))
                                       |f|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |identity|)))) 

(SDEFUN |A1AGG-;stupidnew| ((|n| |NonNegativeInteger|) (|a| A) (|b| A) ($ A))
        (COND ((ZEROP |n|) (SPADCALL (QREFELT $ 42)))
              (#1='T
               (SPADCALL |n|
                         (COND
                          ((SPADCALL |a| (QREFELT $ 36))
                           (SPADCALL |b| (SPADCALL |b| (QREFELT $ 9))
                                     (QREFELT $ 11)))
                          (#1#
                           (SPADCALL |a| (SPADCALL |a| (QREFELT $ 9))
                                     (QREFELT $ 11))))
                         (QREFELT $ 43))))) 

(SDEFUN |A1AGG-;stupidget| ((|l| |List| A) ($ S))
        (SPROG ((#1=#:G500 NIL) (#2=#:G501 NIL) (#3=#:G502 NIL) (|a| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |a| NIL) (LETT #3# |l|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |a| (QREFELT $ 36)))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (SPADCALL |a| (QREFELT $ 44)))
                                     (GO #4=#:G499)))
                              (GO #5=#:G497))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (|error| "Should not happen"))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;map;M3A;15| ((|f| |Mapping| S S S) (|a| A) (|b| A) ($ A))
        (SPROG
         ((|i| NIL) (#1=#:G511 NIL) (|j| NIL) (|c| (A))
          (|l| (|NonNegativeInteger|)) (#2=#:G507 NIL) (|n| (|Integer|))
          (|m| (|Integer|)))
         (SEQ
          (LETT |m|
                (MAX (SPADCALL |a| (QREFELT $ 9))
                     (SPADCALL |b| (QREFELT $ 9))))
          (LETT |n|
                (MIN (SPADCALL |a| (QREFELT $ 10))
                     (SPADCALL |b| (QREFELT $ 10))))
          (LETT |l|
                (PROG1 (LETT #2# (MAX 0 (+ (- |n| |m|) 1)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |c| (|A1AGG-;stupidnew| |l| |a| |b| $))
          (SEQ (LETT |j| |m|) (LETT #1# |n|)
               (LETT |i| (SPADCALL |c| (QREFELT $ 9))) G190
               (COND ((> |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |c| |i|
                           (SPADCALL (SPADCALL |a| |j| (QREFELT $ 11))
                                     (SPADCALL |b| |j| (QREFELT $ 11)) |f|)
                           (QREFELT $ 27))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |c|)))) 

(SDEFUN |A1AGG-;merge;M3A;16|
        ((|f| |Mapping| (|Boolean|) S S) (|a| A) (|b| A) ($ A))
        (SPROG
         ((|k| NIL) (#1=#:G521 NIL) (|j| #2=(|Integer|)) (#3=#:G520 NIL)
          (|i| #2#) (|n| #4=(|Integer|)) (|m| #4#) (|r| (A)))
         (SEQ
          (LETT |r|
                (|A1AGG-;stupidnew|
                 (+ (SPADCALL |a| (QREFELT $ 48))
                    (SPADCALL |b| (QREFELT $ 48)))
                 |a| |b| $))
          (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
          (LETT |m| (SPADCALL |a| (QREFELT $ 10)))
          (LETT |j| (SPADCALL |b| (QREFELT $ 9)))
          (LETT |n| (SPADCALL |b| (QREFELT $ 10)))
          (SEQ (LETT |k| (SPADCALL |r| (QREFELT $ 9))) G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 49))
                    (SPADCALL |j| |n| (QREFELT $ 49)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                             (SPADCALL |b| |j| (QREFELT $ 11)) |f|)
                   (SEQ
                    (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 11))
                              (QREFELT $ 27))
                    (EXIT (LETT |i| (+ |i| 1)))))
                  ('T
                   (SEQ
                    (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT $ 11))
                              (QREFELT $ 27))
                    (EXIT (LETT |j| (+ |j| 1))))))))
               (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| |i|) (LETT #3# |m|) (LETT |k| |k|) G190
               (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 50))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (SEQ (LETT |j| |j|) (LETT #1# |n|) (LETT |k| |k|) G190
               (COND ((> |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT $ 50))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |A1AGG-;elt;AUsA;17|
        ((|a| A) (|s| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((|k| NIL) (#1=#:G531 NIL) (|i| NIL) (|r| (A)) (#2=#:G527 NIL)
          (|h| (|Integer|)) (|l| (|Integer|)))
         (SEQ (LETT |l| (SPADCALL |s| (QREFELT $ 31)))
              (LETT |h|
                    (COND
                     ((SPADCALL |s| (QREFELT $ 32))
                      (SPADCALL |s| (QREFELT $ 33)))
                     ('T (SPADCALL |a| (QREFELT $ 10)))))
              (COND
               ((OR (< |l| (SPADCALL |a| (QREFELT $ 9)))
                    (SPADCALL |h| (SPADCALL |a| (QREFELT $ 10))
                              (QREFELT $ 34)))
                (EXIT (|error| "index out of range"))))
              (LETT |r|
                    (|A1AGG-;stupidnew|
                     (PROG1 (LETT #2# (MAX 0 (+ (- |h| |l|) 1)))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     |a| |a| $))
              (SEQ (LETT |i| |l|) (LETT #1# |h|)
                   (LETT |k| (SPADCALL |r| (QREFELT $ 9))) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 11))
                               (QREFELT $ 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |A1AGG-;insert;2AIA;18| ((|a| A) (|b| A) (|i| |Integer|) ($ A))
        (SPROG
         ((|k| NIL) (#1=#:G539 NIL) (|j| NIL) (#2=#:G538 NIL) (#3=#:G537 NIL)
          (|y| (A)) (|n| (|Integer|)) (|m| (|Integer|)))
         (SEQ (LETT |m| (SPADCALL |b| (QREFELT $ 9)))
              (LETT |n| (SPADCALL |b| (QREFELT $ 10)))
              (COND
               ((OR (< |i| |m|) (SPADCALL |i| |n| (QREFELT $ 34)))
                (EXIT (|error| "index out of range"))))
              (LETT |y|
                    (|A1AGG-;stupidnew|
                     (+ (SPADCALL |a| (QREFELT $ 48))
                        (SPADCALL |b| (QREFELT $ 48)))
                     |a| |b| $))
              (SEQ (LETT |j| |m|) (LETT #3# (- |i| 1))
                   (LETT |k| (SPADCALL |y| (QREFELT $ 9))) G190
                   (COND ((> |j| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |y| |k| (SPADCALL |b| |j| (QREFELT $ 11))
                               (QREFELT $ 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (SEQ (LETT |j| (SPADCALL |a| (QREFELT $ 9)))
                   (LETT #2# (SPADCALL |a| (QREFELT $ 10))) (LETT |k| |k|) G190
                   (COND ((> |j| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |y| |k| (SPADCALL |a| |j| (QREFELT $ 11))
                               (QREFELT $ 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (SEQ (LETT |j| |i|) (LETT #1# |n|) (LETT |k| |k|) G190
                   (COND ((> |j| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |y| |k| (SPADCALL |b| |j| (QREFELT $ 11))
                               (QREFELT $ 27))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |A1AGG-;copy;2A;19| ((|x| A) ($ A))
        (SPROG ((#1=#:G543 NIL) (|i| NIL) (|j| NIL) (|y| (A)))
               (SEQ
                (LETT |y|
                      (|A1AGG-;stupidnew| (SPADCALL |x| (QREFELT $ 48)) |x| |x|
                       $))
                (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 9)))
                     (LETT |i| (SPADCALL |x| (QREFELT $ 9)))
                     (LETT #1# (SPADCALL |x| (QREFELT $ 10))) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |y| |j| (SPADCALL |x| |i| (QREFELT $ 11))
                                 (QREFELT $ 27))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |y|)))) 

(SDEFUN |A1AGG-;copyInto!;2AIA;20| ((|y| A) (|x| A) (|s| |Integer|) ($ A))
        (SPROG ((#1=#:G549 NIL) (|i| NIL) (|j| NIL))
               (SEQ
                (COND
                 ((OR (< |s| (SPADCALL |y| (QREFELT $ 9)))
                      (SPADCALL (+ |s| (SPADCALL |x| (QREFELT $ 48)))
                                (+ (SPADCALL |y| (QREFELT $ 10)) 1)
                                (QREFELT $ 34)))
                  (|error| "index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |j| |s|) (LETT |i| (SPADCALL |x| (QREFELT $ 9)))
                        (LETT #1# (SPADCALL |x| (QREFELT $ 10))) G190
                        (COND ((> |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |y| |j| (SPADCALL |x| |i| (QREFELT $ 11))
                                    (QREFELT $ 27))))
                        (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |y|))))))) 

(SDEFUN |A1AGG-;construct;LA;21| ((|l| |List| S) ($ A))
        (SPROG ((|i| NIL) (#1=#:G554 NIL) (|x| NIL) (|a| (A)))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT $ 42)))
                      ('T
                       (SEQ
                        (LETT |a|
                              (SPADCALL (LENGTH |l|) (|SPADfirst| |l|)
                                        (QREFELT $ 43)))
                        (SEQ (LETT |x| NIL) (LETT #1# |l|)
                             (LETT |i| (SPADCALL |a| (QREFELT $ 9))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 27))))
                             (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT |a|))))))) 

(SDEFUN |A1AGG-;delete;AUsA;22|
        ((|a| A) (|s| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((|k| NIL) (#1=#:G565 NIL) (|i| NIL) (#2=#:G564 NIL) (|r| (A))
          (#3=#:G558 NIL) (|h| (|Integer|)) (|l| (|Integer|)))
         (SEQ (LETT |l| (SPADCALL |s| (QREFELT $ 31)))
              (LETT |h|
                    (COND
                     ((SPADCALL |s| (QREFELT $ 32))
                      (SPADCALL |s| (QREFELT $ 33)))
                     (#4='T (SPADCALL |a| (QREFELT $ 10)))))
              (COND
               ((OR (< |l| (SPADCALL |a| (QREFELT $ 9)))
                    (SPADCALL |h| (SPADCALL |a| (QREFELT $ 10))
                              (QREFELT $ 34)))
                (EXIT (|error| "index out of range"))))
              (EXIT
               (COND ((< |h| |l|) (SPADCALL |a| (QREFELT $ 57)))
                     (#4#
                      (SEQ
                       (LETT |r|
                             (|A1AGG-;stupidnew|
                              (PROG1
                                  (LETT #3#
                                        (-
                                         (+
                                          (- (SPADCALL |a| (QREFELT $ 48)) |h|)
                                          |l|)
                                         1))
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              |a| |a| $))
                       (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                            (LETT #2# (- |l| 1))
                            (LETT |k| (SPADCALL |r| (QREFELT $ 9))) G190
                            (COND ((> |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |r| |k|
                                        (SPADCALL |a| |i| (QREFELT $ 11))
                                        (QREFELT $ 27))))
                            (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1))))
                            (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |i| (+ |h| 1))
                            (LETT #1# (SPADCALL |a| (QREFELT $ 10)))
                            (LETT |k| |k|) G190 (COND ((> |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |r| |k|
                                        (SPADCALL |a| |i| (QREFELT $ 11))
                                        (QREFELT $ 27))))
                            (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |r|)))))))) 

(SDEFUN |A1AGG-;delete;AIA;23| ((|x| A) (|i| |Integer|) ($ A))
        (SPROG
         ((#1=#:G574 NIL) (|j| NIL) (#2=#:G573 NIL) (|y| (A)) (#3=#:G568 NIL))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |x| (QREFELT $ 9)))
                (SPADCALL |i| (SPADCALL |x| (QREFELT $ 10)) (QREFELT $ 34)))
            (|error| "index out of range"))
           ('T
            (SEQ
             (LETT |y|
                   (|A1AGG-;stupidnew|
                    (PROG1 (LETT #3# (- (SPADCALL |x| (QREFELT $ 48)) 1))
                      (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #3#))
                    |x| |x| $))
             (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 9))) (LETT #2# (- |i| 1))
                  (LETT |i| (SPADCALL |y| (QREFELT $ 9))) G190
                  (COND ((> |j| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| (SPADCALL |x| |j| (QREFELT $ 11))
                              (QREFELT $ 27))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (SEQ (LETT |j| (+ |i| 1)) (LETT #1# (SPADCALL |x| (QREFELT $ 10)))
                  (LETT |i| |i|) G190 (COND ((> |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| (SPADCALL |x| |j| (QREFELT $ 11))
                              (QREFELT $ 27))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |A1AGG-;reverse!;2A;24| ((|x| A) ($ A))
        (SPROG ((#1=#:G578 NIL) (|i| NIL) (|n| (|Integer|)) (|m| (|Integer|)))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 9)))
                    (LETT |n| (SPADCALL |x| (QREFELT $ 10)))
                    (SEQ (LETT |i| 0) (LETT #1# (QUOTIENT2 (- |n| |m|) 2)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |x| (+ |m| |i|) (- |n| |i|)
                                     (QREFELT $ 61))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |A1AGG-;concat;LA;25| ((|l| |List| A) ($ A))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G589 NIL) (|a| NIL) (|r| (A))
          (|n| #2=(|NonNegativeInteger|)) (#3=#:G580 NIL) (#4=#:G579 #2#)
          (#5=#:G581 #2#) (#6=#:G588 NIL))
         (SEQ
          (COND ((NULL |l|) (SPADCALL (QREFELT $ 42)))
                (#7='T
                 (SEQ
                  (LETT |n|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |a| (CAR #6#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |a| (QREFELT $ 48)))
                                 (COND (#3# (LETT #4# (+ #4# #5#)))
                                       ('T
                                        (PROGN
                                         (LETT #4# #5#)
                                         (LETT #3# 'T)))))))
                              (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                         (COND (#3# #4#) (#7# 0))))
                  (EXIT
                   (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 42)))
                         (#7#
                          (SEQ
                           (LETT |i|
                                 (SPADCALL
                                  (LETT |r|
                                        (SPADCALL |n|
                                                  (|A1AGG-;stupidget| |l| $)
                                                  (QREFELT $ 43)))
                                  (QREFELT $ 9)))
                           (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (SPADCALL |r| |a| |i| (QREFELT $ 63))
                                     (EXIT
                                      (LETT |i|
                                            (+ |i|
                                               (SPADCALL |a|
                                                         (QREFELT $ 48))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |r|))))))))))) 

(SDEFUN |A1AGG-;sorted?;MAB;26|
        ((|f| |Mapping| (|Boolean|) S S) (|a| A) ($ |Boolean|))
        (SPROG ((#1=#:G594 NIL) (#2=#:G595 NIL) (#3=#:G596 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                         (LETT #3# (- (SPADCALL |a| (QREFELT $ 10)) 1)) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                                        (SPADCALL |a| (+ |i| 1) (QREFELT $ 11))
                                        |f|))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G593)))
                              (GO #5=#:G591))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;concat;3A;27| ((|x| A) (|y| A) ($ A))
        (SPROG ((|i| (|Integer|)) (|z| (A)))
               (SEQ
                (LETT |z|
                      (|A1AGG-;stupidnew|
                       (+ (SPADCALL |x| (QREFELT $ 48))
                          (SPADCALL |y| (QREFELT $ 48)))
                       |x| |y| $))
                (SPADCALL |z| |x| (LETT |i| (SPADCALL |z| (QREFELT $ 9)))
                          (QREFELT $ 63))
                (SPADCALL |z| |y| (+ |i| (SPADCALL |x| (QREFELT $ 48)))
                          (QREFELT $ 63))
                (EXIT |z|)))) 

(SDEFUN |A1AGG-;coerce;AOf;28| ((|r| A) ($ |OutputForm|))
        (SPROG ((#1=#:G602 NIL) (|k| NIL) (#2=#:G601 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |k| (SPADCALL |r| (QREFELT $ 9)))
                       (LETT #1# (SPADCALL |r| (QREFELT $ 10))) G190
                       (COND ((> |k| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |r| |k| (QREFELT $ 11))
                                          (QREFELT $ 69))
                                #2#))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 70))))) 

(SDEFUN |A1AGG-;=;2AB;29| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G608 NIL) (#2=#:G609 NIL) (#3=#:G610 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 48))
                             (SPADCALL |y| (QREFELT $ 48)) (QREFELT $ 72))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 9)))
                           (LETT #3# (SPADCALL |x| (QREFELT $ 10))) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| (QREFELT $ 11))
                                          (SPADCALL |y| |i| (QREFELT $ 11))
                                          (QREFELT $ 73)))
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# NIL) (GO #4=#:G607)))
                                (GO #5=#:G604))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #1#))
                    (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;position;SA2I;30|
        ((|x| S) (|t| A) (|s| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G616 NIL) (#2=#:G617 NIL) (#3=#:G618 NIL) (|k| NIL)
          (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |t| (QREFELT $ 10)))
                (COND
                 ((OR (< |s| (SPADCALL |t| (QREFELT $ 9)))
                      (SPADCALL |s| |n| (QREFELT $ 34)))
                  (EXIT (|error| "index out of range"))))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| |s|) (LETT #3# |n|) G190
                       (COND ((> |k| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 11)) |x|
                                     (QREFELT $ 73))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# |k|) (GO #4=#:G615)))
                            (GO #5=#:G613))))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT (- (SPADCALL |t| (QREFELT $ 9)) 1))))
          #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;<;2AB;31| ((|a| A) (|b| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G623 NIL) (#2=#:G624 NIL) (#3=#:G625 NIL) (|i| NIL)
          (#4=#:G626 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |j| (SPADCALL |b| (QREFELT $ 9)))
                   (LETT #4# (SPADCALL |b| (QREFELT $ 10)))
                   (LETT |i| (SPADCALL |a| (QREFELT $ 9)))
                   (LETT #3# (SPADCALL |a| (QREFELT $ 10))) G190
                   (COND ((OR (> |i| #3#) (> |j| #4#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                                 (SPADCALL |b| |j| (QREFELT $ 11))
                                 (QREFELT $ 40))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL |a| |i| (QREFELT $ 50))
                                      (SPADCALL |b| |j| (QREFELT $ 50))
                                      (QREFELT $ 76)))
                               (GO #5=#:G622)))
                        (GO #6=#:G620))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT
             (< (SPADCALL |a| (QREFELT $ 48)) (SPADCALL |b| (QREFELT $ 48))))))
          #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |OneDimensionalArrayAggregate&;|)) 

(DEFUN |OneDimensionalArrayAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|OneDimensionalArrayAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 78))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|BasicType|))
            (QSETREFV $ 41
                      (CONS (|dispatchFunction| |A1AGG-;reduce;MA3S;12|) $))))
          (COND
           ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
            (QSETREFV $ 71
                      (CONS (|dispatchFunction| |A1AGG-;coerce;AOf;28|) $))))
          (COND
           ((|HasCategory| |#2| '(|BasicType|))
            (PROGN
             (QSETREFV $ 74 (CONS (|dispatchFunction| |A1AGG-;=;2AB;29|) $))
             (QSETREFV $ 75
                       (CONS (|dispatchFunction| |A1AGG-;position;SA2I;30|)
                             $)))))
          (COND
           ((|HasCategory| |#2| '(|OrderedSet|))
            (QSETREFV $ 77 (CONS (|dispatchFunction| |A1AGG-;<;2AB;31|) $))))
          $))) 

(MAKEPROP '|OneDimensionalArrayAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (10 . |qelt|) (|List| 7)
              |A1AGG-;parts;AL;1| (|Mapping| 18 7 7)
              (|FiniteLinearAggregateSort| 7 6) (16 . |quickSort|)
              |A1AGG-;sort!;M2A;2| (|Boolean|) (|Mapping| 18 7)
              |A1AGG-;any?;MAB;3| |A1AGG-;every?;MAB;4| |A1AGG-;position;MAI;5|
              (|Union| 7 '#1="failed") |A1AGG-;find;MAU;6|
              (|NonNegativeInteger|) |A1AGG-;count;MANni;7| (22 . |qsetelt!|)
              (|Mapping| 7 7) |A1AGG-;map!;M2A;8| (|UniversalSegment| 8)
              (29 . |low|) (34 . |hasHi|) (39 . |high|) (44 . >)
              |A1AGG-;setelt!;AUs2S;9| (50 . |empty?|) (|Mapping| 7 7 7)
              |A1AGG-;reduce;MAS;10| |A1AGG-;reduce;MA2S;11| (55 . ~=)
              (61 . |reduce|) (69 . |empty|) (73 . |new|) (79 . |first|)
              (84 . |Zero|) (88 . |Zero|) |A1AGG-;map;M3A;15| (92 . |#|)
              (97 . <=) (103 . |elt|) |A1AGG-;merge;M3A;16|
              |A1AGG-;elt;AUsA;17| |A1AGG-;insert;2AIA;18| |A1AGG-;copy;2A;19|
              |A1AGG-;copyInto!;2AIA;20| |A1AGG-;construct;LA;21|
              (109 . |copy|) |A1AGG-;delete;AUsA;22| |A1AGG-;delete;AIA;23|
              (|Void|) (114 . |swap!|) |A1AGG-;reverse!;2A;24|
              (121 . |copyInto!|) (|List| $) |A1AGG-;concat;LA;25|
              |A1AGG-;sorted?;MAB;26| |A1AGG-;concat;3A;27| (|OutputForm|)
              (128 . |coerce|) (133 . |bracket|) (138 . |coerce|) (143 . ~=)
              (149 . =) (155 . =) (161 . |position|) (168 . <) (174 . <))
           '#(|sorted?| 180 |sort!| 186 |setelt!| 192 |reverse!| 199 |reduce|
              204 |position| 225 |parts| 238 |merge| 243 |map!| 250 |map| 256
              |insert| 263 |find| 270 |every?| 276 |elt| 282 |delete| 288
              |count| 300 |copyInto!| 306 |copy| 313 |construct| 318 |concat|
              323 |coerce| 334 |any?| 339 = 345 < 351)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((= ((|Boolean|) |#1| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((< ((|Boolean|) |#1| |#1|)) T)
                                   '((|sort!| (|#1| |#1|)) T)
                                   '((|sort!|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1|))
                                     T)
                                   '((|reverse!| (|#1| |#1|)) T)
                                   '((|copyInto!| (|#1| |#1| |#1| (|Integer|)))
                                     T)
                                   '((|sorted?| ((|Boolean|) |#1|)) T)
                                   '((|merge| (|#1| |#1| |#1|)) T)
                                   '((|position|
                                      ((|Integer|) |#2| |#1| (|Integer|)))
                                     T)
                                   '((|position| ((|Integer|) |#2| |#1|)) T)
                                   '((|position|
                                      ((|Integer|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|sorted?|
                                      ((|Boolean|)
                                       (|Mapping| (|Boolean|) |#2| |#2|) |#1|))
                                     T)
                                   '((|merge|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1| |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#2| |#1|
                                       (|UniversalSegment| (|Integer|)) |#2|))
                                     T)
                                   '((|insert| (|#1| |#1| |#1| (|Integer|))) T)
                                   '((|insert| (|#1| |#2| |#1| (|Integer|))) T)
                                   '((|delete|
                                      (|#1| |#1|
                                       (|UniversalSegment| (|Integer|))))
                                     T)
                                   '((|delete| (|#1| |#1| (|Integer|))) T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1|))
                                     T)
                                   '((|concat| (|#1| (|List| |#1|))) T)
                                   '((|concat| (|#1| |#1| |#1|)) T)
                                   '((|concat| (|#1| |#2| |#1|)) T)
                                   '((|concat| (|#1| |#1| |#2|)) T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|UniversalSegment| (|Integer|))))
                                     T)
                                   '((|construct| (|#1| (|List| |#2|))) T)
                                   '((|find|
                                      ((|Union| |#2| #1#)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#2|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#2| |#2|))
                                     T)
                                   '((|elt| (|#2| |#1| (|Integer|))) T)
                                   '((|elt| (|#2| |#1| (|Integer|) |#2|)) T)
                                   '((|setelt!| (|#2| |#1| (|Integer|) |#2|))
                                     T)
                                   '((|count|
                                      ((|NonNegativeInteger|) |#2| |#1|))
                                     T)
                                   '((|parts| ((|List| |#2|) |#1|)) T)
                                   '((|count|
                                      ((|NonNegativeInteger|)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|every?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|any?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|map!| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|copy| (|#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 77
                                            '(1 6 8 0 9 1 6 8 0 10 2 6 7 0 8 11
                                              2 15 6 14 6 16 3 6 7 0 8 7 27 1
                                              30 8 0 31 1 30 18 0 32 1 30 8 0
                                              33 2 8 18 0 0 34 1 6 18 0 36 2 7
                                              18 0 0 40 4 0 7 37 0 7 7 41 0 6 0
                                              42 2 6 0 25 7 43 1 6 7 0 44 0 25
                                              0 45 0 8 0 46 1 6 25 0 48 2 8 18
                                              0 0 49 2 6 7 0 8 50 1 6 0 0 57 3
                                              6 60 0 8 8 61 3 6 0 0 0 8 63 1 7
                                              68 0 69 1 68 0 64 70 1 0 68 0 71
                                              2 8 18 0 0 72 2 7 18 0 0 73 2 0
                                              18 0 0 74 3 0 8 7 0 8 75 2 7 18 0
                                              0 76 2 0 18 0 0 77 2 0 18 14 0 66
                                              2 0 0 14 0 17 3 0 7 0 30 7 35 1 0
                                              0 0 62 2 0 7 37 0 38 4 0 7 37 0 7
                                              7 41 3 0 7 37 0 7 39 3 0 8 7 0 8
                                              75 2 0 8 19 0 22 1 0 12 0 13 3 0
                                              0 14 0 0 51 2 0 0 28 0 29 3 0 0
                                              37 0 0 47 3 0 0 0 0 8 53 2 0 23
                                              19 0 24 2 0 18 19 0 21 2 0 0 0 30
                                              52 2 0 0 0 30 58 2 0 0 0 8 59 2 0
                                              25 19 0 26 3 0 0 0 0 8 55 1 0 0 0
                                              54 1 0 0 12 56 2 0 0 0 0 67 1 0 0
                                              64 65 1 0 68 0 71 2 0 18 19 0 20
                                              2 0 18 0 0 74 2 0 18 0 0 77)))))
           '|lookupComplete|)) 