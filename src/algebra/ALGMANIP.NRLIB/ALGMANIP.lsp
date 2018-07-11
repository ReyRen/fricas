
(SDEFUN |ALGMANIP;ratDenom;2F;1| ((|x| F) ($ F))
        (|ALGMANIP;innerRF| |x|
         (|ALGMANIP;algkernels| (SPADCALL |x| (QREFELT $ 15)) $) $)) 

(SDEFUN |ALGMANIP;ratDenom;FLF;2| ((|x| F) (|l| |List| (|Kernel| F)) ($ F))
        (|ALGMANIP;innerRF| |x| (|ALGMANIP;algkernels| |l| $) $)) 

(SDEFUN |ALGMANIP;ratDenom;3F;3| ((|x| F) (|y| F) ($ F))
        (SPADCALL |x| (LIST |y|) (QREFELT $ 20))) 

(SDEFUN |ALGMANIP;ratDenom;FLF;4| ((|x| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G400 NIL) (|y| NIL) (#2=#:G399 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |y| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |y| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |y| (QREFELT $ 23))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 18))))) 

(SDEFUN |ALGMANIP;algkernels|
        ((|l| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|ALGMANIP;algkernels!0| (VECTOR (QREFELT $ 8) $)) |l|
                (QREFELT $ 29)))) 

(SDEFUN |ALGMANIP;algkernels!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 25)) ALGOP (QREFELT $ 27)))))) 

(SDEFUN |ALGMANIP;rootkernels|
        ((|l| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPADCALL (CONS #'|ALGMANIP;rootkernels!0| $) |l| (QREFELT $ 31))) 

(SDEFUN |ALGMANIP;rootkernels!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 25)) '|nthRoot| (QREFELT $ 30))) 

(SDEFUN |ALGMANIP;ratPoly;FSup;7| ((|x| F) ($ |SparseUnivariatePolynomial| F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33))
                         (QREFELT $ 35))
               |x| (QREFELT $ 36))
              (QREFELT $ 37))
             (QREFELT $ 16))
            (QREFELT $ 38))
           (QREFELT $ 35))
          (QREFELT $ 13) (QREFELT $ 41))
         (QREFELT $ 43))) 

(SDEFUN |ALGMANIP;rootSplit;2F;8| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G410 NIL) (|k| NIL) (#2=#:G409 NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $))
          (EXIT
           (SPADCALL |x| |lk|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |k| NIL) (LETT #1# |lk|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (|ALGMANIP;rootExpand| |k| $) #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 46)))))) 

(SDEFUN |ALGMANIP;rootExpand| ((|k| |Kernel| F) ($ F))
        (SPROG ((|op| (|BasicOperator|)) (|n| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 48))))
                    (LETT |n|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 48))
                                    (QREFELT $ 49)))
                    (LETT |op| (SPADCALL |k| (QREFELT $ 25)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |op|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                          (QREFELT $ 35))
                                |n| (QREFELT $ 51))
                      (SPADCALL |op|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 38))
                                          (QREFELT $ 35))
                                |n| (QREFELT $ 51))
                      (QREFELT $ 52)))))) 

