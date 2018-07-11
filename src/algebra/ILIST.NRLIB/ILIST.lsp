
(PUT '|ILIST;#;$Nni;1| '|SPADreplace| 'LENGTH) 

(SDEFUN |ILIST;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (LENGTH |x|)) 

(PUT '|ILIST;concat;S2$;2| '|SPADreplace| 'CONS) 

(SDEFUN |ILIST;concat;S2$;2| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|ILIST;eq?;2$B;3| '|SPADreplace| 'EQ) 

(SDEFUN |ILIST;eq?;2$B;3| ((|x| $) (|y| $) ($ |Boolean|)) (EQ |x| |y|)) 

(PUT '|ILIST;first;$S;4| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |ILIST;first;$S;4| ((|x| $) ($ S)) (|SPADfirst| |x|)) 

(PUT '|ILIST;elt;$firstS;5| '|SPADreplace|
     '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(SDEFUN |ILIST;elt;$firstS;5| ((|x| $) (T3 "first") ($ S)) (|SPADfirst| |x|)) 

(PUT '|ILIST;empty;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |ILIST;empty;$;6| (($ $)) NIL) 

(PUT '|ILIST;empty?;$B;7| '|SPADreplace| 'NULL) 

(SDEFUN |ILIST;empty?;$B;7| ((|x| $) ($ |Boolean|)) (NULL |x|)) 

(PUT '|ILIST;rest;2$;8| '|SPADreplace| 'CDR) 

(SDEFUN |ILIST;rest;2$;8| ((|x| $) ($ $)) (CDR |x|)) 

(PUT '|ILIST;elt;$rest$;9| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(SDEFUN |ILIST;elt;$rest$;9| ((|x| $) (T4 "rest") ($ $)) (CDR |x|)) 

(SDEFUN |ILIST;setfirst!;$2S;10| ((|x| $) (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(PUT '|ILIST;qsetfirst!;$2S;11| '|SPADreplace| '|qset_first|) 

(SDEFUN |ILIST;qsetfirst!;$2S;11| ((|x| $) (|s| S) ($ S))
        (|qset_first| |x| |s|)) 

(SDEFUN |ILIST;setelt!;$first2S;12| ((|x| $) (T11 "first") (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(SDEFUN |ILIST;setrest!;3$;13| ((|x| $) (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(PUT '|ILIST;qsetrest!;3$;14| '|SPADreplace| '|qset_rest|) 

(SDEFUN |ILIST;qsetrest!;3$;14| ((|x| $) (|y| $) ($ $)) (|qset_rest| |x| |y|)) 

(SDEFUN |ILIST;setelt!;$rest2$;15| ((|x| $) (T12 "rest") (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(PUT '|ILIST;construct;L$;16| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |ILIST;construct;L$;16| ((|l| |List| S) ($ $)) |l|) 

(PUT '|ILIST;parts;$L;17| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |ILIST;parts;$L;17| ((|s| $) ($ |List| S)) |s|) 

(PUT '|ILIST;reverse!;2$;18| '|SPADreplace| 'NREVERSE) 

(SDEFUN |ILIST;reverse!;2$;18| ((|x| $) ($ $)) (NREVERSE |x|)) 

(PUT '|ILIST;reverse;2$;19| '|SPADreplace| 'REVERSE) 

(SDEFUN |ILIST;reverse;2$;19| ((|x| $) ($ $)) (REVERSE |x|)) 

(SDEFUN |ILIST;minIndex;$I;20| ((|x| $) ($ |Integer|)) (QREFELT $ 7)) 

(SDEFUN |ILIST;rest;$Nni$;21| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G1288 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                          (EXIT (LETT |x| (QCDR |x|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ILIST;copy;2$;22| ((|x| $) ($ $))
        (SPROG ((|y| ($)) (|i| NIL))
               (SEQ (LETT |y| NIL)
                    (SEQ (LETT |i| 0) G190
                         (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (COND
                           ((EQ |i| 1000)
                            (COND
                             ((SPADCALL |x| (QREFELT $ 35))
                              (|error| "cyclic list")))))
                          (LETT |y| (CONS (QCAR |x|) |y|))
                          (EXIT (LETT |x| (QCDR |x|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |y|))))) 

(SDEFUN |ILIST;leaves;$L;23| ((|x| $) ($ |List| S))
        (SPROG ((|i| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 17)) NIL)
                      ('T
                       (SEQ (LETT |i| 0) G190
                            (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                            (SEQ
                             (COND
                              ((EQ |i| 1000)
                               (COND
                                ((SPADCALL |x| (QREFELT $ 35))
                                 (EXIT (|error| "cyclic list"))))))
                             (EXIT
                              (COND
                               ((SPADCALL |x| (QREFELT $ 37))
                                (LIST (SPADCALL |x| (QREFELT $ 38))))
                               ('T (LETT |x| (QCDR |x|))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))))))) 

(SDEFUN |ILIST;coerce;$Of;24| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|z| (|List| (|OutputForm|))) (|y| (|List| (|OutputForm|)))
          (|s| ($)))
         (SEQ (LETT |y| NIL) (LETT |s| (SPADCALL |x| (QREFELT $ 40)))
              (SEQ G190 (COND ((NULL (NULL (EQ |x| |s|))) (GO G191)))
                   (SEQ
                    (LETT |y|
                          (CONS
                           (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                     (QREFELT $ 42))
                           |y|))
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 18)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |y| (NREVERSE |y|))
              (EXIT
               (COND ((NULL |s|) (SPADCALL |y| (QREFELT $ 44)))
                     ('T
                      (SEQ
                       (LETT |z|
                             (SPADCALL
                              (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                        (QREFELT $ 42))
                              (QREFELT $ 46)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (NULL (EQ |s| (SPADCALL |x| (QREFELT $ 18)))))
                              (GO G191)))
                            (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 18)))
                                 (EXIT
                                  (LETT |z|
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 13))
                                          (QREFELT $ 42))
                                         |z|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (NREVERSE |z|) (QREFELT $ 47))
                                    (QREFELT $ 48))
                                   (QREFELT $ 49))
                         (QREFELT $ 44)))))))))) 

(SDEFUN |ILIST;=;2$B;25| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G1321 NIL))
               (SEQ
                (EXIT
                 (COND ((EQ |x| |y|) 'T)
                       (#2='T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((NULL |x|) NIL)
                                       ('T (NULL (NULL |y|)))))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (QCAR |x|) (QCAR |y|)
                                            (QREFELT $ 51))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G1320)))
                                 ('T
                                  (SEQ (LETT |x| (QCDR |x|))
                                       (EXIT (LETT |y| (QCDR |y|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |ILIST;member?;S$B;26| ((|s| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G1327 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |s| (QCAR |x|) (QREFELT $ 53))
                           (PROGN (LETT #1# 'T) (GO #2=#:G1326)))
                          ('T (LETT |x| (QCDR |x|))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |ILIST;latex;$S;27| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "\\left[")
                    (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (LETT |s|
                                (STRCONC |s|
                                         (SPADCALL (QCAR |x|) (QREFELT $ 56))))
                          (LETT |x| (QCDR |x|))
                          (EXIT
                           (COND
                            ((NULL (NULL |x|))
                             (LETT |s| (STRCONC |s| ", "))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (STRCONC |s| " \\right]"))))) 

(SDEFUN |ILIST;hashUpdate!;Hs$Hs;28|
        ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SEQ
         (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
              (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 59)))
                   (EXIT (LETT |x| (QCDR |x|))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |s|))) 

(SDEFUN |ILIST;concat!;3$;29| ((|x| $) (|y| $) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND ((NULL |x|) |y|)
                      ('T
                       (SEQ (LETT |z| |x|)
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (NULL (QCDR |z|)))) (GO G191)))
                                 (SEQ (EXIT (LETT |z| (QCDR |z|)))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (|qset_rest| |z| |y|) (EXIT |x|))))))) 

(SDEFUN |ILIST;removeDuplicates!;2$;30| ((|l| $) ($ $))
        (SPROG ((|pp| ($)) (|pr| ($)) (|p| ($)) (|f| (S)))
               (SEQ (LETT |p| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                         (SEQ (LETT |pp| |p|) (LETT |f| (QCAR |p|))
                              (LETT |p| (QCDR |p|))
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (NULL (NULL (LETT |pr| (QCDR |pp|)))))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCAR |pr|) |f|
                                                  (QREFELT $ 53))
                                        (|qset_rest| |pp| (QCDR |pr|)))
                                       ('T (LETT |pp| |pr|)))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |ILIST;sort!;M2$;31| ((|f| |Mapping| (|Boolean|) S S) (|l| $) ($ $))
        (|ILIST;mergeSort| |f| |l| (SPADCALL |l| (QREFELT $ 9)) $)) 

(SDEFUN |ILIST;merge!;M3$;32|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|q| $) ($ $))
        (SPROG ((|t| ($)) (|r| ($)))
               (SEQ
                (COND ((NULL |p|) |q|) ((NULL |q|) |p|)
                      ((EQ |p| |q|)
                       (|error| "cannot merge a list into itself"))
                      (#1='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                          (SEQ (LETT |r| (LETT |t| |p|))
                               (EXIT (LETT |p| (QCDR |p|)))))
                         (#1#
                          (SEQ (LETT |r| (LETT |t| |q|))
                               (EXIT (LETT |q| (QCDR |q|))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p|) NIL) ('T (NULL (NULL |q|)))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                                 (SEQ (|qset_rest| |t| |p|) (LETT |t| |p|)
                                      (EXIT (LETT |p| (QCDR |p|)))))
                                ('T
                                 (SEQ (|qset_rest| |t| |q|) (LETT |t| |q|)
                                      (EXIT (LETT |q| (QCDR |q|))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (|qset_rest| |t| (COND ((NULL |p|) |q|) (#1# |p|)))
                        (EXIT |r|))))))) 

(SDEFUN |ILIST;split!;$Nni$;33| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|q| ($)) (#1=#:G1371 NIL))
               (SEQ
                (COND ((< |n| 1) (|error| "index out of range"))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL |p|
                                        (PROG1 (LETT #1# (- |n| 1))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 34)))
                        (LETT |q| (QCDR |p|)) (|qset_rest| |p| NIL)
                        (EXIT |q|))))))) 

(SDEFUN |ILIST;mergeSort|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|n| |Integer|) ($ $))
        (SPROG ((|q| ($)) (|l| (|NonNegativeInteger|)) (#1=#:G1375 NIL))
               (SEQ
                (COND
                 ((EQL |n| 2)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |p| (QREFELT $ 18)) (QREFELT $ 13))
                     (SPADCALL |p| (QREFELT $ 13)) |f|)
                    (LETT |p| (NREVERSE |p|))))))
                (EXIT
                 (COND ((< |n| 3) |p|)
                       ('T
                        (SEQ
                         (LETT |l|
                               (PROG1 (LETT #1# (QUOTIENT2 |n| 2))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         (LETT |q| (SPADCALL |p| |l| (QREFELT $ 66)))
                         (LETT |p| (|ILIST;mergeSort| |f| |p| |l| $))
                         (LETT |q| (|ILIST;mergeSort| |f| |q| (- |n| |l|) $))
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 65)))))))))) 

(DECLAIM (NOTINLINE |IndexedList;|)) 

(DEFUN |IndexedList| (&REST #1=#:G1398)
  (SPROG NIL
         (PROG (#2=#:G1399)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedList|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedList;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedList|)))))))))) 

(DEFUN |IndexedList;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1394 NIL) (#2=#:G1395 NIL) (#3=#:G1397 NIL) (#4=#:G1396 NIL)
    (|pv$| NIL) (#5=#:G1391 NIL) (#6=#:G1392 NIL) (#7=#:G1393 NIL) ($ NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|IndexedList| DV$1 DV$2))
    (LETT $ (GETREFV 80))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|IndexedList| (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 4096))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 8192))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| $ 16384))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 32768))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| $ 65536))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 131072))
    (AND (OR #2# (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 262144))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)))
         (|augmentPredVector| $ 524288))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 1048576))
    (AND #4# #1# (|augmentPredVector| $ 2097152))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 50 (CONS (|dispatchFunction| |ILIST;coerce;$Of;24|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 52 (CONS (|dispatchFunction| |ILIST;=;2$B;25|) $))
       (QSETREFV $ 54 (CONS (|dispatchFunction| |ILIST;member?;S$B;26|) $)))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 57 (CONS (|dispatchFunction| |ILIST;latex;$S;27|) $))
       (QSETREFV $ 60
                 (CONS (|dispatchFunction| |ILIST;hashUpdate!;Hs$Hs;28|) $)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 62
                (CONS (|dispatchFunction| |ILIST;removeDuplicates!;2$;30|)
                      $))))
    $))) 

(MAKEPROP '|IndexedList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |ILIST;#;$Nni;1| |ILIST;concat;S2$;2|
              (|Boolean|) |ILIST;eq?;2$B;3| |ILIST;first;$S;4| '"first"
              |ILIST;elt;$firstS;5| |ILIST;empty;$;6| |ILIST;empty?;$B;7|
              |ILIST;rest;2$;8| '"rest" |ILIST;elt;$rest$;9|
              |ILIST;setfirst!;$2S;10| |ILIST;qsetfirst!;$2S;11|
              |ILIST;setelt!;$first2S;12| |ILIST;setrest!;3$;13|
              |ILIST;qsetrest!;3$;14| |ILIST;setelt!;$rest2$;15| (|List| 6)
              |ILIST;construct;L$;16| |ILIST;parts;$L;17|
              |ILIST;reverse!;2$;18| |ILIST;reverse;2$;19| (|Integer|)
              |ILIST;minIndex;$I;20| |ILIST;rest;$Nni$;21| (0 . |cyclic?|)
              |ILIST;copy;2$;22| (5 . |leaf?|) (10 . |value|)
              |ILIST;leaves;$L;23| (15 . |cycleEntry|) (|OutputForm|)
              (20 . |coerce|) (|List| $) (25 . |bracket|) (|List| 41)
              (30 . |list|) (35 . |commaSeparate|) (40 . |overbar|)
              (45 . |concat!|) (51 . |coerce|) (56 . ~=) (62 . =) (68 . =)
              (74 . |member?|) (|String|) (80 . |latex|) (85 . |latex|)
              (|HashState|) (90 . |hashUpdate!|) (96 . |hashUpdate!|)
              |ILIST;concat!;3$;29| (102 . |removeDuplicates!|)
              (|Mapping| 11 6 6) |ILIST;sort!;M2$;31| |ILIST;merge!;M3$;32|
              |ILIST;split!;$Nni$;33| (|Mapping| 6 6 6) (|List| 69)
              (|Equation| 6) (|SingleInteger|) (|Mapping| 11 6) (|Void|)
              (|UniversalSegment| 32) '"last" '"value" (|Mapping| 6 6)
              (|InputForm|) (|List| 32) (|Union| 6 '"failed"))
           '#(~= 107 |value| 113 |trim| 118 |third| 124 |tail| 129 |swap!| 134
              |split!| 141 |sorted?| 147 |sort!| 158 |sort| 169 |smaller?| 180
              |size?| 186 |setvalue!| 192 |setrest!| 198 |setlast!| 204
              |setfirst!| 210 |setelt!| 216 |setchildren!| 258 |select!| 264
              |select| 270 |second| 276 |sample| 281 |rightTrim| 285 |reverse!|
              291 |reverse| 296 |rest| 301 |removeDuplicates!| 312
              |removeDuplicates| 317 |remove!| 322 |remove| 334 |reduce| 346
              |qsetrest!| 367 |qsetfirst!| 373 |qsetelt!| 379 |qelt| 386
              |possiblyInfinite?| 392 |position| 397 |parts| 416 |nodes| 421
              |node?| 426 |new| 432 |more?| 438 |minIndex| 444 |min| 449
              |merge!| 460 |merge| 473 |members| 486 |member?| 491 |maxIndex|
              497 |max| 502 |map!| 519 |map| 525 |list| 538 |less?| 543
              |leftTrim| 549 |leaves| 555 |leaf?| 560 |latex| 565 |last| 570
              |insert!| 581 |insert| 595 |indices| 609 |index?| 614
              |hashUpdate!| 620 |hash| 626 |first| 631 |find| 642 |fill!| 648
              |explicitlyFinite?| 654 |every?| 659 |eval| 665 |eq?| 691
              |entry?| 697 |entries| 703 |empty?| 708 |empty| 713 |elt| 717
              |distance| 760 |delete!| 766 |delete| 778 |cyclic?| 790
              |cycleTail| 795 |cycleSplit!| 800 |cycleLength| 805 |cycleEntry|
              810 |count| 815 |copyInto!| 827 |copy| 834 |convert| 839
              |construct| 844 |concat!| 849 |concat| 861 |coerce| 884
              |children| 889 |child?| 894 |any?| 900 >= 906 > 912 = 918 <= 924
              < 930 |#| 936)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 0 0 0 1 0 5 0 0 7 9 0 0 0 0 0 7 8
                                  11 1 2))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL NIL |InnerEvalable&| |BasicType&| NIL
                |PartialOrder&| NIL)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 32 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 32 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 73 $$) (|Type|)
                 (|Eltable| 32 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 41) (|PartialOrder|) (|ConvertibleTo| 77))
              (|makeByteWordVec2| 79
                                  '(1 0 11 0 35 1 0 11 0 37 1 0 6 0 38 1 0 0 0
                                    40 1 6 41 0 42 1 41 0 43 44 1 45 0 41 46 1
                                    41 0 43 47 1 41 0 0 48 2 45 0 0 41 49 1 0
                                    41 0 50 2 6 11 0 0 51 2 0 11 0 0 52 2 6 11
                                    0 0 53 2 0 11 6 0 54 1 6 55 0 56 1 0 55 0
                                    57 2 32 58 58 0 59 2 0 58 58 0 60 1 0 0 0
                                    62 2 19 11 0 0 1 1 0 6 0 38 2 18 0 0 6 1 1
                                    0 6 0 1 1 0 0 0 1 3 20 72 0 32 32 1 2 20 0
                                    0 8 66 1 14 11 0 1 2 13 11 63 0 1 1 21 0 0
                                    1 2 22 0 63 0 64 1 14 0 0 1 2 13 0 63 0 1 2
                                    17 11 0 0 1 2 0 11 0 8 1 2 20 6 0 6 1 2 20
                                    0 0 0 24 2 20 6 0 6 1 2 20 6 0 6 21 3 20 6
                                    0 32 6 1 3 20 6 0 73 6 1 3 20 6 0 74 6 1 3
                                    20 0 0 19 0 26 3 20 6 0 14 6 23 3 20 6 0 75
                                    6 1 2 20 0 0 43 1 2 0 0 71 0 1 2 13 0 71 0
                                    1 1 0 6 0 1 0 0 0 1 2 18 0 0 6 1 1 22 0 0
                                    30 1 13 0 0 31 2 0 0 0 8 34 1 0 0 0 18 1 3
                                    0 0 62 1 18 0 0 1 2 3 0 6 0 1 2 0 0 71 0 1
                                    2 18 0 6 0 1 2 13 0 71 0 1 4 18 6 67 0 6 6
                                    1 3 13 6 67 0 6 1 2 13 6 67 0 1 2 20 0 0 0
                                    25 2 20 6 0 6 22 3 20 6 0 32 6 1 2 0 6 0 32
                                    1 1 0 11 0 1 3 18 32 6 0 32 1 2 18 32 6 0 1
                                    2 13 32 71 0 1 1 13 27 0 29 1 0 43 0 1 2 3
                                    11 0 0 1 2 0 0 8 6 1 2 0 11 0 8 1 1 12 32 0
                                    33 2 14 0 0 0 1 1 14 6 0 1 2 1 0 0 0 1 3 0
                                    0 63 0 0 65 2 14 0 0 0 1 3 13 0 63 0 0 1 1
                                    13 27 0 1 2 18 11 6 0 54 1 12 32 0 1 2 14 0
                                    0 0 1 1 14 6 0 1 2 13 6 63 0 1 2 20 0 76 0
                                    1 3 0 0 67 0 0 1 2 0 0 76 0 1 1 0 0 6 1 2 0
                                    11 0 8 1 2 18 0 0 6 1 1 0 27 0 39 1 0 11 0
                                    37 1 16 55 0 57 2 0 0 0 8 1 1 0 6 0 1 3 0 0
                                    0 0 32 1 3 0 0 6 0 32 1 3 0 0 6 0 32 1 3 0
                                    0 0 0 32 1 1 0 78 0 1 2 0 11 32 0 1 2 16 58
                                    58 0 60 1 16 70 0 1 2 0 0 0 8 1 1 0 6 0 13
                                    2 0 79 71 0 1 2 20 0 0 6 1 1 0 11 0 1 2 13
                                    11 71 0 1 3 7 0 0 6 6 1 3 7 0 0 27 27 1 2 7
                                    0 0 68 1 2 7 0 0 69 1 2 0 11 0 0 12 2 18 11
                                    6 0 1 1 0 27 0 1 1 0 11 0 17 0 0 0 16 3 0 6
                                    0 32 6 1 2 0 6 0 32 1 2 0 0 0 73 1 2 0 6 0
                                    74 1 2 0 0 0 19 20 2 0 6 0 14 15 2 0 6 0 75
                                    1 2 0 32 0 0 1 2 0 0 0 32 1 2 0 0 0 73 1 2
                                    0 0 0 32 1 2 0 0 0 73 1 1 0 11 0 35 1 0 0 0
                                    1 1 20 0 0 1 1 0 8 0 1 1 0 0 0 40 2 18 8 6
                                    0 1 2 13 8 71 0 1 3 22 0 0 0 32 1 1 0 0 0
                                    36 1 2 77 0 1 1 0 0 27 28 2 0 0 0 6 1 2 0 0
                                    0 0 61 2 0 0 0 6 1 1 0 0 43 1 2 0 0 6 0 10
                                    2 0 0 0 0 1 1 15 41 0 50 1 0 43 0 1 2 3 11
                                    0 0 1 2 13 11 71 0 1 2 14 11 0 0 1 2 14 11
                                    0 0 1 2 19 11 0 0 52 2 14 11 0 0 1 2 14 11
                                    0 0 1 1 13 8 0 9)))))
           '|lookupComplete|)) 