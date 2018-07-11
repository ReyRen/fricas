
(SDEFUN |PFBR;gen_solv|
        ((|fl| |List| (|SparseUnivariatePolynomial| R))
         ($ |Mapping|
          (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")
          (|SparseUnivariatePolynomial| R)))
        (SPROG NIL (CONS #'|PFBR;gen_solv!0| (VECTOR $ |fl|)))) 

(SDEFUN |PFBR;gen_solv!0| ((|pr| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |fl| |pr| (QREFELT $ 13)))))) 

(SDEFUN |PFBR;randomR;IR;2| ((|n| |Integer|) ($ R)) (SPADCALL (QREFELT $ 14))) 

(SDEFUN |PFBR;randomR;IR;3| ((|n| |Integer|) ($ R))
        (SPADCALL (- (RANDOM (+ (SPADCALL 2 |n| (QREFELT $ 18)) 1)) |n|)
                  (QREFELT $ 19))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;4|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((#1=#:G424 NIL) (|w| NIL) (#2=#:G423 NIL)
          (|ans|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R)))
            "failed"))
          (|ppR|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R)))
          (|lpolysR|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R))))
          (#3=#:G422 NIL) (|u| NIL) (#4=#:G421 NIL))
         (SEQ
          (LETT |lpolysR|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |u| NIL) (LETT #3# |lpolys|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (SPADCALL (ELT $ 21) |u| (QREFELT $ 26))
                                    #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |ppR| (SPADCALL (ELT $ 21) |pp| (QREFELT $ 26)))
          (LETT |ans| (SPADCALL |lpolysR| |ppR| (QREFELT $ 27)))
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |w| NIL) (LETT #1# (QCDR |ans|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |w| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL
                                        (CONS
                                         #'|PFBR;bivariateSLPEBR;LSupVarSetU;4!0|
                                         (VECTOR $ |v|))
                                        |w| (QREFELT $ 32))
                                       #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;4!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 29)))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;5|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpolys| |pp| (QREFELT $ 37))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((#1=#:G437 NIL) (|ppR| (|SparseUnivariatePolynomial| R))
          (|substns| (|List| R)) (#2=#:G439 NIL) (|v| NIL) (#3=#:G438 NIL)
          (|n| (|Integer|)))
         (SEQ (LETT |n| 1)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ (LETT |n| (+ (SPADCALL 2 |n| (QREFELT $ 18)) 1))
                          (LETT |substns|
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |v| NIL) (LETT #2# |lvpp|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |v| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL |n| (QREFELT $ 16))
                                               #3#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#)))))
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL (SPADCALL |pp| (QREFELT $ 38)) |lvpp|
                                        |substns| (QREFELT $ 41))
                              (QREFELT $ 43))
                             "next")
                            ('T
                             (SEQ
                              (LETT |ppR|
                                    (SPADCALL
                                     (CONS
                                      #'|PFBR;chooseFSQViableSubstitutions!0|
                                      (VECTOR $ |substns| |lvpp|))
                                     |pp| (QREFELT $ 47)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL |ppR|
                                             (SPADCALL |ppR| (QREFELT $ 48))
                                             (QREFELT $ 49))
                                   (QREFELT $ 51))
                                  0 (QREFELT $ 52))
                                 "next")
                                ('T
                                 (PROGN
                                  (LETT #1# |$NoValue|)
                                  (GO #4=#:G434))))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #4# (EXIT #1#))
              (EXIT (CONS |substns| |ppR|))))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpp| |substns| $)
          (LETT |lvpp| (QREFELT $$ 2))
          (LETT |substns| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpp| |substns| (QREFELT $ 41))
                      (QREFELT $ 44)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions|
        ((|lvpolys| |List| |VarSet|)
         (|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |lpolysRField| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((|ppR| (|SparseUnivariatePolynomial| R)) (#1=#:G462 NIL)
          (|uu| #2=(|List| (|SparseUnivariatePolynomial| R))) (#3=#:G461 NIL)
          (#4=#:G449 NIL) (#5=#:G448 #6=(|Boolean|)) (#7=#:G450 #6#)
          (#8=#:G468 NIL) (|v| NIL) (|lpolysR| #2#) (#9=#:G467 NIL) (|u| NIL)
          (#10=#:G466 NIL) (#11=#:G443 NIL) (#12=#:G442 #13=(|Boolean|))
          (#14=#:G444 #13#) (#15=#:G465 NIL) (|substns| (|List| R))
          (#16=#:G464 NIL) (#17=#:G463 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| 1)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ (LETT |n| (+ (SPADCALL 2 |n| (QREFELT $ 18)) 1))
                          (LETT |substns|
                                (PROGN
                                 (LETT #17# NIL)
                                 (SEQ (LETT |v| NIL) (LETT #16# |lvpolys|) G190
                                      (COND
                                       ((OR (ATOM #16#)
                                            (PROGN (LETT |v| (CAR #16#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #17#
                                              (CONS
                                               (SPADCALL |n| (QREFELT $ 16))
                                               #17#))))
                                      (LETT #16# (CDR #16#)) (GO G190) G191
                                      (EXIT (NREVERSE #17#)))))
                          (EXIT
                           (COND
                            ((OR
                              (SPADCALL
                               (SPADCALL (SPADCALL |pp| (QREFELT $ 38))
                                         |lvpolys| |substns| (QREFELT $ 41))
                               (QREFELT $ 43))
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT |u| NIL) (LETT #15# |lpolys|) G190
                                    (COND
                                     ((OR (ATOM #15#)
                                          (PROGN (LETT |u| (CAR #15#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #14#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |u| (QREFELT $ 38))
                                               |lvpolys| |substns|
                                               (QREFELT $ 41))
                                              (QREFELT $ 43)))
                                       (COND
                                        (#11#
                                         (LETT #12#
                                               (COND (#12# 'T) ('T #14#))))
                                        ('T
                                         (PROGN
                                          (LETT #12# #14#)
                                          (LETT #11# 'T)))))))
                                    (LETT #15# (CDR #15#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#11# #12#) ('T NIL))))
                             "next")
                            ('T
                             (SEQ
                              (LETT |lpolysR|
                                    (PROGN
                                     (LETT #10# NIL)
                                     (SEQ (LETT |u| NIL) (LETT #9# |lpolys|)
                                          G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |u| (CAR #9#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #10#
                                                  (CONS
                                                   (SPADCALL
                                                    (CONS
                                                     #'|PFBR;chooseSLPEViableSubstitutions!0|
                                                     (VECTOR $ |substns|
                                                             |lvpolys|))
                                                    |u| (QREFELT $ 47))
                                                   #10#))))
                                          (LETT #9# (CDR #9#)) (GO G190) G191
                                          (EXIT (NREVERSE #10#)))))
                              (LETT |uu| |lpolysR|)
                              (SEQ
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL (NULL (NULL |uu|))) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((PROGN
                                          (LETT #4# NIL)
                                          (SEQ (LETT |v| NIL)
                                               (LETT #8# (CDR |uu|)) G190
                                               (COND
                                                ((OR (ATOM #8#)
                                                     (PROGN
                                                      (LETT |v| (CAR #8#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #7#
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|SPADfirst| |uu|)
                                                           |v| (QREFELT $ 49))
                                                          (QREFELT $ 51))
                                                         0 (QREFELT $ 52)))
                                                  (COND
                                                   (#4#
                                                    (LETT #5#
                                                          (COND (#5# 'T)
                                                                ('T #7#))))
                                                   ('T
                                                    (PROGN
                                                     (LETT #5# #7#)
                                                     (LETT #4# 'T)))))))
                                               (LETT #8# (CDR #8#)) (GO G190)
                                               G191 (EXIT NIL))
                                          (COND (#4# #5#) ('T NIL)))
                                         (PROGN
                                          (LETT #3# |$NoValue|)
                                          (GO #18=#:G452)))
                                        ('T (LETT |uu| (CDR |uu|))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #18# (EXIT #3#))
                              (COND ((NULL (NULL |uu|)) (EXIT "next")))
                              (EXIT
                               (PROGN
                                (LETT #1# |$NoValue|)
                                (GO #19=#:G457))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #19# (EXIT #1#))
              (LETT |ppR|
                    (SPADCALL
                     (CONS #'|PFBR;chooseSLPEViableSubstitutions!1|
                           (VECTOR $ |substns| |lvpolys|))
                     |pp| (QREFELT $ 47)))
              (EXIT (VECTOR |substns| |lpolysR| |ppR|))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!1| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2))
          (LETT |substns| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 41))
                      (QREFELT $ 44)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2))
          (LETT |substns| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 41))
                      (QREFELT $ 44)))))) 

(SDEFUN |PFBR;raise|
        ((|supR| |SparseUnivariatePolynomial| R)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL (ELT $ 53) |supR| (QREFELT $ 56))) 

(SDEFUN |PFBR;lower|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (ELT $ 44) |pp| (QREFELT $ 47))) 

(SDEFUN |PFBR;SLPEBR|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|lvpolys| . #1=(|List| |VarSet|))
         (|pp| |SparseUnivariatePolynomial| S) (|lvpp| . #1#)
         ($ . #2=(|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed")))
        (SPROG
         ((|ansR| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|cVS|
           (|Record| (|:| |substnsField| (|List| R))
                     (|:| |lpolysRField|
                          (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (#3=#:G511 NIL) (|uu| NIL) (#4=#:G510 NIL) (#5=#:G499 NIL)
          (|ppR| (|SparseUnivariatePolynomial| R))
          (|lpolysR| (|List| (|SparseUnivariatePolynomial| R))) (#6=#:G509 NIL)
          (|u| NIL) (#7=#:G508 NIL) (#8=#:G507 NIL)
          (|pp1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S)))
          (#9=#:G506 NIL)
          (|ans|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S))))
          (#10=#:G504 NIL) (|a| NIL) (#11=#:G505 NIL) (|a1| NIL)
          (#12=#:G503 NIL) (|d| (|NonNegativeInteger|)) (|ans1| #2#)
          (#13=#:G502 NIL) (|m| (|List| |VarSet|)) (#14=#:G501 NIL)
          (#15=#:G500 NIL) (|v| (|VarSet|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (NULL (LETT |m| (SPADCALL |lvpp| |lvpolys| (QREFELT $ 57)))))
             (SEQ (LETT |v| (|SPADfirst| |m|))
                  (LETT |lvpp| (SPADCALL |v| |lvpp| (QREFELT $ 58)))
                  (LETT |pp1|
                        (SPADCALL
                         (SPADCALL (CONS #'|PFBR;SLPEBR!0| (VECTOR $ |v|)) |pp|
                                   (QREFELT $ 63))
                         (QREFELT $ 65)))
                  (LETT |ans|
                        (PROGN
                         (LETT #15# NIL)
                         (SEQ (LETT |u| NIL) (LETT #14# |lpolys|) G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |u| (CAR #14#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15# (CONS (|spadConstant| $ 66) #15#))))
                              (LETT #14# (CDR #14#)) (GO G190) G191
                              (EXIT (NREVERSE #15#)))))
                  (SEQ (LETT |m| NIL)
                       (LETT #13# (NREVERSE (SPADCALL |pp1| (QREFELT $ 68))))
                       G190
                       (COND
                        ((OR (ATOM #13#) (PROGN (LETT |m| (CAR #13#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ans1|
                              (|PFBR;SLPEBR| |lpolys| |lvpolys|
                               (SPADCALL |m| (QREFELT $ 69)) |lvpp| $))
                        (EXIT
                         (COND
                          ((QEQCAR |ans1| 1)
                           (PROGN
                            (LETT #5# (CONS 1 "failed"))
                            (GO #16=#:G498)))
                          ('T
                           (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 70)))
                                (EXIT
                                 (LETT |ans|
                                       (PROGN
                                        (LETT #12# NIL)
                                        (SEQ (LETT |a1| NIL)
                                             (LETT #11# (QCDR |ans1|))
                                             (LETT |a| NIL) (LETT #10# |ans|)
                                             G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |a| (CAR #10#))
                                                    NIL)
                                                   (ATOM #11#)
                                                   (PROGN
                                                    (LETT |a1| (CAR #11#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #12#
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL |a1| |d|
                                                                 (QREFELT $
                                                                          71))
                                                       |a| (QREFELT $ 72))
                                                      #12#))))
                                             (LETT #10#
                                                   (PROG1 (CDR #10#)
                                                     (LETT #11# (CDR #11#))))
                                             (GO G190) G191
                                             (EXIT (NREVERSE #12#)))))))))))
                       (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS 0
                         (PROGN
                          (LETT #9# NIL)
                          (SEQ (LETT |pp1| NIL) (LETT #8# |ans|) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |pp1| (CAR #8#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL
                                         (CONS #'|PFBR;SLPEBR!1|
                                               (VECTOR $ |v|))
                                         (SPADCALL |pp1| (QREFELT $ 65))
                                         (QREFELT $ 75))
                                        #9#))))
                               (LETT #8# (CDR #8#)) (GO G190) G191
                               (EXIT (NREVERSE #9#))))))))
            ('T
             (COND
              ((NULL |lvpolys|)
               (SEQ
                (LETT |lpolysR|
                      (PROGN
                       (LETT #7# NIL)
                       (SEQ (LETT |u| NIL) (LETT #6# |lpolys|) G190
                            (COND
                             ((OR (ATOM #6#) (PROGN (LETT |u| (CAR #6#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS
                                     (SPADCALL (ELT $ 44) |u| (QREFELT $ 47))
                                     #7#))))
                            (LETT #6# (CDR #6#)) (GO G190) G191
                            (EXIT (NREVERSE #7#)))))
                (LETT |ppR| (SPADCALL (ELT $ 44) |pp| (QREFELT $ 47)))
                (LETT |ansR| (SPADCALL |lpolysR| |ppR| (QREFELT $ 13)))
                (EXIT
                 (COND
                  ((QEQCAR |ansR| 1)
                   (PROGN (LETT #5# (CONS 1 "failed")) (GO #16#)))
                  (#17='T
                   (CONS 0
                         (PROGN
                          (LETT #4# NIL)
                          (SEQ (LETT |uu| NIL) (LETT #3# (QCDR |ansR|)) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |uu| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL (ELT $ 53) |uu|
                                                  (QREFELT $ 56))
                                        #4#))))
                               (LETT #3# (CDR #3#)) (GO G190) G191
                               (EXIT (NREVERSE #4#))))))))))
              (#17#
               (SEQ
                (LETT |cVS|
                      (|PFBR;chooseSLPEViableSubstitutions| |lvpolys| |lpolys|
                       |pp| $))
                (LETT |ansR|
                      (SPADCALL (QVELT |cVS| 1) (QVELT |cVS| 2)
                                (QREFELT $ 13)))
                (EXIT
                 (COND ((QEQCAR |ansR| 1) (CONS 1 "failed"))
                       ((EQL (LENGTH |lvpolys|) 1)
                        (SPADCALL |lpolys| |pp| (|SPADfirst| |lvpolys|)
                                  (QREFELT $ 35)))
                       (#17# (SPADCALL |lpolys| |pp| (QREFELT $ 37)))))))))))
          #16# (EXIT #5#)))) 

(SDEFUN |PFBR;SLPEBR!1| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 28)))))) 

(SDEFUN |PFBR;SLPEBR!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 59)))))) 

(SDEFUN |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((|lvpp| #1=(|List| |VarSet|)) (#2=#:G525 NIL) (|z| NIL)
          (#3=#:G524 NIL) (|lvpolys| #1#) (#4=#:G523 NIL) (#5=#:G522 NIL)
          (#6=#:G521 NIL) (|u| NIL) (#7=#:G520 NIL) (#8=#:G519 NIL)
          (#9=#:G518 NIL))
         (SEQ
          (COND
           ((SPADCALL |pp| (|spadConstant| $ 78) (QREFELT $ 79))
            (CONS 0
                  (PROGN
                   (LETT #9# NIL)
                   (SEQ (LETT |u| NIL) (LETT #8# |lpolys|) G190
                        (COND
                         ((OR (ATOM #8#) (PROGN (LETT |u| (CAR #8#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #9# (CONS (|spadConstant| $ 78) #9#))))
                        (LETT #8# (CDR #8#)) (GO G190) G191
                        (EXIT (NREVERSE #9#))))))
           ('T
            (SEQ
             (LETT |lvpolys|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #7# NIL)
                      (SEQ (LETT |u| NIL) (LETT #6# |lpolys|) G190
                           (COND
                            ((OR (ATOM #6#) (PROGN (LETT |u| (CAR #6#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #7#
                                   (CONS
                                    (SPADCALL
                                     (PROGN
                                      (LETT #5# NIL)
                                      (SEQ (LETT |z| NIL)
                                           (LETT #4#
                                                 (SPADCALL |u| (QREFELT $ 81)))
                                           G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |z| (CAR #4#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #5#
                                                   (CONS
                                                    (SPADCALL |z|
                                                              (QREFELT $ 82))
                                                    #5#))))
                                           (LETT #4# (CDR #4#)) (GO G190) G191
                                           (EXIT (NREVERSE #5#))))
                                     (QREFELT $ 83))
                                    #7#))))
                           (LETT #6# (CDR #6#)) (GO G190) G191
                           (EXIT (NREVERSE #7#))))
                     (QREFELT $ 83))
                    (QREFELT $ 84)))
             (LETT |lvpp|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL)
                      (SEQ (LETT |z| NIL)
                           (LETT #2# (SPADCALL |pp| (QREFELT $ 81))) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |z| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS (SPADCALL |z| (QREFELT $ 82)) #3#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (QREFELT $ 83))
                    (QREFELT $ 84)))
             (EXIT (|PFBR;SLPEBR| |lpolys| |lvpolys| |pp| |lvpp| $)))))))) 

(SDEFUN |PFBR;factorByRecursion;SupF;12|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G530 NIL) (|c| (S)) (|lv| (|List| |VarSet|)) (#2=#:G538 NIL)
          (|z| NIL) (#3=#:G537 NIL))
         (SEQ
          (LETT |lv|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |z| NIL)
                        (LETT #2# (SPADCALL |pp| (QREFELT $ 81))) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |z| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 82)) #3#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 83))
                 (QREFELT $ 84)))
          (EXIT
           (COND
            ((NULL |lv|)
             (SPADCALL (CONS (|function| |PFBR;raise|) $)
                       (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 87))
                       (QREFELT $ 92)))
            (#4='T
             (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 93)))
                  (EXIT
                   (COND
                    ((SPADCALL |c| (QREFELT $ 94))
                     (SPADCALL (SPADCALL |pp| (QREFELT $ 96)) (ELT $ 97)
                               (QREFELT $ 100)))
                    (#4#
                     (SEQ
                      (LETT |pp|
                            (PROG2
                                (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 102)))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 9))
                                               "failed")
                                              #1#)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |pp| (QREFELT $ 96)) (ELT $ 97)
                                  (QREFELT $ 100))
                        (SPADCALL (ELT $ 103) (SPADCALL |c| (QREFELT $ 104))
                                  (QREFELT $ 107))
                        (QREFELT $ 108)))))))))))))) 

(SDEFUN |PFBR;factorSquareFreeByRecursion;SupF;13|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G582 NIL) (#2=#:G597 NIL) (|w| NIL) (#3=#:G596 NIL)
          (#4=#:G569 NIL) (|factors| (|List| (|SparseUnivariatePolynomial| S)))
          (#5=#:G546 NIL) (|lcppPow| (S)) (|lc| (S)) (#6=#:G595 NIL)
          (#7=#:G594 NIL)
          (|flu| (|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
          (|llc| (|List| S)) (#8=#:G593 NIL) (|f1| NIL) (#9=#:G592 NIL)
          (|ppAdjust| (|SparseUnivariatePolynomial| S))
          (|fl2| (|List| (|SparseUnivariatePolynomial| R))) (#10=#:G559 NIL)
          (#11=#:G591 NIL) (#12=#:G590 NIL) (|lcppR| (R))
          (|fl1| (|List| (|SparseUnivariatePolynomial| R))) (#13=#:G589 NIL)
          (|u| NIL) (#14=#:G588 NIL) (|nfact| (|NonNegativeInteger|))
          (|factorsR| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|newppR| (|SparseUnivariatePolynomial| R))
          (|cVS|
           (|Record| (|:| |substnsField| (|List| R))
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (|oldnfact| (|NonNegativeInteger|)) (|lcpp| (S)) (|lcu| (S))
          (|v_degs| (|List| (|NonNegativeInteger|))) (#15=#:G541 NIL)
          (#16=#:G540 #17=(|NonNegativeInteger|)) (#18=#:G542 #17#)
          (#19=#:G587 NIL) (|z| NIL) (#20=#:G586 NIL) (|v| NIL)
          (#21=#:G585 NIL) (|lv| (|List| |VarSet|)) (#22=#:G584 NIL)
          (#23=#:G583 NIL) (|cpp| (|List| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |cpp| (SPADCALL |pp| (QREFELT $ 81)))
                (LETT |lv|
                      (SPADCALL
                       (SPADCALL
                        (PROGN
                         (LETT #23# NIL)
                         (SEQ (LETT |z| NIL) (LETT #22# |cpp|) G190
                              (COND
                               ((OR (ATOM #22#)
                                    (PROGN (LETT |z| (CAR #22#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #23#
                                      (CONS (SPADCALL |z| (QREFELT $ 82))
                                            #23#))))
                              (LETT #22# (CDR #22#)) (GO G190) G191
                              (EXIT (NREVERSE #23#))))
                        (QREFELT $ 83))
                       (QREFELT $ 84)))
                (LETT |v_degs|
                      (PROGN
                       (LETT #21# NIL)
                       (SEQ (LETT |v| NIL) (LETT #20# |lv|) G190
                            (COND
                             ((OR (ATOM #20#)
                                  (PROGN (LETT |v| (CAR #20#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #21#
                                    (CONS
                                     (PROGN
                                      (LETT #15# NIL)
                                      (SEQ (LETT |z| NIL) (LETT #19# |cpp|)
                                           G190
                                           (COND
                                            ((OR (ATOM #19#)
                                                 (PROGN
                                                  (LETT |z| (CAR #19#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (PROGN
                                              (LETT #18#
                                                    (SPADCALL |z| |v|
                                                              (QREFELT $ 110)))
                                              (COND
                                               (#15#
                                                (LETT #16# (MAX #16# #18#)))
                                               ('T
                                                (PROGN
                                                 (LETT #16# #18#)
                                                 (LETT #15# 'T)))))))
                                           (LETT #19# (CDR #19#)) (GO G190)
                                           G191 (EXIT NIL))
                                      (COND (#15# #16#)
                                            ('T (|IdentityError| '|max|))))
                                     #21#))))
                            (LETT #20# (CDR #20#)) (GO G190) G191
                            (EXIT (NREVERSE #21#)))))
                (EXIT
                 (COND
                  ((NULL |lv|)
                   (SPADCALL (CONS (|function| |PFBR;raise|) $)
                             (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 87))
                             (QREFELT $ 92)))
                  ('T
                   (SEQ (LETT |lcu| (|spadConstant| $ 111))
                        (COND
                         ((SPADCALL
                           (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 38)))
                           (QREFELT $ 94))
                          (SEQ (LETT |lcu| |lcpp|)
                               (LETT |pp|
                                     (PROG2
                                         (LETT #5#
                                               (SPADCALL |pp| |lcu|
                                                         (QREFELT $ 102)))
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 0)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 9))
                                                       (|Union|
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 9))
                                                        #24="failed")
                                                       #5#)))
                               (EXIT (LETT |lcpp| (|spadConstant| $ 111))))))
                        (LETT |oldnfact| (+ (SPADCALL |pp| (QREFELT $ 112)) 1))
                        (EXIT
                         (SEQ G190 (COND ((NULL 'T) (GO G191)))
                              (SEQ
                               (LETT |cVS|
                                     (|PFBR;chooseFSQViableSubstitutions| |lv|
                                      |pp| $))
                               (LETT |newppR|
                                     (SPADCALL (QCDR |cVS|) (QREFELT $ 113)))
                               (LETT |factorsR|
                                     (SPADCALL |newppR| (QREFELT $ 114)))
                               (LETT |nfact|
                                     (SPADCALL |factorsR| (QREFELT $ 115)))
                               (EXIT
                                (COND
                                 ((EQL |nfact| 1)
                                  (PROGN
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL |lcu| (QREFELT $ 103))
                                          (LIST
                                           (VECTOR (CONS 2 "irred") |pp| 1))
                                          (QREFELT $ 120)))
                                   (GO #25=#:G581)))
                                 ((SPADCALL |nfact| |oldnfact| (QREFELT $ 52))
                                  "next")
                                 ('T
                                  (SEQ
                                   (LETT |fl1|
                                         (PROGN
                                          (LETT #14# NIL)
                                          (SEQ (LETT |u| NIL)
                                               (LETT #13#
                                                     (SPADCALL |factorsR|
                                                               (QREFELT $
                                                                        123)))
                                               G190
                                               (COND
                                                ((OR (ATOM #13#)
                                                     (PROGN
                                                      (LETT |u| (CAR #13#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #14#
                                                       (CONS (QVELT |u| 1)
                                                             #14#))))
                                               (LETT #13# (CDR #13#)) (GO G190)
                                               G191 (EXIT (NREVERSE #14#)))))
                                   (LETT |lcppR|
                                         (SPADCALL (QCDR |cVS|)
                                                   (QREFELT $ 124)))
                                   (LETT |fl2|
                                         (PROGN
                                          (LETT #12# NIL)
                                          (SEQ (LETT |f1| NIL)
                                               (LETT #11# |fl1|) G190
                                               (COND
                                                ((OR (ATOM #11#)
                                                     (PROGN
                                                      (LETT |f1| (CAR #11#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #12#
                                                       (CONS
                                                        (SPADCALL
                                                         (PROG2
                                                             (LETT #10#
                                                                   (SPADCALL
                                                                    |lcppR|
                                                                    (SPADCALL
                                                                     |f1|
                                                                     (QREFELT $
                                                                              124))
                                                                    (QREFELT $
                                                                             125)))
                                                             (QCDR #10#)
                                                           (|check_union2|
                                                            (QEQCAR #10# 0)
                                                            (QREFELT $ 6)
                                                            (|Union|
                                                             (QREFELT $ 6)
                                                             #26="failed")
                                                            #10#))
                                                         |f1| (QREFELT $ 126))
                                                        #12#))))
                                               (LETT #11# (CDR #11#)) (GO G190)
                                               G191 (EXIT (NREVERSE #12#)))))
                                   (LETT |ppAdjust|
                                         (SPADCALL
                                          (LETT |lcppPow|
                                                (SPADCALL |lcpp|
                                                          (LENGTH (CDR |fl2|))
                                                          (QREFELT $ 127)))
                                          |pp| (QREFELT $ 128)))
                                   (LETT |llc|
                                         (PROGN
                                          (LETT #9# NIL)
                                          (SEQ (LETT |f1| NIL) (LETT #8# |fl2|)
                                               G190
                                               (COND
                                                ((OR (ATOM #8#)
                                                     (PROGN
                                                      (LETT |f1| (CAR #8#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #9# (CONS |lcpp| #9#))))
                                               (LETT #8# (CDR #8#)) (GO G190)
                                               G191 (EXIT (NREVERSE #9#)))))
                                   (LETT |flu|
                                         (SPADCALL |ppAdjust| |lv| |fl2|
                                                   (QCAR |cVS|) |llc| |v_degs|
                                                   (CONS
                                                    (|function|
                                                     |PFBR;gen_solv|)
                                                    $)
                                                   (QREFELT $ 135)))
                                   (EXIT
                                    (COND ((QEQCAR |flu| 1) "next")
                                          ('T
                                           (SEQ (LETT |factors| (QCDR |flu|))
                                                (LETT |factors|
                                                      (PROGN
                                                       (LETT #7# NIL)
                                                       (SEQ (LETT |w| NIL)
                                                            (LETT #6#
                                                                  |factors|)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #6#)
                                                                  (PROGN
                                                                   (LETT |w|
                                                                         (CAR
                                                                          #6#))
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #7#
                                                                    (CONS
                                                                     (SEQ
                                                                      (LETT
                                                                       |lc|
                                                                       (SPADCALL
                                                                        |w|
                                                                        (QREFELT
                                                                         $
                                                                         93)))
                                                                      (LETT
                                                                       |lcppPow|
                                                                       (PROG2
                                                                           (LETT
                                                                            #4#
                                                                            (SPADCALL
                                                                             |lcppPow|
                                                                             |lc|
                                                                             (QREFELT
                                                                              $
                                                                              136)))
                                                                           (QCDR
                                                                            #4#)
                                                                         (|check_union2|
                                                                          (QEQCAR
                                                                           #4#
                                                                           0)
                                                                          (QREFELT
                                                                           $ 9)
                                                                          (|Union|
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           #26#)
                                                                          #4#)))
                                                                      (EXIT
                                                                       (PROG2
                                                                           (LETT
                                                                            #5#
                                                                            (SPADCALL
                                                                             |w|
                                                                             |lc|
                                                                             (QREFELT
                                                                              $
                                                                              102)))
                                                                           (QCDR
                                                                            #5#)
                                                                         (|check_union2|
                                                                          (QEQCAR
                                                                           #5#
                                                                           0)
                                                                          (|SparseUnivariatePolynomial|
                                                                           (QREFELT
                                                                            $
                                                                            9))
                                                                          (|Union|
                                                                           (|SparseUnivariatePolynomial|
                                                                            (QREFELT
                                                                             $
                                                                             9))
                                                                           #24#)
                                                                          #5#))))
                                                                     #7#))))
                                                            (LETT #6#
                                                                  (CDR #6#))
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #7#)))))
                                                (COND
                                                 ((NULL
                                                   (SPADCALL |lcppPow|
                                                             (QREFELT $ 94)))
                                                  (EXIT
                                                   (|error|
                                                    "internal error in factorSquareFreeByRecursion"))))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #1#
                                                        (SPADCALL
                                                         (SPADCALL |lcu|
                                                                   (SPADCALL
                                                                    (PROG2
                                                                        (LETT
                                                                         #4#
                                                                         (SPADCALL
                                                                          |lcppPow|
                                                                          (QREFELT
                                                                           $
                                                                           137)))
                                                                        (QCDR
                                                                         #4#)
                                                                      (|check_union2|
                                                                       (QEQCAR
                                                                        #4# 0)
                                                                       (QREFELT
                                                                        $ 9)
                                                                       (|Union|
                                                                        (QREFELT
                                                                         $ 9)
                                                                        #26#)
                                                                       #4#))
                                                                    (QREFELT $
                                                                             103))
                                                                   (QREFELT $
                                                                            128))
                                                         (PROGN
                                                          (LETT #3# NIL)
                                                          (SEQ (LETT |w| NIL)
                                                               (LETT #2#
                                                                     |factors|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #2#)
                                                                     (PROGN
                                                                      (LETT |w|
                                                                            (CAR
                                                                             #2#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #3#
                                                                       (CONS
                                                                        (VECTOR
                                                                         (CONS
                                                                          2
                                                                          "irred")
                                                                         |w| 1)
                                                                        #3#))))
                                                               (LETT #2#
                                                                     (CDR #2#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #3#))))
                                                         (QREFELT $ 120)))
                                                  (GO #25#))))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #25# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PolynomialFactorizationByRecursion;|)) 

(DEFUN |PolynomialFactorizationByRecursion| (&REST #1=#:G598)
  (SPROG NIL
         (PROG (#2=#:G599)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialFactorizationByRecursion|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PolynomialFactorizationByRecursion;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialFactorizationByRecursion|)))))))))) 

(DEFUN |PolynomialFactorizationByRecursion;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$|
          (LIST '|PolynomialFactorizationByRecursion| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 138))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PolynomialFactorizationByRecursion|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|Finite|))
      (QSETREFV $ 16 (CONS (|dispatchFunction| |PFBR;randomR;IR;2|) $)))
     ('T (QSETREFV $ 16 (CONS (|dispatchFunction| |PFBR;randomR;IR;3|) $))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (QSETREFV $ 35
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;4|)
                      $)))
     ('T
      (QSETREFV $ 35
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;5|)
                      $))))
    $))) 

(MAKEPROP '|PolynomialFactorizationByRecursion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Union| 11 '"failed") (|List| 12)
              (|SparseUnivariatePolynomial| $)
              (0 . |solveLinearPolynomialEquation|) (6 . |random|) (|Integer|)
              (10 . |randomR|) (|PositiveInteger|) (15 . *) (21 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (26 . |univariate|)
              (|SparseUnivariatePolynomial| 20) (|Mapping| 20 9)
              (|SparseUnivariatePolynomial| 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 24 20 22)
              (31 . |map|) (37 . |solveLinearPolynomialEquation|)
              (43 . |multivariate|) (49 . |multivariate|) (|Mapping| 9 20)
              (|UnivariatePolynomialCategoryFunctions2| 20 22 9 24)
              (55 . |map|) (|Union| 34 '#1="failed") (|List| 24)
              (61 . |bivariateSLPEBR|)
              (|LinearPolynomialEquationByFractions| 9)
              (68 . |solveLinearPolynomialEquationByFractions|)
              (74 . |leadingCoefficient|) (|List| 8) (|List| 6) (79 . |eval|)
              (|Boolean|) (86 . |zero?|) (91 . |retract|) (|Mapping| 6 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 24 6 20) (96 . |map|)
              (102 . |differentiate|) (107 . |gcd|) (|NonNegativeInteger|)
              (113 . |degree|) (118 . >) (124 . |coerce|) (|Mapping| 9 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 20 9 24)
              (129 . |map|) (135 . |setDifference|) (141 . |remove|)
              (147 . |univariate|) (|SparseUnivariatePolynomial| 24)
              (|Mapping| 24 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 24 24 60)
              (153 . |map|) (|CommuteUnivariatePolynomialCategory| 9 24 60)
              (159 . |swap|) (164 . |Zero|) (|List| $) (168 . |monomials|)
              (173 . |leadingCoefficient|) (178 . |degree|) (183 . |monomial|)
              (189 . +) (|Mapping| 9 24)
              (|UnivariatePolynomialCategoryFunctions2| 24 60 9 24)
              (195 . |map|) (201 . |Zero|) (205 . |Zero|) (209 . |Zero|)
              (213 . =) (|List| 9) (219 . |coefficients|) (224 . |variables|)
              (229 . |concat|) (234 . |removeDuplicates!|)
              |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|
              (|Factored| 12) (239 . |factorPolynomial|) (|Factored| 24)
              (|Mapping| 24 20) (|Factored| 20) (|FactoredFunctions2| 20 24)
              (244 . |map|) (250 . |content|) (255 . |unit?|) (|Factored| $)
              (260 . |squareFree|) |PFBR;factorSquareFreeByRecursion;SupF;13|
              (|Mapping| 88 24) (|FactoredFunctionUtilities| 24)
              (265 . |refine|) (|Union| $ '"failed") (271 . |exquo|)
              (277 . |coerce|) (282 . |factor|) (|Factored| 9)
              (|FactoredFunctions2| 9 24) (287 . |map|) (293 . |mergeFactors|)
              |PFBR;factorByRecursion;SupF;12| (299 . |degree|) (305 . |One|)
              (309 . |degree|) (314 . |primitivePart|)
              (319 . |factorSquareFreePolynomial|) (324 . |numberOfFactors|)
              (329 . |One|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 117) (|:| |factor| 24) (|:| |exponent| 50))
              (|List| 118) (333 . |makeFR|)
              (|Record| (|:| |flag| 117) (|:| |factor| 20) (|:| |exponent| 50))
              (|List| 121) (339 . |factorList|) (344 . |leadingCoefficient|)
              (349 . |exquo|) (355 . *) (361 . ^) (367 . *) (|List| 20)
              (|List| 50) (|Union| 129 '"failed") (|Mapping| 131 20)
              (|Mapping| 132 129) (|MultivariateLifting| 7 8 6 9)
              (373 . |lifting|) (384 . |exquo|) (390 . |recip|))
           '#(|solveLinearPolynomialEquationByRecursion| 395 |randomR| 401
              |factorSquareFreeByRecursion| 406 |factorByRecursion| 411
              |bivariateSLPEBR| 416)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solveLinearPolynomialEquationByRecursion|
                                 ((|Union|
                                   (|List| (|SparseUnivariatePolynomial| |#4|))
                                   "failed")
                                  (|List| (|SparseUnivariatePolynomial| |#4|))
                                  (|SparseUnivariatePolynomial| |#4|)))
                                T)
                              '((|factorByRecursion|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial| |#4|))
                                  (|SparseUnivariatePolynomial| |#4|)))
                                T)
                              '((|factorSquareFreeByRecursion|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial| |#4|))
                                  (|SparseUnivariatePolynomial| |#4|)))
                                T)
                              '((|randomR| (|#1| (|Integer|))) T)
                              '((|bivariateSLPEBR|
                                 ((|Union|
                                   (|List| (|SparseUnivariatePolynomial| |#4|))
                                   #1#)
                                  (|List| (|SparseUnivariatePolynomial| |#4|))
                                  (|SparseUnivariatePolynomial| |#4|) |#3|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 137
                                            '(2 6 10 11 12 13 0 6 0 14 1 0 6 15
                                              16 2 15 0 17 0 18 1 6 0 15 19 1 9
                                              20 0 21 2 25 22 23 24 26 2 20 10
                                              11 12 27 2 9 0 12 8 28 2 9 0 20 8
                                              29 2 31 24 30 22 32 3 0 33 34 24
                                              8 35 2 36 33 34 24 37 1 24 9 0 38
                                              3 9 0 0 39 40 41 1 9 42 0 43 1 9
                                              6 0 44 2 46 20 45 24 47 1 20 0 0
                                              48 2 20 0 0 0 49 1 20 50 0 51 2
                                              50 42 0 0 52 1 9 0 6 53 2 55 24
                                              54 20 56 2 39 0 0 0 57 2 39 0 8 0
                                              58 2 9 12 0 8 59 2 62 60 61 24 63
                                              1 64 60 60 65 0 60 0 66 1 60 67 0
                                              68 1 60 24 0 69 1 60 50 0 70 2 60
                                              0 24 50 71 2 60 0 0 0 72 2 74 24
                                              73 60 75 0 6 0 76 0 7 0 77 0 24 0
                                              78 2 24 42 0 0 79 1 24 80 0 81 1
                                              9 39 0 82 1 39 0 67 83 1 39 0 0
                                              84 1 6 86 12 87 2 91 88 89 90 92
                                              1 24 9 0 93 1 9 42 0 94 1 24 95 0
                                              96 2 99 88 88 98 100 2 24 101 0 9
                                              102 1 24 0 9 103 1 9 95 0 104 2
                                              106 88 61 105 107 2 88 0 0 0 108
                                              2 9 50 0 8 110 0 9 0 111 1 24 50
                                              0 112 1 20 0 0 113 1 6 86 12 114
                                              1 90 50 0 115 0 6 0 116 2 88 0 24
                                              119 120 1 90 122 0 123 1 20 6 0
                                              124 2 6 101 0 0 125 2 20 0 6 0
                                              126 2 9 0 0 50 127 2 24 0 9 0 128
                                              7 134 33 24 39 129 40 80 130 133
                                              135 2 9 101 0 0 136 1 9 101 0 137
                                              2 0 33 34 24 85 1 0 6 15 16 1 0
                                              88 24 97 1 0 88 24 109 3 0 33 34
                                              24 8 35)))))
           '|lookupComplete|)) 