(SDEFUN |ALGMANIP;innerRF| ((|x| F) (|ll| |List| (|Kernel| F)) ($ F))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| F)) (#1=#:G459 NIL) (|kk| NIL)
          (#2=#:G458 NIL) (#3=#:G454 NIL) (#4=#:G455 NIL) (#5=#:G457 NIL)
          (#6=#:G456 NIL) (|l| (|List| (|Kernel| F)))
          (|lk| (|List| (|Kernel| F))) (|k| (|Kernel| F)))
         (SEQ
          (EXIT
           (COND
            ((OR
              (NULL
               (LETT |l|
                     (SPADCALL (ELT $ 53) (SPADCALL |x| (QREFELT $ 54))
                               (QREFELT $ 56))))
              (NULL
               (SPADCALL |ll| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 57))))
             |x|)
            ('T
             (SEQ (LETT |lk| NIL)
                  (SEQ G190
                       (COND
                        ((NULL
                          (NULL
                           (SPADCALL (LETT |k| (|SPADfirst| |l|)) |ll|
                                     (QREFELT $ 58))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |lk| (CONS |k| |lk|))
                              (EXIT
                               (COND
                                ((NULL (LETT |l| (CDR |l|)))
                                 (PROGN
                                  (LETT #3#
                                        (PROGN
                                         (LETT #4#
                                               (SPADCALL |x| |lk|
                                                         (PROGN
                                                          (LETT #6# NIL)
                                                          (SEQ (LETT |kk| NIL)
                                                               (LETT #5# |lk|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #5#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |kk|
                                                                       (CAR
                                                                        #5#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #6#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         (CONS
                                                                          #'|ALGMANIP;innerRF!0|
                                                                          (VECTOR
                                                                           $
                                                                           |ll|))
                                                                         |kk|
                                                                         (QREFELT
                                                                          $
                                                                          60))
                                                                        #6#))))
                                                               (LETT #5#
                                                                     (CDR #5#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #6#))))
                                                         (QREFELT $ 46)))
                                         (GO #7=#:G453)))
                                  (GO #8=#:G418)))))))
                        #8# (EXIT #3#))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |q|
                        (SPADCALL
                         (SPADCALL |x| |lk|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |kk| NIL) (LETT #1# |lk|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |kk| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL
                                                   (CONS #'|ALGMANIP;innerRF!1|
                                                         (VECTOR $ |ll|))
                                                   |kk| (QREFELT $ 60))
                                                  #2#))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 46))
                         |k| (SPADCALL |k| (QREFELT $ 62)) (QREFELT $ 63)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!2| (VECTOR $ |ll|)) |q|
                              (QREFELT $ 65))
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!3| (VECTOR $ |ll|)) |k|
                              (QREFELT $ 60))
                    (QREFELT $ 66)))))))
          #7# (EXIT #4#)))) 

(SDEFUN |ALGMANIP;innerRF!3| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;innerRF!2| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;innerRF!1| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;innerRF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| $)
          (LETT |ll| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| $))))) 

(SDEFUN |ALGMANIP;fp_root|
        ((|fp| |Factored| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((|res| (F)) (|rr| (F)) (|ce| (|NonNegativeInteger|))
          (|ne| (|NonNegativeInteger|)) (#1=#:G465 NIL) (#2=#:G463 NIL)
          (|nn| (|Integer|)) (|ng| (|NonNegativeInteger|)) (#3=#:G470 NIL)
          (|fr| NIL) (|u| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ (LETT |res| (|spadConstant| $ 68))
              (COND
               ((SPADCALL (LETT |u| (SPADCALL |fp| (QREFELT $ 70)))
                          (|spadConstant| $ 72) (QREFELT $ 73))
                (LETT |res|
                      (SPADCALL |op|
                                (LIST (SPADCALL |u| (QREFELT $ 74))
                                      (SPADCALL |n| (QREFELT $ 76)))
                                (QREFELT $ 77)))))
              (SEQ (LETT |fr| NIL) (LETT #3# (SPADCALL |fp| (QREFELT $ 81)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |fr| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ne| (REM (QVELT |fr| 2) |n|))
                        (LETT |ng| (GCD |ne| |n|))
                        (LETT |nn|
                              (PROG2
                                  (LETT #2# (SPADCALL |n| |ng| (QREFELT $ 84)))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|NonNegativeInteger|)
                                                (|Union| (|NonNegativeInteger|)
                                                         #4="failed")
                                                #2#)))
                        (LETT |ne|
                              (PROG1
                                  (LETT #1#
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |ne| |ng|
                                                            (QREFELT $ 84)))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (|NonNegativeInteger|)
                                                          (|Union|
                                                           (|NonNegativeInteger|)
                                                           #4#)
                                                          #2#)))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#)))
                        (LETT |ce| (QUOTIENT2 (QVELT |fr| 2) |n|))
                        (LETT |rr|
                              (COND
                               ((SPADCALL |nn| 1 (QREFELT $ 85))
                                (SPADCALL |op|
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL (QVELT |fr| 1) |ne|
                                                      (QREFELT $ 86))
                                            (QREFELT $ 74))
                                           (SPADCALL |nn| (QREFELT $ 76)))
                                          (QREFELT $ 77)))
                               ('T (|spadConstant| $ 68))))
                        (EXIT
                         (LETT |res|
                               (SPADCALL
                                (SPADCALL |res|
                                          (SPADCALL
                                           (SPADCALL (QVELT |fr| 1) |ce|
                                                     (QREFELT $ 86))
                                           (QREFELT $ 74))
                                          (QREFELT $ 87))
                                |rr| (QREFELT $ 87)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ALGMANIP;pol_root|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((|pp| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G472 NIL) (|cp| (R)))
         (SEQ (LETT |cp| (SPADCALL |p| (QREFELT $ 88)))
              (SPADCALL |cp| (QREFELT $ 89))
              (LETT |pp|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |p| (SPADCALL |cp| (QREFELT $ 90))
                                        (QREFELT $ 91)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0)
                                      (|SparseMultivariatePolynomial|
                                       (QREFELT $ 6) (|Kernel| (QREFELT $ 7)))
                                      (|Union|
                                       (|SparseMultivariatePolynomial|
                                        (QREFELT $ 6) (|Kernel| (QREFELT $ 7)))
                                       "failed")
                                      #1#)))
              (EXIT
               (SPADCALL
                (|ALGMANIP;fp_root| (SPADCALL |pp| (QREFELT $ 92)) |op| |n| $)
                (|ALGMANIP;fp_root|
                 (SPADCALL (ELT $ 90) (SPADCALL |cp| (QREFELT $ 94))
                           (QREFELT $ 98))
                 |op| |n| $)
                (QREFELT $ 87)))))) 

(SDEFUN |ALGMANIP;root_factor_k| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|)) (#1=#:G476 NIL)
          (|nf| (F)) (|x| (F)))
         (SEQ (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 48))))
              (LETT |nf|
                    (SPADCALL (SPADCALL |k| (QREFELT $ 48)) (QREFELT $ 49)))
              (LETT |n|
                    (PROG1 (LETT #1# (SPADCALL |nf| (QREFELT $ 99)))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |op| (SPADCALL |k| (QREFELT $ 25)))
              (EXIT
               (SPADCALL
                (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT $ 50)) |op| |n| $)
                (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT $ 38)) |op| |n| $)
                (QREFELT $ 52)))))) 

(SDEFUN |ALGMANIP;rootFactor;2F;14| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G483 NIL) (|k| NIL) (#2=#:G482 NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $))
          (EXIT
           (SPADCALL |x| |lk|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |k| NIL) (LETT #1# |lk|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (|ALGMANIP;root_factor_k| |k| $)
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 46)))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;15|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 102)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0)
                       (SPADCALL (SPADCALL (QCDR |r|) |n| (QREFELT $ 103))
                                 (QREFELT $ 89)))
                      ('T (|ALGMANIP;inroot| |op| |x| |n| $))))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;16|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (|ALGMANIP;inroot| |op| |x| |n| $)) 

(SDEFUN |ALGMANIP;breakup|
        ((|l| |List| (|Kernel| F))
         ($ |List|
          (|Record| (|:| |ker| (|List| (|Kernel| F)))
                    (|:| |exponent| (|List| (|Integer|))))))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |ker| (|List| (|Kernel| F)))
                      (|:| |exponent| (|List| (|Integer|))))))
          (|others| #1=(|List| (|Kernel| F))) (|expo| (|List| (|Integer|)))
          (|same| #1#) (|arg| (|List| F)) (#2=#:G497 NIL) (|kk| NIL)
          (|n| (|Integer|)) (|a| (F)) (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) NIL)
                ('T
                 (SEQ (LETT |k| (|SPADfirst| |l|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg| (SPADCALL |k| (QREFELT $ 48)))))
                      (LETT |n|
                            (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                      (QREFELT $ 99)))
                      (LETT |expo| NIL) (LETT |others| (LETT |same| NIL))
                      (SEQ (LETT |kk| NIL) (LETT #2# (CDR |l|)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |kk| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |a|
                                         (|SPADfirst|
                                          (LETT |arg|
                                                (SPADCALL |kk|
                                                          (QREFELT $ 48))))
                                         (QREFELT $ 105))
                               (SEQ (LETT |same| (CONS |kk| |same|))
                                    (EXIT
                                     (LETT |expo|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |arg| (QREFELT $ 49))
                                             (QREFELT $ 99))
                                            |expo|)))))
                              ('T (LETT |others| (CONS |kk| |others|))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ll| (|ALGMANIP;breakup| |others| $))
                      (EXIT
                       (CONS (CONS (CONS |k| |same|) (CONS |n| |expo|))
                             |ll|)))))))) 

(SDEFUN |ALGMANIP;rootProduct;2F;18| ((|x| F) ($ F))
        (SPROG
         ((|lv| (|List| F)) (#1=#:G500 NIL) (#2=#:G509 NIL) (|m| NIL)
          (#3=#:G508 NIL) (|k| (|Kernel| F)) (|n| (|Integer|))
          (|k0| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (#4=#:G507 NIL)
          (|rec| NIL))
         (SEQ
          (SEQ (LETT |rec| NIL)
               (LETT #4#
                     (|ALGMANIP;breakup|
                      (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $)
                      $))
               G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |rec| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |k0| (|SPADfirst| (LETT |l| (QCAR |rec|))))
                    (EXIT
                     (COND
                      ((NULL (NULL (CDR |l|)))
                       (SEQ (LETT |n| (SPADCALL (QCDR |rec|) (QREFELT $ 106)))
                            (LETT |k|
                                  (SPADCALL (SPADCALL |k0| (QREFELT $ 25))
                                            (LIST
                                             (|SPADfirst|
                                              (SPADCALL |k0| (QREFELT $ 48)))
                                             (SPADCALL |n| (QREFELT $ 76)))
                                            (SPADCALL |k0| (QREFELT $ 107))
                                            (QREFELT $ 108)))
                            (LETT |lv|
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |m| NIL) (LETT #2# (QCDR |rec|))
                                        G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |m| (CAR #2#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |k|
                                                            (QREFELT $ 109))
                                                  (PROG1
                                                      (LETT #1#
                                                            (QUOTIENT2 |n|
                                                                       |m|))
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT $ 110))
                                                 #3#))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#)))))
                            (EXIT
                             (LETT |x|
                                   (SPADCALL |x| |l| |lv|
                                             (QREFELT $ 46)))))))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (QREFELT $ 111)))))) 

(SDEFUN |ALGMANIP;rootPower1|
        ((|x| F) (|lk| |List| (|Kernel| F)) (|nlk| |List| F) ($ F))
        (SPROG ((#1=#:G514 NIL) (|k| NIL))
               (SEQ (LETT |x| (SPADCALL |x| |lk| |nlk| (QREFELT $ 46)))
                    (SEQ (LETT |k| NIL)
                         (LETT #1# (SPADCALL |x| (QREFELT $ 54))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |k| (QREFELT $ 25)) '|nthRoot|
                                       (QREFELT $ 30))
                             (LETT |x|
                                   (SPADCALL
                                    (|ALGMANIP;radeval|
                                     (SPADCALL |x| (QREFELT $ 50)) |k| $)
                                    (|ALGMANIP;radeval|
                                     (SPADCALL |x| (QREFELT $ 38)) |k| $)
                                    (QREFELT $ 52)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |ALGMANIP;rootPower;2F;20| ((|x| F) ($ F))
        (SPROG
         ((|nlk| (|List| F)) (|lk| (|List| (|Kernel| F))) (|nk| (F))
          (|nargs| (|List| F)) (#1=#:G521 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL) (LETT |nlk| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |x| (QREFELT $ 15))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |nargs|
                          (SPADCALL
                           (CONS #'|ALGMANIP;rootPower;2F;20!0|
                                 (VECTOR $ |nlk| |lk|))
                           (SPADCALL |k| (QREFELT $ 48)) (QREFELT $ 113)))
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 25)) |nargs|
                                    (QREFELT $ 114)))
                    (LETT |lk| (CONS |k| |lk|))
                    (EXIT (LETT |nlk| (CONS |nk| |nlk|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|ALGMANIP;rootPower1| |x| |lk| |nlk| $))))) 

(SDEFUN |ALGMANIP;rootPower;2F;20!0| ((|k1| NIL) ($$ NIL))
        (PROG (|lk| |nlk| $)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |nlk| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;rootPower1| |k1| |lk| |nlk| $))))) 

(SDEFUN |ALGMANIP;radeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         ($ F))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans| (F)) (|term| (F)) (|g| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
          (#1=#:G526 NIL) (|a| (F)) (|arg| (|List| F)) (|ka| (|Kernel| F))
          (|ka1| (|Union| (|Kernel| F) "failed")) (#2=#:G522 NIL))
         (SEQ
          (LETT |a| (|SPADfirst| (LETT |arg| (SPADCALL |k| (QREFELT $ 48)))))
          (LETT |n|
                (PROG1
                    (LETT #2#
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                    (QREFELT $ 99)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |ans| (|spadConstant| $ 115))
          (LETT |q| (SPADCALL |p| |k| (QREFELT $ 116)))
          (LETT |ka1| (SPADCALL |a| (QREFELT $ 118)))
          (COND
           ((QEQCAR |ka1| 0)
            (COND
             ((SPADCALL (QCDR |ka1|) '|nthRoot| (QREFELT $ 119))
              (SEQ (LETT |ka| (QCDR |ka1|))
                   (LETT |arg| (SPADCALL |ka| (QREFELT $ 48)))
                   (LETT |a| (|SPADfirst| |arg|))
                   (LETT |n|
                         (* |n|
                            (PROG1
                                (LETT #1#
                                      (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                                (QREFELT $ 99)))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))))
                   (EXIT
                    (LETT |k|
                          (SPADCALL (SPADCALL |ka| (QREFELT $ 25))
                                    (LIST |a| (SPADCALL |n| (QREFELT $ 76)))
                                    (SPADCALL |ka| (QREFELT $ 107))
                                    (QREFELT $ 108)))))))))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |d| (SPADCALL |q| (QREFELT $ 121))) 0
                            (QREFELT $ 122)))
                 (GO G191)))
               (SEQ
                (LETT |term|
                      (SEQ (LETT |g| (GCD |d| |n|))
                           (EXIT
                            (COND
                             ((EQL |g| |n|)
                              (SPADCALL |a| (QUOTIENT2 |d| |g|)
                                        (QREFELT $ 110)))
                             ((EQL |g| 1)
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 72) |k| |d|
                                         (QREFELT $ 123))
                               (QREFELT $ 74)))
                             ('T
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 72)
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 25))
                                          (LIST |a|
                                                (SPADCALL (QUOTIENT2 |n| |g|)
                                                          (QREFELT $ 76)))
                                          (SPADCALL |k| (QREFELT $ 107))
                                          (QREFELT $ 108))
                                         (QUOTIENT2 |d| |g|) (QREFELT $ 123))
                               (QREFELT $ 74)))))))
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 124))
                                           (QREFELT $ 74))
                                 |term| (QREFELT $ 87))
                                (QREFELT $ 125)))
                (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 126)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 124)) (QREFELT $ 74))
                     |ans| (QREFELT $ 125)))))) 

