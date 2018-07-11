
(PUT '|TREE;empty?;$B;1| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 1))) 

(SDEFUN |TREE;empty?;$B;1| ((|t| $) ($ |Boolean|)) (QEQCAR |t| 1)) 

(PUT '|TREE;empty;$;2| '|SPADreplace| '(XLAM NIL (CONS 1 "empty"))) 

(SDEFUN |TREE;empty;$;2| (($ $)) (CONS 1 "empty")) 

(SDEFUN |TREE;children;$L;3| ((|t| $) ($ |List| $))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the children of an empty tree"))
         ('T (QCDR (CDR |t|))))) 

(SDEFUN |TREE;setchildren!;$L$;4| ((|t| $) (|lt| |List| $) ($ $))
        (SEQ
         (COND
          ((QEQCAR |t| 1) (|error| "cannot set children of an empty tree"))
          ('T (SEQ (PROGN (RPLACD #1=(CDR |t|) |lt|) (QCDR #1#)) (EXIT |t|)))))) 

(SDEFUN |TREE;setvalue!;$2S;5| ((|t| $) (|s| S) ($ S))
        (SEQ
         (COND ((QEQCAR |t| 1) (|error| "cannot set value of an empty tree"))
               ('T
                (SEQ (PROGN (RPLACA #1=(CDR |t|) |s|) (QCAR #1#))
                     (EXIT |s|)))))) 

(SDEFUN |TREE;count;S$Nni;6| ((|n| S) (|t| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|i| #1=(|NonNegativeInteger|)) (#2=#:G445 NIL) (#3=#:G444 #1#)
          (#4=#:G446 #1#) (#5=#:G451 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #5# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |c| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |n| |c| (QREFELT $ 16)))
                                 (COND (#2# (LETT #3# (+ #3# #4#)))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4#)
                                         (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |n|
                               (QREFELT $ 18))
                     (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;count;M$Nni;7|
        ((|fn| |Mapping| (|Boolean|) S) (|t| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|i| #1=(|NonNegativeInteger|)) (#2=#:G453 NIL) (#3=#:G452 #1#)
          (#4=#:G454 #1#) (#5=#:G458 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #5# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |c| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |fn| |c| (QREFELT $ 20)))
                                 (COND (#2# (LETT #3# (+ #3# #4#)))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4#)
                                         (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;map;M2$;8| ((|fn| |Mapping| S S) (|t| $) ($ $))
        (SPROG ((#1=#:G463 NIL) (|c| NIL) (#2=#:G462 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |c| NIL)
                                       (LETT #1# (SPADCALL |t| (QREFELT $ 12)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |c| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |fn| |c|
                                                          (QREFELT $ 22))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 23))))))) 

(SDEFUN |TREE;map!;M2$;9| ((|fn| |Mapping| S S) (|t| $) ($ $))
        (SPROG ((#1=#:G468 NIL) (|c| NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SEQ
                        (SPADCALL |t|
                                  (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                                  (QREFELT $ 14))
                        (SEQ (LETT |c| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |fn| |c| (QREFELT $ 24))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |t|))))))) 

(SDEFUN |TREE;tree;SL$;10| ((|s| S) (|lt| |List| $) ($ $))
        (CONS 0 (CONS |s| |lt|))) 

(SDEFUN |TREE;tree;S$;11| ((|s| S) ($ $)) (CONS 0 (CONS |s| NIL))) 

(SDEFUN |TREE;tree;L$;12| ((|ls| |List| S) ($ $))
        (SPROG ((#1=#:G475 NIL) (|s| NIL) (#2=#:G474 NIL))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT $ 10)))
                      ('T
                       (SPADCALL (|SPADfirst| |ls|)
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |s| NIL) (LETT #1# (CDR |ls|))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |s| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |s| (QREFELT $ 25))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 23))))))) 

(SDEFUN |TREE;value;$S;13| ((|t| $) ($ S))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the value of an empty tree"))
         ('T (QCAR (CDR |t|))))) 

(SDEFUN |TREE;child?;2$B;14| ((|t1| $) (|t2| $) ($ |Boolean|))
        (COND ((SPADCALL |t2| (QREFELT $ 9)) NIL)
              ('T
               (SPADCALL |t1| (SPADCALL |t2| (QREFELT $ 12)) (QREFELT $ 29))))) 

(SDEFUN |TREE;distance1| ((|t1| $) (|t2| $) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G483 NIL) (#3=#:G482 #1#) (#4=#:G484 #1#) (#5=#:G489 NIL)
          (#6=#:G382 NIL) (|u| (|List| #1#)) (|n| #1#) (#7=#:G488 NIL)
          (|t| NIL) (#8=#:G487 NIL))
         (SEQ
          (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 0) ((QEQCAR |t2| 1) -1)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |t| NIL)
                              (LETT #7# (SPADCALL |t2| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |t| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((>= (LETT |n| (|TREE;distance1| |t1| |t| $))
                                      0)
                                  (LETT #8# (CONS |n| #8#))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |u|) 0 (QREFELT $ 33))
                     (+ 1
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT #6# NIL) (LETT #5# |u|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #6# (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# #6#)
                                 (COND (#2# (LETT #3# (MIN #3# #4#)))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4#)
                                         (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#9# (|IdentityError| '|min|))))))
                    (#9# -1))))))))) 

(SDEFUN |TREE;distance;2$I;16| ((|t1| $) (|t2| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|TREE;distance1| |t1| |t2| $))
                    (EXIT
                     (COND ((>= |n| 0) |n|)
                           ('T (|TREE;distance1| |t2| |t1| $))))))) 

(SDEFUN |TREE;node?;2$B;17| ((|t1| $) (|t2| $) ($ |Boolean|))
        (SPROG NIL
               (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 'T)
                     ((QEQCAR |t2| 1) NIL)
                     ('T
                      (SPADCALL (CONS #'|TREE;node?;2$B;17!0| (VECTOR $ |t1|))
                                (SPADCALL |t2| (QREFELT $ 12))
                                (QREFELT $ 37)))))) 

(SDEFUN |TREE;node?;2$B;17!0| ((|t| NIL) ($$ NIL))
        (PROG (|t1| $)
          (LETT |t1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |t1| |t| (QREFELT $ 35)))))) 

(SDEFUN |TREE;leaf?;$B;18| ((|t| $) ($ |Boolean|))
        (COND ((QEQCAR |t| 1) NIL)
              ('T (SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))))) 

(SDEFUN |TREE;leaves;$L;19| ((|t| $) ($ |List| S))
        (SPROG
         ((#1=#:G503 NIL) (#2=#:G502 #3=(|List| S)) (#4=#:G504 #3#)
          (#5=#:G507 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                ((SPADCALL |t| (QREFELT $ 39))
                 (LIST (SPADCALL |t| (QREFELT $ 17))))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |c| NIL) (LETT #5# (SPADCALL |t| (QREFELT $ 12)))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |c| (QREFELT $ 40)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 41))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |TREE;less?;$NniB;20|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (SPADCALL |t| (QREFELT $ 42)) |n|)) 

(SDEFUN |TREE;more?;$NniB;21|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL (SPADCALL |t| (QREFELT $ 42)) |n| (QREFELT $ 44))) 

(SDEFUN |TREE;nodes;$L;22| ((|t| $) ($ |List| $))
        (SPROG
         ((#1=#:G512 NIL) (#2=#:G511 #3=(|List| $)) (#4=#:G513 #3#)
          (#5=#:G518 NIL) (#6=#:G383 NIL) (|nl| (|List| #3#)) (#7=#:G517 NIL)
          (|c| NIL) (#8=#:G516 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) (SPADCALL (QREFELT $ 46)))
                (#9='T
                 (SEQ
                  (LETT |nl|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #7# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |c| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS (SPADCALL |c| (QREFELT $ 47))
                                            #8#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (EXIT
                   (COND ((SPADCALL |nl| NIL (QREFELT $ 49)) (LIST |t|))
                         (#9#
                          (SPADCALL |t|
                                    (PROGN
                                     (LETT #1# NIL)
                                     (SEQ (LETT #6# NIL) (LETT #5# |nl|) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT #6# (CAR #5#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #4# #6#)
                                             (COND
                                              (#1#
                                               (LETT #2#
                                                     (SPADCALL #2# #4#
                                                               (QREFELT $
                                                                        50))))
                                              ('T
                                               (PROGN
                                                (LETT #2# #4#)
                                                (LETT #1# 'T)))))))
                                          (LETT #5# (CDR #5#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#1# #2#) (#9# NIL)))
                                    (QREFELT $ 51))))))))))) 

(SDEFUN |TREE;size?;$NniB;23|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (SPADCALL |t| (QREFELT $ 42)) |n|)) 

(SDEFUN |TREE;any?;M$B;24|
        ((|fn| |Mapping| #1=(|Boolean|) S) (|t| $) ($ . #1#))
        (SPROG ((#2=#:G527 NIL) (#3=#:G528 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) NIL)
                       ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #3# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |c| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |fn| |c| (QREFELT $ 53))
                                  (PROGN (LETT #2# 'T) (GO #4=#:G526))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;every?;M$B;25|
        ((|fn| |Mapping| #1=(|Boolean|) S) (|t| $) ($ . #1#))
        (SPROG ((#2=#:G535 NIL) (#3=#:G536 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) 'T)
                       ((NULL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|))
                        NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #3# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |c| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |fn| |c| (QREFELT $ 54)))
                                  (PROGN (LETT #2# NIL) (GO #4=#:G534))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;member?;S$B;26| ((|n| S) (|t| $) ($ |Boolean|))
        (SPROG NIL
               (COND ((QEQCAR |t| 1) NIL)
                     ((SPADCALL |n| (SPADCALL |t| (QREFELT $ 17))
                                (QREFELT $ 18))
                      'T)
                     ('T
                      (SPADCALL (CONS #'|TREE;member?;S$B;26!0| (VECTOR $ |n|))
                                (SPADCALL |t| (QREFELT $ 12))
                                (QREFELT $ 37)))))) 

(SDEFUN |TREE;member?;S$B;26!0| ((|c| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |n| |c| (QREFELT $ 55)))))) 

(SDEFUN |TREE;members;$L;27| ((|t| $) ($ |List| S))
        (SPADCALL |t| (QREFELT $ 56))) 

(SDEFUN |TREE;parts;$L;28| ((|t| $) ($ |List| S))
        (SPROG
         ((#1=#:G548 NIL) (#2=#:G547 #3=(|List| S)) (#4=#:G549 #3#)
          (#5=#:G554 NIL) (#6=#:G384 NIL) (|u| (|List| #3#)) (#7=#:G553 NIL)
          (|c| NIL) (#8=#:G552 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #7# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |c| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS (SPADCALL |c| (QREFELT $ 56))
                                            #8#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (EXIT
                   (COND
                    ((SPADCALL |u| NIL (QREFELT $ 59))
                     (LIST (SPADCALL |t| (QREFELT $ 17))))
                    (#9#
                     (CONS (SPADCALL |t| (QREFELT $ 17))
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT #6# NIL) (LETT #5# |u|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT #6# (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4# #6#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 41))))
                                     ('T
                                      (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) (#9# NIL))))))))))))) 

(SDEFUN |TREE;hashUpdate!;Hs$Hs;29| ((|s| |HashState|) (|t| $) ($ |HashState|))
        (SPROG ((#1=#:G560 NIL) (|subt| NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |s|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (SPADCALL |s| (SPADCALL |t| (QREFELT $ 17))
                                        (QREFELT $ 61)))
                        (SEQ (LETT |subt| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |subt| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (SPADCALL |s| |subt| (QREFELT $ 62)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |TREE;=;2$B;30| ((|t1| $) (|t2| $) ($ |Boolean|))
        (|TREE;equal?| |t1| |t2| |t1| |t2| 0 $)) 

(SDEFUN |TREE;equal?|
        ((|t1| $) (|t2| $) (|ot1| $) (|ot2| $) (|k| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G574 NIL) (#2=#:G575 NIL) (|x| NIL) (#3=#:G576 NIL) (|y| NIL)
          (#4=#:G573 NIL) (|c2| #5=(|List| $)) (|c1| #5#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL |k| 5)
              (COND
               ((OR (SPADCALL |ot1| (QREFELT $ 63))
                    (SPADCALL |ot2| (QREFELT $ 63)))
                (EXIT
                 (|error|
                  "use cyclicEqual? to test equality on cyclic trees"))))))
            (EXIT
             (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) NIL)
                   (#6='T
                    (SEQ
                     (EXIT
                      (SEQ
                       (COND
                        ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                                   (SPADCALL |t2| (QREFELT $ 17))
                                   (QREFELT $ 18))
                         (SEQ (LETT |c1| (SPADCALL |t1| (QREFELT $ 12)))
                              (LETT |c2| (SPADCALL |t2| (QREFELT $ 12)))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |c1| |c2| (QREFELT $ 64)))
                                 (PROGN (LETT #4# NIL) (GO #7=#:G570)))))))
                        (#6# (EXIT NIL)))
                       (SEQ (LETT |y| NIL) (LETT #3# |c2|) (LETT |x| NIL)
                            (LETT #2# |c1|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                                  (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (|TREE;equal?| |x| |y| |ot1| |ot2| (+ |k| 1)
                                  $))
                                (PROGN (LETT #1# NIL) (GO #8=#:G572))))))
                            (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT 'T)))
                     #7# (EXIT #4#)))))))
          #8# (EXIT #1#)))) 

(SDEFUN |TREE;#;$Nni;32| ((|t| $) ($ |NonNegativeInteger|))
        (|TREE;treeCount| |t| |t| 0 $)) 

(SDEFUN |TREE;treeCount|
        ((|t| $) (|origTree| $) (|k| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G585 NIL) (#2=#:G584 #3=(|NonNegativeInteger|)) (#4=#:G586 #3#)
          (#5=#:G589 NIL) (|c| NIL))
         (SEQ
          (COND
           ((EQL |k| 5)
            (COND
             ((SPADCALL |origTree| (QREFELT $ 63))
              (EXIT (|error| "# is not defined on cyclic trees"))))))
          (EXIT
           (COND ((QEQCAR |t| 1) 0)
                 (#6='T
                  (+ 1
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |c| NIL)
                           (LETT #5# (SPADCALL |t| (QREFELT $ 12))) G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|TREE;treeCount| |c| |origTree| (+ |k| 1)
                                     $))
                              (COND (#1# (LETT #2# (+ #2# #4#)))
                                    ('T
                                     (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                           (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) (#6# 0)))))))))) 

(SDEFUN |TREE;copy;2$;34| ((|t| $) ($ $)) (|TREE;copy1| |t| |t| 0 $)) 

(SDEFUN |TREE;copy1| ((|t| $) (|origTree| $) (|k| |Integer|) ($ $))
        (SPROG ((#1=#:G599 NIL) (|x| NIL) (#2=#:G598 NIL))
               (SEQ
                (COND
                 ((EQL |k| 5)
                  (COND
                   ((SPADCALL |origTree| (QREFELT $ 63))
                    (EXIT (|error| "use cyclicCopy to copy a cyclic tree"))))))
                (EXIT
                 (COND ((QEQCAR |t| 1) |t|)
                       ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (QREFELT $ 25)))
                       ('T
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |x| NIL)
                                        (LETT #1#
                                              (SPADCALL |t| (QREFELT $ 12)))
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN (LETT |x| (CAR #1#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (|TREE;copy1| |x| |origTree|
                                                  (+ |k| 1) $)
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 23)))))))) 

(SDEFUN |TREE;coerce;$Of;36| ((|t| $) ($ |OutputForm|))
        (|TREE;coerce1| |t| (SPADCALL (QREFELT $ 46))
         (SPADCALL |t| (QREFELT $ 66)) $)) 

(SDEFUN |TREE;coerce1|
        ((|t| $) (|parents| |List| $) (|pl| |List| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G610 NIL) (|br| NIL) (#2=#:G609 NIL)
          (|nodeForm| (|OutputForm|)) (|k| (|Integer|)))
         (SEQ
          (COND ((QEQCAR |t| 1) (SPADCALL NIL (QREFELT $ 69)))
                ((|TREE;eqMember?| |t| |parents| $)
                 (|TREE;multipleOverbar| (SPADCALL "." (QREFELT $ 71))
                  (|TREE;eqMemberIndex| |t| |pl| 0 $) |pl| $))
                ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
                 (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 72)))
                ('T
                 (SEQ
                  (LETT |nodeForm|
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (QREFELT $ 72)))
                  (SEQ (LETT |k| (|TREE;eqMemberIndex| |t| |pl| 0 $))
                       (EXIT
                        (COND
                         ((SPADCALL |k| 0 (QREFELT $ 33))
                          (LETT |nodeForm|
                                (|TREE;multipleOverbar| |nodeForm| |k| |pl|
                                 $))))))
                  (EXIT
                   (SPADCALL |nodeForm|
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |br| NIL)
                                   (LETT #1# (SPADCALL |t| (QREFELT $ 12)))
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |br| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|TREE;coerce1| |br|
                                             (SPADCALL |t| |parents|
                                                       (QREFELT $ 51))
                                             |pl| $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 73))))))))) 

(SDEFUN |TREE;multipleOverbar|
        ((|x| |OutputForm|) (|k| |Integer|) (|pl| |List| $) ($ |OutputForm|))
        (SPROG ((|c| (|Character|)) (|s| (|String|)))
               (SEQ
                (COND ((< |k| 1) |x|)
                      ((EQL (SPADCALL |pl| (QREFELT $ 74)) 1)
                       (SPADCALL |x| (QREFELT $ 75)))
                      ('T
                       (SEQ (LETT |s| "abcdefghijklmnopqrstuvwxyz")
                            (LETT |c|
                                  (SPADCALL |s| (+ 1 (REM (- |k| 1) 26))
                                            (QREFELT $ 77)))
                            (EXIT
                             (SPADCALL (SPADCALL |c| (QREFELT $ 78)) |x|
                                       (QREFELT $ 79))))))))) 

(SDEFUN |TREE;cyclic?;$B;39| ((|t| $) ($ |Boolean|))
        (|TREE;cyclic2?| |t| (SPADCALL (QREFELT $ 46)) $)) 

(SDEFUN |TREE;cyclic2?| ((|x| $) (|parents| |List| $) ($ |Boolean|))
        (SPROG ((#1=#:G623 NIL) (#2=#:G624 NIL) (#3=#:G625 NIL) (|y| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |x| (QREFELT $ 9)) NIL)
                       ((|TREE;eqMember?| |x| |parents| $) 'T)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |y| NIL)
                                (LETT #3# (SPADCALL |x| (QREFELT $ 12))) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |y| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|TREE;cyclic2?| |y|
                                     (SPADCALL |x| |parents| (QREFELT $ 51)) $)
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# 'T)
                                            (GO #4=#:G622)))
                                     (GO #5=#:G618))))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT NIL)))
                          #5# (EXIT #1#))
                         (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;cyclicCopy;2$;41| ((|t| $) ($ $))
        (|TREE;cyclicCopy2| |t| (SPADCALL |t| (QREFELT $ 80)) $)) 

(SDEFUN |TREE;cyclicCopy2| ((|t| $) (|cycles| |List| $) ($ $))
        (SPROG ((#1=#:G631 NIL) (|c| NIL) (#2=#:G630 NIL))
               (SEQ
                (COND
                 ((|TREE;eqMember?| |t| |cycles| $)
                  (|TREE;copyCycle2| |t| |cycles| $))
                 ('T
                  (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |c| NIL)
                                  (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|TREE;cyclicCopy2| |c| |cycles| $)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 23))))))) 

(SDEFUN |TREE;copyCycle2| ((|cycle| $) (|cycleList| |List| $) ($ $))
        (SPROG ((#1=#:G636 NIL) (|c| NIL) (#2=#:G635 NIL) (|newCycle| ($)))
               (SEQ
                (LETT |newCycle|
                      (SPADCALL (SPADCALL |cycle| (QREFELT $ 17)) NIL
                                (QREFELT $ 23)))
                (SPADCALL |newCycle|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |c| NIL)
                                (LETT #1# (SPADCALL |cycle| (QREFELT $ 12)))
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |c| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|TREE;copyCycle4| |c| |cycle|
                                          |newCycle| |cycleList| $)
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 13))
                (EXIT |newCycle|)))) 

(SDEFUN |TREE;copyCycle4|
        ((|t| $) (|cycle| $) (|newCycle| $) (|cycleList| |List| $) ($ $))
        (SPROG ((#1=#:G643 NIL) (|c| NIL) (#2=#:G642 NIL))
               (SEQ
                (COND
                 ((SPADCALL |cycle| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
                 ((SPADCALL |t| |cycle| (QREFELT $ 82)) |newCycle|)
                 ((|TREE;eqMember?| |t| |cycleList| $)
                  (|TREE;copyCycle2| |t| |cycleList| $))
                 ('T
                  (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |c| NIL)
                                  (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|TREE;copyCycle4| |c| |cycle|
                                            |newCycle| |cycleList| $)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 23))))))) 

(SDEFUN |TREE;cyclicEntries;$L;45| ((|t| $) ($ |List| $))
        (|TREE;cyclicEntries3| |t| (SPADCALL (QREFELT $ 46))
         (SPADCALL (QREFELT $ 46)) $)) 

(SDEFUN |TREE;cyclicEntries3|
        ((|t| $) (|parents| |List| $) (|cl| |List| $) ($ |List| $))
        (SPROG ((#1=#:G650 NIL) (|y| NIL))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT $ 9)) |cl|)
                      ((|TREE;eqMember?| |t| |parents| $)
                       (|TREE;insert| |t| |cl| $))
                      ('T
                       (SEQ
                        (LETT |parents|
                              (SPADCALL |t| |parents| (QREFELT $ 51)))
                        (SEQ (LETT |y| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |cl|
                                     (|TREE;cyclicEntries3| |t| |parents| |cl|
                                      $))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |cl|))))))) 

(SDEFUN |TREE;cyclicEqual?;2$B;47| ((|t1| $) (|t2| $) ($ |Boolean|))
        (SPROG ((|cp2| #1=(|List| $)) (|cp1| #1#))
               (SEQ (LETT |cp1| (SPADCALL |t1| (QREFELT $ 66)))
                    (LETT |cp2| (SPADCALL |t2| (QREFELT $ 66)))
                    (COND
                     ((OR
                       (SPADCALL (SPADCALL |cp1| (QREFELT $ 74))
                                 (SPADCALL |cp2| (QREFELT $ 74))
                                 (QREFELT $ 83))
                       (SPADCALL |cp1| (QREFELT $ 38)))
                      (EXIT (SPADCALL |t1| |t2| (QREFELT $ 31)))))
                    (EXIT (|TREE;cyclicEqual4?| |t1| |t2| |cp1| |cp2| $))))) 

(SDEFUN |TREE;cyclicEqual4?|
        ((|t1| $) (|t2| $) (|cp1| |List| $) (|cp2| |List| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G665 NIL) (#2=#:G666 NIL) (|x| NIL) (#3=#:G667 NIL) (|y| NIL)
          (|k| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) NIL)
                 (#4='T
                  (COND
                   ((SPADCALL 0
                              (LETT |k| (|TREE;eqMemberIndex| |t1| |cp1| 0 $))
                              (QREFELT $ 83))
                    (SPADCALL |t2| (SPADCALL |cp2| |k| (QREFELT $ 85))
                              (QREFELT $ 82)))
                   ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                              (SPADCALL |t2| (QREFELT $ 17)) (QREFELT $ 86))
                    NIL)
                   (#4#
                    (SEQ
                     (SEQ (LETT |y| NIL)
                          (LETT #3# (SPADCALL |t2| (QREFELT $ 12)))
                          (LETT |x| NIL)
                          (LETT #2# (SPADCALL |t1| (QREFELT $ 12))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                                (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (|TREE;cyclicEqual4?| |x| |y| |cp1| |cp2| $))
                              (PROGN (LETT #1# NIL) (GO #5=#:G664))))))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                          (GO G190) G191 (EXIT NIL))
                     (EXIT 'T)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |TREE;cyclicParents;$L;49| ((|t| $) ($ |List| $))
        (|TREE;cyclicParents3| |t| (SPADCALL (QREFELT $ 46))
         (SPADCALL (QREFELT $ 46)) $)) 

(SDEFUN |TREE;cyclicParents3|
        ((|x| $) (|parents| |List| $) (|pl| |List| $) ($ |List| $))
        (SPROG
         ((#1=#:G679 NIL) (|y| NIL) (|cycleMembers| (|List| $)) (#2=#:G678 NIL)
          (#3=#:G677 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 9)) |pl|)
                ((|TREE;eqMember?| |x| |parents| $)
                 (SEQ
                  (LETT |cycleMembers|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |y| NIL) (LETT #2# |parents|) G190
                              (COND
                               ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL)
                                    (NULL
                                     (NULL (SPADCALL |x| |y| (QREFELT $ 82)))))
                                (GO G191)))
                              (SEQ (EXIT (LETT #3# (CONS |y| #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (|TREE;eqUnion| (SPADCALL |x| |cycleMembers| (QREFELT $ 51))
                    |pl| $))))
                ('T
                 (SEQ (LETT |parents| (SPADCALL |x| |parents| (QREFELT $ 51)))
                      (SEQ (LETT |y| NIL)
                           (LETT #1# (SPADCALL |x| (QREFELT $ 12))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |pl|
                                   (|TREE;cyclicParents3| |y| |parents| |pl|
                                    $))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |pl|))))))) 

(SDEFUN |TREE;insert| ((|x| $) (|l| |List| $) ($ |List| $))
        (COND ((|TREE;eqMember?| |x| |l| $) |l|)
              ('T (SPADCALL |x| |l| (QREFELT $ 51))))) 

(SDEFUN |TREE;lastNode| ((|l| |List| $) ($ |List| $))
        (SEQ
         (COND
          ((SPADCALL |l| (QREFELT $ 38))
           (|error| "empty tree has no last node"))
          ('T
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL
                    (NULL
                     (SPADCALL (SPADCALL |l| (QREFELT $ 87)) (QREFELT $ 38))))
                   (GO G191)))
                 (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 87))))) NIL
                 (GO G190) G191 (EXIT NIL))
            (EXIT |l|)))))) 

(SDEFUN |TREE;eqMember?| ((|y| $) (|l| |List| $) ($ |Boolean|))
        (SPROG ((#1=#:G693 NIL) (#2=#:G694 NIL) (#3=#:G695 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |x| NIL) (LETT #3# |l|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x| |y| (QREFELT $ 82))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G692)))
                              (GO #5=#:G690))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;eqMemberIndex|
        ((|x| $) (|l| |List| $) (|k| |Integer|) ($ |Integer|))
        (SEQ
         (COND ((SPADCALL |l| (QREFELT $ 38)) |k|)
               (#1='T
                (SEQ (LETT |k| (+ |k| 1))
                     (EXIT
                      (COND
                       ((SPADCALL |x| (SPADCALL |l| (QREFELT $ 88))
                                  (QREFELT $ 82))
                        |k|)
                       (#1#
                        (|TREE;eqMemberIndex| |x| (SPADCALL |l| (QREFELT $ 87))
                         |k| $))))))))) 

(SDEFUN |TREE;eqUnion| ((|u| |List| $) (|v| |List| $) ($ |List| $))
        (SPROG ((|newV| (|List| $)) (|x| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 38)) |v|)
                      (#1='T
                       (SEQ (LETT |x| (SPADCALL |u| (QREFELT $ 88)))
                            (LETT |newV|
                                  (COND ((|TREE;eqMember?| |x| |v| $) |v|)
                                        (#1#
                                         (SPADCALL |x| |v| (QREFELT $ 51)))))
                            (EXIT
                             (|TREE;eqUnion| (SPADCALL |u| (QREFELT $ 87))
                              |newV| $)))))))) 

(DECLAIM (NOTINLINE |Tree;|)) 

(DEFUN |Tree| (#1=#:G707)
  (SPROG NIL
         (PROG (#2=#:G708)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tree;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tree|)))))))))) 

(DEFUN |Tree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G704 NIL) (#2=#:G705 NIL) (#3=#:G706 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Tree| DV$1))
    (LETT $ (GETREFV 94))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))))
    (|haddProp| |$ConstructorCache| '|Tree| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 512))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 1024))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 2048))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7
              (|Union|
               (|:| |node|
                    (|Record| (|:| |value| |#1|) (|:| |args| (|List| $))))
               (|:| |empty| "empty")))
    $))) 

(MAKEPROP '|Tree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |TREE;empty?;$B;1| |TREE;empty;$;2| (|List| $)
              |TREE;children;$L;3| |TREE;setchildren!;$L$;4|
              |TREE;setvalue!;$2S;5| (|NonNegativeInteger|)
              |TREE;count;S$Nni;6| |TREE;value;$S;13| (0 . =) (|Mapping| 8 6)
              |TREE;count;M$Nni;7| (|Mapping| 6 6) |TREE;map;M2$;8|
              |TREE;tree;SL$;10| |TREE;map!;M2$;9| |TREE;tree;S$;11| (|List| 6)
              |TREE;tree;L$;12| (|List| $$) (6 . |member?|)
              |TREE;child?;2$B;14| |TREE;=;2$B;30| (|Integer|) (12 . >)
              |TREE;distance;2$I;16| |TREE;node?;2$B;17| (|Mapping| 8 $$)
              (18 . |any?|) (24 . |empty?|) |TREE;leaf?;$B;18|
              |TREE;leaves;$L;19| (29 . |append|) |TREE;#;$Nni;32|
              |TREE;less?;$NniB;20| (35 . >) |TREE;more?;$NniB;21|
              (41 . |empty|) |TREE;nodes;$L;22| (|List| 28) (45 . =)
              (51 . |append|) (57 . |cons|) |TREE;size?;$NniB;23|
              |TREE;any?;M$B;24| |TREE;every?;M$B;25| |TREE;member?;S$B;26|
              |TREE;parts;$L;28| |TREE;members;$L;27| (|List| 26) (63 . =)
              (|HashState|) (69 . |hashUpdate!|) |TREE;hashUpdate!;Hs$Hs;29|
              |TREE;cyclic?;$B;39| (75 . =) |TREE;copy;2$;34|
              |TREE;cyclicParents;$L;49| (|OutputForm|) |TREE;coerce;$Of;36|
              (81 . |coerce|) (|String|) (86 . |message|) (91 . |coerce|)
              (96 . |prefix|) (102 . |#|) (107 . |overbar|) (|Character|)
              (112 . |elt|) (118 . |coerce|) (123 . |overlabel|)
              |TREE;cyclicEntries;$L;45| |TREE;cyclicCopy;2$;41| (129 . |eq?|)
              (135 . ~=) |TREE;cyclicEqual?;2$B;47| (141 . |elt|) (147 . ~=)
              (153 . |rest|) (158 . |first|) (|Equation| 6) (|List| 89)
              (|Mapping| 8 6 6) '"value" (|SingleInteger|))
           '#(~= 163 |value| 169 |tree| 174 |size?| 190 |setvalue!| 196
              |setelt!| 202 |setchildren!| 209 |sample| 215 |parts| 219 |nodes|
              224 |node?| 229 |more?| 235 |min| 241 |members| 246 |member?| 251
              |max| 257 |map!| 268 |map| 274 |less?| 280 |leaves| 286 |leaf?|
              291 |latex| 296 |hashUpdate!| 301 |hash| 307 |every?| 312 |eval|
              318 |eq?| 344 |empty?| 350 |empty| 355 |elt| 359 |distance| 365
              |cyclicParents| 371 |cyclicEqual?| 376 |cyclicEntries| 382
              |cyclicCopy| 387 |cyclic?| 392 |count| 397 |copy| 409 |coerce|
              414 |children| 419 |child?| 424 |any?| 430 = 436 |#| 442)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 2 1 0 0 0 2 5 7))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Aggregate|) (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|shallowlyMutable|) (|finiteAggregate|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 67))
                   (|makeByteWordVec2| 93
                                       '(2 6 8 0 0 18 2 28 8 2 0 29 2 32 8 0 0
                                         33 2 28 8 36 0 37 1 28 8 0 38 2 26 0 0
                                         0 41 2 15 8 0 0 44 0 28 0 46 2 48 8 0
                                         0 49 2 28 0 0 0 50 2 28 0 2 0 51 2 58
                                         8 0 0 59 2 6 60 60 0 61 2 28 8 0 0 64
                                         1 26 67 0 69 1 67 0 70 71 1 6 67 0 72
                                         2 67 0 0 11 73 1 28 15 0 74 1 67 0 0
                                         75 2 70 76 0 32 77 1 76 67 0 78 2 67 0
                                         0 0 79 2 0 8 0 0 82 2 32 8 0 0 83 2 28
                                         2 0 32 85 2 6 8 0 0 86 1 28 0 0 87 1
                                         28 2 0 88 2 11 8 0 0 1 1 0 6 0 17 1 0
                                         0 26 27 1 0 0 6 25 2 0 0 6 11 23 2 0 8
                                         0 15 52 2 12 6 0 6 14 3 12 6 0 92 6 1
                                         2 12 0 0 11 13 0 0 0 1 1 8 26 0 56 1 0
                                         11 0 47 2 4 8 0 0 35 2 0 8 0 15 45 1 9
                                         6 0 1 1 8 26 0 57 2 10 8 6 0 55 1 9 6
                                         0 1 2 8 6 91 0 1 2 12 0 21 0 24 2 0 0
                                         21 0 22 2 0 8 0 15 43 1 0 26 0 40 1 0
                                         8 0 39 1 1 70 0 1 2 1 60 60 0 62 1 1
                                         93 0 1 2 8 8 19 0 54 3 2 0 0 6 6 1 3 2
                                         0 0 26 26 1 2 2 0 0 89 1 2 2 0 0 90 1
                                         2 0 8 0 0 82 1 0 8 0 9 0 0 0 10 2 0 6
                                         0 92 1 2 0 32 0 0 34 1 0 11 0 66 2 0 8
                                         0 0 84 1 0 11 0 80 1 0 0 0 81 1 0 8 0
                                         63 2 10 15 6 0 16 2 8 15 19 0 20 1 0 0
                                         0 65 1 6 67 0 68 1 0 11 0 12 2 4 8 0 0
                                         30 2 8 8 19 0 53 2 11 8 0 0 31 1 8 15
                                         0 42)))))
           '|lookupComplete|)) 