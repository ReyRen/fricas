
(SDEFUN |CYCLES;trm|
        ((|pt| |Partition|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |pt| (QREFELT $ 8)) (QREFELT $ 10))
                   (QREFELT $ 11))
         |pt| (QREFELT $ 13))) 

(SDEFUN |CYCLES;list|
        ((|st| |Stream| (|List| (|Integer|))) ($ |List| (|List| (|Integer|))))
        (SPADCALL (SPADCALL |st| (QREFELT $ 15)) (QREFELT $ 17))) 

(SDEFUN |CYCLES;complete;ISp;3|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G396 NIL)
          (#2=#:G395 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G397 #3#) (#5=#:G399 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |pt| NIL)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|CYCLES;trm| (SPADCALL |pt| (QREFELT $ 23))
                                 $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;even?| ((|li| |List| (|Integer|)) ($ |Boolean|))
        (SPROG ((#1=#:G404 NIL) (|i| NIL) (#2=#:G403 NIL))
               (SEQ
                (SPADCALL
                 (LENGTH
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |i| NIL) (LETT #1# |li|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |i| (QREFELT $ 27))
                            (LETT #2# (CONS |i| #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 27))))) 

(SDEFUN |CYCLES;alternating;ISp;5|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G406 NIL)
          (#2=#:G405 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G407 #3#) (#5=#:G409 NIL) (|li| NIL))
         (SEQ
          (SPADCALL 2
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |li| NIL)
                          (LETT #5#
                                (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21))
                                 $))
                          G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|CYCLES;even?| |li| $)
                              (PROGN
                               (LETT #4#
                                     (|CYCLES;trm|
                                      (SPADCALL |li| (QREFELT $ 23)) $))
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 18))))
                    (QREFELT $ 29))))) 

(SDEFUN |CYCLES;elementary;ISp;6|
        ((|i| |Integer|)
         ($ . #1=(|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#2=#:G411 NIL) (#3=#:G410 #1#) (#4=#:G412 #1#)
          (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#5=#:G415 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |pt| NIL)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pt| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SEQ
                                 (LETT |spol|
                                       (|CYCLES;trm|
                                        (SPADCALL |pt| (QREFELT $ 23)) $))
                                 (EXIT
                                  (COND ((|CYCLES;even?| |pt| $) |spol|)
                                        ('T
                                         (SPADCALL |spol| (QREFELT $ 31)))))))
                          (COND
                           (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 24))))
                           ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;divisors| ((|n| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|c| (|List| (|Integer|))) (#1=#:G418 NIL)
          (#2=#:G417 #3=(|List| (|Integer|))) (#4=#:G419 #3#) (#5=#:G426 NIL)
          (|j| NIL) (#6=#:G425 NIL) (#7=#:G424 NIL) (|a| NIL)
          (|b|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |b| (SPADCALL (SPADCALL |n| (QREFELT $ 34)) (QREFELT $ 38)))
          (LETT |c|
                (CONS 1
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |a| NIL) (LETT #7# |b|) G190
                            (COND
                             ((OR (ATOM #7#) (PROGN (LETT |a| (CAR #7#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (PROGN
                                      (LETT #6# NIL)
                                      (SEQ (LETT |j| 1)
                                           (LETT #5# (QVELT |a| 2)) G190
                                           (COND
                                            ((|greater_SI| |j| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS
                                                    (EXPT (QVELT |a| 1) |j|)
                                                    #6#))))
                                           (LETT |j| (|inc_SI| |j|)) (GO G190)
                                           G191 (EXIT (NREVERSE #6#)))))
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 40))))
                                ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                            (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                       (COND (#1# #2#) (#8='T NIL)))))
          (EXIT (COND ((EQL (LENGTH |b|) 1) |c|) (#8# (CONS |n| |c|))))))) 

(SDEFUN |CYCLES;ss|
        ((|n| |Integer|) (|m| |Integer|)
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|li| (|List| (|Integer|))) (#1=#:G431 NIL) (|j| NIL)
          (#2=#:G430 NIL))
         (SEQ
          (LETT |li|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |j| 1) (LETT #1# |m|) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |n| #2#))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (SPADCALL (|spadConstant| $ 41) (SPADCALL |li| (QREFELT $ 23))
                     (QREFELT $ 13)))))) 

(SDEFUN |CYCLES;powerSum;ISp;9|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (|CYCLES;ss| |n| 1 $)) 

(SDEFUN |CYCLES;cyclic;ISp;10|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G434 NIL)
          (#2=#:G433 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G435 #3#) (#5=#:G437 NIL) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 1) (SPADCALL 1 (QREFELT $ 42)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |i| NIL) (LETT #5# (|CYCLES;divisors| |n| $)) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |i| (QREFELT $ 44)) |n|
                                           (QREFELT $ 45))
                                 (|CYCLES;ss| |i|
                                  (SPADCALL (SPADCALL |n| |i| (QREFELT $ 45))
                                            (QREFELT $ 46))
                                  $)
                                 (QREFELT $ 47)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;dihedral;ISp;11|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (QUOTIENT2 |n| 2))
                    (EXIT
                     (COND
                      ((ODDP |n|)
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 45))
                                  (SPADCALL |n| (QREFELT $ 48)) (QREFELT $ 47))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 45))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 47))
                         (SPADCALL 1 (QREFELT $ 42)) (QREFELT $ 49))
                        (QREFELT $ 24)))
                      ('T
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 45))
                                   (SPADCALL |n| (QREFELT $ 48))
                                   (QREFELT $ 47))
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 45))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 47))
                         (QREFELT $ 24))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 45))
                                   (|CYCLES;ss| 2 (- |k| 1) $) (QREFELT $ 47))
                         (|CYCLES;ss| 1 2 $) (QREFELT $ 49))
                        (QREFELT $ 24)))))))) 

