
(SDEFUN |INMODGCD;reduction;BPRBP;1| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;1!0| (VECTOR $ |p|))
                       |u| (QREFELT $ 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;1!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 14)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;2| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;2!0| (VECTOR $ |p|))
                       |u| (QREFELT $ 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;2!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 18)))))) 

(SDEFUN |INMODGCD;modularGcdPrimitive;LBP;3| ((|listf| |List| BP) ($ BP))
        (SPROG ((|g| (BP)) (#1=#:G436 NIL) (|f| NIL))
               (SEQ
                (COND ((NULL |listf|) (|spadConstant| $ 11))
                      ('T
                       (SEQ (LETT |g| (|SPADfirst| |listf|))
                            (SEQ (LETT |f| NIL) (LETT #1# (CDR |listf|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |f| (CAR #1#)) NIL)
                                       (NULL
                                        (SPADCALL (SPADCALL |g| (QREFELT $ 23))
                                                  0 (QREFELT $ 24))))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |f| (QREFELT $ 21)))
                                     (LETT |g|
                                           (|INMODGCD;modGcdPrimitive| |g| |f|
                                            $))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |g|))))))) 

(SDEFUN |INMODGCD;modularGcd;LBP;4| ((|listf| |List| BP) ($ BP))
        (SPROG
         ((|ans| (BP)) (|minpol| (BP)) (#1=#:G442 NIL) (#2=#:G463 NIL)
          (|f| NIL) (#3=#:G464 NIL) (|cf| NIL) (#4=#:G462 NIL) (|contgcd| (R))
          (|listCont| (|List| R)) (#5=#:G461 NIL) (#6=#:G460 NIL)
          (|listdeg| (|List| (|NonNegativeInteger|))) (#7=#:G459 NIL)
          (#8=#:G458 NIL) (#9=#:G457 NIL) (#10=#:G456 NIL) (|minpol1| (BP))
          (|mdeg| #11=(|NonNegativeInteger|)) (#12=#:G439 NIL)
          (#13=#:G438 #11#) (#14=#:G440 #11#) (#15=#:G455 NIL))
         (SEQ
          (LETT |listf|
                (SPADCALL (|spadConstant| $ 11) |listf| (QREFELT $ 27)))
          (EXIT
           (COND ((NULL |listf|) (|spadConstant| $ 11))
                 ((EQL (LENGTH |listf|) 1) (|SPADfirst| |listf|))
                 (#16='T
                  (SEQ (LETT |minpol| (|spadConstant| $ 29))
                       (LETT |mdeg|
                             (PROGN
                              (LETT #12# NIL)
                              (SEQ (LETT |f| NIL) (LETT #15# |listf|) G190
                                   (COND
                                    ((OR (ATOM #15#)
                                         (PROGN (LETT |f| (CAR #15#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #14# (SPADCALL |f| (QREFELT $ 30)))
                                      (COND (#12# (LETT #13# (MIN #13# #14#)))
                                            ('T
                                             (PROGN
                                              (LETT #13# #14#)
                                              (LETT #12# 'T)))))))
                                   (LETT #15# (CDR #15#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#12# #13#)
                                    (#16# (|IdentityError| '|min|)))))
                       (COND
                        ((SPADCALL |mdeg| 0 (QREFELT $ 24))
                         (SEQ
                          (LETT |minpol1|
                                (SPADCALL (|spadConstant| $ 28) |mdeg|
                                          (QREFELT $ 31)))
                          (LETT |listf|
                                (PROGN
                                 (LETT #10# NIL)
                                 (SEQ (LETT |f| NIL) (LETT #9# |listf|) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN (LETT |f| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (PROG2
                                                   (LETT #1#
                                                         (SPADCALL |f|
                                                                   |minpol1|
                                                                   (QREFELT $
                                                                            33)))
                                                   (QCDR #1#)
                                                 (|check_union2| (QEQCAR #1# 0)
                                                                 (QREFELT $ 7)
                                                                 (|Union|
                                                                  (QREFELT $ 7)
                                                                  #17="failed")
                                                                 #1#))
                                               #10#))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT (NREVERSE #10#)))))
                          (EXIT
                           (LETT |minpol|
                                 (SPADCALL |minpol| |minpol1|
                                           (QREFELT $ 34)))))))
                       (LETT |listdeg|
                             (PROGN
                              (LETT #8# NIL)
                              (SEQ (LETT |f| NIL) (LETT #7# |listf|) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN (LETT |f| (CAR #7#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #8#
                                           (CONS (SPADCALL |f| (QREFELT $ 23))
                                                 #8#))))
                                   (LETT #7# (CDR #7#)) (GO G190) G191
                                   (EXIT (NREVERSE #8#)))))
                       (LETT |listCont|
                             (PROGN
                              (LETT #6# NIL)
                              (SEQ (LETT |f| NIL) (LETT #5# |listf|) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |f| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS (SPADCALL |f| (QREFELT $ 35))
                                                 #6#))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT (NREVERSE #6#)))))
                       (LETT |contgcd| (SPADCALL |listCont| (QREFELT $ 37)))
                       (LETT |listf|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |cf| NIL) (LETT #3# |listCont|)
                                   (LETT |f| NIL) (LETT #2# |listf|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |f| (CAR #2#)) NIL)
                                         (ATOM #3#)
                                         (PROGN (LETT |cf| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL |f| |cf|
                                                                (QREFELT $
                                                                         38)))
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (QREFELT $ 7)
                                                              (|Union|
                                                               (QREFELT $ 7)
                                                               #17#)
                                                              #1#))
                                            #4#))))
                                   (LETT #2#
                                         (PROG1 (CDR #2#)
                                           (LETT #3# (CDR #3#))))
                                   (GO G190) G191 (EXIT (NREVERSE #4#)))))
                       (LETT |minpol|
                             (SPADCALL |contgcd| |minpol| (QREFELT $ 39)))
                       (LETT |ans|
                             (COND
                              ((SPADCALL (|spadConstant| $ 29) |listf|
                                         (QREFELT $ 40))
                               (|spadConstant| $ 29))
                              ((SPADCALL 1 |listdeg| (QREFELT $ 42))
                               (|INMODGCD;lincase| |listdeg| |listf| $))
                              (#16# (SPADCALL |listf| (QREFELT $ 26)))))
                       (EXIT (SPADCALL |minpol| |ans| (QREFELT $ 34)))))))))) 

(SDEFUN |INMODGCD;lincase|
        ((|listdeg| |List| (|NonNegativeInteger|)) (|listf| |List| BP) ($ BP))
        (SPROG
         ((#1=#:G474 NIL) (|f1| (|Union| BP "failed")) (#2=#:G475 NIL)
          (|f| NIL) (|g| (BP)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL 1 |listdeg| (QREFELT $ 45)))
                (LETT |g| (SPADCALL |listf| |n| (QREFELT $ 46)))
                (SEQ (LETT |f| NIL) (LETT #2# |listf|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 33)))
                          (EXIT
                           (COND
                            ((QEQCAR |f1| 1)
                             (PROGN
                              (LETT #1# (|spadConstant| $ 29))
                              (GO #3=#:G473))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |g|)))
          #3# (EXIT #1#)))) 

(SDEFUN |INMODGCD;test| ((|f| BP) (|g| BP) (|d| BP) ($ |Boolean|))
        (SPROG ((|d0| (R)))
               (SEQ (LETT |d0| (SPADCALL |d| 0 (QREFELT $ 47)))
                    (EXIT
                     (COND
                      ((OR
                        (QEQCAR
                         (SPADCALL (SPADCALL |f| 0 (QREFELT $ 47)) |d0|
                                   (QREFELT $ 48))
                         1)
                        (OR
                         (QEQCAR
                          (SPADCALL (SPADCALL |g| 0 (QREFELT $ 47)) |d0|
                                    (QREFELT $ 48))
                          1)
                         (QEQCAR (SPADCALL |f| |d| (QREFELT $ 33)) 1)))
                       NIL)
                      ('T
                       (NULL (QEQCAR (SPADCALL |g| |d| (QREFELT $ 33)) 1)))))))) 

(SDEFUN |INMODGCD;modGcdPrimitive| ((|f| BP) (|g| BP) ($ BP))
        (SPROG
         ((#1=#:G508 NIL) (|result| (BP)) (|testdeg| #2=(|NonNegativeInteger|))
          (|soFar| (BP)) (|soFarModulus| (R)) (|correctionFactor| (R))
          (|ans| (BP)) (#3=#:G490 NIL) (|cont| (R)) (|correction| (BP))
          (|dp| (FP)) (|ldp| (FP)) (|lcdp| (R)) (|dgp| (|NonNegativeInteger|))
          (|gp| (FP)) (|fp| (FP)) (|prime| (R))
          (|bound| (|NonNegativeInteger|)) (|lcd| (R)) (|lcg| (R)) (|lcf| (R))
          (|dg| #2#) (|df| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT $ 23)))
                (LETT |dg| (SPADCALL |g| (QREFELT $ 23)))
                (LETT |lcf| (SPADCALL |f| (QREFELT $ 49)))
                (LETT |lcg| (SPADCALL |g| (QREFELT $ 49)))
                (LETT |lcd| (SPADCALL |lcf| |lcg| (QREFELT $ 50)))
                (LETT |prime| (QREFELT $ 8))
                (LETT |bound| (|INMODGCD;mbound| |f| |g| $))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                                  (QREFELT $ 51)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |prime|
                             (SPADCALL |prime| |bound| (QREFELT $ 9)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |soFar|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| |prime| (QREFELT $ 52))
                                 (SPADCALL |g| |prime| (QREFELT $ 52))
                                 (QREFELT $ 53))
                       (QREFELT $ 54)))
                (LETT |testdeg| (SPADCALL |soFar| (QREFELT $ 23)))
                (EXIT
                 (COND
                  ((ZEROP |testdeg|)
                   (PROGN (LETT #1# (|spadConstant| $ 29)) (GO #4=#:G507)))
                  (#5='T
                   (SEQ
                    (LETT |ldp|
                          (SEQ (LETT |lcdp| (SPADCALL |soFar| (QREFELT $ 49)))
                               (EXIT
                                (COND
                                 ((SPADCALL |lcdp| (|spadConstant| $ 28)
                                            (QREFELT $ 13))
                                  (SPADCALL (SPADCALL |lcd| (QREFELT $ 55))
                                            |prime| (QREFELT $ 52)))
                                 (#5#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (|INMODGCD;modInverse| |lcdp| |prime| $)
                                     |lcd| (QREFELT $ 56))
                                    (QREFELT $ 55))
                                   |prime| (QREFELT $ 52)))))))
                    (LETT |soFar|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |ldp| (QREFELT $ 54)) |soFar|
                                      (QREFELT $ 34))
                            |prime| (QREFELT $ 52))
                           (QREFELT $ 54)))
                    (LETT |soFarModulus| |prime|)
                    (EXIT
                     (SEQ G190 (COND ((NULL 'T) (GO G191)))
                          (SEQ
                           (LETT |prime|
                                 (SPADCALL |prime| |bound| (QREFELT $ 9)))
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                                        (|spadConstant| $ 10) (QREFELT $ 13))
                              "next prime")
                             ('T
                              (SEQ
                               (LETT |fp|
                                     (SPADCALL |f| |prime| (QREFELT $ 52)))
                               (LETT |gp|
                                     (SPADCALL |g| |prime| (QREFELT $ 52)))
                               (LETT |dp| (SPADCALL |fp| |gp| (QREFELT $ 53)))
                               (LETT |dgp| (SPADCALL |dp| (QREFELT $ 57)))
                               (COND
                                ((EQL |dgp| 0)
                                 (PROGN
                                  (LETT #1# (|spadConstant| $ 29))
                                  (GO #4#))))
                               (COND
                                ((EQL |dgp| |dg|)
                                 (COND
                                  ((NULL
                                    (QEQCAR (SPADCALL |f| |g| (QREFELT $ 33))
                                            1))
                                   (PROGN (LETT #1# |g|) (GO #4#))))))
                               (COND
                                ((EQL |dgp| |df|)
                                 (COND
                                  ((NULL
                                    (QEQCAR (SPADCALL |g| |f| (QREFELT $ 33))
                                            1))
                                   (PROGN (LETT #1# |f|) (GO #4#))))))
                               (EXIT
                                (COND
                                 ((SPADCALL |dgp| |testdeg| (QREFELT $ 24))
                                  "next prime")
                                 ('T
                                  (SEQ
                                   (LETT |ldp|
                                         (SEQ
                                          (LETT |lcdp|
                                                (SPADCALL
                                                 (SPADCALL |dp| (QREFELT $ 54))
                                                 (QREFELT $ 49)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |lcdp|
                                                       (|spadConstant| $ 28)
                                                       (QREFELT $ 13))
                                             (SPADCALL
                                              (SPADCALL |lcd| (QREFELT $ 55))
                                              |prime| (QREFELT $ 52)))
                                            ('T
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (|INMODGCD;modInverse| |lcdp|
                                                 |prime| $)
                                                |lcd| (QREFELT $ 56))
                                               (QREFELT $ 55))
                                              |prime| (QREFELT $ 52)))))))
                                   (LETT |dp|
                                         (SPADCALL |ldp| |dp| (QREFELT $ 58)))
                                   (EXIT
                                    (COND
                                     ((EQL |dgp| |testdeg|)
                                      (SEQ
                                       (LETT |correction|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |dp| (QREFELT $ 54))
                                                |soFar| (QREFELT $ 59))
                                               |prime| (QREFELT $ 52))
                                              (QREFELT $ 54)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |correction|
                                                    (QREFELT $ 21))
                                          (SEQ
                                           (LETT |ans|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |lcd|
                                                              (QREFELT $ 55))
                                                    |soFar| (QREFELT $ 34))
                                                   |soFarModulus|
                                                   (QREFELT $ 52))
                                                  (QREFELT $ 54)))
                                           (LETT |cont|
                                                 (SPADCALL |ans|
                                                           (QREFELT $ 35)))
                                           (LETT |ans|
                                                 (PROG2
                                                     (LETT #3#
                                                           (SPADCALL |ans|
                                                                     |cont|
                                                                     (QREFELT $
                                                                              38)))
                                                     (QCDR #3#)
                                                   (|check_union2|
                                                    (QEQCAR #3# 0)
                                                    (QREFELT $ 7)
                                                    (|Union| (QREFELT $ 7)
                                                             "failed")
                                                    #3#)))
                                           (EXIT
                                            (COND
                                             ((|INMODGCD;test| |f| |g| |ans| $)
                                              (PROGN
                                               (LETT #1# |ans|)
                                               (GO #4#)))
                                             ('T
                                              (LETT |soFarModulus|
                                                    (SPADCALL |soFarModulus|
                                                              |prime|
                                                              (QREFELT $
                                                                       56))))))))
                                         ('T
                                          (SEQ
                                           (LETT |correctionFactor|
                                                 (|INMODGCD;modInverse|
                                                  (SPADCALL |soFarModulus|
                                                            |prime|
                                                            (QREFELT $ 18))
                                                  |prime| $))
                                           (LETT |soFar|
                                                 (SPADCALL |soFar|
                                                           (SPADCALL
                                                            |soFarModulus|
                                                            (SPADCALL
                                                             |correctionFactor|
                                                             |correction|
                                                             (QREFELT $ 39))
                                                            (QREFELT $ 39))
                                                           (QREFELT $ 60)))
                                           (LETT |soFarModulus|
                                                 (SPADCALL |soFarModulus|
                                                           |prime|
                                                           (QREFELT $ 56)))
                                           (EXIT
                                            (LETT |soFar|
                                                  (SPADCALL
                                                   (SPADCALL |soFar|
                                                             |soFarModulus|
                                                             (QREFELT $ 52))
                                                   (QREFELT $ 54))))))))))
                                     ((< |dgp| |testdeg|)
                                      (SEQ (LETT |soFarModulus| |prime|)
                                           (LETT |soFar|
                                                 (SPADCALL |dp|
                                                           (QREFELT $ 54)))
                                           (EXIT (LETT |testdeg| |dgp|))))
                                     ((NULL (QREFELT $ 20))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |prime| (QREFELT $ 61)) 1
                                         (QREFELT $ 24))
                                        (SEQ
                                         (LETT |result|
                                               (SPADCALL |dp| (QREFELT $ 54)))
                                         (EXIT
                                          (COND
                                           ((|INMODGCD;test| |f| |g| |result|
                                             $)
                                            (PROGN
                                             (LETT #1# |result|)
                                             (GO #4#))))))))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |INMODGCD;merge| ((|p| R) (|q| R) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 13)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 10) (QREFELT $ 13))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |INMODGCD;modInverse| ((|c| R) (|p| R) ($ R))
        (SPROG ((#1=#:G515 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| $ 28)
                                    (QREFELT $ 64)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 6))
                                            (|:| |coef2| (QREFELT $ 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 6))
                                             (|:| |coef2| (QREFELT $ 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |INMODGCD;exactquo| ((|u| BP) (|v| BP) (|p| R) ($ |Union| BP "failed"))
        (SPROG
         ((|r| (|Record| (|:| |quotient| BP) (|:| |remainder| BP)))
          (|invlcv| (R)))
         (SEQ
          (LETT |invlcv|
                (|INMODGCD;modInverse| (SPADCALL |v| (QREFELT $ 49)) |p| $))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 39)) |p|
                                    (QREFELT $ 17))
                          (QREFELT $ 66)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 17))
                       (|spadConstant| $ 11) (QREFELT $ 67))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 39)) |p|
                             (QREFELT $ 17))))))))) 

(SDEFUN |INMODGCD;height| ((|f| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G525 NIL) (#2=#:G524 #3=(|NonNegativeInteger|)) (#4=#:G526 #3#)
          (#5=#:G529 NIL) (|cc| NIL) (|degf| (|NonNegativeInteger|)))
         (SEQ (LETT |degf| (SPADCALL |f| (QREFELT $ 23)))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |cc| NIL) (LETT #5# (SPADCALL |f| (QREFELT $ 69)))
                     G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |cc| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4# (SPADCALL |cc| (QREFELT $ 61)))
                        (COND (#1# (LETT #2# (MAX #2# #4#)))
                              ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|IdentityError| '|max|)))))))) 

(SDEFUN |INMODGCD;mbound| ((|f| BP) (|g| BP) ($ |NonNegativeInteger|))
        (SPROG ((|hg| #1=(|NonNegativeInteger|)) (|hf| #1#))
               (SEQ (LETT |hf| (|INMODGCD;height| |f| $))
                    (LETT |hg| (|INMODGCD;height| |g| $))
                    (EXIT (SPADCALL 2 (MIN |hf| |hg|) (QREFELT $ 71)))))) 

(DECLAIM (NOTINLINE |InnerModularGcd;|)) 

(DEFUN |InnerModularGcd| (&REST #1=#:G532)
  (SPROG NIL
         (PROG (#2=#:G533)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerModularGcd|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerModularGcd;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerModularGcd|)))))))))) 

(DEFUN |InnerModularGcd;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|InnerModularGcd| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 72))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerModularGcd|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|IntegerNumberSystem|))
      (QSETREFV $ 17
                (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;1|) $)))
     ('T
      (QSETREFV $ 17
                (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;2|) $))))
    (QSETREFV $ 19
              (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 17)
                                      (CONS (|function| |INMODGCD;merge|) $)
                                      (CONS (|function| |INMODGCD;exactquo|)
                                            $)))
    (QSETREFV $ 20 (|HasCategory| |#1| '(|CharacteristicZero|)))
    $))) 

(MAKEPROP '|InnerModularGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (4 . |Zero|)
              (|Boolean|) (8 . =) (14 . |symmetricRemainder|) (|Mapping| 6 6)
              (20 . |map|) (26 . |reduction|) (32 . |rem|) 'FP '|zeroChar|
              (38 . |zero?|) (|NonNegativeInteger|) (43 . |degree|) (48 . >)
              (|List| 7) |INMODGCD;modularGcdPrimitive;LBP;3| (54 . |remove!|)
              (60 . |One|) (64 . |One|) (68 . |minimumDegree|)
              (73 . |monomial|) (|Union| $ '"failed") (79 . |exquo|) (85 . *)
              (91 . |content|) (|List| $) (96 . |gcd|) (101 . |exquo|)
              (107 . *) (113 . |member?|) (|List| 22) (119 . |member?|)
              |INMODGCD;modularGcd;LBP;4| (|Integer|) (125 . |position|)
              (131 . |elt|) (137 . |coefficient|) (143 . |exquo|)
              (149 . |leadingCoefficient|) (154 . |gcd|) (160 . |zero?|)
              (165 . |reduce|) (171 . |gcd|) (177 . |coerce|) (182 . |coerce|)
              (187 . *) (193 . |euclideanSize|) (198 . *) (204 . -) (210 . +)
              (216 . |euclideanSize|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 62 '"failed")
              (221 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (228 . |monicDivide|) (234 . ~=) (|List| 6)
              (240 . |coefficients|) (|PositiveInteger|) (245 . *))
           '#(|reduction| 251 |modularGcdPrimitive| 257 |modularGcd| 262) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|modularGcdPrimitive| (|#2| (|List| |#2|))) T)
                              '((|modularGcd| (|#2| (|List| |#2|))) T)
                              '((|reduction| (|#2| |#2| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 71
                                            '(0 6 0 10 0 7 0 11 2 6 12 0 0 13 2
                                              6 0 0 0 14 2 7 0 15 0 16 2 0 7 7
                                              6 17 2 6 0 0 0 18 1 7 12 0 21 1 7
                                              22 0 23 2 22 12 0 0 24 2 25 0 7 0
                                              27 0 6 0 28 0 7 0 29 1 7 22 0 30
                                              2 7 0 6 22 31 2 7 32 0 0 33 2 7 0
                                              0 0 34 1 7 6 0 35 1 6 0 36 37 2 7
                                              32 0 6 38 2 7 0 6 0 39 2 25 12 7
                                              0 40 2 41 12 22 0 42 2 41 44 22 0
                                              45 2 25 7 0 44 46 2 7 6 0 22 47 2
                                              6 32 0 0 48 1 7 6 0 49 2 6 0 0 0
                                              50 1 6 12 0 51 2 19 0 7 6 52 2 19
                                              0 0 0 53 1 19 7 0 54 1 7 0 6 55 2
                                              6 0 0 0 56 1 19 22 0 57 2 19 0 0
                                              0 58 2 7 0 0 0 59 2 7 0 0 0 60 1
                                              6 22 0 61 3 6 63 0 0 0 64 2 7 65
                                              0 0 66 2 7 12 0 0 67 1 7 68 0 69
                                              2 22 0 70 0 71 2 0 7 7 6 17 1 0 7
                                              25 26 1 0 7 25 43)))))
           '|lookupComplete|)) 