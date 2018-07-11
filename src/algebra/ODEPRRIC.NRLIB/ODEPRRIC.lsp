
(SDEFUN |ODEPRRIC;lambda|
        ((|c| UP) (|l| L)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (SPROG NIL
               (|ODEPRRIC;innerlb| |l|
                (CONS #'|ODEPRRIC;lambda!0| (VECTOR $ |c|)) $))) 

(SDEFUN |ODEPRRIC;lambda!0| ((|z| NIL) ($$ NIL))
        (PROG (|c| $)
          (LETT |c| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z| |c| (QREFELT $ 15)))))) 

(SDEFUN |ODEPRRIC;infLambda|
        ((|l| L)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (|ODEPRRIC;innerlb| |l| (CONS #'|ODEPRRIC;infLambda!0| $) $)) 

(SDEFUN |ODEPRRIC;infLambda!0| ((|z| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z| (QREFELT $ 16)) (QREFELT $ 18))) 

(SDEFUN |ODEPRRIC;infmax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) ($ |List| (|Integer|)))
        (|ODEPRRIC;innermax| |rec| |l| (ELT $ 16) $)) 

(SDEFUN |ODEPRRIC;dmax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|c| UP) (|l| L) ($ |List| (|Integer|)))
        (SPROG NIL
               (|ODEPRRIC;innermax| |rec| |l|
                (CONS #'|ODEPRRIC;dmax!0| (VECTOR $ |c|)) $))) 

(SDEFUN |ODEPRRIC;dmax!0| ((|z| NIL) ($$ NIL))
        (PROG (|c| $)
          (LETT |c| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z| |c| (QREFELT $ 15)) (QREFELT $ 18)))))) 

(SDEFUN |ODEPRRIC;tau0| ((|p| UP) (|q| UP) ($ UP))
        (SPROG ((#1=#:G408 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1#
                          (SPADCALL |q|
                                    (SPADCALL |p|
                                              (SPADCALL |q| |p| (QREFELT $ 15))
                                              (QREFELT $ 19))
                                    (QREFELT $ 21)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) "failed") #1#))
                |p| (QREFELT $ 22)))) 

(SDEFUN |ODEPRRIC;poly1|
        ((|c| UP) (|cp| UP) (|i| |Integer|)
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G412 NIL) (#2=#:G411 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G413 #3#) (#5=#:G415 NIL) (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |j| 0) (LETT #5# (- |i| 1)) G190
                (COND ((|greater_SI| |j| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 24) 1 (QREFELT $ 26))
                          (SPADCALL (SPADCALL |j| |cp| (QREFELT $ 27))
                                    (QREFELT $ 28))
                          (QREFELT $ 29)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 30))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 31))))))) 

(SDEFUN |ODEPRRIC;getIndices|
        ((|n| |NonNegativeInteger|)
         (|l| |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|))))
         ($ |List| (|Integer|)))
        (SPROG ((#1=#:G420 NIL) (|r| NIL) (#2=#:G419 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |r| NIL) (LETT #1# |l|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QCDR |r|) |n|)
                            (LETT #2# (CONS (QCAR |r|) #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 34))
                 (QREFELT $ 35))))) 

(SDEFUN |ODEPRRIC;denomRicDE;LUP;8| ((|l| L) ($ UP))
        (SPROG
         ((#1=#:G422 NIL) (#2=#:G421 (UP)) (#3=#:G423 (UP)) (#4=#:G425 NIL)
          (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |c| NIL) (LETT #4# (|ODEPRRIC;factoredDenomRicDE| |l| $))
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL |c| (|ODEPRRIC;bound| |c| |l| $)
                                   (QREFELT $ 19)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 36))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 24))))))) 

