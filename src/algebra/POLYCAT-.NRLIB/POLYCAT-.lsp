
(SDEFUN |POLYCAT-;eval;SLS;1| ((|p| S) (|l| |List| (|Equation| S)) ($ S))
        (SPROG
         ((#1=#:G428 NIL) (|e| NIL) (#2=#:G427 NIL) (|lvar| (|List| |VarSet|))
          (#3=#:G426 NIL) (#4=#:G425 NIL) (#5=#:G423 NIL) (#6=#:G424 NIL))
         (SEQ
          (COND ((NULL |l|) |p|)
                ('T
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL) (LETT #6# |l|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((QEQCAR
                              (SPADCALL (SPADCALL |e| (QREFELT $ 11))
                                        (QREFELT $ 13))
                              1)
                             (PROGN
                              (LETT #5#
                                    (|error|
                                     "cannot find a variable to evaluate"))
                              (GO #7=#:G417))))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
                   #7# (EXIT #5#))
                  (LETT |lvar|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |e| NIL) (LETT #3# |l|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL (SPADCALL |e| (QREFELT $ 11))
                                                 (QREFELT $ 14))
                                       #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))
                  (EXIT
                   (SPADCALL |p| |lvar|
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |e| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |e| (QREFELT $ 15))
                                                 #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 18))))))))) 

(SDEFUN |POLYCAT-;isPlus;SU;2| ((|p| S) ($ |Union| (|List| S) "failed"))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL (CDR (LETT |l| (SPADCALL |p| (QREFELT $ 21)))))
                 (CONS 1 "failed"))
                ('T (CONS 0 |l|))))) 

(SDEFUN |POLYCAT-;isTimes;SU;3| ((|p| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((|r| (R)) (|l| (|List| S)) (#1=#:G447 NIL) (|v| NIL) (#2=#:G446 NIL)
          (|lv| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (LETT |lv| (SPADCALL |p| (QREFELT $ 24))))
                (NULL (SPADCALL |p| (QREFELT $ 26))))
            (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |l|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |v| NIL) (LETT #1# |lv|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (|spadConstant| $ 27) |v|
                                            (SPADCALL |p| |v| (QREFELT $ 31))
                                            (QREFELT $ 32))
                                  #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))
             (LETT |r| (SPADCALL |p| (QREFELT $ 33)))
             (EXIT
              (COND
               ((SPADCALL |r| (|spadConstant| $ 34) (QREFELT $ 35))
                (COND ((NULL (CDR |lv|)) (CONS 1 "failed"))
                      (#3='T (CONS 0 |l|))))
               (#3# (CONS 0 (CONS (SPADCALL |r| (QREFELT $ 36)) |l|))))))))))) 

(SDEFUN |POLYCAT-;isExpt;SU;4|
        ((|p| S)
         ($ |Union|
          (|Record| (|:| |var| |VarSet|)
                    (|:| |exponent| (|NonNegativeInteger|)))
          "failed"))
        (SPROG ((|d| (|NonNegativeInteger|)) (|u| (|Union| |VarSet| "failed")))
               (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 38)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |u| 1)
                           (NULL
                            (SPADCALL |p|
                                      (SPADCALL (|spadConstant| $ 27)
                                                (QCDR |u|)
                                                (LETT |d|
                                                      (SPADCALL |p| (QCDR |u|)
                                                                (QREFELT $
                                                                         31)))
                                                (QREFELT $ 32))
                                      (QREFELT $ 39))))
                       (CONS 1 "failed"))
                      ('T (CONS 0 (CONS (QCDR |u|) |d|)))))))) 

(SDEFUN |POLYCAT-;coefficient;SVarSetNniS;5|
        ((|p| S) (|v| |VarSet|) (|n| |NonNegativeInteger|) ($ S))
        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 44)) |n| (QREFELT $ 46))) 

(SDEFUN |POLYCAT-;coefficient;SLLS;6|
        ((|p| S) (|lv| |List| |VarSet|) (|ln| |List| (|NonNegativeInteger|))
         ($ S))
        (COND
         ((NULL |lv|)
          (COND ((NULL |ln|) |p|)
                (#1='T (|error| "mismatched lists in coefficient"))))
         ((NULL |ln|) (|error| "mismatched lists in coefficient"))
         (#1#
          (SPADCALL
           (SPADCALL (SPADCALL |p| (|SPADfirst| |lv|) (QREFELT $ 44))
                     (|SPADfirst| |ln|) (QREFELT $ 46))
           (CDR |lv|) (CDR |ln|) (QREFELT $ 49))))) 

(SDEFUN |POLYCAT-;retract;SVarSet;7| ((|p| S) ($ |VarSet|))
        (SPROG ((|q| (|VarSet|)) (#1=#:G468 NIL))
               (SEQ
                (LETT |q|
                      (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 38)))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                        (|Union| (QREFELT $ 9) "failed") #1#)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |q| (QREFELT $ 51)) |p| (QREFELT $ 39))
                   |q|)
                  ('T (|error| "Polynomial is not a single variable"))))))) 

(SDEFUN |POLYCAT-;retractIfCan;SU;8| ((|p| S) ($ |Union| |VarSet| "failed"))
        (SPROG ((#1=#:G478 NIL) (|q| (|Union| |VarSet| "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |q| (SPADCALL |p| (QREFELT $ 38)))
                       (EXIT
                        (COND
                         ((QEQCAR |q| 0)
                          (COND
                           ((SPADCALL (SPADCALL (QCDR |q|) (QREFELT $ 51)) |p|
                                      (QREFELT $ 39))
                            (PROGN (LETT #1# |q|) (GO #2=#:G476))))))))
                  (EXIT (CONS 1 "failed"))))
                #2# (EXIT #1#)))) 

(SDEFUN |POLYCAT-;totalDegree;SNni;9| ((|p| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|u| (|SparseUnivariatePolynomial| S)) (|d| (|NonNegativeInteger|))
          (#1=#:G480 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 54)) 0)
                ('T
                 (SEQ
                  (LETT |u|
                        (SPADCALL |p|
                                  (PROG2
                                      (LETT #1# (SPADCALL |p| (QREFELT $ 38)))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             "failed")
                                                    #1#))
                                  (QREFELT $ 44)))
                  (LETT |d| 0)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |u| (|spadConstant| $ 57) (QREFELT $ 58)))
                         (GO G191)))
                       (SEQ
                        (LETT |d|
                              (MAX |d|
                                   (+ (SPADCALL |u| (QREFELT $ 59))
                                      (SPADCALL (SPADCALL |u| (QREFELT $ 60))
                                                (QREFELT $ 61)))))
                        (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 62)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |d|))))))) 

(SDEFUN |POLYCAT-;totalDegreeSorted;SLNni;10|
        ((|p| S) (|lv| |List| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG
         ((|u| (|SparseUnivariatePolynomial| S))
          (|d| #1=(|NonNegativeInteger|)) (|w| #1#) (|v0| (|VarSet|))
          (#2=#:G501 NIL) (|v| (|VarSet|)) (#3=#:G490 NIL))
         (SEQ
          (EXIT
           (COND ((OR (SPADCALL |p| (QREFELT $ 54)) (NULL |lv|)) 0)
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL |p|
                                   (LETT |v|
                                         (PROG2
                                             (LETT #3#
                                                   (SPADCALL |p|
                                                             (QREFELT $ 38)))
                                             (QCDR #3#)
                                           (|check_union2| (QEQCAR #3# 0)
                                                           (QREFELT $ 9)
                                                           (|Union|
                                                            (QREFELT $ 9)
                                                            "failed")
                                                           #3#)))
                                   (QREFELT $ 44)))
                   (LETT |d| 0) (LETT |w| 0) (LETT |v0| (|SPADfirst| |lv|))
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |v| |v0| (QREFELT $ 64))) (GO G191)))
                        (SEQ (LETT |lv| (CDR |lv|))
                             (EXIT
                              (COND
                               ((NULL |lv|)
                                (PROGN (LETT #2# 0) (GO #4=#:G500)))
                               ('T (LETT |v0| (|SPADfirst| |lv|))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (COND
                    ((SPADCALL |v0| |v| (QREFELT $ 65))
                     (SEQ (LETT |w| 1) (EXIT (LETT |lv| (CDR |lv|))))))
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |u| (|spadConstant| $ 57) (QREFELT $ 58)))
                          (GO G191)))
                        (SEQ
                         (LETT |d|
                               (MAX |d|
                                    (+ (* |w| (SPADCALL |u| (QREFELT $ 59)))
                                       (SPADCALL (SPADCALL |u| (QREFELT $ 60))
                                                 |lv| (QREFELT $ 66)))))
                         (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 62)))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |d|)))))
          #4# (EXIT #2#)))) 

(SDEFUN |POLYCAT-;totalDegree;SLNni;11|
        ((|p| S) (|lv| |List| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG ((|lv1| (|List| |VarSet|)))
               (SEQ
                (LETT |lv1|
                      (SPADCALL (CONS #'|POLYCAT-;totalDegree;SLNni;11!0| $)
                                |lv| (QREFELT $ 69)))
                (EXIT (SPADCALL |p| |lv1| (QREFELT $ 66)))))) 

(SDEFUN |POLYCAT-;totalDegree;SLNni;11!0| ((|v1| NIL) (|v2| NIL) ($ NIL))
        (SPADCALL |v2| |v1| (QREFELT $ 64))) 

(SDEFUN |POLYCAT-;resultant;2SVarSetS;12|
        ((|p1| S) (|p2| S) (|mvar| |VarSet|) ($ S))
        (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 44))
                  (SPADCALL |p2| |mvar| (QREFELT $ 44)) (QREFELT $ 71))) 

(SDEFUN |POLYCAT-;discriminant;SVarSetS;13| ((|p| S) (|var| |VarSet|) ($ S))
        (SPADCALL (SPADCALL |p| |var| (QREFELT $ 44)) (QREFELT $ 73))) 

(SDEFUN |POLYCAT-;allMonoms| ((|l| |List| S) ($ |List| S))
        (SPROG ((#1=#:G512 NIL) (|p| NIL) (#2=#:G511 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |p| NIL) (LETT #1# |l|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 75)) #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 77))
                 (QREFELT $ 78))))) 

(SDEFUN |POLYCAT-;P2R|
        ((|p| S) (|b| |List| E) (|n| |NonNegativeInteger|) ($ |Vector| R))
        (SPROG
         ((#1=#:G516 NIL) (|i| NIL) (#2=#:G517 NIL) (|bj| NIL)
          (|w| (|Vector| R)))
         (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| $ 56)))
              (SEQ (LETT |bj| NIL) (LETT #2# |b|)
                   (LETT |i| (SPADCALL |w| (QREFELT $ 81)))
                   (LETT #1# (QVSIZE |w|)) G190
                   (COND
                    ((OR (> |i| #1#) (ATOM #2#)
                         (PROGN (LETT |bj| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1O |w| |i| (SPADCALL |p| |bj| (QREFELT $ 82))
                                 1)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |w|)))) 

(SDEFUN |POLYCAT-;eq2R| ((|l| |List| S) (|b| |List| E) ($ |Matrix| R))
        (SPROG
         ((#1=#:G524 NIL) (|p| NIL) (#2=#:G523 NIL) (#3=#:G522 NIL) (|bj| NIL)
          (#4=#:G521 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |bj| NIL) (LETT #3# |b|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |bj| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |p| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |p| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL |p| |bj| (QREFELT $ 82))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT $ 85))))) 

(SDEFUN |POLYCAT-;reducedSystem;MM;17| ((|m| |Matrix| S) ($ |Matrix| R))
        (SPROG
         ((|l| (|List| (|List| S))) (|mm| (|Matrix| R)) (|d| (|List| E))
          (#1=#:G538 NIL) (|bj| NIL) (#2=#:G537 NIL) (|b| (|List| S))
          (#3=#:G536 NIL) (|r| NIL) (#4=#:G535 NIL))
         (SEQ (LETT |l| (SPADCALL |m| (QREFELT $ 88)))
              (LETT |b|
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #4# NIL)
                       (SEQ (LETT |r| NIL) (LETT #3# |l|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (|POLYCAT-;allMonoms| |r| $) #4#))))
                            (LETT #3# (CDR #3#)) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 77))
                     (QREFELT $ 78)))
              (EXIT
               (COND
                ((NULL |b|)
                 (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| $ 56)))
                ('T
                 (SEQ
                  (LETT |d|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |bj| NIL) (LETT #1# |b|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |bj| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |bj| (QREFELT $ 89))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $))
                  (LETT |l| (CDR |l|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                       (SEQ
                        (LETT |mm|
                              (SPADCALL |mm|
                                        (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d|
                                         $)
                                        (QREFELT $ 90)))
                        (EXIT (LETT |l| (CDR |l|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |mm|)))))))) 

(SDEFUN |POLYCAT-;reducedSystem;MVR;18|
        ((|m| |Matrix| S) (|v| |Vector| S)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPROG
         ((|r| (|List| S)) (|l| (|List| (|List| S))) (|w| (|Vector| R))
          (|mm| (|Matrix| R)) (|n| (|NonNegativeInteger|)) (|d| (|List| E))
          (#1=#:G554 NIL) (|bj| NIL) (#2=#:G553 NIL) (|b| (|List| S))
          (#3=#:G552 NIL) (|s| NIL) (#4=#:G551 NIL))
         (SEQ (LETT |l| (SPADCALL |m| (QREFELT $ 88)))
              (LETT |r| (SPADCALL |v| (QREFELT $ 94)))
              (LETT |b|
                    (SPADCALL
                     (SPADCALL (|POLYCAT-;allMonoms| |r| $)
                               (SPADCALL
                                (PROGN
                                 (LETT #4# NIL)
                                 (SEQ (LETT |s| NIL) (LETT #3# |l|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |s| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #4#
                                              (CONS
                                               (|POLYCAT-;allMonoms| |s| $)
                                               #4#))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT (NREVERSE #4#))))
                                (QREFELT $ 77))
                               (QREFELT $ 95))
                     (QREFELT $ 78)))
              (EXIT
               (COND
                ((NULL |b|)
                 (CONS (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| $ 56))
                       (MAKEARR1 0 (|spadConstant| $ 56))))
                ('T
                 (SEQ
                  (LETT |d|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |bj| NIL) (LETT #1# |b|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |bj| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |bj| (QREFELT $ 89))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (LETT |n| (LENGTH |d|))
                  (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $))
                  (LETT |w| (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n| $))
                  (LETT |l| (CDR |l|)) (LETT |r| (CDR |r|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                       (SEQ
                        (LETT |mm|
                              (SPADCALL |mm|
                                        (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d|
                                         $)
                                        (QREFELT $ 90)))
                        (LETT |w|
                              (SPADCALL |w|
                                        (|POLYCAT-;P2R| (|SPADfirst| |r|) |d|
                                         |n| $)
                                        (QREFELT $ 96)))
                        (LETT |l| (CDR |l|)) (EXIT (LETT |r| (CDR |r|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS |mm| |w|))))))))) 

(SDEFUN |POLYCAT-;solveLinearPolynomialEquation;LSupU;19|
        ((|lpp| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 103))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;20|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 109))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;21|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 109))) 

(SDEFUN |POLYCAT-;factor;SF;22| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 113))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;23|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (ELT $ 116) (QREFELT $ 119))) 

(SDEFUN |POLYCAT-;factor;SF;24| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (ELT $ 116) (QREFELT $ 120))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;25|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (ELT $ 116) (QREFELT $ 119))) 

(SDEFUN |POLYCAT-;gcdPolynomial;3Sup;26|
        ((|pp| |SparseUnivariatePolynomial| S)
         (|qq| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL |pp| |qq| (QREFELT $ 122))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;27|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 124))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;28|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 125))) 

(SDEFUN |POLYCAT-;factor;SF;29| ((|p| S) ($ |Factored| S))
        (SPROG
         ((#1=#:G594 NIL) (|ww| NIL) (#2=#:G593 NIL)
          (|ansSUP| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|up| (|SparseUnivariatePolynomial| S)) (#3=#:G592 NIL) (|w| NIL)
          (#4=#:G591 NIL) (|ansR| (|Factored| R))
          (|v| (|Union| |VarSet| "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 38)))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ
                  (LETT |ansR|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                  (QREFELT $ 126)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ansR| (QREFELT $ 128)) (QREFELT $ 36))
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |w| NIL)
                          (LETT #3# (SPADCALL |ansR| (QREFELT $ 132))) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (SPADCALL (QVELT |w| 1)
                                                     (QREFELT $ 36))
                                           (QVELT |w| 2))
                                   #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (QREFELT $ 135)))))
                ('T
                 (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 44)))
                      (LETT |ansSUP| (SPADCALL |up| (QREFELT $ 124)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |ansSUP| (QREFELT $ 136))
                                  (QCDR |v|) (QREFELT $ 137))
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |ww| NIL)
                              (LETT #1# (SPADCALL |ansSUP| (QREFELT $ 140)))
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |ww| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (QVELT |ww| 0)
                                               (SPADCALL (QVELT |ww| 1)
                                                         (QCDR |v|)
                                                         (QREFELT $ 137))
                                               (QVELT |ww| 2))
                                       #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 135)))))))))) 

(SDEFUN |POLYCAT-;gcdPolynomial;3Sup;30|
        ((|pp| |SparseUnivariatePolynomial| S)
         (|qq| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL |pp| |qq| (QREFELT $ 122))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;31|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 124))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;32|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 125))) 

(SDEFUN |POLYCAT-;factor;SF;33| ((|p| S) ($ |Factored| S))
        (SPROG
         ((#1=#:G618 NIL) (|ww| NIL) (#2=#:G617 NIL)
          (|ansSUP| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|up| (|SparseUnivariatePolynomial| S)) (#3=#:G616 NIL) (|w| NIL)
          (#4=#:G615 NIL) (|ansR| (|Factored| R))
          (|v| (|Union| |VarSet| "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 38)))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ
                  (LETT |ansR|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                  (QREFELT $ 126)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ansR| (QREFELT $ 128)) (QREFELT $ 36))
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |w| NIL)
                          (LETT #3# (SPADCALL |ansR| (QREFELT $ 132))) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (SPADCALL (QVELT |w| 1)
                                                     (QREFELT $ 36))
                                           (QVELT |w| 2))
                                   #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (QREFELT $ 135)))))
                ('T
                 (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 44)))
                      (LETT |ansSUP| (SPADCALL |up| (QREFELT $ 124)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |ansSUP| (QREFELT $ 136))
                                  (QCDR |v|) (QREFELT $ 137))
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |ww| NIL)
                              (LETT #1# (SPADCALL |ansSUP| (QREFELT $ 140)))
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |ww| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (QVELT |ww| 0)
                                               (SPADCALL (QVELT |ww| 1)
                                                         (QCDR |v|)
                                                         (QREFELT $ 137))
                                               (QVELT |ww| 2))
                                       #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 135)))))))))) 

(SDEFUN |POLYCAT-;conditionP;MU;34|
        ((|mat| |Matrix| S) ($ |Union| (|Vector| S) #1="failed"))
        (SPROG
         ((#2=#:G641 NIL) (#3=#:G640 (S)) (#4=#:G642 (S))
          (|i| (|NonNegativeInteger|)) (#5=#:G661 NIL) (|m| NIL)
          (#6=#:G658 NIL) (#7=#:G660 NIL) (|mons| #8=(|List| S))
          (#9=#:G659 NIL) (|ans| (|Union| (|Vector| R) #1#))
          (|monslist| (|List| (|List| S))) (|llR| (|List| (|List| R)))
          (#10=#:G656 NIL) (|u| NIL) (#11=#:G657 NIL) (|v| NIL)
          (#12=#:G655 NIL) (|redmons| (|List| S))
          (|deg1| (|List| (|NonNegativeInteger|))) (#13=#:G629 NIL)
          (#14=#:G647 NIL) (|nd| (|Union| (|Integer|) "failed"))
          (#15=#:G654 NIL) (|d| NIL) (#16=#:G653 NIL)
          (|degs| (|List| (|NonNegativeInteger|))) (|vars| (|List| |VarSet|))
          (#17=#:G652 NIL) (#18=#:G624 NIL) (#19=#:G623 #8#) (#20=#:G625 #8#)
          (#21=#:G651 NIL) (#22=#:G650 NIL) (|l| NIL) (|ch| (|Integer|))
          (#23=#:G649 NIL) (|z| NIL) (#24=#:G648 NIL)
          (|ll| (|List| (|List| S))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ll|
                  (SPADCALL (SPADCALL |mat| (QREFELT $ 141)) (QREFELT $ 88)))
            (LETT |llR|
                  (PROGN
                   (LETT #24# NIL)
                   (SEQ (LETT |z| NIL) (LETT #23# (|SPADfirst| |ll|)) G190
                        (COND
                         ((OR (ATOM #23#) (PROGN (LETT |z| (CAR #23#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #24# (CONS NIL #24#))))
                        (LETT #23# (CDR #23#)) (GO G190) G191
                        (EXIT (NREVERSE #24#)))))
            (LETT |monslist| NIL) (LETT |ch| (SPADCALL (QREFELT $ 142)))
            (SEQ (LETT |l| NIL) (LETT #22# |ll|) G190
                 (COND
                  ((OR (ATOM #22#) (PROGN (LETT |l| (CAR #22#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |mons|
                        (PROGN
                         (LETT #18# NIL)
                         (SEQ (LETT |u| NIL) (LETT #21# |l|) G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |u| (CAR #21#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #20# (SPADCALL |u| (QREFELT $ 75)))
                                 (COND
                                  (#18#
                                   (LETT #19#
                                         (SPADCALL #19# #20# (QREFELT $ 143))))
                                  ('T
                                   (PROGN (LETT #19# #20#) (LETT #18# 'T)))))))
                              (LETT #21# (CDR #21#)) (GO G190) G191 (EXIT NIL))
                         (COND (#18# #19#)
                               ('T (|IdentityError| '|setUnion|)))))
                  (LETT |redmons| NIL)
                  (SEQ (LETT |m| NIL) (LETT #17# |mons|) G190
                       (COND
                        ((OR (ATOM #17#) (PROGN (LETT |m| (CAR #17#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |vars| (SPADCALL |m| (QREFELT $ 24)))
                            (LETT |degs| (SPADCALL |m| |vars| (QREFELT $ 144)))
                            (LETT |deg1|
                                  (PROGN
                                   (LETT #16# NIL)
                                   (SEQ (LETT |d| NIL) (LETT #15# |degs|) G190
                                        (COND
                                         ((OR (ATOM #15#)
                                              (PROGN
                                               (LETT |d| (CAR #15#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #16#
                                                (CONS
                                                 (SEQ
                                                  (LETT |nd|
                                                        (SPADCALL |d| |ch|
                                                                  (QREFELT $
                                                                           146)))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |nd| 1)
                                                     (PROGN
                                                      (LETT #14#
                                                            (CONS 1 "failed"))
                                                      (GO #25=#:G646)))
                                                    ('T
                                                     (PROG1
                                                         (LETT #13#
                                                               (QCDR |nd|))
                                                       (|check_subtype2|
                                                        (>= #13# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #13#))))))
                                                 #16#))))
                                        (LETT #15# (CDR #15#)) (GO G190) G191
                                        (EXIT (NREVERSE #16#)))))
                            (LETT |redmons|
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 27) |vars|
                                             |deg1| (QREFELT $ 147))
                                   |redmons|))
                            (EXIT
                             (LETT |llR|
                                   (PROGN
                                    (LETT #12# NIL)
                                    (SEQ (LETT |v| NIL) (LETT #11# |llR|)
                                         (LETT |u| NIL) (LETT #10# |l|) G190
                                         (COND
                                          ((OR (ATOM #10#)
                                               (PROGN
                                                (LETT |u| (CAR #10#))
                                                NIL)
                                               (ATOM #11#)
                                               (PROGN
                                                (LETT |v| (CAR #11#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #12#
                                                 (CONS
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |u| |vars| |degs|
                                                              (QREFELT $ 49))
                                                    (QREFELT $ 148))
                                                   |v|)
                                                  #12#))))
                                         (LETT #10#
                                               (PROG1 (CDR #10#)
                                                 (LETT #11# (CDR #11#))))
                                         (GO G190) G191
                                         (EXIT (NREVERSE #12#)))))))
                       (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |monslist| (CONS |redmons| |monslist|))))
                 (LETT #22# (CDR #22#)) (GO G190) G191 (EXIT NIL))
            (LETT |ans|
                  (SPADCALL
                   (SPADCALL (SPADCALL |llR| (QREFELT $ 85)) (QREFELT $ 149))
                   (QREFELT $ 151)))
            (EXIT
             (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |i| 0)
                         (EXIT
                          (CONS 0
                                (PROGN
                                 (LETT #9# (GETREFV (SIZE |monslist|)))
                                 (SEQ (LETT |mons| NIL) (LETT #7# |monslist|)
                                      (LETT #6# 0) G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN
                                             (LETT |mons| (CAR #7#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT #9# #6#
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (SEQ (LETT |m| NIL)
                                                      (LETT #5# |mons|) G190
                                                      (COND
                                                       ((OR (ATOM #5#)
                                                            (PROGN
                                                             (LETT |m|
                                                                   (CAR #5#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #4#
                                                               (SPADCALL |m|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QCDR
                                                                            |ans|)
                                                                           (LETT
                                                                            |i|
                                                                            (+
                                                                             |i|
                                                                             1))
                                                                           (QREFELT
                                                                            $
                                                                            152))
                                                                          (QREFELT
                                                                           $
                                                                           36))
                                                                         (QREFELT
                                                                          $
                                                                          153)))
                                                         (COND
                                                          (#2#
                                                           (LETT #3#
                                                                 (SPADCALL #3#
                                                                           #4#
                                                                           (QREFELT
                                                                            $
                                                                            154))))
                                                          ('T
                                                           (PROGN
                                                            (LETT #3# #4#)
                                                            (LETT #2# 'T)))))))
                                                      (LETT #5# (CDR #5#))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#2# #3#)
                                                       ('T
                                                        (|spadConstant| $
                                                                        55)))))))
                                      (LETT #6#
                                            (PROG1 (|inc_SI| #6#)
                                              (LETT #7# (CDR #7#))))
                                      (GO G190) G191 (EXIT NIL))
                                 #9#)))))))))
          #25# (EXIT #14#)))) 

(SDEFUN |POLYCAT-;charthRoot;SU;35| ((|p| S) ($ |Union| S "failed"))
        (SPROG
         ((|ch| (|NonNegativeInteger|)) (|ans| (|Union| R "failed"))
          (|vars| (|List| |VarSet|)))
         (SEQ (LETT |vars| (SPADCALL |p| (QREFELT $ 24)))
              (EXIT
               (COND
                ((NULL |vars|)
                 (SEQ
                  (LETT |ans|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 148))
                                  (QREFELT $ 156)))
                  (EXIT
                   (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                         (#1='T
                          (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 36))))))))
                (#1#
                 (SEQ (LETT |ch| (SPADCALL (QREFELT $ 142)))
                      (EXIT (|POLYCAT-;charthRootlv| |p| |vars| |ch| $))))))))) 

(SDEFUN |POLYCAT-;charthRootlv|
        ((|p| S) (|vars| |List| |VarSet|) (|ch| |NonNegativeInteger|)
         ($ |Union| S #1="failed"))
        (SPROG
         ((#2=#:G691 NIL) (|ansx| (|Union| S #1#)) (|ans| (S)) (#3=#:G683 NIL)
          (|d| (|NonNegativeInteger|)) (|cp| (S))
          (|dd| (|Union| (|Integer|) "failed")) (|v| (|VarSet|)))
         (SEQ
          (EXIT
           (COND
            ((NULL |vars|)
             (SEQ
              (LETT |ans|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 148)) (QREFELT $ 156)))
              (EXIT
               (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                     (#4='T
                      (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 36))))))))
            (#4#
             (SEQ (LETT |v| (|SPADfirst| |vars|)) (LETT |vars| (CDR |vars|))
                  (LETT |d| (SPADCALL |p| |v| (QREFELT $ 31)))
                  (LETT |ans| (|spadConstant| $ 55))
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |d| 0 (QREFELT $ 158))) (GO G191)))
                       (SEQ (LETT |dd| (SPADCALL |d| |ch| (QREFELT $ 146)))
                            (EXIT
                             (COND
                              ((QEQCAR |dd| 1)
                               (PROGN
                                (LETT #2# (CONS 1 "failed"))
                                (GO #5=#:G690)))
                              ('T
                               (SEQ
                                (LETT |cp|
                                      (SPADCALL |p| |v| |d| (QREFELT $ 159)))
                                (LETT |p|
                                      (SPADCALL |p|
                                                (SPADCALL |cp| |v| |d|
                                                          (QREFELT $ 32))
                                                (QREFELT $ 160)))
                                (LETT |ansx|
                                      (|POLYCAT-;charthRootlv| |cp| |vars| |ch|
                                       $))
                                (EXIT
                                 (COND
                                  ((QEQCAR |ansx| 1)
                                   (PROGN
                                    (LETT #2# (CONS 1 "failed"))
                                    (GO #5#)))
                                  ('T
                                   (SEQ
                                    (LETT |d|
                                          (SPADCALL |p| |v| (QREFELT $ 31)))
                                    (EXIT
                                     (LETT |ans|
                                           (SPADCALL |ans|
                                                     (SPADCALL (QCDR |ansx|)
                                                               |v|
                                                               (PROG1
                                                                   (LETT #3#
                                                                         (QCDR
                                                                          |dd|))
                                                                 (|check_subtype2|
                                                                  (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                                               (QREFELT $ 32))
                                                     (QREFELT $
                                                              154)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |ansx| (|POLYCAT-;charthRootlv| |p| |vars| |ch| $))
                  (EXIT
                   (COND
                    ((QEQCAR |ansx| 1)
                     (PROGN (LETT #2# (CONS 1 "failed")) (GO #5#)))
                    (#4#
                     (PROGN
                      (LETT #2#
                            (CONS 0
                                  (SPADCALL |ans| (QCDR |ansx|)
                                            (QREFELT $ 154))))
                      (GO #5#)))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |POLYCAT-;monicDivide;2SVarSetR;37|
        ((|p1| S) (|p2| S) (|mvar| |VarSet|)
         ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((|result|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| S))
                     (|:| |remainder| (|SparseUnivariatePolynomial| S)))))
         (SEQ
          (LETT |result|
                (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 44))
                          (SPADCALL |p2| |mvar| (QREFELT $ 44))
                          (QREFELT $ 162)))
          (EXIT
           (CONS (SPADCALL (QCAR |result|) |mvar| (QREFELT $ 137))
                 (SPADCALL (QCDR |result|) |mvar| (QREFELT $ 137))))))) 

(SDEFUN |POLYCAT-;squareFree;SF;38| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 165))) 

(SDEFUN |POLYCAT-;squareFree;SF;39| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 168))) 

(SDEFUN |POLYCAT-;squareFree;SF;40| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 168))) 

(SDEFUN |POLYCAT-;squareFreePart;2S;41| ((|p| S) ($ S))
        (SPROG
         ((#1=#:G701 NIL) (#2=#:G700 (S)) (#3=#:G702 (S)) (#4=#:G704 NIL)
          (|f| NIL) (|s| (|Factored| S)))
         (SEQ
          (SPADCALL
           (SPADCALL (LETT |s| (SPADCALL |p| (QREFELT $ 169))) (QREFELT $ 170))
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |f| NIL) (LETT #4# (SPADCALL |s| (QREFELT $ 171))) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3# (QVELT |f| 1))
                    (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 153))))
                          ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 27))))
           (QREFELT $ 153))))) 

(SDEFUN |POLYCAT-;content;SVarSetS;42| ((|p| S) (|v| |VarSet|) ($ S))
        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 44)) (QREFELT $ 173))) 

(SDEFUN |POLYCAT-;primitivePart;2S;43| ((|p| S) ($ S))
        (SPROG ((#1=#:G707 NIL))
               (COND ((SPADCALL |p| (QREFELT $ 175)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p| (SPADCALL |p| (QREFELT $ 176))
                                            (QREFELT $ 177)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))
                        (QREFELT $ 179))
                       1))))) 

(SDEFUN |POLYCAT-;primitivePart;SVarSetS;44| ((|p| S) (|v| |VarSet|) ($ S))
        (SPROG ((#1=#:G713 NIL))
               (COND ((SPADCALL |p| (QREFELT $ 175)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p|
                                            (SPADCALL |p| |v| (QREFELT $ 181))
                                            (QREFELT $ 182)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))
                        (QREFELT $ 179))
                       1))))) 

(SDEFUN |POLYCAT-;smaller?;2SB;45| ((|p| S) (|q| S) ($ |Boolean|))
        (SPROG ((#1=#:G725 NIL) (|lq| (R)) (|lp| (R)) (|dq| (E)) (|dp| (E)))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL |p| (|spadConstant| $ 55)
                                      (QREFELT $ 184))
                            (SPADCALL |q| (|spadConstant| $ 55)
                                      (QREFELT $ 184)))
                           ('T NIL)))
                         (GO G191)))
                       (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 89)))
                            (LETT |dq| (SPADCALL |q| (QREFELT $ 89)))
                            (EXIT
                             (COND
                              ((SPADCALL |dp| |dq| (QREFELT $ 185))
                               (PROGN
                                (LETT #1#
                                      (SPADCALL (|spadConstant| $ 56)
                                                (SPADCALL |q| (QREFELT $ 33))
                                                (QREFELT $ 187)))
                                (GO #2=#:G724)))
                              ((SPADCALL |dq| |dp| (QREFELT $ 185))
                               (PROGN
                                (LETT #1#
                                      (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                                (|spadConstant| $ 56)
                                                (QREFELT $ 187)))
                                (GO #2#)))
                              ('T
                               (SEQ (LETT |lp| (SPADCALL |p| (QREFELT $ 33)))
                                    (LETT |lq| (SPADCALL |q| (QREFELT $ 33)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |lp| |lq| (QREFELT $ 188))
                                       (PROGN
                                        (LETT #1#
                                              (SPADCALL |lp| |lq|
                                                        (QREFELT $ 187)))
                                        (GO #2#)))
                                      ('T
                                       (SEQ
                                        (LETT |p|
                                              (SPADCALL |p| (QREFELT $ 189)))
                                        (EXIT
                                         (LETT |q|
                                               (SPADCALL |q|
                                                         (QREFELT $
                                                                  189)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((SPADCALL |p| (|spadConstant| $ 55) (QREFELT $ 39))
                     (SPADCALL (|spadConstant| $ 56)
                               (SPADCALL |q| (QREFELT $ 33)) (QREFELT $ 187)))
                    ('T
                     (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                               (|spadConstant| $ 56) (QREFELT $ 187)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |POLYCAT-;patternMatch;SP2Pmr;46|
        ((|p| S) (|pat| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) S)
         ($ |PatternMatchResult| (|Integer|) S))
        (SPADCALL |p| |pat| |l| (QREFELT $ 194))) 

(SDEFUN |POLYCAT-;patternMatch;SP2Pmr;47|
        ((|p| S) (|pat| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) S)
         ($ |PatternMatchResult| (|Float|) S))
        (SPADCALL |p| |pat| |l| (QREFELT $ 200))) 

(SDEFUN |POLYCAT-;convert;SP;48| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (ELT $ 203) (ELT $ 204) |x| (QREFELT $ 208))) 

(SDEFUN |POLYCAT-;convert;SP;49| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (ELT $ 210) (ELT $ 211) |x| (QREFELT $ 215))) 

(SDEFUN |POLYCAT-;convert;SIf;50| ((|p| S) ($ |InputForm|))
        (SPADCALL (ELT $ 218) (ELT $ 219) |p| (QREFELT $ 223))) 

(DECLAIM (NOTINLINE |PolynomialCategory&;|)) 

(DEFUN |PolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 233))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|GcdDomain|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#4|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#4|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|SemiRing|))))))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 15)
      (QSETREFV $ 20 (CONS (|dispatchFunction| |POLYCAT-;eval;SLS;1|) $))))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 37 (CONS (|dispatchFunction| |POLYCAT-;isTimes;SU;3|) $))
       (QSETREFV $ 42 (CONS (|dispatchFunction| |POLYCAT-;isExpt;SU;4|) $)))))
    (COND
     ((|HasCategory| |#1| '(|CommutativeRing|))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 72
                   (CONS (|dispatchFunction| |POLYCAT-;resultant;2SVarSetS;12|)
                         $))
         (QSETREFV $ 74
                   (CONS
                    (|dispatchFunction| |POLYCAT-;discriminant;SVarSetS;13|)
                    $)))))))
    (COND
     ((|HasCategory| |#2| '(|IntegralDomain|))
      (PROGN
       (QSETREFV $ 92
                 (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MM;17|) $))
       (QSETREFV $ 99
                 (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MVR;18|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 106
                 (CONS
                  (|dispatchFunction|
                   |POLYCAT-;solveLinearPolynomialEquation;LSupU;19|)
                  $))
       (COND
        ((|HasCategory| |#2| '(|FiniteFieldCategory|))
         (PROGN
          (QSETREFV $ 111
                    (CONS
                     (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;20|)
                     $))
          (QSETREFV $ 112
                    (CONS
                     (|dispatchFunction|
                      |POLYCAT-;factorSquareFreePolynomial;SupF;21|)
                     $))
          (QSETREFV $ 115
                    (CONS (|dispatchFunction| |POLYCAT-;factor;SF;22|) $))))
        ((|HasCategory| |#2| '(|CharacteristicZero|))
         (COND
          ((|HasCategory| |#2| '(|EuclideanDomain|))
           (PROGN
            (QSETREFV $ 111
                      (CONS
                       (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;23|)
                       $))
            (QSETREFV $ 115
                      (CONS (|dispatchFunction| |POLYCAT-;factor;SF;24|) $))
            (QSETREFV $ 112
                      (CONS
                       (|dispatchFunction|
                        |POLYCAT-;factorSquareFreePolynomial;SupF;25|)
                       $))))
          ('T
           (PROGN
            (QSETREFV $ 123
                      (CONS
                       (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;26|)
                       $))
            (QSETREFV $ 111
                      (CONS
                       (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;27|)
                       $))
            (QSETREFV $ 112
                      (CONS
                       (|dispatchFunction|
                        |POLYCAT-;factorSquareFreePolynomial;SupF;28|)
                       $))
            (QSETREFV $ 115
                      (CONS (|dispatchFunction| |POLYCAT-;factor;SF;29|)
                            $))))))
        ('T
         (PROGN
          (QSETREFV $ 123
                    (CONS (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;30|)
                          $))
          (QSETREFV $ 111
                    (CONS
                     (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;31|)
                     $))
          (QSETREFV $ 112
                    (CONS
                     (|dispatchFunction|
                      |POLYCAT-;factorSquareFreePolynomial;SupF;32|)
                     $))
          (QSETREFV $ 115
                    (CONS (|dispatchFunction| |POLYCAT-;factor;SF;33|) $)))))
       (COND
        ((|HasCategory| |#2| '(|CharacteristicNonZero|))
         (PROGN
          (QSETREFV $ 155
                    (CONS (|dispatchFunction| |POLYCAT-;conditionP;MU;34|)
                          $))))))))
    (COND
     ((|HasCategory| |#2| '(|CharacteristicNonZero|))
      (PROGN
       (QSETREFV $ 157
                 (CONS (|dispatchFunction| |POLYCAT-;charthRoot;SU;35|) $)))))
    (COND
     ((|testBitVector| |pv$| 14)
      (QSETREFV $ 163
                (CONS (|dispatchFunction| |POLYCAT-;monicDivide;2SVarSetR;37|)
                      $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (COND
        ((|HasCategory| |#2| '(|EuclideanDomain|))
         (COND
          ((|HasCategory| |#2| '(|CharacteristicZero|))
           (QSETREFV $ 166
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;38|)
                           $)))
          ('T
           (QSETREFV $ 166
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;39|)
                           $)))))
        ('T
         (QSETREFV $ 166
                   (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;40|) $))))
       (QSETREFV $ 172
                 (CONS (|dispatchFunction| |POLYCAT-;squareFreePart;2S;41|) $))
       (QSETREFV $ 174
                 (CONS (|dispatchFunction| |POLYCAT-;content;SVarSetS;42|) $))
       (QSETREFV $ 180
                 (CONS (|dispatchFunction| |POLYCAT-;primitivePart;2S;43|) $))
       (QSETREFV $ 183
                 (CONS
                  (|dispatchFunction| |POLYCAT-;primitivePart;SVarSetS;44|)
                  $)))))
    (COND
     ((|HasCategory| |#2| '(|Comparable|))
      (PROGN
       (QSETREFV $ 190
                 (CONS (|dispatchFunction| |POLYCAT-;smaller?;2SB;45|) $))
       (COND
        ((|testBitVector| |pv$| 14)
         (PROGN
          (COND
           ((|testBitVector| |pv$| 7)
            (COND
             ((|testBitVector| |pv$| 6)
              (QSETREFV $ 196
                        (CONS
                         (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;46|)
                         $))))))
          (COND
           ((|testBitVector| |pv$| 5)
            (COND
             ((|testBitVector| |pv$| 4)
              (QSETREFV $ 202
                        (CONS
                         (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;47|)
                         $))))))))))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 11)
         (COND
          ((|testBitVector| |pv$| 10)
           (QSETREFV $ 209
                     (CONS (|dispatchFunction| |POLYCAT-;convert;SP;48|)
                           $))))))
       (COND
        ((|testBitVector| |pv$| 9)
         (COND
          ((|testBitVector| |pv$| 8)
           (QSETREFV $ 216
                     (CONS (|dispatchFunction| |POLYCAT-;convert;SP;49|)
                           $)))))))))
    (COND
     ((|testBitVector| |pv$| 13)
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 224
                  (CONS (|dispatchFunction| |POLYCAT-;convert;SIf;50|) $))))))
    $))) 

(MAKEPROP '|PolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Equation| 6) (0 . |lhs|)
              (|Union| 9 '#1="failed") (5 . |retractIfCan|) (10 . |retract|)
              (15 . |rhs|) (|List| 9) (|List| $) (20 . |eval|) (|List| 225)
              (27 . |eval|) (33 . |monomials|) (|Union| 17 '#2="failed")
              |POLYCAT-;isPlus;SU;2| (38 . |variables|) (|Boolean|)
              (43 . |monomial?|) (48 . |One|) (|Factored| 6) (52 . |One|)
              (|NonNegativeInteger|) (56 . |degree|) (62 . |monomial|)
              (69 . |leadingCoefficient|) (74 . |One|) (78 . =) (84 . |coerce|)
              (89 . |isTimes|) (94 . |mainVariable|) (99 . =)
              (|Record| (|:| |var| 9) (|:| |exponent| 30))
              (|Union| 40 '#3="failed") (105 . |isExpt|)
              (|SparseUnivariatePolynomial| $) (110 . |univariate|)
              (|SparseUnivariatePolynomial| 6) (116 . |coefficient|)
              |POLYCAT-;coefficient;SVarSetNniS;5| (|List| 30)
              (122 . |coefficient|) |POLYCAT-;coefficient;SLLS;6|
              (129 . |coerce|) |POLYCAT-;retract;SVarSet;7|
              |POLYCAT-;retractIfCan;SU;8| (134 . |ground?|) (139 . |Zero|)
              (143 . |Zero|) (147 . |Zero|) (151 . ~=) (157 . |degree|)
              (162 . |leadingCoefficient|) (167 . |totalDegree|)
              (172 . |reductum|) |POLYCAT-;totalDegree;SNni;9| (177 . <)
              (183 . =) (189 . |totalDegreeSorted|)
              |POLYCAT-;totalDegreeSorted;SLNni;10| (|Mapping| 25 9 9)
              (195 . |sort|) |POLYCAT-;totalDegree;SLNni;11|
              (201 . |resultant|) (207 . |resultant|) (214 . |discriminant|)
              (219 . |discriminant|) (225 . |primitiveMonomials|) (|List| 6)
              (230 . |concat|) (235 . |removeDuplicates!|) (|Integer|)
              (|Vector| 7) (240 . |minIndex|) (245 . |coefficient|)
              (|List| 226) (|Matrix| 7) (251 . |matrix|) (|List| 76)
              (|Matrix| 6) (256 . |listOfLists|) (261 . |degree|)
              (266 . |vertConcat|) (|Matrix| $) (272 . |reducedSystem|)
              (|Vector| 6) (277 . |entries|) (282 . |concat|) (288 . |concat|)
              (|Record| (|:| |mat| 84) (|:| |vec| 80)) (|Vector| $)
              (294 . |reducedSystem|) (|Union| 101 '"failed") (|List| 45)
              (|PolynomialFactorizationByRecursion| 7 8 9 6)
              (300 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 105 '#4="failed") (|List| 43)
              (306 . |solveLinearPolynomialEquation|) (|Factored| 45)
              (|MultFiniteFactorize| 9 8 7 6) (312 . |factor|) (|Factored| 43)
              (317 . |factorPolynomial|) (322 . |factorSquareFreePolynomial|)
              (327 . |factor|) (|Factored| $) (332 . |factor|)
              (337 . |factorPolynomial|)
              (|Mapping| (|Factored| (|SparseUnivariatePolynomial| 7))
                         (|SparseUnivariatePolynomial| 7))
              (|InnerMultFact| 9 8 7 6) (342 . |factor|) (348 . |factor|)
              (|GeneralPolynomialGcdPackage| 8 9 7 6) (354 . |gcdPolynomial|)
              (360 . |gcdPolynomial|) (366 . |factorByRecursion|)
              (371 . |factorSquareFreeByRecursion|) (376 . |factor|)
              (|Factored| 7) (381 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 129) (|:| |factor| 7) (|:| |exponent| 30))
              (|List| 130) (386 . |factorList|)
              (|Record| (|:| |flag| 129) (|:| |factor| 6) (|:| |exponent| 30))
              (|List| 133) (391 . |makeFR|) (397 . |unit|)
              (402 . |multivariate|)
              (|Record| (|:| |flag| 129) (|:| |factor| 45) (|:| |exponent| 30))
              (|List| 138) (408 . |factorList|) (413 . |transpose|)
              (418 . |characteristic|) (422 . |setUnion|) (428 . |degree|)
              (|Union| $ '"failed") (434 . |exquo|) (440 . |monomial|)
              (447 . |ground|) (452 . |transpose|) (|Union| 98 '#4#)
              (457 . |conditionP|) (462 . |elt|) (468 . *) (474 . +)
              (480 . |conditionP|) (485 . |charthRoot|) (490 . |charthRoot|)
              (495 . >) (501 . |coefficient|) (508 . -)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (514 . |monicDivide|) (520 . |monicDivide|)
              (|MultivariateSquareFree| 8 9 7 6) (527 . |squareFree|)
              (532 . |squareFree|) (|PolynomialSquareFree| 9 8 7 6)
              (537 . |squareFree|) (542 . |squareFree|) (547 . |unit|)
              (552 . |factorList|) (557 . |squareFreePart|) (562 . |content|)
              (567 . |content|) (573 . |zero?|) (578 . |content|)
              (583 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (589 . |unitNormal|) (594 . |primitivePart|) (599 . |content|)
              (605 . |exquo|) (611 . |primitivePart|) (617 . ~=) (623 . <)
              (629 . |Zero|) (633 . |smaller?|) (639 . ~=) (645 . |reductum|)
              (650 . |smaller?|) (|PatternMatchResult| 79 6) (|Pattern| 79)
              (|PatternMatchPolynomialCategory| 79 8 9 7 6)
              (656 . |patternMatch|) (|PatternMatchResult| 79 $)
              (663 . |patternMatch|) (|PatternMatchResult| (|Float|) 6)
              (|Pattern| (|Float|))
              (|PatternMatchPolynomialCategory| (|Float|) 8 9 7 6)
              (670 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (677 . |patternMatch|) (684 . |convert|) (689 . |convert|)
              (|Mapping| 192 9) (|Mapping| 192 7)
              (|PolynomialCategoryLifting| 8 9 7 6 192) (694 . |map|)
              (701 . |convert|) (706 . |convert|) (711 . |convert|)
              (|Mapping| 198 9) (|Mapping| 198 7)
              (|PolynomialCategoryLifting| 8 9 7 6 198) (716 . |map|)
              (723 . |convert|) (|InputForm|) (728 . |convert|)
              (733 . |convert|) (|Mapping| 217 9) (|Mapping| 217 7)
              (|PolynomialCategoryLifting| 8 9 7 6 217) (738 . |map|)
              (745 . |convert|) (|Equation| $) (|List| 7) (|Matrix| 79)
              (|Record| (|:| |mat| 227) (|:| |vec| (|Vector| 79)))
              (|Union| 232 '#1#) (|Union| 7 '#1#) (|Union| 79 '#1#)
              (|Fraction| 79))
           '#(|totalDegreeSorted| 750 |totalDegree| 756 |squareFreePart| 767
              |squareFree| 772 |solveLinearPolynomialEquation| 777 |smaller?|
              783 |retractIfCan| 789 |retract| 794 |resultant| 799
              |reducedSystem| 806 |primitivePart| 817 |patternMatch| 828
              |monicDivide| 842 |isTimes| 849 |isPlus| 854 |isExpt| 859
              |gcdPolynomial| 864 |factorSquareFreePolynomial| 870
              |factorPolynomial| 875 |factor| 880 |eval| 885 |discriminant| 891
              |convert| 897 |content| 912 |conditionP| 918 |coefficient| 923
              |charthRoot| 937)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|retract| (|#4| |#1|)) T)
                                   '((|retractIfCan| ((|Union| |#4| #1#) |#1|))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#1| |#1|)) T)
                                   '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|convert| ((|InputForm|) |#1|)) T)
                                   '((|convert| ((|Pattern| (|Integer|)) |#1|))
                                     T)
                                   '((|convert| ((|Pattern| (|Float|)) |#1|))
                                     T)
                                   '((|patternMatch|
                                      ((|PatternMatchResult| (|Integer|) |#1|)
                                       |#1| (|Pattern| (|Integer|))
                                       (|PatternMatchResult| (|Integer|)
                                                             |#1|)))
                                     T)
                                   '((|patternMatch|
                                      ((|PatternMatchResult| (|Float|) |#1|)
                                       |#1| (|Pattern| (|Float|))
                                       (|PatternMatchResult| (|Float|) |#1|)))
                                     T)
                                   '((|gcdPolynomial|
                                      ((|SparseUnivariatePolynomial| |#1|)
                                       (|SparseUnivariatePolynomial| |#1|)
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|squareFree| ((|Factored| |#1|) |#1|)) T)
                                   '((|squareFreePart| (|#1| |#1|)) T)
                                   '((|factor| ((|Factored| |#1|) |#1|)) T)
                                   '((|factorPolynomial|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|factorSquareFreePolynomial|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|solveLinearPolynomialEquation|
                                      ((|Union|
                                        (|List|
                                         (|SparseUnivariatePolynomial| |#1|))
                                        #4#)
                                       (|List|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|conditionP|
                                      ((|Union| (|Vector| |#1|) #4#)
                                       (|Matrix| |#1|)))
                                     T)
                                   '((|charthRoot| ((|Union| |#1| #4#) |#1|))
                                     T)
                                   '((|primitivePart| (|#1| |#1| |#4|)) T)
                                   '((|content| (|#1| |#1| |#4|)) T)
                                   '((|discriminant| (|#1| |#1| |#4|)) T)
                                   '((|resultant| (|#1| |#1| |#1| |#4|)) T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| |#4|)
                                                  (|:| |exponent|
                                                       (|NonNegativeInteger|)))
                                        #3#)
                                       |#1|))
                                     T)
                                   '((|isTimes|
                                      ((|Union| (|List| |#1|) "failed") |#1|))
                                     T)
                                   '((|isPlus|
                                      ((|Union| (|List| |#1|) #2#) |#1|))
                                     T)
                                   '((|monicDivide|
                                      ((|Record| (|:| |quotient| |#1|)
                                                 (|:| |remainder| |#1|))
                                       |#1| |#1| |#4|))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#4|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#4| |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#4|) (|List| |#2|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#4| |#2|)) T)
                                   '((|reducedSystem|
                                      ((|Matrix| |#2|) (|Matrix| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Record| (|:| |mat| (|Matrix| |#2|))
                                                 (|:| |vec| (|Vector| |#2|)))
                                       (|Matrix| |#1|) (|Vector| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Record|
                                        (|:| |mat| (|Matrix| (|Integer|)))
                                        (|:| |vec| (|Vector| (|Integer|))))
                                       (|Matrix| |#1|) (|Vector| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Matrix| (|Integer|)) (|Matrix| |#1|)))
                                     T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|totalDegreeSorted|
                                      ((|NonNegativeInteger|) |#1|
                                       (|List| |#4|)))
                                     T)
                                   '((|totalDegree|
                                      ((|NonNegativeInteger|) |#1|
                                       (|List| |#4|)))
                                     T)
                                   '((|totalDegree|
                                      ((|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|coefficient|
                                      (|#1| |#1| (|List| |#4|)
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|coefficient|
                                      (|#1| |#1| |#4| (|NonNegativeInteger|)))
                                     T)
                                   '((|primitivePart| (|#1| |#1|)) T)
                                   '((|content| (|#2| |#1|)) T)
                                   '((|retract| (|#2| |#1|)) T)
                                   '((|retractIfCan| ((|Union| |#2| #1#) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #1#)
                                       |#1|))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Integer|) #1#) |#1|))
                                     T)
                                   '((|retract| ((|Integer|) |#1|)) T)
                                   '((|coefficient| (|#2| |#1| |#3|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 224
                                            '(1 10 6 0 11 1 6 12 0 13 1 6 9 0
                                              14 1 10 6 0 15 3 6 0 0 16 17 18 2
                                              0 0 0 19 20 1 6 17 0 21 1 6 16 0
                                              24 1 6 25 0 26 0 6 0 27 0 28 0 29
                                              2 6 30 0 9 31 3 6 0 0 9 30 32 1 6
                                              7 0 33 0 7 0 34 2 7 25 0 0 35 1 6
                                              0 7 36 1 0 22 0 37 1 6 12 0 38 2
                                              6 25 0 0 39 1 0 41 0 42 2 6 43 0
                                              9 44 2 45 6 0 30 46 3 6 0 0 16 48
                                              49 1 6 0 9 51 1 6 25 0 54 0 6 0
                                              55 0 7 0 56 0 45 0 57 2 45 25 0 0
                                              58 1 45 30 0 59 1 45 6 0 60 1 6
                                              30 0 61 1 45 0 0 62 2 9 25 0 0 64
                                              2 9 25 0 0 65 2 6 30 0 16 66 2 16
                                              0 68 0 69 2 45 6 0 0 71 3 0 0 0 0
                                              9 72 1 45 6 0 73 2 0 0 0 9 74 1 6
                                              17 0 75 1 76 0 17 77 1 76 0 0 78
                                              1 80 79 0 81 2 6 7 0 8 82 1 84 0
                                              83 85 1 87 86 0 88 1 6 8 0 89 2
                                              84 0 0 0 90 1 0 84 91 92 1 93 76
                                              0 94 2 76 0 0 0 95 2 80 0 0 0 96
                                              2 0 97 91 98 99 2 102 100 101 45
                                              103 2 0 104 105 43 106 1 108 107
                                              45 109 1 0 110 43 111 1 0 110 43
                                              112 1 108 28 6 113 1 0 114 0 115
                                              1 7 110 43 116 2 118 107 45 117
                                              119 2 118 28 6 117 120 2 121 45
                                              45 45 122 2 0 43 43 43 123 1 102
                                              107 45 124 1 102 107 45 125 1 7
                                              114 0 126 1 127 7 0 128 1 127 131
                                              0 132 2 28 0 6 134 135 1 107 45 0
                                              136 2 6 0 43 9 137 1 107 139 0
                                              140 1 87 0 0 141 0 6 30 142 2 76
                                              0 0 0 143 2 6 48 0 16 144 2 79
                                              145 0 0 146 3 6 0 0 16 48 147 1 6
                                              7 0 148 1 84 0 0 149 1 7 150 91
                                              151 2 80 7 0 79 152 2 6 0 0 0 153
                                              2 6 0 0 0 154 1 0 150 91 155 1 7
                                              145 0 156 1 0 145 0 157 2 30 25 0
                                              0 158 3 6 0 0 9 30 159 2 6 0 0 0
                                              160 2 45 161 0 0 162 3 0 161 0 0
                                              9 163 1 164 28 6 165 1 0 114 0
                                              166 1 167 28 6 168 1 6 114 0 169
                                              1 28 6 0 170 1 28 134 0 171 1 0 0
                                              0 172 1 45 6 0 173 2 0 0 0 9 174
                                              1 6 25 0 175 1 6 7 0 176 2 6 145
                                              0 7 177 1 6 178 0 179 1 0 0 0 180
                                              2 6 0 0 9 181 2 6 145 0 0 182 2 0
                                              0 0 9 183 2 6 25 0 0 184 2 8 25 0
                                              0 185 0 8 0 186 2 7 25 0 0 187 2
                                              7 25 0 0 188 1 6 0 0 189 2 0 25 0
                                              0 190 3 193 191 6 192 191 194 3 0
                                              195 0 192 195 196 3 199 197 6 198
                                              197 200 3 0 201 0 198 201 202 1 9
                                              192 0 203 1 7 192 0 204 3 207 192
                                              205 206 6 208 1 0 192 0 209 1 9
                                              198 0 210 1 7 198 0 211 3 214 198
                                              212 213 6 215 1 0 198 0 216 1 9
                                              217 0 218 1 7 217 0 219 3 222 217
                                              220 221 6 223 1 0 217 0 224 2 0
                                              30 0 16 67 2 0 30 0 16 70 1 0 30
                                              0 63 1 0 0 0 172 1 0 114 0 166 2
                                              0 104 105 43 106 2 0 25 0 0 190 1
                                              0 12 0 53 1 0 9 0 52 3 0 0 0 0 9
                                              72 2 0 97 91 98 99 1 0 84 91 92 2
                                              0 0 0 9 183 1 0 0 0 180 3 0 195 0
                                              192 195 196 3 0 201 0 198 201 202
                                              3 0 161 0 0 9 163 1 0 22 0 37 1 0
                                              22 0 23 1 0 41 0 42 2 0 43 43 43
                                              123 1 0 110 43 112 1 0 110 43 111
                                              1 0 114 0 115 2 0 0 0 19 20 2 0 0
                                              0 9 74 1 0 217 0 224 1 0 198 0
                                              216 1 0 192 0 209 2 0 0 0 9 174 1
                                              0 150 91 155 3 0 0 0 16 48 50 3 0
                                              0 0 9 30 47 1 0 145 0 157)))))
           '|lookupComplete|)) 