(SDEFUN |ALGMANIP;inroot|
        ((|op| |BasicOperator|) (|x| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((#1=#:G562 NIL)
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|q| (|Fraction| (|Integer|)))
          (|pr|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (#2=#:G566 NIL)
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| $ 68) (QREFELT $ 105)) |x|)
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (|spadConstant| $ 68)
                                          (QREFELT $ 127))
                                (QREFELT $ 128))
                      (SEQ (LETT |num| (SPADCALL |x| (QREFELT $ 50)))
                           (EXIT
                            (COND
                             ((OR
                               (SPADCALL |num| (|spadConstant| $ 72)
                                         (QREFELT $ 129))
                               (SPADCALL |num|
                                         (SPADCALL (|spadConstant| $ 72)
                                                   (QREFELT $ 131))
                                         (QREFELT $ 129)))
                              (PROGN
                               (LETT #2#
                                     (SPADCALL
                                      (|ALGMANIP;inroot| |op|
                                       (SPADCALL
                                        (SPADCALL |num|
                                                  (SPADCALL |x| (QREFELT $ 38))
                                                  (QREFELT $ 130))
                                        (QREFELT $ 74))
                                       |n| $)
                                      (QREFELT $ 37)))
                               (GO #4=#:G564))))))))
                    (LETT |u| (SPADCALL |x| |op| (QREFELT $ 134)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL |op| (LIST |x| (SPADCALL |n| (QREFELT $ 76)))
                                 (QREFELT $ 77)))
                      (#3#
                       (SEQ (LETT |pr| (QCDR |u|))
                            (LETT |q|
                                  (SPADCALL (QCDR |pr|)
                                            (SPADCALL |n|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL (QCAR |pr|)
                                                                  (QREFELT $
                                                                           48))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 99))
                                                      (QREFELT $ 135))
                                            (QREFELT $ 137)))
                            (LETT |qr|
                                  (DIVIDE2 (SPADCALL |q| (QREFELT $ 138))
                                           (SPADCALL |q| (QREFELT $ 139))))
                            (LETT |x|
                                  (|SPADfirst|
                                   (SPADCALL (QCAR |pr|) (QREFELT $ 48))))
                            (EXIT
                             (SPADCALL
                              (SPADCALL |x| (QCAR |qr|) (QREFELT $ 140))
                              (SPADCALL
                               (SPADCALL |op| |x|
                                         (PROG1
                                             (LETT #1#
                                                   (SPADCALL |q|
                                                             (QREFELT $ 139)))
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT $ 104))
                               (QCDR |qr|) (QREFELT $ 140))
                              (QREFELT $ 87)))))))))
                  #4# (EXIT #2#))))))) 

