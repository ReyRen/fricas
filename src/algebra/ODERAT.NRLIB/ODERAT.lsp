
(SDEFUN |ODERAT;infOrder| ((|f| |Fraction| UP) ($ |Integer|))
        (- (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 14))
           (SPADCALL (SPADCALL |f| (QREFELT $ 15)) (QREFELT $ 14)))) 

(SDEFUN |ODERAT;evenodd| ((|n| |NonNegativeInteger|) ($ F))
        (COND ((SPADCALL |n| (QREFELT $ 18)) (|spadConstant| $ 19))
              ('T (SPADCALL (|spadConstant| $ 19) (QREFELT $ 21))))) 

(SDEFUN |ODERAT;ratDsolve1|
        ((|op| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|lg| |List| (|Fraction| UP))
         ($ |Record| (|:| |basis| (|List| (|Fraction| UP)))
          (|:| |mat| (|Matrix| F))))
        (SPROG
         ((|sys1| (|Matrix| UP)) (|l| (|List| (|Fraction| UP))) (#1=#:G422 NIL)
          (|q| NIL) (#2=#:G421 NIL) (#3=#:G420 NIL) (|i| NIL) (#4=#:G419 NIL)
          (|rec|
           (|Record| (|:| |basis| (|List| (|Fraction| UP)))
                     (|:| |particular| (|List| (|Fraction| UP)))))
          (|d| (UP)) (#5=#:G418 NIL) (|g| NIL) (#6=#:G417 NIL))
         (SEQ
          (COND
           ((ZEROP (SPADCALL |op| (QREFELT $ 23)))
            (CONS
             (PROGN
              (LETT #6# NIL)
              (SEQ (LETT |g| NIL) (LETT #5# |lg|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #6#
                           (CONS
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |op| (QREFELT $ 24))
                                        (QREFELT $ 25))
                              (QREFELT $ 26))
                             |g| (QREFELT $ 27))
                            #6#))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT (NREVERSE #6#))))
             (MAKE_MATRIX1 0 (LENGTH |lg|) (|spadConstant| $ 28))))
           ('T
            (SEQ (LETT |d| (SPADCALL |op| |lg| (QREFELT $ 32)))
                 (LETT |rec| (|ODERAT;candidates| |op| |lg| |d| $))
                 (LETT |l|
                       (SPADCALL
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |i| 1) (LETT #3# (LENGTH (QCDR |rec|)))
                              G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |op|
                                                  (SPADCALL (QCDR |rec|) |i|
                                                            (QREFELT $ 33))
                                                  (QREFELT $ 34))
                                        (SPADCALL |lg| |i| (QREFELT $ 33))
                                        (QREFELT $ 35))
                                       #4#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |q| NIL) (LETT #1# (QCAR |rec|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |q| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |op| |q| (QREFELT $ 34))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 36)))
                 (LETT |sys1|
                       (SPADCALL (SPADCALL (LIST |l|) (QREFELT $ 39))
                                 (QREFELT $ 42)))
                 (EXIT
                  (CONS (SPADCALL (QCDR |rec|) (QCAR |rec|) (QREFELT $ 36))
                        (SPADCALL |sys1| (QREFELT $ 44)))))))))) 

(SDEFUN |ODERAT;ratDsolve0|
        ((|op| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|g| |Fraction| UP)
         ($ |Record| (|:| |particular| (|Union| (|Fraction| UP) #1="failed"))
          (|:| |basis| (|List| (|Fraction| UP)))))
        (SPROG
         ((#2=#:G462 NIL) (|v| (|Vector| F)) (#3=#:G461 NIL)
          (|part| (|Union| (|Fraction| UP) #1#)) (#4=#:G448 NIL)
          (|sol|
           (|Record| (|:| |particular| (|Union| (|Vector| F) #5="failed"))
                     (|:| |basis| (|List| (|Vector| F)))))
          (|m| (|Matrix| F))
          (|sys2| (|Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F))))
          (|sys1|
           (|Record| (|:| |mat| (|Matrix| UP)) (|:| |vec| (|Vector| UP))))
          (|h| (|Fraction| UP)) (|lb| #6=(|List| (|Fraction| UP))) (|l| #6#)
          (|lsol| #6#) (|opq| (|Fraction| UP)) (#7=#:G460 NIL) (|q| NIL)
          (|rec|
           (|Record| (|:| |basis| (|List| (|Fraction| UP)))
                     (|:| |particular| (|List| (|Fraction| UP)))))
          (|u| (|Union| UP "failed")) (#8=#:G425 NIL)
          (|b| (|List| (|Fraction| UP)))
          (|uu| (|Union| (|Fraction| UP) "failed")) (#9=#:G459 NIL) (|f| NIL))
         (SEQ
          (COND
           ((ZEROP (SPADCALL |op| (QREFELT $ 23)))
            (CONS
             (CONS 0
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |op| (QREFELT $ 24)) (QREFELT $ 25))
                     (QREFELT $ 26))
                    |g| (QREFELT $ 27)))
             NIL))
           ((SPADCALL (SPADCALL |op| (QREFELT $ 45)) 0 (QREFELT $ 46))
            (SEQ
             (LETT |sol|
                   (|ODERAT;ratDsolve0|
                    (QCAR
                     (SPADCALL |op|
                               (SPADCALL (|spadConstant| $ 20) 1
                                         (QREFELT $ 47))
                               (QREFELT $ 49)))
                    |g| $))
             (LETT |b| (LIST (|spadConstant| $ 50)))
             (SEQ (LETT |f| NIL) (LETT #9# (QCDR |sol|)) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#)) NIL))
                    (GO G191)))
                  (SEQ (LETT |uu| (SPADCALL |f| (QREFELT $ 53)))
                       (EXIT
                        (COND
                         ((QEQCAR |uu| 0) (LETT |b| (CONS (QCDR |uu|) |b|))))))
                  (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND ((QEQCAR (QCAR |sol|) 1) (CONS (CONS 1 "failed") |b|))
                    (#10='T
                     (CONS
                      (SPADCALL
                       (PROG2 (LETT #8# (QCAR |sol|))
                           (QCDR #8#)
                         (|check_union2| (QEQCAR #8# 0)
                                         (|Fraction| (QREFELT $ 7))
                                         (|Union| (|Fraction| (QREFELT $ 7))
                                                  #1#)
                                         #8#))
                       (QREFELT $ 53))
                      |b|))))))
           (#10#
            (SEQ (LETT |u| (SPADCALL |op| |g| (QREFELT $ 55)))
                 (EXIT
                  (COND ((QEQCAR |u| 1) (CONS (CONS 1 "failed") NIL))
                        (#10#
                         (SEQ
                          (LETT |rec|
                                (|ODERAT;candidates| |op| (LIST |g|) (QCDR |u|)
                                 $))
                          (LETT |l| (LETT |lb| (LETT |lsol| NIL)))
                          (SEQ (LETT |q| NIL) (LETT #7# (QCAR |rec|)) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |q| (CAR #7#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (LETT |opq|
                                          (SPADCALL |op| |q| (QREFELT $ 34)))
                                    (QREFELT $ 56))
                                   (LETT |lsol| (CONS |q| |lsol|)))
                                  ('T
                                   (SEQ (LETT |l| (CONS |opq| |l|))
                                        (EXIT (LETT |lb| (CONS |q| |lb|))))))))
                               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                          (LETT |h|
                                (COND
                                 ((SPADCALL |g| (QREFELT $ 56))
                                  (|spadConstant| $ 57))
                                 (#10# (|SPADfirst| (QCDR |rec|)))))
                          (EXIT
                           (COND
                            ((NULL |l|)
                             (COND
                              ((SPADCALL |g| (QREFELT $ 56))
                               (CONS (CONS 0 (|spadConstant| $ 57)) |lsol|))
                              (#10#
                               (CONS
                                (COND
                                 ((SPADCALL |g|
                                            (SPADCALL |op| |h| (QREFELT $ 34))
                                            (QREFELT $ 58))
                                  (CONS 0 |h|))
                                 (#10# (CONS 1 "failed")))
                                |lsol|))))
                            (#10#
                             (SEQ
                              (COND
                               ((SPADCALL |g| (QREFELT $ 56))
                                (SEQ
                                 (LETT |m|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (LIST |l|) (QREFELT $ 39))
                                         (QREFELT $ 42))
                                        (QREFELT $ 44)))
                                 (EXIT
                                  (LETT |v|
                                        (MAKEARR1 (ANCOLS |m|)
                                                  (|spadConstant| $ 28))))))
                               (#10#
                                (SEQ
                                 (LETT |sys1|
                                       (SPADCALL
                                        (SPADCALL (LIST |l|) (QREFELT $ 39))
                                        (SPADCALL
                                         (LIST
                                          (SPADCALL |g|
                                                    (SPADCALL |op| |h|
                                                              (QREFELT $ 34))
                                                    (QREFELT $ 35)))
                                         (QREFELT $ 60))
                                        (QREFELT $ 63)))
                                 (LETT |sys2|
                                       (SPADCALL (QCAR |sys1|) (QCDR |sys1|)
                                                 (QREFELT $ 65)))
                                 (LETT |m| (QCAR |sys2|))
                                 (EXIT (LETT |v| (QCDR |sys2|))))))
                              (LETT |sol| (SPADCALL |m| |v| (QREFELT $ 70)))
                              (LETT |part|
                                    (COND
                                     ((SPADCALL |g| (QREFELT $ 56))
                                      (CONS 0 (|spadConstant| $ 57)))
                                     ((QEQCAR (QCAR |sol|) 1)
                                      (CONS 1 "failed"))
                                     (#10#
                                      (CONS 0
                                            (SPADCALL
                                             (|ODERAT;makeDot|
                                              (PROG2 (LETT #4# (QCAR |sol|))
                                                  (QCDR #4#)
                                                (|check_union2| (QEQCAR #4# 0)
                                                                (|Vector|
                                                                 (QREFELT $ 6))
                                                                (|Union|
                                                                 (|Vector|
                                                                  (QREFELT $
                                                                           6))
                                                                 #5#)
                                                                #4#))
                                              |lb| $)
                                             (|SPADfirst| (QCDR |rec|))
                                             (QREFELT $ 71))))))
                              (EXIT
                               (CONS |part|
                                     (SPADCALL |lsol|
                                               (PROGN
                                                (LETT #3# NIL)
                                                (SEQ (LETT |v| NIL)
                                                     (LETT #2# (QCDR |sol|))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #2#)
                                                           (PROGN
                                                            (LETT |v|
                                                                  (CAR #2#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (COND
                                                        ((|ODERAT;nzero?| |v|
                                                          $)
                                                         (LETT #3#
                                                               (CONS
                                                                (|ODERAT;makeDot|
                                                                 |v| |lb| $)
                                                                #3#))))))
                                                     (LETT #2# (CDR #2#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #3#))))
                                               (QREFELT $ 72)))))))))))))))))) 

(SDEFUN |ODERAT;indicialEquationAtInfinity;LodoUP;5|
        ((|op| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         ($ UP))
        (SPROG
         ((|rec|
           (|Record| (|:| |mu| (|Integer|))
                     (|:| |lambda| (|List| (|NonNegativeInteger|)))
                     (|:| |func| (|List| UP)))))
         (SEQ (LETT |rec| (|ODERAT;infMuLambda| |op| $))
              (EXIT
               (|ODERAT;infIndicialEquation| (QVELT |rec| 1) (QVELT |rec| 2)
                $))))) 

(SDEFUN |ODERAT;indicialEquationAtInfinity;LodoUP;6|
        ((|op| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP)) ($ UP))
        (SPROG
         ((|rec|
           (|Record|
            (|:| |eq|
                 (|LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP)))
            (|:| |rh| (|List| (|Fraction| UP))))))
         (SEQ (LETT |rec| (SPADCALL |op| NIL (QREFELT $ 76)))
              (EXIT (SPADCALL (QCAR |rec|) (QREFELT $ 73)))))) 

(SDEFUN |ODERAT;regularPoint|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|lg| |List| (|Fraction| UP)) ($ |Integer|))
        (SPROG ((#1=#:G474 NIL) (#2=#:G475 NIL) (|j| (F)) (|i| NIL) (|a| (UP)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (SPADCALL |l| (QREFELT $ 24))
                                  (SPADCALL |lg| (QREFELT $ 79))
                                  (QREFELT $ 80)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |a| 0 (QREFELT $ 81))
                               (|spadConstant| $ 28) (QREFELT $ 82))
                     0)
                    ('T
                     (SEQ (LETT |i| 1) G190 NIL
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL |a|
                                         (LETT |j|
                                               (SPADCALL |i| (QREFELT $ 83)))
                                         (QREFELT $ 84))
                               (|spadConstant| $ 28) (QREFELT $ 82))
                              (PROGN (LETT #2# |i|) (GO #3=#:G473)))
                             ('T
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |a| (SPADCALL |j| (QREFELT $ 21))
                                             (QREFELT $ 84))
                                   (|spadConstant| $ 28) (QREFELT $ 82))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# (- |i|)) (GO #3#)))
                                   (GO #4=#:G469)))))
                               #4# (EXIT #1#))))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL)))))))
                #3# (EXIT #2#)))) 

(SDEFUN |ODERAT;unitlist|
        ((|i| |NonNegativeInteger|) (|q| |NonNegativeInteger|) ($ |List| F))
        (SPROG ((|v| (|Vector| F)))
               (SEQ (LETT |v| (MAKEARR1 |q| (|spadConstant| $ 28)))
                    (SPADCALL |v| |i| (|spadConstant| $ 19) (QREFELT $ 85))
                    (EXIT (SPADCALL |v| (QREFELT $ 87)))))) 

(SDEFUN |ODERAT;candidates|
        ((|op| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|lg| |List| (|Fraction| UP)) (|d| UP)
         ($ |Record| (|:| |basis| (|List| (|Fraction| UP)))
          (|:| |particular| (|List| (|Fraction| UP)))))
        (SPROG
         ((|part| (|List| (|Fraction| UP))) (#1=#:G491 NIL) (|g| NIL)
          (#2=#:G490 NIL) (|a1| (|Fraction| UP))
          (|hom| (|List| (|Fraction| UP))) (#3=#:G489 NIL) (|i| NIL)
          (#4=#:G488 NIL) (|e| (|List| F)) (|q| (|NonNegativeInteger|))
          (|f| (|Mapping| |uts| (|List| |uts|))) (|dd| (|uts|))
          (|solver|
           (CATEGORY |package|
            (SIGNATURE |stFunc1|
             ((|Mapping| (|Stream| F) (|Stream| F)) (|Mapping| |uts| |uts|)))
            (SIGNATURE |stFunc2|
             ((|Mapping| (|Stream| F) (|Stream| F) (|Stream| F))
              (|Mapping| |uts| |uts| |uts|)))
            (SIGNATURE |stFuncN|
             ((|Mapping| (|Stream| F) (|List| (|Stream| F)))
              (|Mapping| |uts| (|List| |uts|))))
            (SIGNATURE |fixedPointExquo| (|uts| |uts| |uts|))
            (SIGNATURE |ode1| (|uts| (|Mapping| |uts| |uts|) F))
            (SIGNATURE |ode2| (|uts| (|Mapping| |uts| |uts| |uts|) F F))
            (SIGNATURE |ode|
             (|uts| (|Mapping| |uts| (|List| |uts|)) (|List| F)))
            (SIGNATURE |mpsode|
             ((|List| |uts|) (|List| F)
              (|List| (|Mapping| |uts| (|List| |uts|)))))))
          (|tools|
           (CATEGORY |package| (SIGNATURE UP2UTS (|uts| UP))
            (SIGNATURE UTS2UP (UP |uts| (|NonNegativeInteger|)))
            (SIGNATURE LODO2FUN
             ((|Mapping| |uts| (|List| |uts|))
              (|LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))))
            (IF (|has| F (|IntegralDomain|))
                (SIGNATURE RF2UTS (|uts| (|Fraction| UP)))
                |noBranch|)))
          (|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| F)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |dummy| F)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |dummy| F) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |dummy|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |dummy|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| F (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |dummy|)))
                        |noBranch|))))
          (|m| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (+ (SPADCALL |d| (QREFELT $ 14))
                   (|ODERAT;infBound| |op| |lg| $)))
          (LETT |m| (|ODERAT;regularPoint| |op| |lg| $))
          (LETT |uts|
                (|UnivariateTaylorSeries| (QREFELT $ 6) (QREFELT $ 10)
                                          (SPADCALL |m| (QREFELT $ 83))))
          (LETT |tools|
                (|UTSodetools| (QREFELT $ 6) (QREFELT $ 7)
                               (|LinearOrdinaryDifferentialOperator2|
                                (QREFELT $ 7) (|Fraction| (QREFELT $ 7)))
                               |uts|))
          (LETT |solver|
                (|UnivariateTaylorSeriesODESolver| (QREFELT $ 6) |uts|))
          (LETT |dd|
                (SPADCALL |d|
                          (|compiledLookupCheck| 'UP2UTS
                                                 (LIST (|devaluate| |uts|)
                                                       (|devaluate| (ELT $ 7)))
                                                 |tools|)))
          (LETT |f|
                (SPADCALL |op|
                          (|compiledLookupCheck| 'LODO2FUN
                                                 (LIST
                                                  (LIST '|Mapping|
                                                        (|devaluate| |uts|)
                                                        (LIST '|List|
                                                              (|devaluate|
                                                               |uts|)))
                                                  (LIST
                                                   '|LinearOrdinaryDifferentialOperator2|
                                                   (|devaluate| (ELT $ 7))
                                                   (LIST '|Fraction|
                                                         (|devaluate|
                                                          (ELT $ 7)))))
                                                 |tools|)))
          (LETT |q| (SPADCALL |op| (QREFELT $ 23)))
          (LETT |e| (|ODERAT;unitlist| 1 |q| $))
          (LETT |hom|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| 1) (LETT #3# |q|) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |dd|
                                           (SPADCALL |f|
                                                     (|ODERAT;unitlist| |i| |q|
                                                      $)
                                                     (|compiledLookupCheck|
                                                      '|ode|
                                                      (LIST (|devaluate| |uts|)
                                                            (LIST '|Mapping|
                                                                  (|devaluate|
                                                                   |uts|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |uts|)))
                                                            (LIST '|List|
                                                                  (|devaluate|
                                                                   (ELT $ 6))))
                                                      |solver|))
                                           (|compiledLookupCheck| '*
                                                                  (LIST '$ '$
                                                                        '$)
                                                                  |uts|))
                                 |n|
                                 (|compiledLookupCheck| 'UTS2UP
                                                        (LIST
                                                         (|devaluate|
                                                          (ELT $ 7))
                                                         (|devaluate| |uts|)
                                                         (LIST
                                                          '|NonNegativeInteger|))
                                                        |tools|))
                                |d| (QREFELT $ 88))
                               #4#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |a1|
                (SPADCALL
                 (SPADCALL (SPADCALL |op| (QREFELT $ 24)) (QREFELT $ 25))
                 (QREFELT $ 26)))
          (LETT |part|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |g| NIL) (LETT #1# |lg|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |dd|
                                           (SPADCALL
                                            (CONS #'|ODERAT;candidates!0|
                                                  (VECTOR |f| |tools| |uts| $
                                                          |g| |a1|))
                                            |e|
                                            (|compiledLookupCheck| '|ode|
                                                                   (LIST
                                                                    (|devaluate|
                                                                     |uts|)
                                                                    (LIST
                                                                     '|Mapping|
                                                                     (|devaluate|
                                                                      |uts|)
                                                                     (LIST
                                                                      '|List|
                                                                      (|devaluate|
                                                                       |uts|)))
                                                                    (LIST
                                                                     '|List|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           6))))
                                                                   |solver|))
                                           (|compiledLookupCheck| '*
                                                                  (LIST '$ '$
                                                                        '$)
                                                                  |uts|))
                                 |n|
                                 (|compiledLookupCheck| 'UTS2UP
                                                        (LIST
                                                         (|devaluate|
                                                          (ELT $ 7))
                                                         (|devaluate| |uts|)
                                                         (LIST
                                                          '|NonNegativeInteger|))
                                                        |tools|))
                                |d| (QREFELT $ 88))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (CONS |hom| |part|))))) 

(SDEFUN |ODERAT;candidates!0| ((|l1| NIL) ($$ NIL))
        (PROG (|a1| |g| $ |uts| |tools| |f|)
          (LETT |a1| (QREFELT $$ 5))
          (LETT |g| (QREFELT $$ 4))
          (LETT $ (QREFELT $$ 3))
          (LETT |uts| (QREFELT $$ 2))
          (LETT |tools| (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |a1| |g| (QREFELT $ 27))
                       (|compiledLookupCheck| 'RF2UTS
                                              (LIST (|devaluate| |uts|)
                                                    (LIST '|Fraction|
                                                          (|devaluate|
                                                           (ELT $ 7))))
                                              |tools|))
             (SPADCALL |l1| |f|)
             (|compiledLookupCheck| '+ (LIST '$ '$ '$) |uts|)))))) 

(SDEFUN |ODERAT;nzero?| ((|v| |Vector| F) ($ |Boolean|))
        (SPROG ((#1=#:G496 NIL) (#2=#:G497 NIL) (#3=#:G498 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 89)))
                         (LETT #3# (QVSIZE |v|)) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 90)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G495)))
                              (GO #5=#:G493))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |ODERAT;UPfact| ((|n| |NonNegativeInteger|) ($ UP))
        (SPROG
         ((#1=#:G502 NIL) (#2=#:G501 (UP)) (#3=#:G503 (UP)) (#4=#:G507 NIL)
          (#5=#:G500 NIL) (|i| NIL) (|z| (UP)))
         (SEQ
          (COND ((ZEROP |n|) (|spadConstant| $ 20))
                (#6='T
                 (SEQ
                  (LETT |z| (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 91)))
                  (EXIT
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| 0)
                         (LETT #4#
                               (PROG1 (LETT #5# (- |n| 1))
                                 (|check_subtype2| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #5#)))
                         G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3#
                                  (SPADCALL |z|
                                            (SPADCALL
                                             (SPADCALL |i| (QREFELT $ 83))
                                             (QREFELT $ 92))
                                            (QREFELT $ 93)))
                            (COND
                             (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 80))))
                             ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#6# (|spadConstant| $ 20))))))))))) 

(SDEFUN |ODERAT;infMuLambda|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         ($ |Record| (|:| |mu| (|Integer|))
          (|:| |lambda| (|List| (|NonNegativeInteger|)))
          (|:| |func| (|List| UP))))
        (SPROG
         ((|lf| (|List| UP)) (|lamb| (|List| #1=(|NonNegativeInteger|)))
          (|mup| #2=(|Integer|)) (|m| #2#) (|d| #1#) (|a| (UP)))
         (SEQ (LETT |lamb| (LIST (LETT |d| (SPADCALL |l| (QREFELT $ 23)))))
              (LETT |lf| (LIST (LETT |a| (SPADCALL |l| (QREFELT $ 24)))))
              (LETT |mup| (- (SPADCALL |a| (QREFELT $ 14)) |d|))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT |l| (SPADCALL |l| (QREFELT $ 94)))
                                (|spadConstant| $ 95) (QREFELT $ 96)))
                     (GO G191)))
                   (SEQ (LETT |a| (SPADCALL |l| (QREFELT $ 24)))
                        (LETT |m|
                              (- (SPADCALL |a| (QREFELT $ 14))
                                 (LETT |d| (SPADCALL |l| (QREFELT $ 23)))))
                        (EXIT
                         (COND
                          ((SPADCALL |m| |mup| (QREFELT $ 97))
                           (SEQ (LETT |mup| |m|) (LETT |lamb| (LIST |d|))
                                (EXIT (LETT |lf| (LIST |a|)))))
                          ((EQL |m| |mup|)
                           (SEQ (LETT |lamb| (CONS |d| |lamb|))
                                (EXIT (LETT |lf| (CONS |a| |lf|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |mup| |lamb| |lf|))))) 

(SDEFUN |ODERAT;infIndicialEquation|
        ((|lambda| |List| (|NonNegativeInteger|)) (|lf| |List| UP) ($ UP))
        (SPROG
         ((|ans| (UP)) (#1=#:G518 NIL) (|i| NIL) (#2=#:G519 NIL) (|f| NIL))
         (SEQ (LETT |ans| (|spadConstant| $ 29))
              (SEQ (LETT |f| NIL) (LETT #2# |lf|) (LETT |i| NIL)
                   (LETT #1# |lambda|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |f| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL
                                      (SPADCALL (|ODERAT;evenodd| |i| $)
                                                (SPADCALL |f| (QREFELT $ 98))
                                                (QREFELT $ 99))
                                      (|ODERAT;UPfact| |i| $) (QREFELT $ 100))
                                     (QREFELT $ 93)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODERAT;infBound|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|lg| |List| (|Fraction| UP)) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G527 NIL) (|m| #2=(|Integer|)) (|mm| #2#) (#3=#:G531 NIL)
          (|g| NIL) (#4=#:G523 NIL) (|n| (|Integer|))
          (|rec|
           (|Record| (|:| |mu| (|Integer|))
                     (|:| |lambda| (|List| (|NonNegativeInteger|)))
                     (|:| |func| (|List| UP)))))
         (SEQ (LETT |rec| (|ODERAT;infMuLambda| |l| $))
              (LETT |n|
                    (MIN (- (- (SPADCALL |l| (QREFELT $ 23))) 1)
                         (SPADCALL
                          (|ODERAT;infIndicialEquation| (QVELT |rec| 1)
                           (QVELT |rec| 2) $)
                          (QREFELT $ 102))))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |lg|) NIL)
                            ('T (SPADCALL (|SPADfirst| |lg|) (QREFELT $ 56)))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |lg| (CDR |lg|)))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (COND
                ((NULL |lg|)
                 (PROG1 (LETT #4# (- |n|))
                   (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #4#)))
                ('T
                 (SEQ (LETT |m| (|ODERAT;infOrder| (|SPADfirst| |lg|) $))
                      (SEQ (LETT |g| NIL) (LETT #3# (CDR |lg|)) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |g| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |g| (QREFELT $ 56)))
                               (SEQ (LETT |mm| (|ODERAT;infOrder| |g| $))
                                    (EXIT
                                     (COND
                                      ((< |mm| |m|) (LETT |m| |mm|)))))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROG1
                           (LETT #1#
                                 (-
                                  (MIN |n|
                                       (+
                                        (- (QVELT |rec| 0)
                                           (SPADCALL
                                            (SPADCALL |l| (QREFELT $ 24))
                                            (QREFELT $ 14)))
                                        |m|))))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))))))))) 

(SDEFUN |ODERAT;makeDot|
        ((|v| |Vector| F) (|bas| |List| (|Fraction| UP)) ($ |Fraction| UP))
        (SPROG ((|ans| (|Fraction| UP)) (|i| NIL) (#1=#:G535 NIL) (|b| NIL))
               (SEQ (LETT |ans| (|spadConstant| $ 57))
                    (SEQ (LETT |b| NIL) (LETT #1# |bas|) (LETT |i| 1) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ans|
                                 (SPADCALL |ans|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |v| |i| (QREFELT $ 103))
                                             (QREFELT $ 92))
                                            |b| (QREFELT $ 104))
                                           (QREFELT $ 71)))))
                         (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |ODERAT;ratDsolve;LodoFR;16|
        ((|op| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|g| |Fraction| UP)
         ($ |Record| (|:| |particular| (|Union| (|Fraction| UP) "failed"))
          (|:| |basis| (|List| (|Fraction| UP)))))
        (SPROG
         ((|rec|
           (|Record|
            (|:| |eq|
                 (|LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP)))
            (|:| |rh| (|List| (|Fraction| UP))))))
         (SEQ (LETT |rec| (SPADCALL |op| (LIST |g|) (QREFELT $ 76)))
              (EXIT
               (|ODERAT;ratDsolve0| (QCAR |rec|) (|SPADfirst| (QCDR |rec|))
                $))))) 

(SDEFUN |ODERAT;ratDsolve;LodoLR;17|
        ((|op| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|lg| |List| (|Fraction| UP))
         ($ |Record| (|:| |basis| (|List| (|Fraction| UP)))
          (|:| |mat| (|Matrix| F))))
        (SPROG
         ((|rec|
           (|Record|
            (|:| |eq|
                 (|LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP)))
            (|:| |rh| (|List| (|Fraction| UP))))))
         (SEQ (LETT |rec| (SPADCALL |op| |lg| (QREFELT $ 76)))
              (EXIT (|ODERAT;ratDsolve1| (QCAR |rec|) (QCDR |rec|) $))))) 

(SDEFUN |ODERAT;ratDsolve;LodoFR;18|
        ((|op| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|g| |Fraction| UP)
         ($ |Record| (|:| |particular| (|Union| (|Fraction| UP) "failed"))
          (|:| |basis| (|List| (|Fraction| UP)))))
        (SPROG ((#1=#:G548 NIL) (|c| (UP)))
               (COND
                ((SPADCALL (LETT |c| (SPADCALL |op| (QREFELT $ 109)))
                           (QREFELT $ 110))
                 (|ODERAT;ratDsolve0| |op| |g| $))
                ('T
                 (|ODERAT;ratDsolve0|
                  (PROG2 (LETT #1# (SPADCALL |op| |c| (QREFELT $ 112)))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0)
                                    (|LinearOrdinaryDifferentialOperator2|
                                     (QREFELT $ 7) (|Fraction| (QREFELT $ 7)))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator2|
                                      (QREFELT $ 7) (|Fraction| (QREFELT $ 7)))
                                     "failed")
                                    #1#))
                  (SPADCALL
                   (SPADCALL (SPADCALL |c| (QREFELT $ 25)) (QREFELT $ 26)) |g|
                   (QREFELT $ 27))
                  $))))) 

(SDEFUN |ODERAT;ratDsolve;LodoLR;19|
        ((|op| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|lg| |List| (|Fraction| UP))
         ($ |Record| (|:| |basis| (|List| (|Fraction| UP)))
          (|:| |mat| (|Matrix| F))))
        (SPROG
         ((#1=#:G560 NIL) (|g| NIL) (#2=#:G559 NIL) (#3=#:G554 NIL) (|c| (UP)))
         (SEQ
          (COND
           ((SPADCALL (LETT |c| (SPADCALL |op| (QREFELT $ 109)))
                      (QREFELT $ 110))
            (|ODERAT;ratDsolve1| |op| |lg| $))
           ('T
            (|ODERAT;ratDsolve1|
             (PROG2 (LETT #3# (SPADCALL |op| |c| (QREFELT $ 112)))
                 (QCDR #3#)
               (|check_union2| (QEQCAR #3# 0)
                               (|LinearOrdinaryDifferentialOperator2|
                                (QREFELT $ 7) (|Fraction| (QREFELT $ 7)))
                               (|Union|
                                (|LinearOrdinaryDifferentialOperator2|
                                 (QREFELT $ 7) (|Fraction| (QREFELT $ 7)))
                                "failed")
                               #3#))
             (PROGN
              (LETT #2# NIL)
              (SEQ (LETT |g| NIL) (LETT #1# |lg|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL
                             (SPADCALL (SPADCALL |c| (QREFELT $ 25))
                                       (QREFELT $ 26))
                             |g| (QREFELT $ 27))
                            #2#))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#))))
             $)))))) 

(SDEFUN |ODERAT;integrate_sols;LodoR;20|
        ((|op| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |Record|
          (|:| |ltilde|
               (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
          (|:| |r|
               (|Union| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
                        "failed"))))
        (SPADCALL |op| (ELT $ 106) (QREFELT $ 119))) 

(DECLAIM (NOTINLINE |RationalLODE;|)) 

(DEFUN |RationalLODE| (&REST #1=#:G566)
  (SPROG NIL
         (PROG (#2=#:G567)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RationalLODE|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RationalLODE;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RationalLODE|)))))))))) 

(DEFUN |RationalLODE;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RationalLODE| DV$1 DV$2))
          (LETT $ (GETREFV 121))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RationalLODE| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          $))) 

(MAKEPROP '|RationalLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|dummy| (|Fraction| 7) (4 . |denom|)
              (|NonNegativeInteger|) (9 . |degree|) (14 . |numer|) (|Boolean|)
              (|Integer|) (19 . |even?|) (24 . |One|) (28 . |One|) (32 . -)
              (|LinearOrdinaryDifferentialOperator2| 7 11) (37 . |degree|)
              (42 . |leadingCoefficient|) (47 . |coerce|) (52 . |inv|) (57 . *)
              (63 . |Zero|) (67 . |Zero|) (|List| 11)
              (|PrimitiveRatDE| 6 7 22 75) (71 . |denomLODE|) (77 . |elt|)
              (83 . |elt|) (89 . -) (95 . |concat|) (|List| 30) (|Matrix| 11)
              (101 . |matrix|) (|Matrix| 7) (|Matrix| $)
              (106 . |reducedSystem|) (|Matrix| 6) (111 . |reducedSystem|)
              (116 . |minimumDegree|) (121 . >) (127 . |monomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (133 . |monicRightDivide|) (139 . |One|) (|Union| 11 '"failed")
              (|RationalIntegration| 6 7) (143 . |infieldint|)
              (|Union| 7 '"failed") (148 . |denomLODE|) (154 . |zero?|)
              (159 . |Zero|) (163 . =) (|Vector| 11) (169 . |vector|)
              (|Record| (|:| |mat| 40) (|:| |vec| (|Vector| 7))) (|Vector| $)
              (174 . |reducedSystem|) (|Record| (|:| |mat| 43) (|:| |vec| 68))
              (180 . |reducedSystem|) (|Union| 68 '"failed")
              (|Record| (|:| |particular| 66) (|:| |basis| (|List| 68)))
              (|Vector| 6) (|LinearSystemMatrixPackage| 6 68 68 43)
              (186 . |solve|) (192 . +) (198 . |concat!|)
              |ODERAT;indicialEquationAtInfinity;LodoUP;5|
              (|Record| (|:| |eq| 22) (|:| |rh| 30))
              (|LinearOrdinaryDifferentialOperator1| 11)
              (204 . |splitDenominator|)
              |ODERAT;indicialEquationAtInfinity;LodoUP;6|
              (|InnerCommonDenominator| 7 11 (|List| 7) 30)
              (210 . |commonDenominator|) (215 . *) (221 . |coefficient|)
              (227 . ~=) (233 . |coerce|) (238 . |elt|) (244 . |setelt!|)
              (|List| 6) (251 . |parts|) (256 . /) (262 . |minIndex|)
              (267 . |zero?|) (272 . |monomial|) (278 . |coerce|) (283 . +)
              (289 . |reductum|) (294 . |Zero|) (298 . ~=) (304 . >)
              (310 . |leadingCoefficient|) (315 . *) (321 . *)
              (|BoundIntegerRoots| 6 7) (327 . |integerBound|) (332 . |elt|)
              (338 . *) (|Record| (|:| |particular| 51) (|:| |basis| 30))
              |ODERAT;ratDsolve;LodoFR;16|
              (|Record| (|:| |basis| 30) (|:| |mat| 43))
              |ODERAT;ratDsolve;LodoLR;17| (344 . |content|) (349 . |unit?|)
              (|Union| $ '"failed") (354 . |exquo|)
              |ODERAT;ratDsolve;LodoFR;18| |ODERAT;ratDsolve;LodoLR;19|
              (|Union| 75 '"failed") (|Record| (|:| |ltilde| 75) (|:| |r| 115))
              (|Mapping| 105 75 11) (|IntegrateSolutions| 11 75)
              (360 . |integrate_sols|) |ODERAT;integrate_sols;LodoR;20|)
           '#(|ratDsolve| 366 |integrate_sols| 390 |indicialEquationAtInfinity|
              395)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|ratDsolve|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Fraction| |#2|)
                                                 #1="failed"))
                                   (|:| |basis| (|List| (|Fraction| |#2|))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction| |#2|))
                                  (|Fraction| |#2|)))
                                T)
                              '((|ratDsolve|
                                 ((|Record|
                                   (|:| |basis| (|List| (|Fraction| |#2|)))
                                   (|:| |mat| (|Matrix| |#1|)))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction| |#2|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|ratDsolve|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Fraction| |#2|) #1#))
                                   (|:| |basis| (|List| (|Fraction| |#2|))))
                                  (|LinearOrdinaryDifferentialOperator2| |#2|
                                                                         (|Fraction|
                                                                          |#2|))
                                  (|Fraction| |#2|)))
                                T)
                              '((|ratDsolve|
                                 ((|Record|
                                   (|:| |basis| (|List| (|Fraction| |#2|)))
                                   (|:| |mat| (|Matrix| |#1|)))
                                  (|LinearOrdinaryDifferentialOperator2| |#2|
                                                                         (|Fraction|
                                                                          |#2|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|indicialEquationAtInfinity|
                                 (|#2|
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction| |#2|))))
                                T)
                              '((|indicialEquationAtInfinity|
                                 (|#2|
                                  (|LinearOrdinaryDifferentialOperator2| |#2|
                                                                         (|Fraction|
                                                                          |#2|))))
                                T)
                              '((|integrate_sols|
                                 ((|Record|
                                   (|:| |ltilde|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction| |#2|)))
                                   (|:| |r|
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction| |#2|))
                                         "failed")))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction| |#2|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 120
                                            '(0 8 0 9 1 11 7 0 12 1 7 13 0 14 1
                                              11 7 0 15 1 17 16 0 18 0 6 0 19 0
                                              7 0 20 1 6 0 0 21 1 22 13 0 23 1
                                              22 7 0 24 1 11 0 7 25 1 11 0 0 26
                                              2 11 0 0 0 27 0 6 0 28 0 7 0 29 2
                                              31 7 22 30 32 2 30 11 0 17 33 2
                                              22 11 0 11 34 2 11 0 0 0 35 2 30
                                              0 0 0 36 1 38 0 37 39 1 11 40 41
                                              42 1 7 43 41 44 1 22 13 0 45 2 13
                                              16 0 0 46 2 22 0 7 13 47 2 22 48
                                              0 0 49 0 11 0 50 1 52 51 11 53 2
                                              31 54 22 11 55 1 11 16 0 56 0 11
                                              0 57 2 11 16 0 0 58 1 59 0 30 60
                                              2 11 61 41 62 63 2 7 64 41 62 65
                                              2 69 67 43 68 70 2 11 0 0 0 71 2
                                              30 0 0 0 72 2 31 74 75 30 76 1 78
                                              7 30 79 2 7 0 0 0 80 2 7 6 0 13
                                              81 2 6 16 0 0 82 1 6 0 17 83 2 7
                                              6 0 6 84 3 68 6 0 17 6 85 1 68 86
                                              0 87 2 11 0 7 7 88 1 68 17 0 89 1
                                              6 16 0 90 2 7 0 6 13 91 1 7 0 6
                                              92 2 7 0 0 0 93 1 22 0 0 94 0 22
                                              0 95 2 22 16 0 0 96 2 17 16 0 0
                                              97 1 7 6 0 98 2 6 0 0 0 99 2 7 0
                                              6 0 100 1 101 17 7 102 2 68 6 0
                                              17 103 2 11 0 7 0 104 1 22 7 0
                                              109 1 7 16 0 110 2 22 111 0 7 112
                                              2 118 116 75 117 119 2 0 105 75
                                              11 106 2 0 105 22 11 113 2 0 107
                                              75 30 108 2 0 107 22 30 114 1 0
                                              116 75 120 1 0 7 75 77 1 0 7 22
                                              73)))))
           '|lookupComplete|)) 
