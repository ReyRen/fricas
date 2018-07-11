
(SDEFUN |IR2F;cmplex| ((|alpha| F) (|p| |SparseUnivariatePolynomial| F) ($ F))
        (SPADCALL |alpha|
                  (SPADCALL (SPADCALL |p| |alpha| (QREFELT $ 9))
                            (QREFELT $ 10))
                  (QREFELT $ 11))) 

(SDEFUN |IR2F;IR2F| ((|i| |IntegrationResult| F) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL |i| (QREFELT $ 13)) NIL
                   (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 19))
         (QREFELT $ 20))) 

(SDEFUN |IR2F;pairprod| ((|x| F) (|l| |List| F) ($ |List| F))
        (SPROG ((#1=#:G415 NIL) (|y| NIL) (#2=#:G414 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |y| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |y| (QREFELT $ 11)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IR2F;evenRoots| ((|x| F) ($ |List| F))
        (SPROG ((#1=#:G422 NIL) (|k| NIL) (#2=#:G421 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |x| (QREFELT $ 22)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL |k| '|nthRoot| (QREFELT $ 26))
                            (COND
                             ((SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |k| (QREFELT $ 28))
                                          (QREFELT $ 29))
                                (QREFELT $ 31))
                               (QREFELT $ 32))
                              (NULL
                               (NULL
                                (SPADCALL
                                 (|SPADfirst| (SPADCALL |k| (QREFELT $ 28)))
                                 (QREFELT $ 34)))))
                             (#3='T NIL)))
                           (#3# NIL))
                          (LETT #2#
                                (CONS
                                 (|SPADfirst| (SPADCALL |k| (QREFELT $ 28)))
                                 #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IR2F;expand;IrSL;5|
        ((|i| |IntegrationResult| F) (|x| |Symbol|) ($ |List| F))
        (SPROG ((|j| (|IntegrationResult| F)))
               (SEQ (LETT |j| (SPADCALL |i| (QREFELT $ 35)))
                    (EXIT
                     (|IR2F;pairsum| (LIST (|IR2F;IR2F| |j| $))
                      (|IR2F;mkRealFunc| (SPADCALL |j| (QREFELT $ 36)) |x| $)
                      $))))) 

(SDEFUN |IR2F;split;2Ir;6|
        ((|i| |IntegrationResult| F) ($ |IntegrationResult| F))
        (SPROG ((#1=#:G431 NIL) (|l| NIL) (#2=#:G430 NIL))
               (SEQ
                (SPADCALL (SPADCALL |i| (QREFELT $ 13))
                          (SPADCALL
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |l| NIL)
                                 (LETT #1# (SPADCALL |i| (QREFELT $ 36))) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |l| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (|IR2F;nlogs| |l| $) #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 39))
                          (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 19))))) 

(SDEFUN |IR2F;complexExpand;IrF;7| ((|i| |IntegrationResult| F) ($ F))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G433 (F)) (#3=#:G435 (F)) (#4=#:G438 NIL)
          (|lg| NIL) (|j| (|IntegrationResult| F)))
         (SEQ (LETT |j| (SPADCALL |i| (QREFELT $ 35)))
              (EXIT
               (SPADCALL (|IR2F;IR2F| |j| $)
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |lg| NIL)
                               (LETT #4# (SPADCALL |j| (QREFELT $ 36))) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |lg| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #3#
                                        (SPADCALL
                                         (SPADCALL (QVELT |lg| 0)
                                                   (QREFELT $ 41))
                                         (|IR2F;lg2cfunc| |lg| $)
                                         (QREFELT $ 11)))
                                  (COND
                                   (#1#
                                    (LETT #2#
                                          (SPADCALL #2# #3# (QREFELT $ 42))))
                                   ('T
                                    (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                          (COND (#1# #2#) ('T (|spadConstant| $ 43))))
                         (QREFELT $ 42)))))) 

(SDEFUN |IR2F;quadratic|
        ((|p| |SparseUnivariatePolynomial| F)
         (|lg| |SparseUnivariatePolynomial| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((|nn| (F)) (|sqrn| (F)) (|pp| (F)) (|sqrp| (F))
          (|s| #1=(|Record| (|:| |ans1| F) (|:| |ans2| F)))
          (|sqr| (|Record| (|:| |sqrt| #1#) (|:| |sgn| (|Integer|))))
          (|lgp| (F)) (|nrm| (F)) (|f| (F)) (|e| (F))
          (|q| (|Record| (|:| |ans1| F) (|:| |ans2| F))) (|c| (F)) (|d| (F))
          (|delta| (F)) (|p0| (F)) (|a| (F)) (|b| (F)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |delta|
                   (SPADCALL
                    (SPADCALL (LETT |b| (SPADCALL |p| 1 (QREFELT $ 48))) 2
                              (QREFELT $ 50))
                    (SPADCALL
                     (SPADCALL 4 (LETT |a| (SPADCALL |p| 2 (QREFELT $ 48)))
                               (QREFELT $ 51))
                     (LETT |p0| (SPADCALL |p| 0 (QREFELT $ 48)))
                     (QREFELT $ 11))
                    (QREFELT $ 53)))
             (QREFELT $ 54))
            (LIST
             (|IR2F;linear|
              (SPADCALL (SPADCALL (|spadConstant| $ 46) 1 (QREFELT $ 55))
                        (SPADCALL (SPADCALL |b| |a| (QREFELT $ 56))
                                  (QREFELT $ 57))
                        (QREFELT $ 58))
              |lg| $)))
           (#2='T
            (SEQ
             (LETT |e|
                   (QCAR
                    (LETT |q|
                          (|IR2F;quadeval| |lg|
                           (LETT |c|
                                 (SPADCALL
                                  (SPADCALL |b|
                                            (LETT |d|
                                                  (SPADCALL
                                                   (SPADCALL 2 |a|
                                                             (QREFELT $ 51))
                                                   (QREFELT $ 59)))
                                            (QREFELT $ 11))
                                  (QREFELT $ 60)))
                           |d| |delta| $))))
             (LETT |lgp|
                   (SPADCALL |c|
                             (SPADCALL
                              (LETT |nrm|
                                    (SPADCALL (SPADCALL |e| 2 (QREFELT $ 50))
                                              (SPADCALL |delta|
                                                        (SPADCALL
                                                         (LETT |f| (QCDR |q|))
                                                         2 (QREFELT $ 50))
                                                        (QREFELT $ 11))
                                              (QREFELT $ 53)))
                              (QREFELT $ 10))
                             (QREFELT $ 11)))
             (LETT |s| (QCAR (LETT |sqr| (|IR2F;insqrt| |delta| $))))
             (LETT |pp| (LETT |nn| (|spadConstant| $ 43)))
             (COND
              ((>= (QCDR |sqr|) 0)
               (SEQ
                (LETT |sqrp|
                      (SPADCALL (QCAR |s|)
                                (SPADCALL (SPADCALL (QCDR |s|) (QREFELT $ 61))
                                          (QREFELT $ 63))
                                (QREFELT $ 11)))
                (EXIT
                 (LETT |pp|
                       (SPADCALL |lgp|
                                 (SPADCALL (SPADCALL |d| |sqrp| (QREFELT $ 11))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 2 |e| (QREFELT $ 51))
                                                |f| (QREFELT $ 11))
                                               |nrm| (QREFELT $ 56))
                                              |sqrp| (QREFELT $ 11))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |e| 2 (QREFELT $ 50))
                                               (SPADCALL |delta|
                                                         (SPADCALL |f| 2
                                                                   (QREFELT $
                                                                            50))
                                                         (QREFELT $ 11))
                                               (QREFELT $ 42))
                                              |nrm| (QREFELT $ 56))
                                             (QREFELT $ 42))
                                            (QREFELT $ 10))
                                           (QREFELT $ 11))
                                 (QREFELT $ 42)))))))
             (COND
              ((SPADCALL (QCDR |sqr|) 0 (QREFELT $ 64))
               (SEQ
                (LETT |sqrn|
                      (SPADCALL (QCAR |s|)
                                (SPADCALL
                                 (SPADCALL (SPADCALL (QCDR |s|) (QREFELT $ 60))
                                           (QREFELT $ 61))
                                 (QREFELT $ 63))
                                (QREFELT $ 11)))
                (EXIT
                 (LETT |nn|
                       (SPADCALL |lgp|
                                 (SPADCALL (SPADCALL |d| |sqrn| (QREFELT $ 11))
                                           (|IR2F;ilog| |e|
                                            (SPADCALL |f| |sqrn|
                                                      (QREFELT $ 11))
                                            |x| $)
                                           (QREFELT $ 11))
                                 (QREFELT $ 42)))))))
             (EXIT
              (COND ((SPADCALL (QCDR |sqr|) 0 (QREFELT $ 65)) (LIST |pp|))
                    ((< (QCDR |sqr|) 0) (LIST |nn|))
                    (#2# (LIST |pp| |nn|)))))))))) 

(SDEFUN |IR2F;tantrick| ((|a| F) (|b| F) ($ F))
        (SPROG
         ((#1=#:G458 NIL) (|sa| #2=(|Union| (|Integer|) "failed")) (|sb| #2#))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |a| (QREFELT $ 67)) 0)
             (SPADCALL 2
                       (SPADCALL
                        (SPADCALL (SPADCALL |b| |a| (QREFELT $ 56))
                                  (QREFELT $ 60))
                        (QREFELT $ 68))
                       (QREFELT $ 51)))
            ('T
             (SEQ (LETT |sb| (SPADCALL |b| (QREFELT $ 71)))
                  (COND
                   ((QEQCAR |sb| 0)
                    (PROGN
                     (LETT #1#
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |a| |b| (QREFELT $ 56))
                                      (QREFELT $ 68))
                                     (QREFELT $ 51)))
                     (GO #3=#:G457))))
                  (LETT |sa| (SPADCALL |a| (QREFELT $ 71)))
                  (COND
                   ((QEQCAR |sa| 0)
                    (PROGN
                     (LETT #1#
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |b| |a| (QREFELT $ 56))
                                       (QREFELT $ 60))
                                      (QREFELT $ 68))
                                     (QREFELT $ 51)))
                     (GO #3#))))
                  (EXIT
                   (SPADCALL 2
                             (SPADCALL (SPADCALL |a| |b| (QREFELT $ 56))
                                       (QREFELT $ 68))
                             (QREFELT $ 51)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |IR2F;var_kers|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|x| |Symbol|)
         ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G462 NIL) (|k| NIL) (#2=#:G461 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |p| (QREFELT $ 74)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 76)) |x|
                                     (QREFELT $ 77))
                           (|spadConstant| $ 43) (QREFELT $ 78))
                          (LETT #2# (CONS |k| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IR2F;ilog| ((|a| F) (|b| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|opk| (|BasicOperator|)) (|k| (|Kernel| F))
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| $ 43) (QREFELT $ 79))
            (|spadConstant| $ 43))
           (#1='T
            (SEQ
             (COND
              ((NULL (|IR2F;var_kers| (SPADCALL |a| (QREFELT $ 81)) |x| $))
               (COND
                ((NULL
                  (NULL (|IR2F;var_kers| (SPADCALL |b| (QREFELT $ 81)) |x| $)))
                 (EXIT (|IR2F;tantrick| |a| |b| $)))))
              (#1# (EXIT (|IR2F;tantrick| |a| |b| $))))
             (LETT |l|
                   (SPADCALL
                    (|IR2F;var_kers| (SPADCALL |a| (QREFELT $ 82)) |x| $)
                    (|IR2F;var_kers| (SPADCALL |b| (QREFELT $ 82)) |x| $)
                    (QREFELT $ 83)))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |l|) 1 (QREFELT $ 84))
                (|IR2F;tantrick| |a| |b| $))
               (#1#
                (SEQ (LETT |k| (|SPADfirst| |l|))
                     (LETT |opk| (SPADCALL |k| (QREFELT $ 86)))
                     (COND
                      ((OR (SPADCALL |opk| '|tan| (QREFELT $ 87))
                           (SPADCALL |opk| '|%alg| (QREFELT $ 88)))
                       (EXIT (|IR2F;tantrick| |a| |b| $))))
                     (EXIT
                      (|IR2F;ilog0| |a| |b|
                       (SPADCALL (SPADCALL |a| |k| (QREFELT $ 90))
                                 (QREFELT $ 92))
                       (SPADCALL (SPADCALL |b| |k| (QREFELT $ 90))
                                 (QREFELT $ 92))
                       (SPADCALL |k| (QREFELT $ 76)) $)))))))))))) 

(SDEFUN |IR2F;ilog0|
        ((|a| F) (|b| F) (|upa| . #1=(|SparseUnivariatePolynomial| F))
         (|upb| |SparseUnivariatePolynomial| F) (|k| F) ($ F))
        (SPROG
         ((|bb| (F)) (|aa| (F))
          (|qr|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|g| (|Union| F "failed"))
          (|r|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))
                     (|:| |generator| (|SparseUnivariatePolynomial| F))))
          (|#G37| (F)) (|#G36| (F)) (|#G35| #1#)
          (|#G34| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((< (SPADCALL |upa| (QREFELT $ 93)) (SPADCALL |upb| (QREFELT $ 93)))
            (SEQ
             (PROGN
              (LETT |#G34| (SPADCALL |upb| (QREFELT $ 94)))
              (LETT |#G35| |upa|)
              (LETT |upa| |#G34|)
              (LETT |upb| |#G35|))
             (EXIT
              (PROGN
               (LETT |#G36| (SPADCALL |b| (QREFELT $ 60)))
               (LETT |#G37| |a|)
               (LETT |a| |#G36|)
               (LETT |b| |#G37|))))))
          (EXIT
           (COND
            ((ZEROP (SPADCALL |upb| (QREFELT $ 93)))
             (|IR2F;tantrick| |a| |b| $))
            (#2='T
             (SEQ (LETT |r| (SPADCALL |upa| |upb| (QREFELT $ 96)))
                  (LETT |g| (SPADCALL (QVELT |r| 2) (QREFELT $ 98)))
                  (EXIT
                   (COND ((QEQCAR |g| 1) (|IR2F;tantrick| |a| |b| $))
                         (#2#
                          (SEQ
                           (COND
                            ((>= (SPADCALL (QVELT |r| 0) (QREFELT $ 93))
                                 (SPADCALL |upb| (QREFELT $ 93)))
                             (SEQ
                              (LETT |qr|
                                    (SPADCALL (QVELT |r| 0) |upb|
                                              (QREFELT $ 100)))
                              (QSETVELT |r| 0 (QCDR |qr|))
                              (EXIT
                               (QSETVELT |r| 1
                                         (SPADCALL (QVELT |r| 1)
                                                   (SPADCALL (QCAR |qr|) |upa|
                                                             (QREFELT $ 101))
                                                   (QREFELT $ 58)))))))
                           (LETT |aa|
                                 (SPADCALL (QVELT |r| 1) |k| (QREFELT $ 9)))
                           (LETT |bb|
                                 (SPADCALL
                                  (SPADCALL (QVELT |r| 0) |k| (QREFELT $ 9))
                                  (QREFELT $ 60)))
                           (EXIT
                            (SPADCALL
                             (|IR2F;tantrick|
                              (SPADCALL (SPADCALL |aa| |a| (QREFELT $ 11))
                                        (SPADCALL |bb| |b| (QREFELT $ 11))
                                        (QREFELT $ 42))
                              (QCDR |g|) $)
                             (|IR2F;ilog0| |aa| |bb| (QVELT |r| 1)
                              (SPADCALL (QVELT |r| 0) (QREFELT $ 94)) |k| $)
                             (QREFELT $ 42)))))))))))))) 

(SDEFUN |IR2F;lg2func|
        ((|lg| |Record| (|:| |scalar| (|Fraction| (|Integer|)))
          (|:| |coeff| #1=(|SparseUnivariatePolynomial| F))
          (|:| |logand| (|SparseUnivariatePolynomial| F)))
         (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((#2=#:G495 NIL) (#3=#:G488 NIL) (|alpha| (F))
          (|r| (|Union| F "failed")) (|d| (|NonNegativeInteger|)) (|p| #1#))
         (SEQ
          (COND
           ((ZEROP
             (LETT |d| (SPADCALL (LETT |p| (QVELT |lg| 1)) (QREFELT $ 93))))
            (|error| "poly has degree 0"))
           ((EQL |d| 1) (LIST (|IR2F;linear| |p| (QVELT |lg| 2) $)))
           ((EQL |d| 2) (|IR2F;quadratic| |p| (QVELT |lg| 2) |x| $))
           ('T
            (SEQ
             (EXIT
              (SEQ
               (COND
                ((ODDP |d|)
                 (SEQ
                  (LETT |r|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 102))
                                  (QREFELT $ 98)))
                  (EXIT
                   (COND
                    ((QEQCAR |r| 0)
                     (PROGN
                      (LETT #2#
                            (|IR2F;pairsum|
                             (LIST
                              (|IR2F;cmplex|
                               (LETT |alpha|
                                     (SPADCALL (SPADCALL |p| (QREFELT $ 104))
                                               (QREFELT $ 63)))
                               (QVELT |lg| 2) $))
                             (|IR2F;lg2func|
                              (VECTOR (QVELT |lg| 0)
                                      (PROG2
                                          (LETT #3#
                                                (SPADCALL |p|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            46)
                                                            1 (QREFELT $ 55))
                                                           (SPADCALL |alpha|
                                                                     (QREFELT $
                                                                              57))
                                                           (QREFELT $ 105))
                                                          (QREFELT $ 107)))
                                          (QCDR #3#)
                                        (|check_union2| (QEQCAR #3# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 7))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 7))
                                                         "failed")
                                                        #3#))
                                      (QVELT |lg| 2))
                              |x| $)
                             $))
                      (GO #4=#:G492))))))))
               (EXIT (LIST (|IR2F;lg2cfunc| |lg| $)))))
             #4# (EXIT #2#))))))) 

(SDEFUN |IR2F;lg2cfunc|
        ((|lg| |Record| (|:| |scalar| (|Fraction| (|Integer|)))
          (|:| |coeff| (|SparseUnivariatePolynomial| F))
          (|:| |logand| (|SparseUnivariatePolynomial| F)))
         ($ F))
        (SPROG
         ((#1=#:G498 NIL) (#2=#:G497 (F)) (#3=#:G499 (F)) (#4=#:G501 NIL)
          (|alpha| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |alpha| NIL)
                (LETT #4# (SPADCALL (QVELT |lg| 1) (QREFELT $ 108))) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |alpha| (CAR #4#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# (|IR2F;cmplex| |alpha| (QVELT |lg| 2) $))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 42))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 43))))))) 

(SDEFUN |IR2F;mkRealFunc|
        ((|l| |List|
          (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                    (|:| |coeff| (|SparseUnivariatePolynomial| F))
                    (|:| |logand| (|SparseUnivariatePolynomial| F))))
         (|x| |Symbol|) ($ |List| F))
        (SPROG ((|ans| (|List| F)) (#1=#:G506 NIL) (|lg| NIL))
               (SEQ (LETT |ans| NIL)
                    (SEQ (LETT |lg| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |lg| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ans|
                                 (|IR2F;pairsum| |ans|
                                  (|IR2F;pairprod|
                                   (SPADCALL (QVELT |lg| 0) (QREFELT $ 41))
                                   (|IR2F;lg2func| |lg| |x| $) $)
                                  $))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |IR2F;linear|
        ((|p| |SparseUnivariatePolynomial| F)
         (|lg| |SparseUnivariatePolynomial| F) ($ F))
        (SPROG ((|alpha| (F)))
               (SEQ
                (LETT |alpha|
                      (SPADCALL
                       (SPADCALL (SPADCALL |p| 0 (QREFELT $ 48))
                                 (SPADCALL |p| 1 (QREFELT $ 48))
                                 (QREFELT $ 56))
                       (QREFELT $ 60)))
                (EXIT
                 (SPADCALL |alpha|
                           (SPADCALL (SPADCALL |lg| |alpha| (QREFELT $ 9))
                                     (QREFELT $ 10))
                           (QREFELT $ 11)))))) 

(SDEFUN |IR2F;quadeval|
        ((|p| |SparseUnivariatePolynomial| F) (|a| F) (|b| F) (|delta| F)
         ($ |Record| (|:| |ans1| F) (|:| |ans2| F)))
        (SPROG
         ((|ai| (F)) (|bi| (F)) (|temp| (F)) (|d| (F)) (|c| (F))
          (#1=#:G515 NIL) (|i| NIL) (|v| (|Vector| F)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 109))
            (CONS (|spadConstant| $ 43) (|spadConstant| $ 43)))
           ('T
            (SEQ (LETT |bi| (LETT |c| (LETT |d| (|spadConstant| $ 43))))
                 (LETT |ai| (|spadConstant| $ 46))
                 (LETT |v|
                       (SPADCALL |p| (+ 1 (SPADCALL |p| (QREFELT $ 93)))
                                 (QREFELT $ 111)))
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 112)))
                      (LETT #1# (QVSIZE |v|)) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (LETT |c|
                             (SPADCALL |c|
                                       (SPADCALL (QAREF1O |v| |i| 1) |ai|
                                                 (QREFELT $ 11))
                                       (QREFELT $ 42)))
                       (LETT |d|
                             (SPADCALL |d|
                                       (SPADCALL (QAREF1O |v| |i| 1) |bi|
                                                 (QREFELT $ 11))
                                       (QREFELT $ 42)))
                       (LETT |temp|
                             (SPADCALL (SPADCALL |a| |ai| (QREFELT $ 11))
                                       (SPADCALL
                                        (SPADCALL |b| |bi| (QREFELT $ 11))
                                        |delta| (QREFELT $ 11))
                                       (QREFELT $ 42)))
                       (LETT |bi|
                             (SPADCALL (SPADCALL |a| |bi| (QREFELT $ 11))
                                       (SPADCALL |b| |ai| (QREFELT $ 11))
                                       (QREFELT $ 42)))
                       (EXIT (LETT |ai| |temp|)))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                 (EXIT (CONS |c| |d|)))))))) 

(SDEFUN |IR2F;compatible?| ((|lx| |List| F) (|ly| |List| F) ($ |Boolean|))
        (SPROG
         ((#1=#:G525 NIL) (#2=#:G526 NIL) (|s| (|Union| (|Integer|) "failed"))
          (#3=#:G528 NIL) (|y| NIL) (#4=#:G527 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (COND ((NULL |ly|) 'T)
                 ('T
                  (SEQ
                   (SEQ (LETT |x| NIL) (LETT #4# |lx|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |y| NIL) (LETT #3# |ly|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |y| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |s|
                                      (SPADCALL
                                       (SPADCALL |x| |y| (QREFELT $ 11))
                                       (QREFELT $ 71)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |s| 0)
                                   (COND
                                    ((< (QCDR |s|) 0)
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #5=#:G524)))
                                      (GO #6=#:G520))))))))
                               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |IR2F;pairsum| ((|lx| |List| F) (|ly| |List| F) ($ |List| F))
        (SPROG
         ((|l| (|List| F)) (|ln| (|List| F)) (#1=#:G538 NIL) (|y| NIL)
          (#2=#:G537 NIL) (|ls| (|List| F)) (#3=#:G536 NIL) (|x| NIL))
         (SEQ
          (COND ((NULL |lx|) |ly|) ((NULL |ly|) |lx|)
                ('T
                 (SEQ (LETT |l| NIL)
                      (SEQ (LETT |x| NIL) (LETT #3# |lx|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |ls| (|IR2F;evenRoots| |x| $))
                                (EXIT
                                 (COND
                                  ((NULL
                                    (NULL
                                     (LETT |ln|
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT |y| NIL) (LETT #1# |ly|)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |y| (CAR #1#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((|IR2F;compatible?| |ls|
                                                      (|IR2F;evenRoots| |y| $)
                                                      $)
                                                     (LETT #2#
                                                           (CONS
                                                            (SPADCALL |x| |y|
                                                                      (QREFELT
                                                                       $ 42))
                                                            #2#))))))
                                                 (LETT #1# (CDR #1#)) (GO G190)
                                                 G191
                                                 (EXIT (NREVERSE #2#)))))))
                                   (LETT |l|
                                         (SPADCALL
                                          (SPADCALL |l| |ln| (QREFELT $ 113))
                                          (QREFELT $ 114)))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |l|))))))) 

(SDEFUN |IR2F;insqrt|
        ((|y| F)
         ($ |Record| (|:| |sqrt| (|Record| (|:| |ans1| F) (|:| |ans2| F)))
          (|:| |sgn| (|Integer|))))
        (SPROG
         ((|s| (|Union| (|Integer|) "failed"))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F))))
         (SEQ (LETT |rec| (SPADCALL |y| 2 (QREFELT $ 117)))
              (EXIT
               (COND
                ((EQL (QVELT |rec| 0) 1)
                 (CONS
                  (CONS
                   (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT $ 11))
                   (|spadConstant| $ 46))
                  1))
                ((SPADCALL (QVELT |rec| 0) 2 (QREFELT $ 84))
                 (|error| "Should not happen"))
                (#1='T
                 (CONS (CONS (QVELT |rec| 1) (QVELT |rec| 2))
                       (SEQ
                        (LETT |s| (SPADCALL (QVELT |rec| 2) (QREFELT $ 71)))
                        (EXIT
                         (COND ((QEQCAR |s| 1) 0) (#1# (QCDR |s|)))))))))))) 

(SDEFUN |IR2F;nlogs|
        ((|lg| |Record| (|:| |scalar| (|Fraction| (|Integer|)))
          (|:| |coeff| (|SparseUnivariatePolynomial| F))
          (|:| |logand| (|SparseUnivariatePolynomial| F)))
         ($ |List|
          (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                    (|:| |coeff| (|SparseUnivariatePolynomial| F))
                    (|:| |logand| (|SparseUnivariatePolynomial| F)))))
        (SPROG ((#1=#:G554 NIL) (|f| NIL) (#2=#:G553 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL)
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QVELT |lg| 1) (QREFELT $ 118))
                              (QREFELT $ 121))
                             (QREFELT $ 125)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR
                                (SPADCALL (QVELT |f| 2) (QVELT |lg| 0)
                                          (QREFELT $ 126))
                                (QVELT |f| 1) (QVELT |lg| 2))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |IntegrationResultToFunction;|)) 

(DEFUN |IntegrationResultToFunction| (&REST #1=#:G555)
  (SPROG NIL
         (PROG (#2=#:G556)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegrationResultToFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |IntegrationResultToFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IntegrationResultToFunction|)))))))))) 

(DEFUN |IntegrationResultToFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|IntegrationResultToFunction| DV$1 DV$2))
          (LETT $ (GETREFV 127))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IntegrationResultToFunction|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegrationResultToFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 7) (0 . |elt|) (6 . |log|) (11 . *)
              (|IntegrationResult| 7) (17 . |ratpart|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 14)
              (22 . |notelem|)
              (|Record| (|:| |scalar| 40) (|:| |coeff| 8) (|:| |logand| 8))
              (|List| 17) (27 . |mkAnswer|) (34 . |retract|) (|List| 75)
              (39 . |tower|) (|Boolean|) (|Symbol|) (|Kernel| 7) (44 . |is?|)
              (|List| 7) (50 . |argument|) (55 . |second|) (|Integer|)
              (60 . |retract|) (65 . |even?|) (|List| 24) (70 . |variables|)
              |IR2F;split;2Ir;6| (75 . |logpart|) |IR2F;expand;IrSL;5|
              (|List| $) (80 . |concat|) (|Fraction| 30) (85 . |coerce|)
              (90 . +) (96 . |Zero|) |IR2F;complexExpand;IrF;7| (100 . |One|)
              (104 . |One|) (|NonNegativeInteger|) (108 . |coefficient|)
              (|PositiveInteger|) (114 . ^) (120 . *) (126 . |Zero|) (130 . -)
              (136 . |zero?|) (141 . |monomial|) (147 . /) (153 . |coerce|)
              (158 . +) (164 . |inv|) (169 . -) (174 . |sqrt|)
              (|AlgebraicManipulations| 6 7) (179 . |rootSimp|) (184 . <=)
              (190 . >) (|Union| 40 '"failed") (196 . |retractIfCan|)
              (201 . |atan|) (|Union| 30 '"failed")
              (|ElementaryFunctionSign| 6 7) (206 . |sign|) (|List| 25)
              (|SparseMultivariatePolynomial| 6 25) (211 . |variables|)
              (|Kernel| $) (216 . |coerce|) (221 . D) (227 . ~=) (233 . =)
              (|SparseMultivariatePolynomial| 6 75) (239 . |denom|)
              (244 . |numer|) (249 . |setUnion|) (255 . ~=) (|BasicOperator|)
              (261 . |operator|) (266 . |is?|) (272 . |has?|) (|Fraction| 103)
              (278 . |univariate|) (|Fraction| 8) (284 . |numer|)
              (289 . |degree|) (294 . -)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (299 . |extendedEuclidean|) (|Union| 7 '"failed")
              (305 . |retractIfCan|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (310 . |divide|) (316 . *) (322 . |reductum|)
              (|SparseUnivariatePolynomial| $) (327 . |zeroOf|) (332 . -)
              (|Union| $ '"failed") (338 . |exquo|) (344 . |zerosOf|)
              (349 . |zero?|) (|Vector| 7) (354 . |vectorise|)
              (360 . |minIndex|) (365 . |concat|) (371 . |removeDuplicates|)
              (|Record| (|:| |exponent| 47) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 25) 25 6 73 7)
              (376 . |froot|) (382 . |primitivePart|) (|Factored| 8)
              (|ExpressionFactorPolynomial| 6 7) (387 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 122) (|:| |factor| 8) (|:| |exponent| 47))
              (|List| 123) (392 . |factorList|) (397 . *))
           '#(|split| 403 |expand| 408 |complexExpand| 414) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|split|
                                 ((|IntegrationResult| |#2|)
                                  (|IntegrationResult| |#2|)))
                                T)
                              '((|expand|
                                 ((|List| |#2|) (|IntegrationResult| |#2|)
                                  (|Symbol|)))
                                T)
                              '((|complexExpand|
                                 (|#2| (|IntegrationResult| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 126
                                            '(2 8 7 0 7 9 1 7 0 0 10 2 7 0 0 0
                                              11 1 12 7 0 13 1 12 15 0 16 3 12
                                              0 7 18 15 19 1 12 7 0 20 1 7 21 0
                                              22 2 25 23 0 24 26 1 25 27 0 28 1
                                              27 7 0 29 1 7 30 0 31 1 30 23 0
                                              32 1 7 33 0 34 1 12 18 0 36 1 18
                                              0 38 39 1 7 0 40 41 2 7 0 0 0 42
                                              0 7 0 43 0 6 0 45 0 7 0 46 2 8 7
                                              0 47 48 2 7 0 0 49 50 2 7 0 49 0
                                              51 0 6 0 52 2 7 0 0 0 53 1 7 23 0
                                              54 2 8 0 7 47 55 2 7 0 0 0 56 1 8
                                              0 7 57 2 8 0 0 0 58 1 7 0 0 59 1
                                              7 0 0 60 1 7 0 0 61 1 62 7 7 63 2
                                              30 23 0 0 64 2 30 23 0 0 65 1 7
                                              66 0 67 1 7 0 0 68 1 70 69 7 71 1
                                              73 72 0 74 1 7 0 75 76 2 7 0 0 24
                                              77 2 7 23 0 0 78 2 7 23 0 0 79 1
                                              7 80 0 81 1 7 80 0 82 2 72 0 0 0
                                              83 2 47 23 0 0 84 1 25 85 0 86 2
                                              85 23 0 24 87 2 85 23 0 24 88 2 7
                                              89 0 75 90 1 91 8 0 92 1 8 47 0
                                              93 1 8 0 0 94 2 8 95 0 0 96 1 8
                                              97 0 98 2 8 99 0 0 100 2 8 0 0 0
                                              101 1 8 0 0 102 1 7 0 103 104 2 8
                                              0 0 0 105 2 8 106 0 0 107 1 7 38
                                              103 108 1 8 23 0 109 2 8 110 0 47
                                              111 1 110 30 0 112 2 27 0 0 0 113
                                              1 27 0 0 114 2 116 115 7 47 117 1
                                              8 0 0 118 1 120 119 8 121 1 119
                                              124 0 125 2 40 0 47 0 126 1 0 12
                                              12 35 2 0 27 12 24 37 1 0 7 12
                                              44)))))
           '|lookupComplete|)) 