(SDEFUN |ALGMANIP;sroot|
        ((|k| |Kernel| F) (|lk| |List| (|Kernel| F)) (|nlk| |List| F) ($ F))
        (SPROG
         ((|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#1=#:G567 NIL) (|narg1| (F)) (|arg| (|List| F)))
         (SEQ
          (LETT |narg1|
                (SPADCALL
                 (|SPADfirst| (LETT |arg| (SPADCALL |k| (QREFELT $ 48)))) |lk|
                 |nlk| (QREFELT $ 46)))
          (LETT |pr|
                (SPADCALL |narg1|
                          (PROG1
                              (LETT #1#
                                    (SPADCALL (SPADCALL |arg| (QREFELT $ 49))
                                              (QREFELT $ 99)))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 143)))
          (EXIT
           (SPADCALL (QVELT |pr| 1)
                     (SPADCALL (SPADCALL |k| (QREFELT $ 25)) (QVELT |pr| 2)
                               (QVELT |pr| 0) (QREFELT $ 104))
                     (QREFELT $ 87)))))) 

(SDEFUN |ALGMANIP;rootSimp;2F;24| ((|x| F) ($ F))
        (SPROG
         ((|nlk| (|List| F)) (|lk| (|List| (|Kernel| F))) (|nk| (F))
          (#1=#:G575 NIL) (|k| NIL) (|tk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |tk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT $ 15)) $))
          (LETT |lk| NIL) (LETT |nlk| NIL)
          (SEQ (LETT |k| NIL) (LETT #1# |tk|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |nk| (|ALGMANIP;sroot| |k| |lk| |nlk| $))
                    (LETT |lk| (CONS |k| |lk|))
                    (EXIT (LETT |nlk| (CONS |nk| |nlk|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| |lk| |nlk| (QREFELT $ 46)))))) 

(DECLAIM (NOTINLINE |AlgebraicManipulations;|)) 

(DEFUN |AlgebraicManipulations| (&REST #1=#:G576)
  (SPROG NIL
         (PROG (#2=#:G577)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicManipulations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicManipulations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicManipulations|)))))))))) 

(DEFUN |AlgebraicManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AlgebraicManipulations| DV$1 DV$2))
          (LETT $ (GETREFV 145))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FunctionSpace|
                                                               (|devaluate|
                                                                |#1|))))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#1|
                                                              '(|UniqueFactorizationDomain|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FunctionSpace|
                                                               (|devaluate|
                                                                |#1|))))))))
          (|haddProp| |$ConstructorCache| '|AlgebraicManipulations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
          (COND
           ((|HasCategory| |#1| '(|Comparable|))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (COND
               ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
                (COND
                 ((|HasCategory| |#2|
                                 (LIST '|FunctionSpace| (|devaluate| |#1|)))
                  (PROGN
                   (COND
                    ((|HasCategory| |#1| '(|UniqueFactorizationDomain|))
                     (PROGN
                      (QSETREFV $ 67
                                (|GeneralizedMultivariateFactorize|
                                 (|Kernel| |#2|)
                                 (|IndexedExponents| (|Kernel| |#2|)) |#1| |#1|
                                 (|SparseMultivariatePolynomial| |#1|
                                                                 (|Kernel|
                                                                  |#2|))))
                      (QSETREFV $ 100
                                (CONS
                                 (|dispatchFunction|
                                  |ALGMANIP;rootFactor;2F;14|)
                                 $)))))
                   (COND
                    ((|HasCategory| |#1| '(|RadicalCategory|))
                     (QSETREFV $ 104
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;15|)
                                $)))
                    ('T
                     (QSETREFV $ 104
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;16|)
                                $))))
                   (QSETREFV $ 112
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootProduct;2F;18|)
                              $))
                   (QSETREFV $ 111
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootPower;2F;20|)
                              $))
                   (QSETREFV $ 144
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootSimp;2F;24|)
                              $)))))))))))
          $))) 

(MAKEPROP '|AlgebraicManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|) '|dummy|
              (|List| 22) (9 . |tower|) |ALGMANIP;ratDenom;2F;1| (|List| 11)
              |ALGMANIP;ratDenom;FLF;2| (|List| 7) |ALGMANIP;ratDenom;FLF;4|
              |ALGMANIP;ratDenom;3F;3| (|Kernel| $) (14 . |retract|)
              (|BasicOperator|) (19 . |operator|) (|Boolean|) (24 . |has?|)
              (|Mapping| 26 11) (30 . |select|) (36 . |is?|) (42 . |select!|)
              (|SparseMultivariatePolynomial| 6 11) (48 . |coerce|)
              (|SparseMultivariatePolynomial| 6 22) (53 . |coerce|) (58 . -)
              (64 . |inv|) (69 . |denom|) (|Fraction| 42)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6 32 7)
              (74 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (80 . |numer|) |ALGMANIP;ratPoly;FSup;7| (|List| $) (85 . |eval|)
              |ALGMANIP;rootSplit;2F;8| (92 . |argument|) (97 . |second|)
              (102 . |numer|) (107 . |elt|) (114 . /) (120 . >)
              (126 . |kernels|) (|Mapping| 26 11 11) (131 . |sort!|)
              (137 . |setIntersection|) (143 . |member?|) (|Mapping| $ $)
              (149 . |map|) (|SparseUnivariatePolynomial| $) (155 . |minPoly|)
              (160 . |univariate|) (|Mapping| 7 7) (167 . |map|) (173 . |elt|)
              '|MPfact| (179 . |One|) (|Factored| 32) (183 . |unit|)
              (188 . |One|) (192 . |One|) (196 . ~=) (202 . |coerce|)
              (|Integer|) (207 . |coerce|) (212 . |kernel|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 78) (|:| |factor| 32) (|:| |exponent| 83))
              (|List| 79) (218 . |factorList|) (|Union| $ '"failed")
              (|NonNegativeInteger|) (223 . |exquo|) (229 . >) (235 . ^)
              (241 . *) (247 . |content|) (252 . |coerce|) (257 . |coerce|)
              (262 . |exquo|) (268 . |factor|) (|Factored| $) (273 . |factor|)
              (|Mapping| 32 6) (|Factored| 6) (|FactoredFunctions2| 6 32)
              (278 . |map|) (284 . |retract|) (289 . |rootFactor|)
              (|Union| 6 '#1="failed") (294 . |retractIfCan|) (299 . |nthRoot|)
              (305 . |rootKerSimp|) (312 . =) (318 . |lcm|) (323 . |height|)
              (328 . |kernel|) (335 . |coerce|) (340 . ^) (346 . |rootPower|)
              (351 . |rootProduct|) (356 . |map|) (362 . |elt|) (368 . |Zero|)
              (372 . |univariate|) (|Union| 22 '#1#) (378 . |retractIfCan|)
              (383 . |is?|) (|SparseUnivariatePolynomial| 32) (389 . |degree|)
              (394 . >) (400 . |monomial|) (407 . |leadingCoefficient|)
              (412 . +) (418 . |reductum|) (423 . -) (428 . ~=) (434 . =)
              (440 . *) (446 . -) (|Record| (|:| |var| 22) (|:| |exponent| 75))
              (|Union| 132 '"failed") (451 . |isExpt|) (457 . *)
              (|Fraction| 75) (463 . /) (469 . |numer|) (474 . |denom|)
              (479 . ^)
              (|Record| (|:| |exponent| 83) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 11) 11 6 32 7)
              (485 . |froot|) (491 . |rootSimp|))
           '#(|rootSplit| 496 |rootSimp| 501 |rootProduct| 506 |rootPower| 511
              |rootKerSimp| 516 |rootFactor| 523 |ratPoly| 528 |ratDenom| 533)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|rootSplit| (|#2| |#2|)) T)
                                   '((|ratDenom| (|#2| |#2|)) T)
                                   '((|ratDenom| (|#2| |#2| |#2|)) T)
                                   '((|ratDenom| (|#2| |#2| (|List| |#2|))) T)
                                   '((|ratDenom|
                                      (|#2| |#2| (|List| (|Kernel| |#2|))))
                                     T)
                                   '((|ratPoly|
                                      ((|SparseUnivariatePolynomial| |#2|)
                                       |#2|))
                                     T)
                                   '((|rootFactor| (|#2| |#2|))
                                     (AND
                                      (|has| 6 (|UniqueFactorizationDomain|))
                                      (|has| 7 (|FunctionSpace| 6))
                                      (|has| 6 (|RetractableTo| 75))
                                      (|has| 6 (|GcdDomain|))
                                      (|has| 6 (|Comparable|))))
                                   '((|rootPower| (|#2| |#2|))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|))))
                                   '((|rootProduct| (|#2| |#2|))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|))))
                                   '((|rootSimp| (|#2| |#2|))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|))))
                                   '((|rootKerSimp|
                                      (|#2| (|BasicOperator|) |#2|
                                       (|NonNegativeInteger|)))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 144
                                            '(0 9 0 10 1 11 0 9 12 1 7 14 0 15
                                              1 7 22 0 23 1 11 24 0 25 2 24 26
                                              0 9 27 2 17 0 28 0 29 2 24 26 0 9
                                              30 2 17 0 28 0 31 1 32 0 11 33 1
                                              7 0 34 35 2 7 0 0 0 36 1 7 0 0 37
                                              1 7 34 0 38 2 40 39 7 11 41 1 39
                                              42 0 43 3 7 0 0 14 45 46 1 11 19
                                              0 48 1 19 7 0 49 1 7 34 0 50 3 7
                                              0 24 0 0 51 2 7 0 0 0 52 2 11 26
                                              0 0 53 1 7 14 0 54 2 17 0 55 0 56
                                              2 17 0 0 0 57 2 17 26 11 0 58 2 7
                                              0 59 22 60 1 7 61 22 62 3 40 42 7
                                              11 42 63 2 42 0 64 0 65 2 42 7 0
                                              7 66 0 7 0 68 1 69 32 0 70 0 6 0
                                              71 0 32 0 72 2 32 26 0 0 73 1 7 0
                                              34 74 1 7 0 75 76 2 7 0 24 45 77
                                              1 69 80 0 81 2 83 82 0 0 84 2 75
                                              26 0 0 85 2 32 0 0 83 86 2 7 0 0
                                              0 87 1 32 6 0 88 1 7 0 6 89 1 32
                                              0 6 90 2 32 82 0 0 91 1 67 69 32
                                              92 1 6 93 0 94 2 97 69 95 96 98 1
                                              7 75 0 99 1 0 7 7 100 1 7 101 0
                                              102 2 6 0 0 75 103 3 0 7 24 7 83
                                              104 2 7 26 0 0 105 1 75 0 45 106
                                              1 11 83 0 107 3 11 0 24 19 83 108
                                              1 7 0 22 109 2 7 0 0 83 110 1 0 7
                                              7 111 1 0 7 7 112 2 19 0 64 0 113
                                              2 7 0 24 45 114 0 7 0 115 2 32 61
                                              0 11 116 1 7 117 0 118 2 11 26 0
                                              9 119 1 120 83 0 121 2 83 26 0 0
                                              122 3 32 0 0 11 83 123 1 120 32 0
                                              124 2 7 0 0 0 125 1 120 0 0 126 1
                                              7 0 0 127 2 7 26 0 0 128 2 32 26
                                              0 0 129 2 32 0 0 0 130 1 32 0 0
                                              131 2 7 133 0 24 134 2 75 0 83 0
                                              135 2 136 0 75 75 137 1 136 75 0
                                              138 1 136 75 0 139 2 7 0 0 75 140
                                              2 142 141 7 83 143 1 0 7 7 144 1
                                              0 7 7 47 1 1 7 7 144 1 1 7 7 112
                                              1 1 7 7 111 3 1 7 24 7 83 104 1 2
                                              7 7 100 1 0 42 7 44 1 0 7 7 16 2
                                              0 7 7 7 21 2 0 7 7 17 18 2 0 7 7
                                              19 20)))))
           '|lookupComplete|)) 