(SDEFUN |CYCLES;trm2|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|prod2| #1#) (|r1| #2=(|Integer|)) (|r0| #3=(|Integer|))
          (#4=#:G448 NIL) (|r| NIL)
          (|c| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|k| (|Integer|)) (|ll1| #2#) (|ll0| #3#) (#5=#:G447 NIL) (|ll| NIL)
          (|xx| (|Fraction| (|Integer|)))
          (|lli| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |lli| (SPADCALL |li| (QREFELT $ 51)))
              (LETT |xx|
                    (SPADCALL 1
                              (SPADCALL (SPADCALL |li| (QREFELT $ 23))
                                        (QREFELT $ 8))
                              (QREFELT $ 45)))
              (LETT |prod| (|spadConstant| $ 19))
              (SEQ (LETT |ll| NIL) (LETT #5# |lli|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ll0| (|SPADfirst| |ll|))
                        (LETT |ll1| (SPADCALL |ll| (QREFELT $ 52)))
                        (LETT |k| (QUOTIENT2 |ll0| 2))
                        (LETT |c|
                              (COND
                               ((ODDP |ll0|)
                                (|CYCLES;ss| |ll0| (* |ll1| |k|) $))
                               ('T
                                (SPADCALL (|CYCLES;ss| |k| |ll1| $)
                                          (|CYCLES;ss| |ll0|
                                           (* |ll1| (- |k| 1)) $)
                                          (QREFELT $ 49)))))
                        (LETT |c|
                              (SPADCALL |c|
                                        (|CYCLES;ss| |ll0|
                                         (* |ll0|
                                            (QUOTIENT2 (* |ll1| (- |ll1| 1))
                                                       2))
                                         $)
                                        (QREFELT $ 49)))
                        (LETT |prod2| (|spadConstant| $ 19))
                        (SEQ (LETT |r| NIL) (LETT #4# |lli|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< (|SPADfirst| |r|) |ll0|)
                                 (SEQ (LETT |r0| (|SPADfirst| |r|))
                                      (LETT |r1| (SPADCALL |r| (QREFELT $ 52)))
                                      (EXIT
                                       (LETT |prod2|
                                             (SPADCALL
                                              (|CYCLES;ss|
                                               (SPADCALL |r0| |ll0|
                                                         (QREFELT $ 53))
                                               (* (* (GCD |r0| |ll0|) |r1|)
                                                  |ll1|)
                                               $)
                                              |prod2| (QREFELT $ 49)))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |prod|
                               (SPADCALL (SPADCALL |c| |prod2| (QREFELT $ 49))
                                         |prod| (QREFELT $ 49)))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |xx| |prod| (QREFELT $ 47)))))) 

(SDEFUN |CYCLES;graphs;ISp;13|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G450 NIL)
          (#2=#:G449 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G451 #3#) (#5=#:G453 NIL) (|li| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |li| NIL)
                (LETT #5# (|CYCLES;list| (SPADCALL |n| (QREFELT $ 21)) $)) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|CYCLES;trm2| |li| $))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 18))))))) 

(SDEFUN |CYCLES;cupp|
        ((|pt| |Partition|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|dg| (|Partition|)))
               (SEQ
                (COND ((SPADCALL |spol| (QREFELT $ 55)) (|spadConstant| $ 18))
                      (#1='T
                       (SEQ (LETT |dg| (SPADCALL |spol| (QREFELT $ 56)))
                            (EXIT
                             (COND
                              ((SPADCALL |dg| |pt| (QREFELT $ 57))
                               (|spadConstant| $ 18))
                              ((SPADCALL |dg| |pt| (QREFELT $ 58))
                               (SPADCALL (SPADCALL |pt| (QREFELT $ 8))
                                         (SPADCALL
                                          (SPADCALL |spol| (QREFELT $ 59)) |dg|
                                          (QREFELT $ 13))
                                         (QREFELT $ 60)))
                              (#1#
                               (|CYCLES;cupp| |pt|
                                (SPADCALL |spol| (QREFELT $ 61)) $)))))))))) 

(SDEFUN |CYCLES;cup;3Sp;15|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|p| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
               (SEQ
                (COND ((SPADCALL |spol1| (QREFELT $ 55)) (|spadConstant| $ 18))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |spol1| (QREFELT $ 59))
                                        (|CYCLES;cupp|
                                         (SPADCALL |spol1| (QREFELT $ 56))
                                         |spol2| $)
                                        (QREFELT $ 47)))
                        (EXIT
                         (SPADCALL |p|
                                   (SPADCALL (SPADCALL |spol1| (QREFELT $ 61))
                                             |spol2| (QREFELT $ 62))
                                   (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;eval;SpF;16|
        ((|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (COND ((SPADCALL |spol| (QREFELT $ 55)) (|spadConstant| $ 63))
              ('T
               (SPADCALL (SPADCALL |spol| (QREFELT $ 59))
                         (SPADCALL (SPADCALL |spol| (QREFELT $ 61))
                                   (QREFELT $ 64))
                         (QREFELT $ 65))))) 

(SDEFUN |CYCLES;cap;2SpF;17|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |spol1| |spol2| (QREFELT $ 62)) (QREFELT $ 64))) 

(SDEFUN |CYCLES;mtpol|
        ((|n| |Integer|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|deg| (|Partition|)) (#1=#:G469 NIL) (|k| NIL) (#2=#:G468 NIL))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 55)) (|spadConstant| $ 18))
                ('T
                 (SEQ
                  (LETT |deg|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |k| NIL)
                               (LETT #1#
                                     (SPADCALL (SPADCALL |spol| (QREFELT $ 56))
                                               (QREFELT $ 67)))
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |k| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ (EXIT (LETT #2# (CONS (* |n| |k|) #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 23)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |spol| (QREFELT $ 59)) |deg|
                              (QREFELT $ 13))
                    (|CYCLES;mtpol| |n| (SPADCALL |spol| (QREFELT $ 61)) $)
                    (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;evspol|
        ((|fn2| |Mapping| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
          (|Integer|))
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#2=#:G471 NIL) (#3=#:G470 #1#) (#4=#:G472 #1#) (#5=#:G477 NIL)
          (|i| NIL) (|lc| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 55)) (|spadConstant| $ 18))
                (#6='T
                 (SEQ (LETT |lc| (SPADCALL |spol| (QREFELT $ 59)))
                      (LETT |prod|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |i| NIL)
                                  (LETT #5#
                                        (SPADCALL
                                         (SPADCALL |spol| (QREFELT $ 56))
                                         (QREFELT $ 67)))
                                  G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |i| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #4# (SPADCALL |i| |fn2|))
                                     (COND
                                      (#2#
                                       (LETT #3#
                                             (SPADCALL #3# #4#
                                                       (QREFELT $ 49))))
                                      ('T
                                       (PROGN
                                        (LETT #3# #4#)
                                        (LETT #2# 'T)))))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#2# #3#) (#6# (|spadConstant| $ 19)))))
                      (EXIT
                       (SPADCALL (SPADCALL |lc| |prod| (QREFELT $ 47))
                                 (|CYCLES;evspol| |fn2|
                                  (SPADCALL |spol| (QREFELT $ 61)) $)
                                 (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;wreath;3Sp;20|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG NIL
               (|CYCLES;evspol|
                (CONS #'|CYCLES;wreath;3Sp;20!0| (VECTOR $ |spol2|)) |spol1|
                $))) 

(SDEFUN |CYCLES;wreath;3Sp;20!0| ((|x| NIL) ($$ NIL))
        (PROG (|spol2| $)
          (LETT |spol2| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|CYCLES;mtpol| |x| |spol2| $))))) 

(SDEFUN |CYCLES;hh|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (COND ((EQL |n| 0) (|spadConstant| $ 19))
              ((< |n| 0) (|spadConstant| $ 18))
              ('T (SPADCALL |n| (QREFELT $ 25))))) 

(SDEFUN |CYCLES;SFunction;LSp;22|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G488 NIL) (|k| NIL) (#2=#:G489 NIL) (|j| NIL) (#3=#:G487 NIL)
          (#4=#:G486 NIL) (|i| NIL) (#5=#:G485 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |i| 1) (LETT #4# (LENGTH |li|)) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5#
                               (CONS
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |j| 1) (LETT #2# (LENGTH |li|))
                                      (LETT |k| NIL) (LETT #1# |li|) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |k| (CAR #1#)) NIL)
                                            (|greater_SI| |j| #2#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (|CYCLES;hh| (+ (- |k| |j|) |i|)
                                                $)
                                               #3#))))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT |j| (|inc_SI| |j|))))
                                      (GO G190) G191 (EXIT (NREVERSE #3#))))
                                #5#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 71)))
          (EXIT (SPADCALL |a| (QREFELT $ 72)))))) 

(SDEFUN |CYCLES;roundup|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |List| (|Integer|)))
        (COND
         ((SPADCALL (LENGTH |li1|) (LENGTH |li2|) (QREFELT $ 74))
          (|CYCLES;roundup| |li1| (SPADCALL |li2| 0 (QREFELT $ 75)) $))
         ('T |li2|))) 

(SDEFUN |CYCLES;skewSFunction;2LSp;24|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G500 NIL) (|k| NIL) (#2=#:G501 NIL) (|j| NIL) (#3=#:G499 NIL)
          (#4=#:G498 NIL) (|i| NIL) (#5=#:G497 NIL))
         (SEQ
          (COND
           ((< (LENGTH |li1|) (LENGTH |li2|))
            (|error| "skewSFunction: partition1 does not include partition2"))
           ('T
            (SEQ (LETT |li2| (|CYCLES;roundup| |li1| |li2| $))
                 (LETT |a|
                       (SPADCALL
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |i| 1) (LETT #4# (LENGTH |li1|)) G190
                              (COND ((|greater_SI| |i| #4#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS
                                       (PROGN
                                        (LETT #3# NIL)
                                        (SEQ (LETT |j| 1)
                                             (LETT #2# (LENGTH |li1|))
                                             (LETT |k| NIL) (LETT #1# |li1|)
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |k| (CAR #1#))
                                                    NIL)
                                                   (|greater_SI| |j| #2#))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3#
                                                     (CONS
                                                      (|CYCLES;hh|
                                                       (+
                                                        (-
                                                         (- |k|
                                                            (SPADCALL |li2| |i|
                                                                      (QREFELT
                                                                       $ 76)))
                                                         |j|)
                                                        |i|)
                                                       $)
                                                      #3#))))
                                             (LETT #1#
                                                   (PROG1 (CDR #1#)
                                                     (LETT |j|
                                                           (|inc_SI| |j|))))
                                             (GO G190) G191
                                             (EXIT (NREVERSE #3#))))
                                       #5#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        (QREFELT $ 71)))
                 (EXIT (SPADCALL |a| (QREFELT $ 72))))))))) 

(DECLAIM (NOTINLINE |CycleIndicators;|)) 

(DEFUN |CycleIndicators| ()
  (SPROG NIL
         (PROG (#1=#:G503)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CycleIndicators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CycleIndicators|
                             (LIST (CONS NIL (CONS 1 (|CycleIndicators;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CycleIndicators|)))))))))) 

(DEFUN |CycleIndicators;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CycleIndicators|))
          (LETT $ (GETREFV 78))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CycleIndicators| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV $ 73
                       (CONS (|dispatchFunction| |CYCLES;SFunction;LSp;22|) $))
             NIL
             (QSETREFV $ 77
                       (CONS
                        (|dispatchFunction| |CYCLES;skewSFunction;2LSp;24|)
                        $)))))
          $))) 

(MAKEPROP '|CycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Partition|) (0 . |pdct|)
              (|Fraction| 6) (5 . |coerce|) (10 . |inv|)
              (|SymmetricPolynomial| 9) (15 . |monomial|) (|Stream| 22)
              (21 . |complete|) (|List| 22) (26 . |entries|) (31 . |Zero|)
              (35 . |One|) (|PartitionsAndPermutations|) (39 . |partitions|)
              (|List| 6) (44 . |partition|) (49 . +) |CYCLES;complete;ISp;3|
              (|Boolean|) (55 . |even?|) (|PositiveInteger|) (60 . *)
              |CYCLES;alternating;ISp;5| (66 . -) |CYCLES;elementary;ISp;6|
              (|Factored| 6) (71 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 6)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 36) (76 . |factorList|) (81 . |One|) (85 . |append|)
              (91 . |One|) |CYCLES;powerSum;ISp;9|
              (|IntegerNumberTheoryFunctions|) (95 . |eulerPhi|) (100 . /)
              (106 . |numer|) (111 . *) |CYCLES;cyclic;ISp;10| (117 . *)
              |CYCLES;dihedral;ISp;11| (123 . |powers|) (128 . |second|)
              (133 . |lcm|) |CYCLES;graphs;ISp;13| (139 . |zero?|)
              (144 . |degree|) (149 . <) (155 . =) (161 . |leadingCoefficient|)
              (166 . *) (172 . |reductum|) |CYCLES;cup;3Sp;15| (177 . |Zero|)
              |CYCLES;eval;SpF;16| (181 . +) |CYCLES;cap;2SpF;17|
              (187 . |coerce|) |CYCLES;wreath;3Sp;20| (|List| (|List| 12))
              (|Matrix| 12) (192 . |matrix|) (197 . |determinant|)
              (202 . |SFunction|) (207 . >) (213 . |concat|) (219 . |elt|)
              (225 . |skewSFunction|))
           '#(|wreath| 231 |skewSFunction| 237 |powerSum| 243 |graphs| 248
              |eval| 253 |elementary| 258 |dihedral| 263 |cyclic| 268 |cup| 273
              |complete| 279 |cap| 284 |alternating| 290 |SFunction| 295)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|complete|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|powerSum|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|elementary|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|alternating|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|cyclic|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|dihedral|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|graphs|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|cap|
                                 ((|Fraction| (|Integer|))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|cup|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|eval|
                                 ((|Fraction| (|Integer|))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|wreath|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T)
                              '((|SFunction|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|List| (|Integer|))))
                                T)
                              '((|skewSFunction|
                                 ((|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))
                                  (|List| (|Integer|)) (|List| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 77
                                            '(1 7 6 0 8 1 9 0 6 10 1 9 0 0 11 2
                                              12 0 9 7 13 1 14 0 0 15 1 14 16 0
                                              17 0 12 0 18 0 12 0 19 1 20 14 6
                                              21 1 7 0 22 23 2 12 0 0 0 24 1 6
                                              26 0 27 2 12 0 28 0 29 1 12 0 0
                                              31 1 33 0 6 34 1 33 37 0 38 0 33
                                              0 39 2 22 0 0 0 40 0 9 0 41 1 43
                                              6 6 44 2 9 0 6 6 45 1 9 6 0 46 2
                                              12 0 9 0 47 2 12 0 0 0 49 1 7 16
                                              22 51 1 22 6 0 52 2 6 0 0 0 53 1
                                              12 26 0 55 1 12 7 0 56 2 7 26 0 0
                                              57 2 7 26 0 0 58 1 12 9 0 59 2 12
                                              0 6 0 60 1 12 0 0 61 0 9 0 63 2 9
                                              0 0 0 65 1 7 22 0 67 1 70 0 69 71
                                              1 70 12 0 72 1 0 12 22 73 2 6 26
                                              0 0 74 2 22 0 0 6 75 2 22 6 0 6
                                              76 2 0 12 22 22 77 2 0 12 12 12
                                              68 2 0 12 22 22 77 1 0 12 6 42 1
                                              0 12 6 54 1 0 9 12 64 1 0 12 6 32
                                              1 0 12 6 50 1 0 12 6 48 2 0 12 12
                                              12 62 1 0 12 6 25 2 0 9 12 12 66
                                              1 0 12 6 30 1 0 12 22 73)))))
           '|lookupComplete|)) 

(MAKEPROP '|CycleIndicators| 'NILADIC T) 