(SDEFUN |ODEPRRIC;polyRicDE;LML;9|
        ((|l| L) (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
        (CONS (CONS (|spadConstant| $ 39) |l|)
              (|ODEPRRIC;polysol| |l| 0 NIL |zeros| $))) 

(SDEFUN |ODEPRRIC;refine|
        ((|l| |List| UP) (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List| UP))
        (SPROG
         ((#1=#:G439 NIL) (|r| NIL) (#2=#:G438 NIL) (#3=#:G437 NIL) (|p| NIL)
          (#4=#:G436 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |p| NIL) (LETT #3# |l|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |r| NIL)
                                (LETT #1#
                                      (SPADCALL (SPADCALL |p| |ezfactor|)
                                                (QREFELT $ 48)))
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |r| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (QVELT |r| 1) #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT $ 50))))) 

(SDEFUN |ODEPRRIC;padicsol|
        ((|c| UP) (|op| L) (|b| |NonNegativeInteger|) (|finite?| |Boolean|)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#1=#:G460 NIL) (|sol| NIL) (#2=#:G459 NIL)
          (|sols|
           (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#3=#:G445 NIL) (|neweq| (L)) (|rcn| (|Fraction| UP)) (#4=#:G458 NIL)
          (|r| NIL) (#5=#:G457 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |eq| (|SparseUnivariatePolynomial| UP))))))
         (SEQ (LETT |ans| NIL)
              (COND (|finite?| (COND ((ZEROP |b|) (EXIT |ans|)))))
              (LETT |lc| (|ODEPRRIC;leadingDenomRicDE| |c| |op| $))
              (COND
               (|finite?|
                (LETT |lc|
                      (SPADCALL (CONS #'|ODEPRRIC;padicsol!0| (VECTOR $ |b|))
                                |lc| (QREFELT $ 56)))))
              (SEQ (LETT |rec| NIL) (LETT #5# |lc|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |r| NIL)
                          (LETT #4# (SPADCALL |c| (QCDR |rec|) |zeros|)) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |r| (|spadConstant| $ 39)
                                        (QREFELT $ 57))
                              (SEQ
                               (LETT |rcn|
                                     (SPADCALL |r|
                                               (SPADCALL |c| (QCAR |rec|)
                                                         (QREFELT $ 19))
                                               (QREFELT $ 59)))
                               (LETT |neweq|
                                     (SPADCALL |op| |rcn| (QREFELT $ 60)))
                               (LETT |sols|
                                     (|ODEPRRIC;padicsol| |c| |neweq|
                                      (PROG1 (LETT #3# (- (QCAR |rec|) 1))
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      'T |zeros| $))
                               (EXIT
                                (LETT |ans|
                                      (COND
                                       ((NULL |sols|)
                                        (CONS (CONS |rcn| |neweq|) |ans|))
                                       ('T
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# NIL)
                                          (SEQ (LETT |sol| NIL)
                                               (LETT #1# |sols|) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |sol| (CAR #1#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |rcn|
                                                                   (QCAR |sol|)
                                                                   (QREFELT $
                                                                            61))
                                                         (QCDR |sol|))
                                                        #2#))))
                                               (LETT #1# (CDR #1#)) (GO G190)
                                               G191 (EXIT (NREVERSE #2#))))
                                         |ans| (QREFELT $ 64)))))))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;padicsol!0| ((|z| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (QCAR |z|) |b| (QREFELT $ 52)))))) 

(SDEFUN |ODEPRRIC;leadingDenomRicDE|
        ((|c| UP) (|l| L)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|))
                    (|:| |eq| (|SparseUnivariatePolynomial| UP)))))
        (SPROG
         ((|done| (|List| (|NonNegativeInteger|)))
          (|ans|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |eq| (|SparseUnivariatePolynomial| UP)))))
          (|ind| (|List| (|Integer|))) (#1=#:G472 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|))))))
         (SEQ (LETT |lb| (|ODEPRRIC;lambda| |c| |l| $)) (LETT |done| NIL)
              (LETT |ans| NIL)
              (SEQ (LETT |rec| NIL) (LETT #1# |lb|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL (QCDR |rec|) |done| (QREFELT $ 66)) NIL)
                        ('T
                         (NULL
                          (NULL
                           (LETT |ind| (|ODEPRRIC;dmax| |rec| |c| |l| $))))))
                       (SEQ
                        (LETT |ans|
                              (CONS
                               (CONS (QCDR |rec|)
                                     (|ODEPRRIC;getPol| |rec| |c| |l| |ind| $))
                               |ans|))
                        (EXIT (LETT |done| (CONS (QCDR |rec|) |done|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (CONS #'|ODEPRRIC;leadingDenomRicDE!0| $) |ans|
                         (QREFELT $ 69)))))) 

(SDEFUN |ODEPRRIC;leadingDenomRicDE!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 67))) 

(SDEFUN |ODEPRRIC;getPol|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|c| UP) (|l| L) (|ind| |List| (|Integer|))
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G475 NIL) (#2=#:G474 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G476 #3#) (#5=#:G479 NIL) (#6=#:G478 NIL) (#7=#:G482 NIL)
          (|i| NIL))
         (SEQ
          (COND ((EQL (QCDR |rec|) 1) (|ODEPRRIC;getPol1| |ind| |c| |l| $))
                (#8='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |i| NIL) (LETT #7# |ind|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (|ODEPRRIC;tau0| |c|
                                  (SPADCALL |l|
                                            (PROG1 (LETT #6# |i|)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (QREFELT $ 70))
                                  $)
                                 (PROG1 (LETT #5# |i|)
                                   (|check_subtype2| (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                 (QREFELT $ 26)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 71))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#8# (|spadConstant| $ 72))))))))) 

(SDEFUN |ODEPRRIC;getPol1|
        ((|ind| |List| (|Integer|)) (|c| UP) (|l| L)
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G484 NIL) (#2=#:G483 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G485 #3#) (#5=#:G519 NIL) (#6=#:G522 NIL) (|i| NIL)
          (|cp| (UP)))
         (SEQ (LETT |cp| (SPADCALL (QREFELT $ 11) |c| (QREFELT $ 73)))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |i| NIL) (LETT #6# |ind|) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4#
                              (SPADCALL
                               (|ODEPRRIC;tau0| |c|
                                (SPADCALL |l|
                                          (PROG1 (LETT #5# |i|)
                                            (|check_subtype2| (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #5#))
                                          (QREFELT $ 70))
                                $)
                               (|ODEPRRIC;poly1| |c| |cp| |i| $)
                               (QREFELT $ 74)))
                        (COND
                         (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 71))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|spadConstant| $ 72)))))))) 

(SDEFUN |ODEPRRIC;constantCoefficientRicDE;LML;15|
        ((|op| L) (|ric| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |constant| F) (|:| |eq| L))))
        (SPROG
         ((#1=#:G534 NIL) (|a| NIL) (#2=#:G533 NIL)
          (|m| #3=(|NonNegativeInteger|)) (#4=#:G525 NIL) (#5=#:G524 #3#)
          (#6=#:G526 #3#) (#7=#:G532 NIL) (|p| NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |p| NIL) (LETT #7# (SPADCALL |op| (QREFELT $ 75)))
                      G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6# (SPADCALL |p| (QREFELT $ 16)))
                         (COND (#4# (LETT #5# (MAX #5# #6#)))
                               ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                      (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|max|)))))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |a| NIL)
                 (LETT #1#
                       (SPADCALL
                        (|ODEPRRIC;constantCoefficientOperator| |op| |m| $)
                        |ric|))
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS |a|
                                (SPADCALL |op| (SPADCALL |a| (QREFELT $ 76))
                                          (QREFELT $ 77)))
                          #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODEPRRIC;constantCoefficientOperator|
        ((|op| L) (|m| |NonNegativeInteger|) ($ UP))
        (SPROG ((|ans| (UP)) (|p| (UP)))
               (SEQ (LETT |ans| (|spadConstant| $ 39))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |op| (|spadConstant| $ 81)
                                      (QREFELT $ 82)))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((EQL
                             (SPADCALL
                              (LETT |p| (SPADCALL |op| (QREFELT $ 83)))
                              (QREFELT $ 16))
                             |m|)
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 84))
                                             (SPADCALL |op| (QREFELT $ 85))
                                             (QREFELT $ 86))
                                            (QREFELT $ 87)))))
                          (EXIT (LETT |op| (SPADCALL |op| (QREFELT $ 88)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;getPoly|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) (|ind| |List| (|Integer|)) ($ UP))
        (SPROG
         ((#1=#:G542 NIL) (#2=#:G541 (UP)) (#3=#:G543 (UP)) (#4=#:G546 NIL)
          (#5=#:G545 NIL) (#6=#:G548 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |i| NIL) (LETT #6# |ind|) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |l|
                                     (PROG1 (LETT #5# |i|)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 70))
                           (QREFELT $ 84))
                          (PROG1 (LETT #4# |i|)
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#))
                          (QREFELT $ 86)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 87))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 39))))))) 

(SDEFUN |ODEPRRIC;innermax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) (|nu| |Mapping| (|Integer|) UP) ($ |List| (|Integer|)))
        (SPROG
         ((|ans| (|List| (|Integer|))) (#1=#:G556 NIL) (|k| #2=(|Integer|))
          (|f| (UP)) (#3=#:G557 NIL) (|j| NIL) (|m| #2#) (#4=#:G551 NIL)
          (|d| (|Integer|)) (|i| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |l| (QREFELT $ 85)))
                (LETT |i| (|SPADfirst| (QCAR |rec|)))
                (LETT |m|
                      (+ (* |i| (LETT |d| (QCDR |rec|)))
                         (SPADCALL
                          (SPADCALL |l|
                                    (PROG1 (LETT #4# |i|)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 70))
                          |nu|)))
                (LETT |ans| NIL)
                (SEQ (LETT |j| 0) (LETT #3# |n|) G190
                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LETT |f| (SPADCALL |l| |j| (QREFELT $ 70)))
                                   (|spadConstant| $ 39) (QREFELT $ 57))
                         (SEQ
                          (LETT |k|
                                (+ (SPADCALL |j| |d| (QREFELT $ 89))
                                   (SPADCALL |f| |nu|)))
                          (EXIT
                           (COND
                            ((SPADCALL |k| |m| (QREFELT $ 90))
                             (PROGN (LETT #1# NIL) (GO #5=#:G555)))
                            ((EQL |k| |m|)
                             (LETT |ans| (CONS |j| |ans|))))))))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #5# (EXIT #1#)))) 

(SDEFUN |ODEPRRIC;leadingCoefficientRicDE;LL;19|
        ((|l| L)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP))))
        (SPROG
         ((|done| (|List| (|NonNegativeInteger|)))
          (|ans|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP))))
          (|ind| (|List| (|Integer|))) (#1=#:G570 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|))))))
         (SEQ (LETT |lb| (|ODEPRRIC;infLambda| |l| $)) (LETT |done| NIL)
              (LETT |ans| NIL)
              (SEQ (LETT |rec| NIL) (LETT #1# |lb|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL (QCDR |rec|) |done| (QREFELT $ 66)) NIL)
                        ('T
                         (NULL
                          (NULL
                           (LETT |ind| (|ODEPRRIC;infmax| |rec| |l| $))))))
                       (SEQ
                        (LETT |ans|
                              (CONS
                               (CONS (QCDR |rec|)
                                     (|ODEPRRIC;getPoly| |rec| |l| |ind| $))
                               |ans|))
                        (EXIT (LETT |done| (CONS (QCDR |rec|) |done|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (CONS #'|ODEPRRIC;leadingCoefficientRicDE;LL;19!0| $)
                         |ans| (QREFELT $ 94)))))) 

(SDEFUN |ODEPRRIC;leadingCoefficientRicDE;LL;19!0|
        ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 67))) 

(SDEFUN |ODEPRRIC;factoredDenomRicDE| ((|l| L) ($ |List| UP))
        (SPROG
         ((#1=#:G576 NIL) (|dd| NIL) (#2=#:G575 NIL)
          (|bd|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |bd|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| (QREFELT $ 83))
                           (SPADCALL |l| (QREFELT $ 75)) (QREFELT $ 97))
                 (QREFELT $ 48)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |dd| NIL) (LETT #1# |bd|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (QVELT |dd| 1) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODEPRRIC;changeVar;LUPL;21| ((|l| L) (|a| UP) ($ L))
        (SPROG ((|dpan| (L)) (|op| (L)) (#1=#:G581 NIL) (|i| NIL) (|dpa| (L)))
               (SEQ
                (LETT |dpa|
                      (SPADCALL (QREFELT $ 11) (SPADCALL |a| (QREFELT $ 98))
                                (QREFELT $ 99)))
                (LETT |dpan| (|spadConstant| $ 100))
                (LETT |op| (|spadConstant| $ 81))
                (SEQ (LETT |i| 0) (LETT #1# (SPADCALL |l| (QREFELT $ 85))) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |op|
                            (SPADCALL |op|
                                      (SPADCALL
                                       (SPADCALL |l| |i| (QREFELT $ 70)) |dpan|
                                       (QREFELT $ 101))
                                      (QREFELT $ 99)))
                      (EXIT
                       (LETT |dpan| (SPADCALL |dpa| |dpan| (QREFELT $ 102)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |op| (QREFELT $ 103)))))) 

(SDEFUN |ODEPRRIC;changeVar;LFL;22| ((|l| L) (|a| |Fraction| UP) ($ L))
        (SPROG
         ((|dpan| (LQ)) (|op| (LQ)) (#1=#:G587 NIL) (|i| NIL) (|dpa| (LQ)))
         (SEQ
          (LETT |dpa|
                (SPADCALL (QREFELT $ 13) (SPADCALL |a| (QREFELT $ 104))
                          (QREFELT $ 105)))
          (LETT |dpan| (|spadConstant| $ 106))
          (LETT |op| (|spadConstant| $ 107))
          (SEQ (LETT |i| 0) (LETT #1# (SPADCALL |l| (QREFELT $ 85))) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| |i| (QREFELT $ 70))
                                           (QREFELT $ 108))
                                 |dpan| (QREFELT $ 109))
                                (QREFELT $ 105)))
                (EXIT (LETT |dpan| (SPADCALL |dpa| |dpan| (QREFELT $ 110)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT (QCAR (SPADCALL |op| NIL (QREFELT $ 114))))))) 

(SDEFUN |ODEPRRIC;bound| ((|c| UP) (|l| L) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G590 NIL) (#2=#:G589 #3=(|NonNegativeInteger|)) (#4=#:G591 #3#)
          (#5=#:G594 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|))) (|:| |deg| #3#)))))
         (SEQ
          (COND ((NULL (LETT |lb| (|ODEPRRIC;lambda| |c| |l| $))) 1)
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |rec| NIL) (LETT #5# |lb|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (QCDR |rec|))
                          (COND (#1# (LETT #2# (MAX #2# #4#)))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |ODEPRRIC;innerlb|
        ((|l| L) (|nu| |Mapping| (|Integer|) UP)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (SPROG
         ((|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|)))))
          (#1=#:G600 NIL) (|b| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")) (|lj| (UP)) (#2=#:G608 NIL)
          (|j| NIL) (|li| (UP)) (#3=#:G607 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |lb| NIL) (LETT |n| (SPADCALL |l| (QREFELT $ 85)))
              (SEQ (LETT |i| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |li| (SPADCALL |l| |i| (QREFELT $ 70)))
                                 (|spadConstant| $ 39) (QREFELT $ 57))
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #2# |n|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (LETT |lj| (SPADCALL |l| |j| (QREFELT $ 70)))
                                 (|spadConstant| $ 39) (QREFELT $ 57))
                                (SEQ
                                 (LETT |u|
                                       (SPADCALL
                                        (- (SPADCALL |li| |nu|)
                                           (SPADCALL |lj| |nu|))
                                        (- |i| |j|) (QREFELT $ 115)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u| 0)
                                    (SEQ (LETT |b| (QCDR |u|))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |b| 0 (QREFELT $ 90))
                                            (LETT |lb|
                                                  (CONS
                                                   (CONS (LIST |i| |j|)
                                                         (PROG1 (LETT #1# |b|)
                                                           (|check_subtype2|
                                                            (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#)))
                                                   |lb|))))))))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lb|)))) 

(SDEFUN |ODEPRRIC;singRicDE;LMML;25|
        ((|l| L)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (CONS (CONS (|spadConstant| $ 116) |l|)
              (|ODEPRRIC;fracsol| |l| |zeros|
               (|ODEPRRIC;refine| (|ODEPRRIC;factoredDenomRicDE| |l| $)
                |ezfactor| $)
               $))) 

(SDEFUN |ODEPRRIC;fracsol|
        ((|l| L)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         (|lc| |List| UP)
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#1=#:G634 NIL) (|sol| NIL) (#2=#:G633 NIL)
          (|sols|
           (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (|neweq| (L)) (#3=#:G632 NIL) (|rec| NIL))
         (SEQ (LETT |ans| NIL)
              (EXIT
               (COND ((NULL |lc|) |ans|)
                     ((NULL
                       (LETT |sols|
                             (|ODEPRRIC;padicsol| (|SPADfirst| |lc|) |l| 0 NIL
                              |zeros| $)))
                      (|ODEPRRIC;fracsol| |l| |zeros| (CDR |lc|) $))
                     ('T
                      (SEQ
                       (SEQ (LETT |rec| NIL) (LETT #3# |sols|) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |rec| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |neweq|
                                   (SPADCALL |l| (QCAR |rec|) (QREFELT $ 60)))
                             (LETT |sols|
                                   (|ODEPRRIC;fracsol| |neweq| |zeros|
                                    (CDR |lc|) $))
                             (EXIT
                              (LETT |ans|
                                    (COND ((NULL |sols|) (CONS |rec| |ans|))
                                          ('T
                                           (SPADCALL
                                            (PROGN
                                             (LETT #2# NIL)
                                             (SEQ (LETT |sol| NIL)
                                                  (LETT #1# |sols|) G190
                                                  (COND
                                                   ((OR (ATOM #1#)
                                                        (PROGN
                                                         (LETT |sol| (CAR #1#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #2#
                                                          (CONS
                                                           (CONS
                                                            (SPADCALL
                                                             (QCAR |rec|)
                                                             (QCAR |sol|)
                                                             (QREFELT $ 61))
                                                            (QCDR |sol|))
                                                           #2#))))
                                                  (LETT #1# (CDR #1#))
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #2#))))
                                            |ans| (QREFELT $ 64)))))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |ans|)))))))) 

(SDEFUN |ODEPRRIC;polysol|
        ((|l| L) (|b| |NonNegativeInteger|) (|finite?| |Boolean|)
         (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
          (#1=#:G652 NIL) (|sol| NIL) (#2=#:G651 NIL)
          (|sols| (|List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
          (#3=#:G639 NIL) (|neweq| (L)) (|atn| (UP)) (#4=#:G650 NIL) (|a| NIL)
          (#5=#:G649 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP)))))
         (SEQ (LETT |ans| NIL)
              (COND (|finite?| (COND ((ZEROP |b|) (EXIT |ans|)))))
              (LETT |lc| (SPADCALL |l| (QREFELT $ 95)))
              (COND
               (|finite?|
                (LETT |lc|
                      (SPADCALL (CONS #'|ODEPRRIC;polysol!0| (VECTOR $ |b|))
                                |lc| (QREFELT $ 121)))))
              (SEQ (LETT |rec| NIL) (LETT #5# |lc|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |a| NIL)
                          (LETT #4# (SPADCALL (QCDR |rec|) |zeros|)) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |a| (|spadConstant| $ 38)
                                        (QREFELT $ 122))
                              (SEQ
                               (LETT |atn|
                                     (SPADCALL |a| (QCAR |rec|)
                                               (QREFELT $ 86)))
                               (LETT |neweq|
                                     (SPADCALL |l| |atn| (QREFELT $ 77)))
                               (LETT |sols|
                                     (|ODEPRRIC;polysol| |neweq|
                                      (PROG1 (LETT #3# (- (QCAR |rec|) 1))
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      'T |zeros| $))
                               (EXIT
                                (LETT |ans|
                                      (COND
                                       ((NULL |sols|)
                                        (CONS (CONS |atn| |neweq|) |ans|))
                                       ('T
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# NIL)
                                          (SEQ (LETT |sol| NIL)
                                               (LETT #1# |sols|) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |sol| (CAR #1#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |atn|
                                                                   (QCAR |sol|)
                                                                   (QREFELT $
                                                                            87))
                                                         (QCDR |sol|))
                                                        #2#))))
                                               (LETT #1# (CDR #1#)) (GO G190)
                                               G191 (EXIT (NREVERSE #2#))))
                                         |ans| (QREFELT $ 123)))))))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;polysol!0| ((|z| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (QCAR |z|) |b| (QREFELT $ 52)))))) 

(DECLAIM (NOTINLINE |PrimitiveRatRicDE;|)) 

(DEFUN |PrimitiveRatRicDE| (&REST #1=#:G653)
  (SPROG NIL
         (PROG (#2=#:G654)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveRatRicDE|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PrimitiveRatRicDE;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveRatRicDE|)))))))))) 

(DEFUN |PrimitiveRatRicDE;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PrimitiveRatRicDE| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 124))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PrimitiveRatRicDE|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
    (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
    $))) 

(MAKEPROP '|PrimitiveRatRicDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . D) '|diff| (4 . D) '|diffq|
              (|NonNegativeInteger|) (8 . |order|) (14 . |degree|) (|Integer|)
              (19 . -) (24 . ^) (|Union| $ '"failed") (30 . |exquo|)
              (36 . |rem|) (42 . |One|) (46 . |One|)
              (|SparseUnivariatePolynomial| 7) (50 . |monomial|) (56 . *)
              (62 . |coerce|) (67 . -) (73 . *) (79 . |One|) (|List| $)
              (|List| 17) (83 . |concat|) (88 . |removeDuplicates!|) (93 . *)
              |ODEPRRIC;denomRicDE;LUP;8| (99 . |Zero|) (103 . |Zero|)
              (|Record| (|:| |poly| 7) (|:| |eq| 8)) (|List| 40)
              (|Mapping| (|List| 6) 7) |ODEPRRIC;polyRicDE;LML;9|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 44) (|:| |factor| 7) (|:| |exponent| 14))
              (|List| 45) (|Factored| 7) (107 . |factorList|) (|List| 7)
              (112 . |concat|) (|Boolean|) (117 . <=)
              (|Record| (|:| |deg| 14) (|:| |eq| 25)) (|Mapping| 51 53)
              (|List| 53) (123 . |select!|) (129 . ~=) (|Fraction| 7) (135 . /)
              |ODEPRRIC;changeVar;LFL;22| (141 . +)
              (|Record| (|:| |frac| 58) (|:| |eq| 8)) (|List| 62)
              (147 . |concat!|) (|List| 14) (153 . |member?|) (159 . >)
              (|Mapping| 51 53 53) (165 . |sort!|) (171 . |coefficient|)
              (177 . +) (183 . |Zero|) (187 . |elt|) (193 . *)
              (199 . |coefficients|) (204 . |coerce|)
              |ODEPRRIC;changeVar;LUPL;21|
              (|Record| (|:| |constant| 6) (|:| |eq| 8)) (|List| 78)
              |ODEPRRIC;constantCoefficientRicDE;LML;15| (209 . |Zero|)
              (213 . ~=) (219 . |leadingCoefficient|)
              (224 . |leadingCoefficient|) (229 . |degree|) (234 . |monomial|)
              (240 . +) (246 . |reductum|) (251 . *) (257 . >)
              (|Record| (|:| |deg| 14) (|:| |eq| 7)) (|Mapping| 51 91 91)
              (|List| 91) (263 . |sort!|)
              |ODEPRRIC;leadingCoefficientRicDE;LL;19|
              (|BalancedFactorisation| 6 7) (269 . |balancedFactorisation|)
              (275 . |coerce|) (280 . +) (286 . |One|) (290 . *) (296 . *)
              (302 . |primitivePart|) (307 . |coerce|) (312 . +) (318 . |One|)
              (322 . |Zero|) (326 . |coerce|) (331 . *) (337 . *)
              (|Record| (|:| |eq| 8) (|:| |rh| 112)) (|List| 58)
              (|PrimitiveRatDE| 6 7 8 9) (343 . |splitDenominator|)
              (349 . |exquo|) (355 . |Zero|) (|Mapping| 49 7 25)
              (|Mapping| 47 7) |ODEPRRIC;singRicDE;LMML;25| (|Mapping| 51 91)
              (359 . |select!|) (365 . ~=) (371 . |concat!|))
           '#(|singRicDE| 377 |polyRicDE| 384 |leadingCoefficientRicDE| 390
              |denomRicDE| 395 |constantCoefficientRicDE| 400 |changeVar| 406)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|denomRicDE| (|#2| |#3|)) T)
                                   '((|leadingCoefficientRicDE|
                                      ((|List|
                                        (|Record|
                                         (|:| |deg| (|NonNegativeInteger|))
                                         (|:| |eq| |#2|)))
                                       |#3|))
                                     T)
                                   '((|constantCoefficientRicDE|
                                      ((|List|
                                        (|Record| (|:| |constant| |#1|)
                                                  (|:| |eq| |#3|)))
                                       |#3| (|Mapping| (|List| |#1|) |#2|)))
                                     T)
                                   '((|polyRicDE|
                                      ((|List|
                                        (|Record| (|:| |poly| |#2|)
                                                  (|:| |eq| |#3|)))
                                       |#3| (|Mapping| (|List| |#1|) |#2|)))
                                     T)
                                   '((|singRicDE|
                                      ((|List|
                                        (|Record|
                                         (|:| |frac| (|Fraction| |#2|))
                                         (|:| |eq| |#3|)))
                                       |#3|
                                       (|Mapping| (|List| |#2|) |#2|
                                                  (|SparseUnivariatePolynomial|
                                                   |#2|))
                                       (|Mapping| (|Factored| |#2|) |#2|)))
                                     T)
                                   '((|changeVar| (|#3| |#3| |#2|)) T)
                                   '((|changeVar|
                                      (|#3| |#3| (|Fraction| |#2|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 123
                                            '(0 8 0 10 0 9 0 12 2 7 14 0 0 15 1
                                              7 14 0 16 1 17 0 0 18 2 7 0 0 14
                                              19 2 7 20 0 0 21 2 7 0 0 0 22 0 6
                                              0 23 0 7 0 24 2 25 0 7 14 26 2 7
                                              0 14 0 27 1 25 0 7 28 2 25 0 0 0
                                              29 2 25 0 0 0 30 0 25 0 31 1 33 0
                                              32 34 1 33 0 0 35 2 7 0 0 0 36 0
                                              6 0 38 0 7 0 39 1 47 46 0 48 1 49
                                              0 32 50 2 14 51 0 0 52 2 55 0 54
                                              0 56 2 7 51 0 0 57 2 58 0 7 7 59
                                              2 58 0 0 0 61 2 63 0 0 0 64 2 65
                                              51 14 0 66 2 14 51 0 0 67 2 55 0
                                              68 0 69 2 8 7 0 14 70 2 25 0 0 0
                                              71 0 25 0 72 2 8 7 0 7 73 2 25 0
                                              7 0 74 1 8 49 0 75 1 7 0 6 76 0 8
                                              0 81 2 8 51 0 0 82 1 8 7 0 83 1 7
                                              6 0 84 1 8 14 0 85 2 7 0 6 14 86
                                              2 7 0 0 0 87 1 8 0 0 88 2 17 0 14
                                              0 89 2 17 51 0 0 90 2 93 0 92 0
                                              94 2 96 47 7 49 97 1 8 0 7 98 2 8
                                              0 0 0 99 0 8 0 100 2 8 0 7 0 101
                                              2 8 0 0 0 102 1 8 0 0 103 1 9 0
                                              58 104 2 9 0 0 0 105 0 9 0 106 0
                                              9 0 107 1 58 0 7 108 2 9 0 58 0
                                              109 2 9 0 0 0 110 2 113 111 9 112
                                              114 2 17 20 0 0 115 0 58 0 116 2
                                              93 0 120 0 121 2 6 51 0 0 122 2
                                              41 0 0 0 123 3 0 63 8 117 118 119
                                              2 0 41 8 42 43 1 0 93 8 95 1 0 7
                                              8 37 2 0 79 8 42 80 2 0 8 8 58 60
                                              2 0 8 8 7 77)))))
           '|lookupComplete|)) 