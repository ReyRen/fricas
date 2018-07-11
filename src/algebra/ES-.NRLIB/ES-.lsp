
(SDEFUN |ES-;box;2S;1| ((|x| S) ($ S))
        (SPADCALL (QREFELT $ 13) (LIST |x|) (QREFELT $ 15))) 

(SDEFUN |ES-;paren;2S;2| ((|x| S) ($ S))
        (SPADCALL (QREFELT $ 12) (LIST |x|) (QREFELT $ 15))) 

(SDEFUN |ES-;belong?;BoB;3| ((|op| |BasicOperator|) ($ |Boolean|))
        (COND
         ((SPADCALL |op| '|any| (QREFELT $ 19))
          (COND ((SPADCALL |op| '|%paren| (QREFELT $ 20)) 'T)
                (#1='T (SPADCALL |op| '|%box| (QREFELT $ 20)))))
         (#1# NIL))) 

(SDEFUN |ES-;listk| ((|f| S) ($ |List| (|Kernel| S)))
        (SPADCALL (|ES-;allKernels| |f| $) (QREFELT $ 24))) 

(SDEFUN |ES-;tower;SL;5| ((|f| S) ($ |List| (|Kernel| S)))
        (SPADCALL (|ES-;listk| |f| $) (QREFELT $ 25))) 

(SDEFUN |ES-;allk| ((|l| |List| S) ($ |Set| (|Kernel| S)))
        (SPROG ((#1=#:G426 NIL) (|f| NIL) (#2=#:G425 NIL))
               (SEQ
                (SPADCALL (ELT $ 28)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (|ES-;allKernels| |f| $) #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (SPADCALL (QREFELT $ 29)) (QREFELT $ 32))))) 

(SDEFUN |ES-;tower;LL;7| ((|lf| |List| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL (|ES-;allk| |lf| $) (QREFELT $ 24)) (QREFELT $ 25))) 

(SDEFUN |ES-;kernels;LL;8| ((|lf| |List| S) ($ |List| (|Kernel| S)))
        (SPROG ((#1=#:G440 NIL) (|f| NIL) (#2=#:G439 NIL))
               (SEQ
                (SPADCALL (ELT $ 34)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |f| (QREFELT $ 35))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          NIL (QREFELT $ 38))))) 

(SDEFUN |ES-;operators;SL;9| ((|f| S) ($ |List| (|BasicOperator|)))
        (SPROG ((#1=#:G445 NIL) (|k| NIL) (#2=#:G444 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# (|ES-;listk| |f| $)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 41)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ES-;height;SNni;10| ((|f| S) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G451 NIL) (|k| NIL) (#2=#:G450 NIL))
               (SEQ
                (SPADCALL (ELT $ 45)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |k| NIL)
                                (LETT #1# (SPADCALL |f| (QREFELT $ 35))) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |k| (QREFELT $ 46))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          0 (QREFELT $ 49))))) 

(SDEFUN |ES-;freeOf?;SSB;11| ((|x| S) (|s| |Symbol|) ($ |Boolean|))
        (SPROG ((#1=#:G456 NIL) (|k| NIL) (#2=#:G455 NIL))
               (SEQ
                (NULL
                 (SPADCALL |s|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |k| NIL) (LETT #1# (|ES-;listk| |x| $))
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |k| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |k| (QREFELT $ 51))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 53)))))) 

(SDEFUN |ES-;distribute;2S;12| ((|x| S) ($ S))
        (SPROG ((#1=#:G461 NIL) (|k| NIL) (#2=#:G460 NIL))
               (SEQ
                (|ES-;unwrap|
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |k| NIL) (LETT #1# (|ES-;listk| |x| $)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |k| (QREFELT $ 12) (QREFELT $ 55)) 'T)
                            ('T (SPADCALL |k| (QREFELT $ 13) (QREFELT $ 55))))
                           (LETT #2# (CONS |k| #2#))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| $)))) 

(SDEFUN |ES-;freeOf?;2SB;13| ((|x| S) (|k| S) ($ |Boolean|))
        (NULL
         (SPADCALL (SPADCALL |k| (QREFELT $ 62)) (|ES-;listk| |x| $)
                   (QREFELT $ 63)))) 

(SDEFUN |ES-;kernel;Bo2S;14| ((|op| |BasicOperator|) (|arg| S) ($ S))
        (SPADCALL |op| (LIST |arg|) (QREFELT $ 65))) 

(SDEFUN |ES-;elt;Bo2S;15| ((|op| |BasicOperator|) (|x| S) ($ S))
        (SPADCALL |op| (LIST |x|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo3S;16| ((|op| |BasicOperator|) (|x| S) (|y| S) ($ S))
        (SPADCALL |op| (LIST |x| |y|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo4S;17|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo5S;18|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo6S;19|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo7S;20|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo8S;21|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         (|q| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo9S;22|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         (|q| S) (|p| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p|) (QREFELT $ 15))) 

(SDEFUN |ES-;elt;Bo10S;23|
        ((|op| |BasicOperator|) (|x| S) (|y| S) (|z| S) (|t| S) (|s| S) (|r| S)
         (|q| S) (|p| S) (|o| S) ($ S))
        (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p| |o|)
                  (QREFELT $ 15))) 

(SDEFUN |ES-;eval;SSMS;24|
        ((|x| S) (|s| |Symbol|) (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST |s|) (LIST |f|) (QREFELT $ 78))) 

(SDEFUN |ES-;eval;SBoMS;25|
        ((|x| S) (|s| |BasicOperator|) (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST (SPADCALL |s| (QREFELT $ 80))) (LIST |f|)
                  (QREFELT $ 78))) 

(SDEFUN |ES-;eval;SSMS;26| ((|x| S) (|s| |Symbol|) (|f| |Mapping| S S) ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|)
                         (LIST (CONS #'|ES-;eval;SSMS;26!0| (VECTOR |f| $)))
                         (QREFELT $ 78)))) 

(SDEFUN |ES-;eval;SSMS;26!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;eval;SBoMS;27|
        ((|x| S) (|s| |BasicOperator|) (|f| |Mapping| S S) ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|)
                         (LIST (CONS #'|ES-;eval;SBoMS;27!0| (VECTOR |f| $)))
                         (QREFELT $ 86)))) 

(SDEFUN |ES-;eval;SBoMS;27!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;subst;SES;28| ((|x| S) (|e| |Equation| S) ($ S))
        (SPADCALL |x| (LIST |e|) (QREFELT $ 89))) 

(SDEFUN |ES-;eval;SLLS;29|
        ((|x| S) (|ls| |List| (|BasicOperator|)) (|lf| |List| (|Mapping| S S))
         ($ S))
        (SPROG ((#1=#:G532 NIL) (|f| NIL) (#2=#:G531 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|ES-;eval;SLLS;29!0|
                                               (VECTOR |f| $))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 86))))) 

(SDEFUN |ES-;eval;SLLS;29!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;eval;SLLS;30|
        ((|x| S) (|ls| |List| (|Symbol|)) (|lf| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G537 NIL) (|f| NIL) (#2=#:G536 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|ES-;eval;SLLS;30!0|
                                               (VECTOR |f| $))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 78))))) 

(SDEFUN |ES-;eval;SLLS;30!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(SDEFUN |ES-;eval;SLLS;31|
        ((|x| S) (|ls| |List| (|BasicOperator|))
         (|lf| |List| (|Mapping| S (|List| S))) ($ S))
        (SPROG ((#1=#:G542 NIL) (|s| NIL) (#2=#:G541 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |s| (QREFELT $ 80))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |lf| (QREFELT $ 78))))) 

(SDEFUN |ES-;map;MKS;32| ((|fn| |Mapping| S S) (|k| |Kernel| S) ($ S))
        (SPROG ((|l| (|List| S)) (#1=#:G575 NIL) (|x| NIL) (#2=#:G574 NIL))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |l|
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |x| NIL)
                               (LETT #1# (SPADCALL |k| (QREFELT $ 96))) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2# (CONS (SPADCALL |x| |fn|) #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))
                   (SPADCALL |k| (QREFELT $ 96)) (QREFELT $ 97))
                  (SPADCALL |k| (QREFELT $ 98)))
                 ('T
                  (SPADCALL (SPADCALL |k| (QREFELT $ 41)) |l|
                            (QREFELT $ 15))))))) 

(SDEFUN |ES-;operator;2Bo;33| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|%paren| (QREFELT $ 20)) (QREFELT $ 12))
              ((SPADCALL |op| '|%box| (QREFELT $ 20)) (QREFELT $ 13))
              ('T
               (|error|
                (STRCONC "Unknown operator 1: "
                         (SPADCALL (SPADCALL |op| (QREFELT $ 80))
                                   (QREFELT $ 101))))))) 

(SDEFUN |ES-;mainKernel;SU;34| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPROG
         ((|k| (|Kernel| S)) (|n| (|NonNegativeInteger|)) (#1=#:G591 NIL)
          (|kk| NIL) (|l| (|List| (|Kernel| S))))
         (SEQ
          (COND
           ((NULL (LETT |l| (SPADCALL |x| (QREFELT $ 35)))) (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |n| (SPADCALL (LETT |k| (|SPADfirst| |l|)) (QREFELT $ 46)))
             (SEQ (LETT |kk| NIL) (LETT #1# (CDR |l|)) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |kk| (QREFELT $ 46)) |n|
                                (QREFELT $ 103))
                      (SEQ (LETT |n| (SPADCALL |kk| (QREFELT $ 46)))
                           (EXIT (LETT |k| |kk|)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (EXIT (CONS 0 |k|)))))))) 

(SDEFUN |ES-;allKernels| ((|f| S) ($ |Set| (|Kernel| S)))
        (SPROG
         ((|s| (|Set| (|Kernel| S))) (|t| (|Set| (|Kernel| S)))
          (|arg| (|List| S)) (|n| (|NonNegativeInteger|))
          (|s0| (|Set| (|Kernel| S))) (|u| (|Union| (|None|) "failed"))
          (#1=#:G604 NIL) (|k| NIL) (|l| (|List| (|Kernel| S))))
         (SEQ
          (LETT |s|
                (SPADCALL (LETT |l| (SPADCALL |f| (QREFELT $ 35)))
                          (QREFELT $ 106)))
          (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (LETT |t|
                      (SEQ
                       (LETT |u|
                             (SPADCALL (SPADCALL |k| (QREFELT $ 41))
                                       (QREFELT $ 7) (QREFELT $ 108)))
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (SEQ (LETT |arg| (SPADCALL |k| (QREFELT $ 96)))
                               (LETT |s0|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |arg| (QREFELT $ 109))
                                       (QREFELT $ 62))
                                      (|ES-;allKernels| (|SPADfirst| |arg|) $)
                                      (QREFELT $ 110)))
                               (LETT |arg| (CDR (CDR |arg|)))
                               (LETT |n| (QCDR |u|))
                               (COND
                                ((SPADCALL |n| 1 (QREFELT $ 103))
                                 (LETT |arg| (CDR |arg|))))
                               (EXIT
                                (SPADCALL |s0| (|ES-;allk| |arg| $)
                                          (QREFELT $ 28)))))
                         ('T (|ES-;allk| (SPADCALL |k| (QREFELT $ 96)) $))))))
                (EXIT (LETT |s| (SPADCALL |s| |t| (QREFELT $ 28)))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |s|)))) 

(SDEFUN |ES-;kernel;BoLS;36| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (COND
         ((NULL (SPADCALL |op| (QREFELT $ 111)))
          (|error|
           (STRCONC "Unknown operator 2: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 80))
                              (QREFELT $ 101)))))
         ('T (|ES-;okkernel| |op| |args| $)))) 

(SDEFUN |ES-;okkernel| ((|op| |BasicOperator|) (|l| |List| S) ($ S))
        (SPROG ((#1=#:G619 NIL) (|f| NIL) (#2=#:G618 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL |op| |l|
                           (+ 1
                              (SPADCALL (ELT $ 45)
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |f| NIL) (LETT #1# |l|)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |f| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          113))
                                                       #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        0 (QREFELT $ 49)))
                           (QREFELT $ 114))
                 (QREFELT $ 98))))) 

(SDEFUN |ES-;elt;BoLS;38| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (SPROG
         ((|v| (|Union| S "failed")) (#1=#:G631 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |op| (QREFELT $ 111)))
             (|error|
              (STRCONC "Unknown operator 3: "
                       (SPADCALL (SPADCALL |op| (QREFELT $ 80))
                                 (QREFELT $ 101)))))
            ('T
             (SEQ
              (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 116)))
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (COND
                       ((SPADCALL (LENGTH |args|) (QCDR |u|) (QREFELT $ 117))
                        (PROGN
                         (LETT #1# (|error| "Wrong number of arguments"))
                         (GO #2=#:G629))))))))
              (LETT |v| (SPADCALL |op| |args| (QREFELT $ 119)))
              (EXIT
               (COND ((QEQCAR |v| 0) (QCDR |v|))
                     ('T (|ES-;okkernel| |op| |args| $))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |ES-;retract;SK;39| ((|f| S) ($ |Kernel| S))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 121)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |k| 1)
                           (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 98)) |f|
                                     (QREFELT $ 122)))
                       (|error| "not a kernel"))
                      ('T (QCDR |k|))))))) 

(SDEFUN |ES-;retractIfCan;SU;40| ((|f| S) ($ |Union| (|Kernel| S) "failed"))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 121)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |k| 1)
                           (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 98)) |f|
                                     (QREFELT $ 122)))
                       (CONS 1 "failed"))
                      ('T |k|)))))) 

(SDEFUN |ES-;is?;SSB;41| ((|f| S) (|s| |Symbol|) ($ |Boolean|))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 125)))
                    (EXIT
                     (COND ((QEQCAR |k| 1) NIL)
                           ('T (SPADCALL (QCDR |k|) |s| (QREFELT $ 126)))))))) 

(SDEFUN |ES-;is?;SBoB;42| ((|f| S) (|op| |BasicOperator|) ($ |Boolean|))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 125)))
                    (EXIT
                     (COND ((QEQCAR |k| 1) NIL)
                           ('T (SPADCALL (QCDR |k|) |op| (QREFELT $ 55)))))))) 

(SDEFUN |ES-;unwrap| ((|l| |List| (|Kernel| S)) (|x| S) ($ S))
        (SPROG ((#1=#:G659 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| NIL) (LETT #1# (NREVERSE |l|)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |x|
                             (SPADCALL |x| |k|
                                       (|SPADfirst|
                                        (SPADCALL |k| (QREFELT $ 96)))
                                       (QREFELT $ 129)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ES-;distribute;3S;44| ((|x| S) (|y| S) ($ S))
        (SPROG ((#1=#:G670 NIL) (|k| NIL) (#2=#:G669 NIL) (|ky| (|Kernel| S)))
               (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 62)))
                    (EXIT
                     (|ES-;unwrap|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |k| NIL) (LETT #1# (|ES-;listk| |x| $)) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((COND
                                 ((OR
                                   (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 55))
                                   (SPADCALL |k| (QREFELT $ 13)
                                             (QREFELT $ 55)))
                                  (SPADCALL |ky|
                                            (|ES-;listk|
                                             (SPADCALL |k| (QREFELT $ 98)) $)
                                            (QREFELT $ 63)))
                                 ('T NIL))
                                (LETT #2# (CONS |k| #2#))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      |x| $))))) 

(SDEFUN |ES-;eval;SLS;45| ((|f| S) (|leq| |List| (|Equation| S)) ($ S))
        (SPROG
         ((|rec|
           (|Record| (|:| |lstk| (|List| (|Kernel| S)))
                     (|:| |lstv| (|List| S)))))
         (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $))
              (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 131)))))) 

(SDEFUN |ES-;subst;SLS;46| ((|f| S) (|leq| |List| (|Equation| S)) ($ S))
        (SPROG
         ((|rec|
           (|Record| (|:| |lstk| (|List| (|Kernel| S)))
                     (|:| |lstv| (|List| S)))))
         (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $))
              (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 133)))))) 

(SDEFUN |ES-;mkKerLists|
        ((|leq| |List| (|Equation| S))
         ($ |Record| (|:| |lstk| (|List| (|Kernel| S)))
          (|:| |lstv| (|List| S))))
        (SPROG
         ((|lv| (|List| S)) (|lk| (|List| (|Kernel| S)))
          (|k| (|Union| (|Kernel| S) "failed")) (#1=#:G689 NIL) (|eq| NIL))
         (SEQ (LETT |lk| NIL) (LETT |lv| NIL)
              (SEQ (LETT |eq| NIL) (LETT #1# |leq|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |k|
                          (SPADCALL (SPADCALL |eq| (QREFELT $ 136))
                                    (QREFELT $ 125)))
                    (EXIT
                     (COND
                      ((QEQCAR |k| 1)
                       (|error| "left hand side must be a single kernel"))
                      ((NULL (SPADCALL (QCDR |k|) |lk| (QREFELT $ 63)))
                       (SEQ (LETT |lk| (CONS (QCDR |k|) |lk|))
                            (EXIT
                             (LETT |lv|
                                   (CONS (SPADCALL |eq| (QREFELT $ 137))
                                         |lv|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |lk| |lv|))))) 

(SDEFUN |ES-;even?;SB;48| ((|x| S) ($ |Boolean|))
        (|ES-;intpred?| |x| (ELT $ 139) $)) 

(SDEFUN |ES-;odd?;SB;49| ((|x| S) ($ |Boolean|))
        (|ES-;intpred?| |x| (ELT $ 141) $)) 

(SDEFUN |ES-;intpred?|
        ((|x| S) (|pred?| |Mapping| (|Boolean|) (|Integer|)) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 144)))
                    (EXIT
                     (COND ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |pred?|))
                           ('T NIL)))))) 

(DECLAIM (NOTINLINE |ExpressionSpace&;|)) 

(DEFUN |ExpressionSpace&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ExpressionSpace&| DV$1))
          (LETT $ (GETREFV 145))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|Ring|))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 '|%dummyVar|)
          (QSETREFV $ 12 (SPADCALL '|%paren| (QREFELT $ 11)))
          (QSETREFV $ 13 (SPADCALL '|%box| (QREFELT $ 11)))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (SPADCALL (QREFELT $ 13) (CONS #'|ExpressionSpace&!0| $)
                       (QREFELT $ 60))
             (SPADCALL (QREFELT $ 12) (CONS #'|ExpressionSpace&!1| $)
                       (QREFELT $ 60)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 140 (CONS (|dispatchFunction| |ES-;even?;SB;48|) $))
             (QSETREFV $ 142 (CONS (|dispatchFunction| |ES-;odd?;SB;49|) $)))))
          $))) 

(DEFUN |ExpressionSpace&!1| (|x| $) (|spadConstant| $ 57)) 

(DEFUN |ExpressionSpace&!0| (|x| $) (|spadConstant| $ 57)) 

(MAKEPROP '|ExpressionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'DUMMYVAR
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppren| '|opbox| (|List| $) (5 . |elt|) |ES-;box;2S;1|
              |ES-;paren;2S;2| (|Boolean|) (11 . |has?|) (17 . |is?|)
              |ES-;belong?;BoB;3| (|List| 40) (|Set| 40) (23 . |parts|)
              (28 . |sort!|) (|List| 61) |ES-;tower;SL;5| (33 . |union|)
              (39 . |set|) (|Mapping| 23 23 23) (|List| 23) (43 . |reduce|)
              |ES-;tower;LL;7| (50 . |setUnion|) (56 . |kernels|)
              (|Mapping| 22 22 22) (|List| 22) (61 . |reduce|)
              |ES-;kernels;LL;8| (|Kernel| 6) (68 . |operator|) (|List| 8)
              |ES-;operators;SL;9| (|NonNegativeInteger|) (73 . |max|)
              (79 . |height|) (|Mapping| 44 44 44) (|List| 44) (84 . |reduce|)
              |ES-;height;SNni;10| (91 . |name|) (|List| 9) (96 . |member?|)
              |ES-;freeOf?;SSB;11| (102 . |is?|) |ES-;distribute;2S;12|
              (108 . |One|) (|Mapping| 6 6) (|BasicOperatorFunctions1| 6)
              (112 . |derivative|) (|Kernel| $) (118 . |retract|)
              (123 . |member?|) |ES-;freeOf?;2SB;13| (129 . |kernel|)
              |ES-;kernel;Bo2S;14| |ES-;elt;Bo2S;15| |ES-;elt;Bo3S;16|
              |ES-;elt;Bo4S;17| |ES-;elt;Bo5S;18| |ES-;elt;Bo6S;19|
              |ES-;elt;Bo7S;20| |ES-;elt;Bo8S;21| |ES-;elt;Bo9S;22|
              |ES-;elt;Bo10S;23| (|Mapping| $ 14) (|List| 76) (135 . |eval|)
              |ES-;eval;SSMS;24| (142 . |name|) |ES-;eval;SBoMS;25| (|List| 6)
              (147 . |first|) (|Mapping| $ $) |ES-;eval;SSMS;26| (152 . |eval|)
              |ES-;eval;SBoMS;27| (|List| 90) (159 . |subst|) (|Equation| $)
              |ES-;subst;SES;28| (|List| 84) |ES-;eval;SLLS;29|
              |ES-;eval;SLLS;30| |ES-;eval;SLLS;31| (165 . |argument|)
              (170 . =) (176 . |coerce|) |ES-;map;MKS;32| (|String|)
              (181 . |string|) |ES-;operator;2Bo;33| (186 . >)
              (|Union| 61 '#1="failed") |ES-;mainKernel;SU;34| (192 . |set|)
              (|Union| (|None|) '"failed") (197 . |property|) (203 . |second|)
              (208 . |remove!|) (214 . |belong?|) |ES-;kernel;BoLS;36|
              (219 . |height|) (224 . |kernel|) (|Union| 44 '"failed")
              (231 . |arity|) (236 . ~=) (|Union| 6 '"failed")
              (242 . |evaluate|) |ES-;elt;BoLS;38| (248 . |mainKernel|)
              (253 . ~=) |ES-;retract;SK;39| |ES-;retractIfCan;SU;40|
              (259 . |retractIfCan|) (264 . |is?|) |ES-;is?;SSB;41|
              |ES-;is?;SBoB;42| (270 . |eval|) |ES-;distribute;3S;44|
              (277 . |eval|) |ES-;eval;SLS;45| (284 . |subst|)
              |ES-;subst;SLS;46| (|Equation| 6) (291 . |lhs|) (296 . |rhs|)
              (|Integer|) (301 . |even?|) (306 . |even?|) (311 . |odd?|)
              (316 . |odd?|) (|Union| 138 '#2="failed") (321 . |retractIfCan|))
           '#(|tower| 326 |subst| 336 |retractIfCan| 348 |retract| 353 |paren|
              358 |operators| 363 |operator| 368 |odd?| 373 |map| 378
              |mainKernel| 384 |kernels| 389 |kernel| 394 |is?| 406 |height|
              418 |freeOf?| 423 |even?| 435 |eval| 440 |elt| 495 |distribute|
              591 |box| 602 |belong?| 607)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|odd?| ((|Boolean|) |#1|)) T)
                                   '((|even?| ((|Boolean|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|freeOf?| ((|Boolean|) |#1| (|Symbol|)))
                                     T)
                                   '((|freeOf?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|map|
                                      (|#1| (|Mapping| |#1| |#1|)
                                       (|Kernel| |#1|)))
                                     T)
                                   '((|kernel|
                                      (|#1| (|BasicOperator|) (|List| |#1|)))
                                     T)
                                   '((|kernel| (|#1| (|BasicOperator|) |#1|))
                                     T)
                                   '((|is?| ((|Boolean|) |#1| (|Symbol|))) T)
                                   '((|is?|
                                      ((|Boolean|) |#1| (|BasicOperator|)))
                                     T)
                                   '((|belong?|
                                      ((|Boolean|) (|BasicOperator|)))
                                     T)
                                   '((|operator|
                                      ((|BasicOperator|) (|BasicOperator|)))
                                     T)
                                   '((|operators|
                                      ((|List| (|BasicOperator|)) |#1|))
                                     T)
                                   '((|tower|
                                      ((|List| (|Kernel| |#1|)) (|List| |#1|)))
                                     T)
                                   '((|tower| ((|List| (|Kernel| |#1|)) |#1|))
                                     T)
                                   '((|kernels|
                                      ((|List| (|Kernel| |#1|)) (|List| |#1|)))
                                     T)
                                   '((|kernels|
                                      ((|List| (|Kernel| |#1|)) |#1|))
                                     T)
                                   '((|mainKernel|
                                      ((|Union| (|Kernel| |#1|) #1#) |#1|))
                                     T)
                                   '((|height| ((|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|distribute| (|#1| |#1| |#1|)) T)
                                   '((|distribute| (|#1| |#1|)) T)
                                   '((|paren| (|#1| |#1|)) T)
                                   '((|box| (|#1| |#1|)) T)
                                   '((|subst|
                                      (|#1| |#1| (|List| (|Kernel| |#1|))
                                       (|List| |#1|)))
                                     T)
                                   '((|subst|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|subst| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) (|List| |#1|)))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#1| |#1|)) T)
                                   '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Kernel| |#1|))
                                       (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| (|Kernel| |#1|) |#1|))
                                     T)
                                   '((|retract| ((|Kernel| |#1|) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Kernel| |#1|) #2#) |#1|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 144
                                            '(1 10 8 9 11 2 6 0 8 14 15 2 8 18
                                              0 9 19 2 8 18 0 9 20 1 23 22 0 24
                                              1 22 0 0 25 2 23 0 0 0 28 0 23 0
                                              29 3 31 23 30 0 23 32 2 22 0 0 0
                                              34 1 6 26 0 35 3 37 22 36 0 22 38
                                              1 40 8 0 41 2 44 0 0 0 45 1 40 44
                                              0 46 3 48 44 47 0 44 49 1 40 9 0
                                              51 2 52 18 9 0 53 2 40 18 0 8 55
                                              0 6 0 57 2 59 8 8 58 60 1 6 61 0
                                              62 2 22 18 40 0 63 2 6 0 8 14 65
                                              3 6 0 0 52 77 78 1 8 9 0 80 1 82
                                              6 0 83 3 6 0 0 42 77 86 2 6 0 0
                                              88 89 1 40 82 0 96 2 82 18 0 0 97
                                              1 6 0 61 98 1 9 100 0 101 2 44 18
                                              0 0 103 1 23 0 22 106 2 8 107 0 9
                                              108 1 82 6 0 109 2 23 0 40 0 110
                                              1 6 18 8 111 1 6 44 0 113 3 40 0
                                              8 82 44 114 1 8 115 0 116 2 44 18
                                              0 0 117 2 59 118 8 82 119 1 6 104
                                              0 121 2 6 18 0 0 122 1 6 104 0
                                              125 2 40 18 0 9 126 3 6 0 0 61 0
                                              129 3 6 0 0 26 14 131 3 6 0 0 26
                                              14 133 1 135 6 0 136 1 135 6 0
                                              137 1 138 18 0 139 1 0 18 0 140 1
                                              138 18 0 141 1 0 18 0 142 1 6 143
                                              0 144 1 0 26 14 33 1 0 26 0 27 2
                                              0 0 0 88 134 2 0 0 0 90 91 1 0
                                              104 0 124 1 0 61 0 123 1 0 0 0 17
                                              1 0 42 0 43 1 0 8 8 102 1 0 18 0
                                              142 2 0 0 84 61 99 1 0 104 0 105
                                              1 0 26 14 39 2 0 0 8 0 66 2 0 0 8
                                              14 112 2 0 18 0 9 127 2 0 18 0 8
                                              128 1 0 44 0 50 2 0 18 0 0 64 2 0
                                              18 0 9 54 1 0 18 0 140 3 0 0 0 8
                                              84 87 3 0 0 0 8 76 81 3 0 0 0 42
                                              92 93 3 0 0 0 42 77 95 3 0 0 0 9
                                              84 85 3 0 0 0 9 76 79 3 0 0 0 52
                                              92 94 2 0 0 0 88 132 2 0 0 8 14
                                              120 9 0 0 8 0 0 0 0 0 0 0 0 74 10
                                              0 0 8 0 0 0 0 0 0 0 0 0 75 7 0 0
                                              8 0 0 0 0 0 0 72 8 0 0 8 0 0 0 0
                                              0 0 0 73 6 0 0 8 0 0 0 0 0 71 4 0
                                              0 8 0 0 0 69 5 0 0 8 0 0 0 0 70 3
                                              0 0 8 0 0 68 2 0 0 8 0 67 1 0 0 0
                                              56 2 0 0 0 0 130 1 0 0 0 16 1 0
                                              18 8 21)))))
           '|lookupComplete|)) 