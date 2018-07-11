
(SDEFUN |LODOF2;convertUPtoUTS|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         ($ |UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|))
        (SPADCALL |np| (QREFELT $ 10))) 

(SDEFUN |LODOF2;convertUTStoUP|
        ((|ns| |UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
         (|n| |Integer|)
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPADCALL |ns| (- |n| 1) (QREFELT $ 16))) 

(SDEFUN |LODOF2;convertL3toLL|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|ftmp| #1#)
          (|apf|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#2=#:G459 NIL)
          (|den|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |apf| (|spadConstant| $ 18)) (LETT |ftmp| |f|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 22) (QREFELT $ 24)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 26)))
                        (LETT |den|
                              (SPADCALL
                               (|LODOF2;convertUPtoUTS|
                                (SPADCALL |lc| (QREFELT $ 27)) $)
                               (QREFELT $ 28)))
                        (LETT |apf|
                              (SPADCALL |apf|
                                        (SPADCALL
                                         (SPADCALL
                                          (|LODOF2;convertUPtoUTS|
                                           (SPADCALL |lc| (QREFELT $ 29)) $)
                                          (PROG2
                                              (LETT #2#
                                                    (SPADCALL |den|
                                                              (QREFELT $ 31)))
                                              (QCDR #2#)
                                            (|check_union2| (QEQCAR #2# 0)
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|Union|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             "failed")
                                                            #2#))
                                          (QREFELT $ 32))
                                         (SPADCALL |ftmp| (QREFELT $ 33))
                                         (QREFELT $ 34))
                                        (QREFELT $ 35)))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 36)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |apf|)))) 

(SDEFUN |LODOF2;newtonpolygonPoints|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         ($ |List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
        (SPROG
         ((|npg|
           (|List| #2=(|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|ccw| (|Boolean|)) (|sb2| #3=(|Integer|)) (|sb1| #3#) (|p2| #2#)
          (|p1| #2#) (#4=#:G480 NIL) (|i| NIL)
          (|points3|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|points|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|ftmp| #1#) (|yzero| (|Integer|)) (|yv| (|Integer|))
          (|xv| (|NonNegativeInteger|)))
         (SEQ (LETT |ftmp| |f|) (LETT |points| NIL)
              (LETT |yzero|
                    (SPADCALL (SPADCALL |ftmp| (QREFELT $ 37)) (QREFELT $ 39)))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |xv| (SPADCALL |ftmp| (QREFELT $ 41)))
                        (LETT |yv|
                              (SPADCALL (SPADCALL |ftmp| (QREFELT $ 37))
                                        (SPADCALL (SPADCALL |f| (QREFELT $ 37))
                                                  (QREFELT $ 39))
                                        (QREFELT $ 42)))
                        (COND
                         ((SPADCALL |xv| 0 (QREFELT $ 43))
                          (LETT |points| (CONS (CONS |xv| |yv|) |points|))))
                        (LETT |yzero| (MIN |yzero| |yv|))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |points| (CONS (CONS 0 |yzero|) |points|))
              (LETT |npg|
                    (LIST (SPADCALL |points| 2 (QREFELT $ 47))
                          (SPADCALL |points| 1 (QREFELT $ 47))))
              (LETT |points3| (CDR (CDR |points|)))
              (SEQ (LETT |i| NIL) (LETT #4# |points3|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ccw| 'T)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL (LENGTH |npg|) 1 (QREFELT $ 48))
                                  |ccw|)
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ (LETT |p1| (SPADCALL |npg| 2 (QREFELT $ 47)))
                                  (LETT |p2| (SPADCALL |npg| 1 (QREFELT $ 47)))
                                  (LETT |sb1|
                                        (* (- (QCAR |p2|) (QCAR |p1|))
                                           (- (QCDR |i|) (QCDR |p1|))))
                                  (LETT |sb2|
                                        (* (- (QCDR |p2|) (QCDR |p1|))
                                           (- (QCAR |i|) (QCAR |p1|))))
                                  (LETT |ccw|
                                        (SPADCALL (- |sb1| |sb2|) 0
                                                  (QREFELT $ 49)))
                                  (EXIT
                                   (COND (|ccw| (LETT |npg| (CDR |npg|))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |npg| (CONS |i| |npg|))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |npg|))))) 

(SDEFUN |LODOF2;newtonpolygon|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         ($ |List|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| (|Fraction| (|Integer|)))
           (|:| |npoly|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|npol| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|lsc| (|Expression| (|Integer|)))
          (|opc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ind| (|NonNegativeInteger|)) (#1=#:G491 NIL) (|j| NIL)
          (|slop| (|Fraction| (|Integer|))) (#2=#:G489 NIL) (|i| NIL)
          (#3=#:G490 NIL) (|nxt| NIL)
          (|restl|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|npg|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))))
         (SEQ (LETT |npg| (|LODOF2;newtonpolygonPoints| |f| $))
              (LETT |res| NIL) (LETT |restl| (CDR |npg|))
              (SEQ (LETT |nxt| NIL) (LETT #3# |restl|) (LETT |i| NIL)
                   (LETT #2# |npg|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL) (ATOM #3#)
                         (PROGN (LETT |nxt| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |slop|
                          (SPADCALL (- (QCDR |nxt|) (QCDR |i|))
                                    (- (QCAR |nxt|) (QCAR |i|))
                                    (QREFELT $ 51)))
                    (LETT |npol| (|spadConstant| $ 52))
                    (SEQ (LETT |j| 0)
                         (LETT #1#
                               (QUOTIENT2 (- (QCAR |nxt|) (QCAR |i|))
                                          (SPADCALL |slop| (QREFELT $ 53))))
                         G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                         (SEQ
                          (LETT |ind|
                                (+ (* (SPADCALL |slop| (QREFELT $ 53)) |j|)
                                   (QCAR |i|)))
                          (LETT |opc| (SPADCALL |f| |ind| (QREFELT $ 54)))
                          (LETT |lsc|
                                (SPADCALL |opc|
                                          (+
                                           (SPADCALL |j|
                                                     (SPADCALL |slop|
                                                               (QREFELT $ 55))
                                                     (QREFELT $ 56))
                                           (QCDR |i|))
                                          (QREFELT $ 57)))
                          (EXIT
                           (LETT |npol|
                                 (SPADCALL |npol|
                                           (SPADCALL |lsc| |j| (QREFELT $ 58))
                                           (QREFELT $ 59)))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (LIST (VECTOR |i| |slop| |npol|))
                                     (QREFELT $ 62)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;testnp;LodoL;6|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |List|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| (|Fraction| (|Integer|)))
           (|:| |npoly|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| $) $)) 

(SDEFUN |LODOF2;factor_newton|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))))
          (#1=#:G528 NIL)
          (|jl|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#2=#:G541 NIL) (|i| NIL) (|slo| #3=(|Fraction| (|Integer|)))
          (|v|
           #4=(|List|
               (|Record|
                (|:| |factor|
                     (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
                (|:| |exponent| (|NonNegativeInteger|)))))
          (#5=#:G540 NIL) (#6=#:G539 NIL) (|v_old| #4#)
          (|unsafe|
           (|List|
            (|Record|
             (|:| |factor|
                  #7=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|sbt| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|newx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|ie| (|Integer|)) (|e| (|Expression| (|Integer|)))
          (|d| (|NonNegativeInteger|)) (|vjf| #7#) (#8=#:G537 NIL) (|j| NIL)
          (#9=#:G538 NIL) (|jj| NIL) (|dvif| (|NonNegativeInteger|))
          (|vif| #7#) (#10=#:G534 NIL) (#11=#:G535 NIL) (|ii| NIL)
          (#12=#:G536 NIL) (|restl| NIL) (#13=#:G532 NIL) (#14=#:G533 NIL)
          (|semi|
           (|OneDimensionalArray|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#15=#:G531 NIL) (|il| NIL) (#16=#:G530 NIL)
          (|npol|
           #17=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#18=#:G529 NIL) (|k| NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| #3#) (|:| |npoly| #17#)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 49))
              (PROGN (LETT #1# (LIST |f|)) (GO #19=#:G527))))
            (LETT |np| (|LODOF2;newtonpolygon| |f| $)) (LETT |res| NIL)
            (SEQ (LETT |k| NIL) (LETT #18# |np|) G190
                 (COND
                  ((OR (ATOM #18#) (PROGN (LETT |k| (CAR #18#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |npol| (QVELT |k| 2))
                      (LETT |v|
                            (SPADCALL (|LODOF2;factorUP| |npol| |factorizer| $)
                                      (QREFELT $ 67)))
                      (COND
                       ((SPADCALL (QVELT |k| 1) (|spadConstant| $ 68)
                                  (QREFELT $ 69))
                        (LETT |v|
                              (PROGN
                               (LETT #16# NIL)
                               (SEQ (LETT |il| NIL) (LETT #15# |v|) G190
                                    (COND
                                     ((OR (ATOM #15#)
                                          (PROGN (LETT |il| (CAR #15#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #16#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |il|) (QCDR |il|)
                                                        (QREFELT $ 70))
                                              0)
                                             #16#))))
                                    (LETT #15# (CDR #15#)) (GO G190) G191
                                    (EXIT (NREVERSE #16#))))))
                       ('T
                        (SEQ (LETT |unsafe| NIL)
                             (LETT |semi|
                                   (MAKEARR1 (LENGTH |v|)
                                             (|spadConstant| $ 52)))
                             (SEQ (LETT |ii| 1) (LETT #14# (LENGTH |v|))
                                  (LETT |i| NIL) (LETT #13# |v|) G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN (LETT |i| (CAR #13#)) NIL)
                                        (|greater_SI| |ii| #14#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |semi| |ii|
                                              (SPADCALL (QCAR |i|) (QCDR |i|)
                                                        (QREFELT $ 70))
                                              (QREFELT $ 72))))
                                  (LETT #13#
                                        (PROG1 (CDR #13#)
                                          (LETT |ii| (|inc_SI| |ii|))))
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |restl| NIL)
                                  (LETT #12#
                                        (SPADCALL (CDR |v|) (QREFELT $ 74)))
                                  (LETT |ii| 1) (LETT #11# (LENGTH |v|))
                                  (LETT |i| NIL) (LETT #10# |v|) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN (LETT |i| (CAR #10#)) NIL)
                                        (|greater_SI| |ii| #11#) (ATOM #12#)
                                        (PROGN (LETT |restl| (CAR #12#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |vif| (QCAR |i|))
                                       (LETT |dvif|
                                             (SPADCALL |vif| (QREFELT $ 75)))
                                       (EXIT
                                        (SEQ (LETT |jj| (+ |ii| 1))
                                             (LETT #9# (LENGTH |v|))
                                             (LETT |j| NIL) (LETT #8# |restl|)
                                             G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |j| (CAR #8#))
                                                    NIL)
                                                   (> |jj| #9#))
                                               (GO G191)))
                                             (SEQ (LETT |vjf| (QCAR |j|))
                                                  (EXIT
                                                   (COND
                                                    ((EQL |dvif|
                                                          (SPADCALL |vjf|
                                                                    (QREFELT $
                                                                             75)))
                                                     (SEQ
                                                      (LETT |d| (- |dvif| 1))
                                                      (LETT |e|
                                                            (SPADCALL
                                                             (SPADCALL |vif|
                                                                       |d|
                                                                       (QREFELT
                                                                        $ 76))
                                                             (SPADCALL |vjf|
                                                                       |d|
                                                                       (QREFELT
                                                                        $ 76))
                                                             (QREFELT $ 77)))
                                                      (LETT |e|
                                                            (SPADCALL |e|
                                                                      (SPADCALL
                                                                       |dvif|
                                                                       (QREFELT
                                                                        $ 78))
                                                                      (QREFELT
                                                                       $ 79)))
                                                      (EXIT
                                                       (COND
                                                        ((SPADCALL |e|
                                                                   (QREFELT $
                                                                            81))
                                                         (COND
                                                          ((SPADCALL |e|
                                                                     (|spadConstant|
                                                                      $ 19)
                                                                     (QREFELT $
                                                                              82))
                                                           (SEQ
                                                            (LETT |ie|
                                                                  (SPADCALL |e|
                                                                            (QREFELT
                                                                             $
                                                                             83)))
                                                            (LETT |newx|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 12)
                                                                    1
                                                                    (QREFELT $
                                                                             58))
                                                                   (SPADCALL
                                                                    |ie|
                                                                    (QREFELT $
                                                                             84))
                                                                   (QREFELT $
                                                                            59)))
                                                            (LETT |sbt|
                                                                  (SPADCALL
                                                                   |vjf|
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 12)
                                                                    1
                                                                    (QREFELT $
                                                                             58))
                                                                   |newx|
                                                                   (QREFELT $
                                                                            85)))
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL
                                                                (SPADCALL |vif|
                                                                          |sbt|
                                                                          (QREFELT
                                                                           $
                                                                           86))
                                                                (|spadConstant|
                                                                 $ 52)
                                                                (QREFELT $ 87))
                                                               (COND
                                                                ((SPADCALL |ie|
                                                                           0
                                                                           (QREFELT
                                                                            $
                                                                            88))
                                                                 (SEQ
                                                                  (LETT
                                                                   |unsafe|
                                                                   (CONS |i|
                                                                         |unsafe|))
                                                                  (EXIT
                                                                   (SPADCALL
                                                                    |semi| |jj|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |semi|
                                                                      |jj|
                                                                      (QREFELT
                                                                       $ 89))
                                                                     (SPADCALL
                                                                      |vif|
                                                                      (QCDR
                                                                       |i|)
                                                                      (QREFELT
                                                                       $ 70))
                                                                     (QREFELT $
                                                                              90))
                                                                    (QREFELT $
                                                                             72)))))
                                                                ('T
                                                                 (SEQ
                                                                  (LETT
                                                                   |unsafe|
                                                                   (CONS |j|
                                                                         |unsafe|))
                                                                  (EXIT
                                                                   (SPADCALL
                                                                    |semi| |ii|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |semi|
                                                                      |ii|
                                                                      (QREFELT
                                                                       $ 89))
                                                                     (SPADCALL
                                                                      |vjf|
                                                                      (QCDR
                                                                       |j|)
                                                                      (QREFELT
                                                                       $ 70))
                                                                     (QREFELT $
                                                                              90))
                                                                    (QREFELT $
                                                                             72))))))))))))))))))))
                                             (LETT #8#
                                                   (PROG1 (CDR #8#)
                                                     (LETT |jj| (+ |jj| 1))))
                                             (GO G190) G191 (EXIT NIL))))
                                  (LETT #10#
                                        (PROG1 (CDR #10#)
                                          (LETT |ii|
                                                (PROG1 (|inc_SI| |ii|)
                                                  (LETT #12# (CDR #12#))))))
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |v_old| |v|)
                             (LETT |v| (SPADCALL |v| |unsafe| (QREFELT $ 91)))
                             (EXIT
                              (COND
                               ((EQUAL |option| "semireg")
                                (LETT |v|
                                      (PROGN
                                       (LETT #6# NIL)
                                       (SEQ (LETT |i| NIL) (LETT #5# |v|) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |i| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (CONS
                                                      (SPADCALL |semi|
                                                                (SPADCALL |i|
                                                                          |v_old|
                                                                          (QREFELT
                                                                           $
                                                                           92))
                                                                (QREFELT $ 89))
                                                      1)
                                                     #6#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #6#)))))))))))
                      (LETT |slo| (QVELT |k| 1))
                      (COND
                       ((EQL
                         (SPADCALL
                          (SPADCALL (QCAR (SPADCALL |v| 1 (QREFELT $ 93)))
                                    (QREFELT $ 75))
                          (SPADCALL |slo| (QREFELT $ 53)) (QREFELT $ 56))
                         (SPADCALL |f| (QREFELT $ 41)))
                        (PROGN (LETT #1# (LIST |f|)) (GO #19#))))
                      (EXIT
                       (SEQ (LETT |i| NIL) (LETT #2# |v|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |jl|
                                   (|LODOF2;factor_newton2| |f| (QCAR |i|) |k|
                                    $))
                             (COND
                              ((EQUAL |option| "alg factor")
                               (PROGN (LETT #1# (LIST (QCDR |jl|))) (GO #19#)))
                              ((EQUAL |option| "split over k((x))")
                               (PROGN
                                (LETT #1#
                                      (SPADCALL
                                       (|LODOF2;factor_newton| (QCAR |jl|)
                                        |factorizer| |option| $)
                                       (LIST (QCDR |jl|)) (QREFELT $ 95)))
                                (GO #19#))))
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res| (LIST (QCDR |jl|))
                                              (QREFELT $ 95)))))
                            (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #18# (CDR #18#)) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #19# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfn;LodoMSL;8|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;factor_newton| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;factorUP|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|factorSUP| |Mapping|
          #1=(|Factored|
              (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Factored|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|fsnp| #1#)
          (|snp| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ (LETT |snp| (SPADCALL |np| (QREFELT $ 100)))
              (LETT |fsnp| (SPADCALL |snp| |factorSUP|))
              (EXIT (SPADCALL (ELT $ 101) |fsnp| (QREFELT $ 105)))))) 

(SDEFUN |LODOF2;factor_newton2|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|r| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|l| |Record|
          (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
          (|:| |slope| #1=(|Fraction| (|Integer|)))
          (|:| |npoly|
               #2=(|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |Record|
          (|:| |Qt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |Rt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|right|
           #3=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|left| #3#)
          (|llr|
           (|Record|
            (|:| |laurl|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |laurr|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|ordl| (|Integer|)) (|ordr| (|Integer|))
          (|npor| #4=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npo| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|mlr| #4#) (|shift| (|Fraction| (|Integer|))) (|npol| #2#)
          (|xcd| (|Integer|)) (|ycd| (|Integer|)) (|slop| #1#))
         (SEQ (LETT |slop| (QVELT |l| 1)) (LETT |ycd| (QCDR (QVELT |l| 0)))
              (LETT |xcd| (QCAR (QVELT |l| 0))) (LETT |npol| (QVELT |l| 2))
              (LETT |shift|
                    (SPADCALL (|spadConstant| $ 68)
                              (SPADCALL (SPADCALL |ycd| (QREFELT $ 106))
                                        (SPADCALL
                                         (- (SPADCALL |f| (QREFELT $ 41))
                                            |xcd|)
                                         |slop| (QREFELT $ 107))
                                        (QREFELT $ 108))
                              (QREFELT $ 109)))
              (LETT |npo|
                    (SPADCALL (|spadConstant| $ 12) |xcd| (QREFELT $ 58)))
              (LETT |mlr|
                    (SPADCALL (SPADCALL |npol| |r| (QREFELT $ 110))
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 85)))
              (LETT |npo| (SPADCALL |npo| |mlr| (QREFELT $ 90)))
              (LETT |npor|
                    (SPADCALL |r|
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 85)))
              (LETT |ordr|
                    (SPADCALL (SPADCALL |r| (QREFELT $ 75))
                              (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 56)))
              (LETT |ordl| (- (SPADCALL |f| (QREFELT $ 41)) |ordr|))
              (LETT |lwr|
                    (|LODOF2;ln_wrapper| |slop| |f| |npo| |npor| |shift| |ordr|
                     $))
              (LETT |lcr|
                    (|LODOF2;listream_coefs| |lwr| |ordl| |ordr| |shift| |slop|
                     $))
              (LETT |llr| (|LODOF2;list_laurent| |lcr| |ordl| |ordr| $))
              (LETT |left| (|LODOF2;laurent_op| (QCAR |llr|) |ordl| $))
              (LETT |right| (|LODOF2;laurent_op| (QCDR |llr|) |ordr| $))
              (EXIT (CONS |left| |right|))))) 

(SDEFUN |LODOF2;testf2;LodoUpFR;11|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|r| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|slop| |Fraction| (|Integer|))
         ($ |Record|
          (|:| |Qt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |Rt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|l|
           #1=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (#2=#:G560 NIL) (|i| NIL) (|np| (|List| #1#)))
         (SEQ
          (LETT |np| (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| $) $))
          (SEQ (LETT |i| NIL) (LETT #2# |np|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |i| 1) |slop| (QREFELT $ 111))
                   (LETT |l| |i|)))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|LODOF2;factor_newton2| (|LODOF2;convertL3toLL| |f| $) |r| |l|
            $))))) 

(SDEFUN |LODOF2;laurent_op|
        ((|llaur| |List|
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|dgf| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G564 NIL) (|i| NIL))
         (SEQ (LETT |f| (|spadConstant| $ 18))
              (SEQ (LETT |i| 0) (LETT #1# |dgf|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |f|
                           (SPADCALL |f|
                                     (SPADCALL
                                      (SPADCALL |llaur| (+ |i| 1)
                                                (QREFELT $ 115))
                                      |i| (QREFELT $ 34))
                                     (QREFELT $ 35)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;list_laurent|
        ((|lsc| |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|))))))))
         (|dgl| |Integer|) (|dgr| |Integer|)
         ($ |Record|
          (|:| |laurl|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |laurr|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|laurer|
           #1=(|List|
               (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)))
          (|laurel| #1#))
         (SEQ (LETT |laurel| (|LODOF2;list_laurentop| (QCAR |lsc|) |dgl| $))
              (LETT |laurer| (|LODOF2;list_laurentop| (QCDR |lsc|) |dgr| $))
              (EXIT (CONS |laurel| |laurer|))))) 

(SDEFUN |LODOF2;testll;FLodo2UpFIR;14|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |laurl|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |laurr|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $)
                 |l_low| |r_low| |shift| |dgr| $))
          (LETT |lcr|
                (|LODOF2;listream_coefs| |lwr|
                 (- (SPADCALL |f| (QREFELT $ 33)) |dgr|) |dgr| |shift| |slop|
                 $))
          (EXIT
           (|LODOF2;list_laurent| |lcr| (- (SPADCALL |f| (QREFELT $ 33)) |dgr|)
            |dgr| $))))) 

(SDEFUN |LODOF2;list_laurentop|
        ((|lsc| |List|
          (|Stream|
           (|Record| (|:| |k| (|Integer|))
                     (|:| |c| (|Expression| (|Integer|))))))
         (|dgf| |Integer|)
         ($ |List|
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#1=#:G578 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 0) (LETT #1# |dgf|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST
                                      (SPADCALL
                                       (SPADCALL |lsc| (+ |i| 1)
                                                 (QREFELT $ 121))
                                       (QREFELT $ 122)))
                                     (QREFELT $ 123)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;listream_coefs|
        ((|slr| |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))))
         (|dgl| |Integer|) (|dgr| |Integer|) (|shift| |Fraction| (|Integer|))
         (|slop| |Fraction| (|Integer|))
         ($ |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|rsc|
           #1=(|List|
               (|Stream|
                (|Record| (|:| |k| (|Integer|))
                          (|:| |c| (|Expression| (|Integer|)))))))
          (|re| (|Integer|))
          (|sre|
           #2=(|Stream|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|))))
          (|lsc| #1#) (|le| (|Integer|)) (|sle| #2#))
         (SEQ
          (LETT |sle|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!0|) |slr|
                          (QREFELT $ 128)))
          (LETT |le|
                (SPADCALL
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                           (QREFELT $ 107))
                 (QREFELT $ 129)))
          (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|)))
          (LETT |lsc| (|LODOF2;listream_coefsop| |sle| |dgl| |le| |slop| $))
          (LETT |sre|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!1|) |slr|
                          (QREFELT $ 128)))
          (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)))
          (LETT |rsc| (|LODOF2;listream_coefsop| |sre| |dgr| |re| |slop| $))
          (EXIT (CONS |lsc| |rsc|))))) 

(SDEFUN |LODOF2;listream_coefs!1| ((|landr| NIL) ($$ NIL)) (QCDR |landr|)) 

(SDEFUN |LODOF2;listream_coefs!0| ((|landr| NIL) ($$ NIL)) (QCAR |landr|)) 

(SDEFUN |LODOF2;testlc;FLodo2UpFIR;17|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $)
                 |l_low| |r_low| |shift| |dgr| $))
          (EXIT
           (|LODOF2;listream_coefs| |lwr|
            (- (SPADCALL |f| (QREFELT $ 33)) |dgr|) |dgr| |shift| |slop| $))))) 

(SDEFUN |LODOF2;listream_coefsop|
        ((|sfe| |Stream|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|dgf| |Integer|) (|fe| |Integer|) (|slop| |Fraction| (|Integer|))
         ($ |List|
          (|Stream|
           (|Record| (|:| |k| (|Integer|))
                     (|:| |c| (|Expression| (|Integer|)))))))
        (SPROG
         ((|dgc|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|res|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|new_term|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (|nl_st| (|Stream| (|Integer|))) (#1=#:G613 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 0) (LETT #1# (- |dgf| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |nl_st|
                          (SPADCALL (CONS #'|LODOF2;listream_coefsop!0| $) 1
                                    (QREFELT $ 137)))
                    (LETT |new_term|
                          (SPADCALL
                           (CONS #'|LODOF2;listream_coefsop!1|
                                 (VECTOR |i| |fe| |slop| $))
                           |sfe| |nl_st| (QREFELT $ 145)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (LIST |new_term|)
                                     (QREFELT $ 146)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |dgc|
                    (LIST
                     (SPADCALL (LIST (CONS 0 (|spadConstant| $ 12)))
                               (QREFELT $ 148))))
              (EXIT (SPADCALL |res| |dgc| (QREFELT $ 146)))))) 

(SDEFUN |LODOF2;listream_coefsop!1| ((|x| NIL) (|n_l| NIL) ($$ NIL))
        (PROG ($ |slop| |fe| |i|)
          (LETT $ (QREFELT $$ 3))
          (LETT |slop| (QREFELT $$ 2))
          (LETT |fe| (QREFELT $$ 1))
          (LETT |i| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((#1=#:G602 NIL) (|coefd| NIL) (|cx| NIL) (|deg| NIL)
              (|degn| NIL))
             (SEQ
              (LETT |degn|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |n_l| (|spadConstant| $ 133) (QREFELT $ 138))
                       (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 139))
                      |fe| (QREFELT $ 134))
                     (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 55))
                               (QREFELT $ 56))
                     (QREFELT $ 134)))
              (LETT |deg|
                    (SPADCALL
                     (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                               (QREFELT $ 51))
                     (QREFELT $ 141)))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |deg| (CONS 1 "failed") (QREFELT $ 142)))
                     (GO G191)))
                   (SEQ
                    (LETT |degn|
                          (SPADCALL |degn| (|spadConstant| $ 133)
                                    (QREFELT $ 134)))
                    (EXIT
                     (LETT |deg|
                           (SPADCALL
                            (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                                      (QREFELT $ 51))
                            (QREFELT $ 141)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |cx| (SPADCALL |x| |i| (QREFELT $ 54)))
              (LETT |coefd|
                    (SPADCALL |cx|
                              (PROG2 (LETT #1# |deg|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                                (|Union| (|Integer|)
                                                         #2="failed")
                                                #1#))
                              (QREFELT $ 57)))
              (EXIT
               (CONS
                (PROG2 (LETT #1# |deg|)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                  (|Union| (|Integer|) #2#) #1#))
                |coefd|)))))))) 

(SDEFUN |LODOF2;listream_coefsop!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 133) (QREFELT $ 134))) 

(SDEFUN |LODOF2;lift_newton|
        ((|slop| |Fraction| (|Integer|))
         (|ff| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         (|v| |Record|
          (|:| |Qt|
               #1=(|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
          (|:| |Rt|
               #2=(|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
         (|ei| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|n_l| |PositiveInteger|)
         ($ |Record|
          (|:| |main|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |nf|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |error|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|ri| #2#) (|li| #1#)
          (|r_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|l_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|pl_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pr_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pi| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#3=#:G632 NIL) (|i| #4=(|Integer|)) (|fe| #5=(|Integer|))
          (|re| (|Integer|)) (|le| #5#)
          (|c2| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c1| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|s|
           (|Record|
            (|:| |coef1|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |coef2|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#6=#:G623 NIL)
          (|sl_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dgl| #4#))
         (SEQ (LETT |dgl| (- (SPADCALL |ff| (QREFELT $ 41)) |dgr|))
              (LETT |li| (QCAR |v|)) (LETT |ri| (QCDR |v|))
              (COND
               ((SPADCALL |slop| (|spadConstant| $ 68) (QREFELT $ 111))
                (SEQ (LETT |i| (- |n_l| 1))
                     (COND
                      ((EQL |i| 0)
                       (SEQ (LETT |r_extra| (|LODOF2;plug_delta| |r_low| $))
                            (EXIT
                             (LETT |l_extra|
                                   (SPADCALL (|LODOF2;plug_delta| |l_low| $)
                                             (SPADCALL (|spadConstant| $ 12)
                                                       (SPADCALL |shift|
                                                                 (QREFELT $
                                                                          129))
                                                       (QREFELT $ 149))
                                             (QREFELT $ 150))))))
                      (#7='T
                       (SEQ
                        (LETT |sl_low|
                              (SPADCALL |l_low|
                                        (SPADCALL (|spadConstant| $ 12) 1
                                                  (QREFELT $ 58))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58))
                                         (SPADCALL |i| (QREFELT $ 84))
                                         (QREFELT $ 59))
                                        (QREFELT $ 85)))
                        (LETT |s| (SPADCALL |r_low| |sl_low| (QREFELT $ 152)))
                        (COND
                         ((SPADCALL (QVELT |s| 2) (|spadConstant| $ 153)
                                    (QREFELT $ 154))
                          (|error| "unsafe factor")))
                        (LETT |c1| (QVELT |s| 0)) (LETT |c2| (QVELT |s| 1))
                        (LETT |pi|
                              (|LODOF2;coeffx| |ei|
                               (SPADCALL (SPADCALL |i| (QREFELT $ 106)) |shift|
                                         (QREFELT $ 108))
                               $))
                        (LETT |pr_extra|
                              (SPADCALL
                               (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 90))
                                         |r_low| (QREFELT $ 155))
                               (QREFELT $ 156)))
                        (LETT |r_extra| (|LODOF2;plug_delta| |pr_extra| $))
                        (LETT |pl_extra|
                              (SPADCALL
                               (SPADCALL |pi|
                                         (SPADCALL |pr_extra| |sl_low|
                                                   (QREFELT $ 90))
                                         (QREFELT $ 59))
                               |r_low| (QREFELT $ 110)))
                        (LETT |l_extra| (|LODOF2;plug_delta| |pl_extra| $))
                        (LETT |l_extra|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 12)
                                          (+ |i|
                                             (SPADCALL |shift|
                                                       (QREFELT $ 129)))
                                          (QREFELT $ 149))
                                |l_extra| (QREFELT $ 160))
                               (QREFELT $ 161)))
                        (EXIT
                         (LETT |r_extra|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 12) |i|
                                          (QREFELT $ 149))
                                |r_extra| (QREFELT $ 160)))))))
                     (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)))
                     (LETT |ei|
                           (SPADCALL
                            (SPADCALL |ei|
                                      (SPADCALL |l_extra| |ri| (QREFELT $ 162))
                                      (QREFELT $ 35))
                            (SPADCALL |li| |r_extra| (QREFELT $ 162))
                            (QREFELT $ 35)))
                     (EXIT
                      (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35))))))
               (#7#
                (SEQ
                 (LETT |s|
                       (PROG2
                           (LETT #6#
                                 (SPADCALL |r_low| |l_low|
                                           (|spadConstant| $ 153)
                                           (QREFELT $ 165)))
                           (QCDR #6#)
                         (|check_union2| (QEQCAR #6# 0)
                                         (|Record|
                                          (|:| |coef1|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))
                                          (|:| |coef2|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|)))))
                                         (|Union|
                                          (|Record|
                                           (|:| |coef1|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |coef2|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|)))))
                                          "failed")
                                         #6#)))
                 (LETT |c1| (QCAR |s|)) (LETT |c2| (QCDR |s|))
                 (LETT |le|
                       (SPADCALL
                        (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                                  (QREFELT $ 107))
                        (QREFELT $ 129)))
                 (LETT |le|
                       (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|)))
                 (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)))
                 (LETT |fe|
                       (SPADCALL
                        (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                                  (QREFELT $ 107))
                        (QREFELT $ 129)))
                 (LETT |fe|
                       (- |fe|
                          (* (SPADCALL |slop| (QREFELT $ 55))
                             (SPADCALL |ff| (QREFELT $ 41)))))
                 (EXIT
                  (SEQ
                   (LETT |i| (* (- |n_l| 1) (SPADCALL |slop| (QREFELT $ 53))))
                   (LETT #3#
                         (-
                          (SPADCALL |n_l| (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 167))
                          1))
                   G190 (COND ((> |i| #3#) (GO G191)))
                   (SEQ
                    (COND
                     ((EQL |i| 0)
                      (SEQ
                       (LETT |r_extra|
                             (|LODOF2;coefs_operator| |r_low| |slop| |re| $))
                       (EXIT
                        (LETT |l_extra|
                              (|LODOF2;coefs_operator| |l_low| |slop| |le|
                               $)))))
                     ('T
                      (SEQ
                       (LETT |pi|
                             (|LODOF2;coefs_poly| |ei| |slop| (+ |i| |fe|) $))
                       (LETT |pr_extra|
                             (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 90))
                                       |r_low| (QREFELT $ 155)))
                       (LETT |pl_extra|
                             (SPADCALL |pi|
                                       (SPADCALL |pr_extra| |l_low|
                                                 (QREFELT $ 90))
                                       (QREFELT $ 86)))
                       (LETT |pl_extra|
                             (SPADCALL
                              (SPADCALL |pl_extra| |r_low| (QREFELT $ 110))
                              (QREFELT $ 156)))
                       (LETT |l_extra|
                             (|LODOF2;coefs_operator| |pl_extra| |slop|
                              (+ |i| |le|) $))
                       (EXIT
                        (LETT |r_extra|
                              (|LODOF2;coefs_operator|
                               (SPADCALL |pr_extra| (QREFELT $ 156)) |slop|
                               (+ |i| |re|) $))))))
                    (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)))
                    (LETT |ei|
                          (SPADCALL
                           (SPADCALL |ei|
                                     (SPADCALL |l_extra| |ri| (QREFELT $ 162))
                                     (QREFELT $ 35))
                           (SPADCALL |li| |r_extra| (QREFELT $ 162))
                           (QREFELT $ 35)))
                    (EXIT
                     (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))))
              (EXIT
               (VECTOR
                (CONS (SPADCALL |li| (QCAR |v|) (QREFELT $ 168))
                      (SPADCALL |ri| (QCDR |v|) (QREFELT $ 168)))
                (CONS |li| |ri|) |ei|))))) 

(SDEFUN |LODOF2;testln;FLodo2UpFIR;20|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |main|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |nf|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |error|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|ei|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|v|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|lnr|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|i| NIL))
         (SEQ (LETT |v| (CONS (|spadConstant| $ 18) (|spadConstant| $ 18)))
              (LETT |ei|
                    (SPADCALL (|LODOF2;convertL3toLL| |f| $) (QREFELT $ 161)))
              (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 5) (GO G191)))
                   (SEQ
                    (LETT |lnr|
                          (|LODOF2;lift_newton| |slop|
                           (|LODOF2;convertL3toLL| |f| $) |l_low| |r_low|
                           |shift| |dgr| |v| |ei| |i| $))
                    (SPADCALL (SPADCALL (QCAR (QVELT |lnr| 0)) (QREFELT $ 170))
                              (QREFELT $ 172))
                    (SPADCALL (SPADCALL (QCDR (QVELT |lnr| 0)) (QREFELT $ 170))
                              (QREFELT $ 172))
                    (LETT |v| (QVELT |lnr| 1))
                    (EXIT (LETT |ei| (QVELT |lnr| 2))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lnr|)))) 

(SDEFUN |LODOF2;ln_wrapper|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|res|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|all|
           (|Stream|
            (|Record|
             (|:| |lr|
                  (|Record|
                   (|:| |main|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |nf|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |error|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |n_lifts| (|PositiveInteger|)))))
          (|lni|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|n_li| (|PositiveInteger|)))
         (SEQ
          (LETT |lni|
                (VECTOR (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                        (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                        (SPADCALL |f| (QREFELT $ 161))))
          (LETT |n_li| 1)
          (LETT |lni|
                (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low| |shift| |dgr|
                 (QVELT |lni| 1) (QVELT |lni| 2) |n_li| $))
          (LETT |all|
                (SPADCALL
                 (CONS #'|LODOF2;ln_wrapper!0|
                       (VECTOR |dgr| |shift| |r_low| |l_low| |f| |slop| $))
                 (CONS |lni| |n_li|) (QREFELT $ 180)))
          (LETT |res|
                (SPADCALL (LIST #'|LODOF2;ln_wrapper!1|) |all|
                          (QREFELT $ 183)))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;ln_wrapper!1| ((|rec| NIL) ($$ NIL)) (QVELT (QCAR |rec|) 0)) 

(SDEFUN |LODOF2;ln_wrapper!0| ((|rec| NIL) ($$ NIL))
        (PROG ($ |slop| |f| |l_low| |r_low| |shift| |dgr|)
          (LETT $ (QREFELT $$ 6))
          (LETT |slop| (QREFELT $$ 5))
          (LETT |f| (QREFELT $$ 4))
          (LETT |l_low| (QREFELT $$ 3))
          (LETT |r_low| (QREFELT $$ 2))
          (LETT |shift| (QREFELT $$ 1))
          (LETT |dgr| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|lnr| NIL) (|n_l| NIL))
                   (SEQ (LETT |lnr| (QCAR |rec|))
                        (LETT |n_l|
                              (SPADCALL (QCDR |rec|) (|spadConstant| $ 175)
                                        (QREFELT $ 176)))
                        (LETT |lnr|
                              (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low|
                               |shift| |dgr| (QVELT |lnr| 1) (QVELT |lnr| 2)
                               |n_l| $))
                        (EXIT (CONS |lnr| |n_l|)))))))) 

(SDEFUN |LODOF2;testlw;FLodo2UpFIS;22|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $) |l_low|
         |r_low| |shift| |dgr| $)) 

(SDEFUN |LODOF2;coefs_poly|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPROG
         ((|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npc| (|Expression| (|Integer|)))
          (|fc| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#1=#:G659 NIL) (|j| NIL) (|start_x| (|Fraction| (|Integer|)))
          (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 185))
                 0))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 186)))
          (LETT |start_x|
                (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 107))
                          (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 51))
                          (QREFELT $ 108)))
          (LETT |res| (|spadConstant| $ 52))
          (SEQ (LETT |j| 0)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| (QREFELT $ 41))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 187)))
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |fc|
                      (|LODOF2;coeffx| |f|
                       (SPADCALL |start_x|
                                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                           (SPADCALL |j| (QREFELT $ 106))
                                           (QREFELT $ 107))
                                 (QREFELT $ 108))
                       $))
                (LETT |npc|
                      (SPADCALL |fc|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 76)))
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |npc|
                                           (+ |start_D|
                                              (SPADCALL |j|
                                                        (SPADCALL |slop|
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 56)))
                                           (QREFELT $ 58))
                                 (QREFELT $ 59)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testcp;LodoFILodo;24|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;coefs_operator|
         (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| $) |slop| |i| $)
         |slop| |i| $)) 

(SDEFUN |LODOF2;coefs_operator|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|npc| (|Expression| (|Integer|))) (#1=#:G666 NIL) (|j| NIL)
          (|start_x| (|Integer|)) (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 185))
                 0))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 186)))
          (LETT |start_x|
                (SPADCALL
                 (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 107))
                           (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 51))
                           (QREFELT $ 108))
                 (QREFELT $ 129)))
          (LETT |res| (|spadConstant| $ 18))
          (SEQ (LETT |j| 0)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |np| (QREFELT $ 75))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 189)))
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |npc|
                      (SPADCALL |np|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 76)))
                (LETT |sc|
                      (SPADCALL |npc|
                                (+ |start_x|
                                   (* (SPADCALL |slop| (QREFELT $ 55)) |j|))
                                (QREFELT $ 149)))
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |sc|
                                           (+ |start_D|
                                              (SPADCALL |j|
                                                        (SPADCALL |slop|
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 56)))
                                           (QREFELT $ 34))
                                 (QREFELT $ 35)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testco;LodoFIB;26|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|) ($ |Boolean|))
        (SPROG
         ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |np|
                (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| $) |slop| |i|
                 $))
          (EXIT
           (SPADCALL
            (|LODOF2;coefs_poly| (|LODOF2;coefs_operator| |np| |slop| |i| $)
             |slop| |i| $)
            |np| (QREFELT $ 87)))))) 

(SDEFUN |LODOF2;coeffx|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         (|e| |Fraction| (|Integer|))
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPROG
         ((|ftmp| #1#)
          (|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ex| (|Integer|)))
         (SEQ (LETT |ftmp| |f|) (LETT |ex| (SPADCALL |e| (QREFELT $ 129)))
              (LETT |res| (|spadConstant| $ 52))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)))
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| |ex| (QREFELT $ 57))
                                         |dg| (QREFELT $ 58))
                                        (QREFELT $ 59)))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;testcx;LodoFUp;28|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|e| |Fraction| (|Integer|))
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (|LODOF2;coeffx| (|LODOF2;convertL3toLL| |f| $) |e| $)) 

(SDEFUN |LODOF2;plug_delta|
        ((|np| . #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|nptmp| #1#)
          (|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|dg| (|NonNegativeInteger|)) (|lc| (|Expression| (|Integer|))))
         (SEQ (LETT |f| (|spadConstant| $ 18)) (LETT |nptmp| |np|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 154)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 192)))
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 75)))
                        (LETT |f|
                              (SPADCALL |f|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 193)) |dg|
                                         (QREFELT $ 34))
                                        (QREFELT $ 35)))
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 194)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;testpd;UpLodo;30|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;plug_delta| |np| $)) 

(SDEFUN |LODOF2;factor_riccati|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((#1=#:G762 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|nt|
           (|Record|
            (|:| |ope|
                 #2=(|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|ir|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#3=#:G773 NIL)
          (|i| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|res_sp|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#4=#:G772 NIL) (#5=#:G771 NIL)
          (|vsp|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|r| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|v|
           (|Union|
            (|List|
             (|Record|
              (|:| |op|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |ram|
                   (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
              (|:| |expart|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
            (|List|
             (|Union|
              (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|))
              (|Record|
               (|:| |ope|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
               (|:| |dext| (|PositiveInteger|))
               (|:| |alpha| (|Expression| (|Integer|)))
               (|:| |rami|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|)))))))))
          (|f2r|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|lns|
           #6=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| #7=(|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (#8=#:G770 NIL) (|np| (|List| #6#))
          (|tosub| (|Expression| (|Integer|))) (|exp| (|Integer|))
          (|ror|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|coefr| (|Expression| (|Integer|))) (|n| (|Integer|))
          (#9=#:G769 NIL)
          (|npgr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|gr| (|Expression| (|Integer|)))
          (|rk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#10=#:G455 NIL) (#11=#:G768 NIL)
          (|ric|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#12=#:G682 NIL)
          (|lk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|r1|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#13=#:G767 NIL) (#14=#:G766 NIL)
          (|retv|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|fullxr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|xsubsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#15=#:G765 NIL) (|vi| NIL) (|sym| (|Symbol|)) (#16=#:G681 NIL)
          (#17=#:G454 NIL)
          (|cxs|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|irred_f| (|Boolean|))
          (|npf|
           (|Record|
            (|:| |flag| (|Union| #18="nil" #19="sqfr" #20="irred" #21="prime"))
            (|:| |factor|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |exponent| (|NonNegativeInteger|))))
          (#22=#:G764 NIL) (|ip| NIL)
          (|subs|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sols| (|List| (|Integer|))) (#23=#:G694 NIL)
          (|fact|
           #24=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|diff| (|Union| (|Integer|) "failed")) (#25=#:G763 NIL) (|l| NIL)
          (|npf1|
           (|List|
            (|Record| (|:| |flag| (|Union| #18# #19# #20# #21#))
                      (|:| |factor| #24#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|vr_ope| #2#)
          (|xx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vr|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|va|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|slop| #7#)
          (|np1|
           (|Record|
            (|:| |point|
                 (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
            (|:| |slope| (|Fraction| (|Integer|)))
            (|:| |npoly|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (|LODOF2;newtonpolygon| |f| $))
                (LETT |np1| (SPADCALL |np| 1 (QREFELT $ 196)))
                (LETT |slop| (QVELT |np1| 1))
                (COND
                 ((EQUAL |option| "semireg")
                  (COND
                   ((SPADCALL |slop| (|spadConstant| $ 68) (QREFELT $ 111))
                    (EXIT
                     (SEQ
                      (LETT |va|
                            (SPADCALL
                             (PROG2
                                 (LETT #12#
                                       (|LODOF2;factor_op| |f| |factorizer|
                                        "alg factor" $))
                                 (QCDR #12#)
                               (|check_union2| (QEQCAR #12# 1)
                                               (|List|
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #12#))
                             (QREFELT $ 200)))
                      (LETT |vr|
                            (COND
                             ((QEQCAR |va| 0)
                              (VECTOR (QCDR |va|) 1 (|spadConstant| $ 19)
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))))
                             (#26='T (QCDR |va|))))
                      (LETT |xx|
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58)))
                      (LETT |vr_ope| (QVELT |vr| 0))
                      (LETT |i|
                            (SPADCALL |xx|
                                      (|LODOF2;coeffx| |vr_ope|
                                       (|spadConstant| $ 68) $)
                                      (QREFELT $ 86)))
                      (LETT |n|
                            (QUOTIENT2 (SPADCALL |f| (QREFELT $ 41))
                                       (QVELT |vr| 1)))
                      (COND
                       ((EQL |n| 1)
                        (SEQ
                         (LETT |il|
                               (SPADCALL (|LODOF2;convertUPtoUTS| |i| $)
                                         (QREFELT $ 28)))
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (CONS 0
                                       (LIST
                                        (VECTOR
                                         (SPADCALL (QVELT |vr| 0)
                                                   (SPADCALL |il|
                                                             (QREFELT $ 201))
                                                   (QREFELT $ 35))
                                         (QVELT |vr| 3) |il|))))
                           (GO #27=#:G761))))))
                      (LETT |npf1|
                            (SPADCALL
                             (|LODOF2;factorUP|
                              (SPADCALL (QVELT |np1| 2)
                                        (SPADCALL (|spadConstant| $ 12) 1
                                                  (QREFELT $ 58))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58))
                                         |i| (QREFELT $ 59))
                                        (QREFELT $ 85))
                              |factorizer| $)
                             (QREFELT $ 205)))
                      (LETT |r| (|spadConstant| $ 153)) (LETT |sols| NIL)
                      (SEQ (LETT |l| NIL) (LETT #25# |npf1|) G190
                           (COND
                            ((OR (ATOM #25#) (PROGN (LETT |l| (CAR #25#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |diff|
                                  (SPADCALL
                                   (SPADCALL |xx| (QVELT |l| 1) (QREFELT $ 86))
                                   (QREFELT $ 206)))
                            (EXIT
                             (COND
                              ((SPADCALL |diff| (CONS 1 "failed")
                                         (QREFELT $ 207))
                               (SEQ (LETT |fact| (QVELT |l| 1))
                                    (LETT |r|
                                          (SPADCALL |r|
                                                    (SPADCALL |fact|
                                                              (QVELT |l| 2)
                                                              (QREFELT $ 70))
                                                    (QREFELT $ 90)))
                                    (EXIT
                                     (LETT |sols|
                                           (CONS
                                            (PROG2 (LETT #23# |diff|)
                                                (QCDR #23#)
                                              (|check_union2| (QEQCAR #23# 0)
                                                              (|Integer|)
                                                              (|Union|
                                                               (|Integer|)
                                                               "failed")
                                                              #23#))
                                            |sols|))))))))
                           (LETT #25# (CDR #25#)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((SPADCALL (SPADCALL |r| (QREFELT $ 75)) |n|
                                  (QREFELT $ 208))
                        (|error| "bug")))
                      (LETT |n| (SPADCALL (ELT $ 209) |sols| (QREFELT $ 212)))
                      (LETT |r|
                            (SPADCALL |r|
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (SPADCALL |n| (QREFELT $ 84))
                                       (QREFELT $ 59))
                                      (QREFELT $ 85)))
                      (LETT |subs|
                            (PROG2
                                (LETT #17#
                                      (|LODOF2;substitute|
                                       (CONS 0
                                             (SPADCALL |i|
                                                       (SPADCALL |n|
                                                                 (QREFELT $
                                                                          84))
                                                       (QREFELT $ 59)))
                                       (CONS 0 |f|) $))
                                (QCDR #17#)
                              (|check_union2| (QEQCAR #17# 0)
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))
                                              #17#)))
                      (LETT |np| (|LODOF2;newtonpolygon| |subs| $))
                      (SEQ (LETT |ip| NIL) (LETT #22# |np|) G190
                           (COND
                            ((OR (ATOM #22#)
                                 (PROGN (LETT |ip| (CAR #22#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |ip| 1) (|spadConstant| $ 68)
                                         (QREFELT $ 111))
                               (LETT |lns| |ip|)))))
                           (LETT #22# (CDR #22#)) (GO G190) G191 (EXIT NIL))
                      (LETT |f2r|
                            (QCDR
                             (|LODOF2;factor_newton2| |subs| |r| |lns| $)))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (CONS 0
                                    (LIST
                                     (VECTOR |f2r| (QVELT |vr| 3)
                                             (SPADCALL
                                              (|LODOF2;convertUPtoUTS|
                                               (SPADCALL |i|
                                                         (SPADCALL |n|
                                                                   (QREFELT $
                                                                            84))
                                                         (QREFELT $ 59))
                                               $)
                                              (QREFELT $ 28))))))
                        (GO #27#)))))))))
                (LETT |npf|
                      (SPADCALL
                       (SPADCALL
                        (|LODOF2;factorUP| (QVELT |np1| 2) |factorizer| $)
                        (QREFELT $ 205))
                       1 (QREFELT $ 213)))
                (LETT |irred_f|
                      (COND
                       ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1
                                  (QREFELT $ 214))
                        'T)
                       ((EQL (QVELT |npf| 2) 1)
                        (COND ((EQUAL |option| "split over k((x))") 'T)
                              (#26# (EQUAL |option| "all right factors"))))
                       (#26# NIL)))
                (EXIT
                 (COND
                  (|irred_f|
                   (COND
                    ((EQUAL |option| "semireg")
                     (SEQ
                      (LETT |il|
                            (SPADCALL
                             (SPADCALL (SPADCALL |f| 0 (QREFELT $ 54)) 0
                                       (QREFELT $ 215))
                             (QREFELT $ 216)))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (CONS 0
                                    (LIST
                                     (VECTOR
                                      (SPADCALL |f|
                                                (SPADCALL |il| (QREFELT $ 201))
                                                (QREFELT $ 35))
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      |il|))))
                        (GO #27#)))))
                    (#26# (CONS 1 (LIST (CONS 0 |f|))))))
                  (#26#
                   (SEQ
                    (COND
                     ((EQL (SPADCALL (QVELT |npf| 1) (QREFELT $ 75)) 1)
                      (COND
                       ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                        (EXIT
                         (SEQ
                          (LETT |cxs|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QVELT |npf| 1) 0 (QREFELT $ 76))
                                  (SPADCALL (|spadConstant| $ 12)
                                            (-
                                             (SPADCALL |slop| (QREFELT $ 55)))
                                            (QREFELT $ 149))
                                  (QREFELT $ 217))
                                 (QREFELT $ 216)))
                          (LETT |v|
                                (|LODOF2;factor_op|
                                 (PROG2
                                     (LETT #17#
                                           (|LODOF2;substitute| (CONS 1 |cxs|)
                                            (CONS 0 |f|) $))
                                     (QCDR #17#)
                                   (|check_union2| (QEQCAR #17# 0)
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #17#))
                                 |factorizer| |option| $))
                          (COND
                           ((EQUAL |option| "semireg")
                            (SEQ
                             (LETT |vsp|
                                   (PROG2 (LETT #16# |v|)
                                       (QCDR #16#)
                                     (|check_union2| (QEQCAR #16# 0)
                                                     (|List|
                                                      (|Record|
                                                       (|:| |op|
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))))
                                                       (|:| |ram|
                                                            (|UnivariatePolynomial|
                                                             (QREFELT $ 6)
                                                             (|Expression|
                                                              (|Integer|))))
                                                       (|:| |expart|
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7)))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #16#)))
                             (LETT |sym| (SPADCALL |cxs| (QREFELT $ 219)))
                             (LETT |retv| NIL)
                             (SEQ (LETT |vi| NIL) (LETT #15# |vsp|) G190
                                  (COND
                                   ((OR (ATOM #15#)
                                        (PROGN (LETT |vi| (CAR #15#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |xsubsr|
                                         (SPADCALL
                                          (SPADCALL
                                           (|LODOF2;convertUPtoUTS|
                                            (QVELT |vi| 1) $)
                                           (QREFELT $ 28))
                                          (- (SPADCALL |slop| (QREFELT $ 55)))
                                          (QREFELT $ 220)))
                                   (LETT |fullxr|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (QVELT |vi| 1)
                                                     (QREFELT $ 75))
                                           (SPADCALL
                                            (SPADCALL (QVELT |npf| 1) 0
                                                      (QREFELT $ 76))
                                            (QREFELT $ 221))
                                           (QREFELT $ 222))
                                          |xsubsr| (QREFELT $ 217)))
                                   (EXIT
                                    (LETT |retv|
                                          (SPADCALL |retv|
                                                    (LIST
                                                     (VECTOR (QVELT |vi| 0)
                                                             (QVELT |vi| 1)
                                                             (SPADCALL
                                                              (QVELT |vi| 2)
                                                              |fullxr|
                                                              (QREFELT $
                                                                       223))))
                                                    (QREFELT $ 226)))))
                                  (LETT #15# (CDR #15#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (PROGN (LETT #1# (CONS 0 |retv|)) (GO #27#))))))
                          (LETT |vrs|
                                (PROG2 (LETT #12# |v|)
                                    (QCDR #12#)
                                  (|check_union2| (QEQCAR #12# 1)
                                                  (|List|
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|)))))))
                                                  (|Union|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |op|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |ram|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))
                                                     (|:| |expart|
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7)))))
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))))))
                                                  #12#)))
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (CONS 1
                                        (PROGN
                                         (LETT #14# NIL)
                                         (SEQ (LETT |i| NIL) (LETT #13# |vrs|)
                                              G190
                                              (COND
                                               ((OR (ATOM #13#)
                                                    (PROGN
                                                     (LETT |i| (CAR #13#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #14#
                                                      (CONS
                                                       (|LODOF2;substitute|
                                                        (CONS 1
                                                              (SPADCALL |cxs|
                                                                        (QREFELT
                                                                         $
                                                                         216)))
                                                        |i| $)
                                                       #14#))))
                                              (LETT #13# (CDR #13#)) (GO G190)
                                              G191 (EXIT (NREVERSE #14#))))))
                            (GO #27#)))))))))
                    (EXIT
                     (COND
                      ((EQUAL |option| "split over k((x))")
                       (SEQ
                        (LETT |ric|
                              (PROG2
                                  (LETT #12#
                                        (|LODOF2;factor_riccati| |f|
                                         |factorizer| "alg factor" $))
                                  (QCDR #12#)
                                (|check_union2| (QEQCAR #12# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #12#)))
                        (LETT |r1|
                              (PROG2
                                  (LETT #10# (SPADCALL |ric| (QREFELT $ 200)))
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 1)
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|)))))
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                #10#)))
                        (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $))
                        (EXIT
                         (COND
                          ((SPADCALL |rk| |f| (QREFELT $ 227))
                           (PROGN
                            (LETT #1# (CONS 1 (LIST (CONS 0 |f|))))
                            (GO #27#)))
                          (#26#
                           (SEQ (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 228)))
                                (EXIT
                                 (PROGN
                                  (LETT #1#
                                        (CONS 1
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #12#
                                                         (|LODOF2;factor_riccati|
                                                          |lk| |factorizer|
                                                          |option| $))
                                                   (QCDR #12#)
                                                 (|check_union2|
                                                  (QEQCAR #12# 1)
                                                  (|List|
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|)))))))
                                                  (|Union|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |op|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |ram|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))
                                                     (|:| |expart|
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7)))))
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))))))
                                                  #12#))
                                               (LIST (CONS 0 |rk|))
                                               (QREFELT $ 229))))
                                  (GO #27#)))))))))
                      ((EQUAL |option| "all right factors")
                       (SEQ
                        (LETT |ric|
                              (PROG2
                                  (LETT #12#
                                        (|LODOF2;factor_riccati| |f|
                                         |factorizer| "all alg factors" $))
                                  (QCDR #12#)
                                (|check_union2| (QEQCAR #12# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #12#)))
                        (LETT |res| NIL)
                        (SEQ (LETT |i| NIL) (LETT #11# |ric|) G190
                             (COND
                              ((OR (ATOM #11#)
                                   (PROGN (LETT |i| (CAR #11#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |rk|
                                    (|LODOF2;make_rightfactor| |f|
                                     (PROG2 (LETT #10# |i|)
                                         (QCDR #10#)
                                       (|check_union2| (QEQCAR #10# 1)
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|)))))
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))
                                                       #10#))
                                     $))
                              (EXIT
                               (COND
                                ((SPADCALL |rk| |f| (QREFELT $ 227))
                                 (LETT |res| (LIST (CONS 0 |f|))))
                                ('T
                                 (LETT |res|
                                       (SPADCALL |res| (LIST (CONS 0 |rk|))
                                                 (QREFELT $ 229)))))))
                             (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (PROGN (LETT #1# (CONS 1 |res|)) (GO #27#)))))
                      (#26#
                       (COND
                        ((SPADCALL (SPADCALL (QVELT |npf| 1) (QREFELT $ 75)) 1
                                   (QREFELT $ 48))
                         (SEQ
                          (LETT |gr|
                                (SPADCALL
                                 (SPADCALL (QVELT |npf| 1) (QREFELT $ 100))
                                 (QREFELT $ 231)))
                          (LETT |npgr|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  (SPADCALL |gr| (QREFELT $ 232))
                                  (QREFELT $ 86))
                                 (QVELT |npf| 2) (QREFELT $ 70)))
                          (LETT |f2r|
                                (QCDR
                                 (|LODOF2;factor_newton2| |f| |npgr| |np1| $)))
                          (LETT |v|
                                (|LODOF2;factor_riccati| |f2r| |factorizer|
                                 |option| $))
                          (EXIT
                           (COND
                            ((QEQCAR |v| 0) (PROGN (LETT #1# |v|) (GO #27#)))
                            (#26#
                             (SEQ (LETT |vrs| (QCDR |v|)) (LETT |res| NIL)
                                  (SEQ (LETT |i| NIL) (LETT #9# |vrs|) G190
                                       (COND
                                        ((OR (ATOM #9#)
                                             (PROGN (LETT |i| (CAR #9#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((QEQCAR |i| 0)
                                           (SEQ
                                            (LETT |nt|
                                                  (VECTOR (QCDR |i|)
                                                          (SPADCALL
                                                           (QVELT |npf| 1)
                                                           (QREFELT $ 75))
                                                          |gr|
                                                          (SPADCALL
                                                           (|spadConstant| $
                                                                           12)
                                                           1 (QREFELT $ 58))))
                                            (EXIT
                                             (LETT |res|
                                                   (SPADCALL |res|
                                                             (LIST
                                                              (CONS 1 |nt|))
                                                             (QREFELT $
                                                                      229))))))
                                          ('T
                                           (LETT |res|
                                                 (SPADCALL |res| (LIST |i|)
                                                           (QREFELT $
                                                                    229)))))))
                                       (LETT #9# (CDR #9#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (PROGN
                                    (LETT #1# (CONS 1 |res|))
                                    (GO #27#)))))))))
                        (#26#
                         (SEQ
                          (LETT |n|
                                (QVELT
                                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                           (SPADCALL |slop| (QREFELT $ 53))
                                           (QREFELT $ 185))
                                 0))
                          (LETT |coefr|
                                (SPADCALL
                                 (SPADCALL (QVELT |npf| 1) 0 (QREFELT $ 76))
                                 (QREFELT $ 221)))
                          (LETT |ror|
                                (|LODOF2;ramification_of| |f|
                                 (SPADCALL |coefr| |n| (QREFELT $ 233))
                                 (SPADCALL |slop| (QREFELT $ 53)) $))
                          (LETT |exp|
                                (SPADCALL
                                 (SPADCALL
                                  (- 1
                                     (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                                  (SPADCALL |slop| (QREFELT $ 53))
                                  (QREFELT $ 51))
                                 (QREFELT $ 129)))
                          (LETT |tosub|
                                (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                          (SPADCALL |coefr| |exp|
                                                    (QREFELT $ 233))
                                          (QREFELT $ 234)))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  (SPADCALL |tosub| (QREFELT $ 232))
                                  (QREFELT $ 86))
                                 (QVELT |npf| 2) (QREFELT $ 70)))
                          (LETT |np| (|LODOF2;newtonpolygon| |ror| $))
                          (SEQ (LETT |i| NIL) (LETT #8# |np|) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |i| (CAR #8#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (QVELT |i| 1)
                                             (SPADCALL
                                              (SPADCALL |slop| (QREFELT $ 55))
                                              (QREFELT $ 106))
                                             (QREFELT $ 111))
                                   (LETT |lns| |i|)))))
                               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                          (LETT |f2r|
                                (QCDR
                                 (|LODOF2;factor_newton2| |ror| |r| |lns| $)))
                          (LETT |v|
                                (|LODOF2;factor_riccati| |f2r| |factorizer|
                                 |option| $))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL |coefr| |n| (QREFELT $ 233))
                                 (SPADCALL |slop| (QREFELT $ 53))
                                 (QREFELT $ 58)))
                          (EXIT
                           (COND
                            ((QEQCAR |v| 0)
                             (SEQ (LETT |vsp| (QCDR |v|))
                                  (LETT |res_sp|
                                        (PROGN
                                         (LETT #5# NIL)
                                         (SEQ (LETT |i| NIL) (LETT #4# |vsp|)
                                              G190
                                              (COND
                                               ((OR (ATOM #4#)
                                                    (PROGN
                                                     (LETT |i| (CAR #4#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #5#
                                                      (CONS
                                                       (VECTOR (QVELT |i| 0)
                                                               (SPADCALL |r|
                                                                         (SPADCALL
                                                                          (|spadConstant|
                                                                           $
                                                                           12)
                                                                          1
                                                                          (QREFELT
                                                                           $
                                                                           58))
                                                                         (QVELT
                                                                          |i|
                                                                          1)
                                                                         (QREFELT
                                                                          $
                                                                          85))
                                                               (QVELT |i| 2))
                                                       #5#))))
                                              (LETT #4# (CDR #4#)) (GO G190)
                                              G191 (EXIT (NREVERSE #5#)))))
                                  (EXIT
                                   (PROGN
                                    (LETT #1# (CONS 0 |res_sp|))
                                    (GO #27#)))))
                            (#26#
                             (SEQ (LETT |vrs| (QCDR |v|)) (LETT |res| NIL)
                                  (SEQ (LETT |i| NIL) (LETT #3# |vrs|) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |i| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (COND
                                         ((QEQCAR |i| 0)
                                          (LETT |nt|
                                                (VECTOR (QCDR |i|) 1
                                                        (|spadConstant| $ 19)
                                                        |r|)))
                                         ('T
                                          (SEQ (LETT |ir| (QCDR |i|))
                                               (EXIT
                                                (LETT |nt|
                                                      (VECTOR (QVELT |ir| 0)
                                                              (QVELT |ir| 1)
                                                              (QVELT |ir| 2)
                                                              (SPADCALL |r|
                                                                        (SPADCALL
                                                                         (|spadConstant|
                                                                          $ 12)
                                                                         1
                                                                         (QREFELT
                                                                          $
                                                                          58))
                                                                        (QVELT
                                                                         |ir|
                                                                         3)
                                                                        (QREFELT
                                                                         $
                                                                         85))))))))
                                        (EXIT
                                         (LETT |res|
                                               (SPADCALL |res|
                                                         (LIST (CONS 1 |nt|))
                                                         (QREFELT $ 229)))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (PROGN
                                    (LETT #1# (CONS 1 |res|))
                                    (GO #27#)))))))))))))))))))
          #27# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfr;LodoMSU;32|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (|LODOF2;factor_riccati| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;substitute|
        ((|a| |Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|f| |Union|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |Union|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G793 NIL)
          (|fr|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|fl|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|new_mon|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |new_mon| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34)))
            (COND
             ((QEQCAR |a| 0)
              (LETT |new_mon|
                    (SPADCALL |new_mon|
                              (|LODOF2;convertL3toLL|
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 237))
                                         (QREFELT $ 238))
                               $)
                              (QREFELT $ 35))))
             (#2='T
              (LETT |new_mon|
                    (SPADCALL |new_mon| (SPADCALL (QCDR |a|) (QREFELT $ 201))
                              (QREFELT $ 35)))))
            (COND ((QEQCAR |f| 0) (LETT |ftmp| (QCDR |f|)))
                  (#2#
                   (SEQ (LETT |fr| (QCDR |f|)) (LETT |ftmp| (QVELT |fr| 0))
                        (EXIT
                         (LETT |new_mon|
                               (|LODOF2;ramification_of| |new_mon|
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 192))
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 75))
                                $))))))
            (LETT |res| (|spadConstant| $ 18))
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)))
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)))
                      (LETT |res|
                            (SPADCALL |res|
                                      (SPADCALL |lc|
                                                (SPADCALL |new_mon| |dg|
                                                          (QREFELT $ 239))
                                                (QREFELT $ 160))
                                      (QREFELT $ 35)))
                      (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((QEQCAR |f| 0)
               (SEQ (LETT |fl| (QCDR |f|))
                    (EXIT (PROGN (LETT #1# (CONS 0 |res|)) (GO #3=#:G792)))))
              (#2#
               (SEQ (LETT |fr| (QCDR |f|))
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (VECTOR |res| (QVELT |fr| 1) (QVELT |fr| 2)
                                          (QVELT |fr| 3))))
                      (GO #3#)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsb;ULodoLodo;34|
        ((|a| |Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG ((#1=#:G454 NIL))
               (PROG2
                   (LETT #1#
                         (|LODOF2;substitute| |a|
                          (CONS 0 (|LODOF2;convertL3toLL| |f| $)) $))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LinearOrdinaryDifferentialOperator3|
                                  (|Expression| (|Integer|))
                                  (|UnivariateTaylorSeries|
                                   (|Expression| (|Integer|)) (QREFELT $ 6)
                                   (QREFELT $ 7))
                                  (|UnivariateLaurentSeries|
                                   (|Expression| (|Integer|)) (QREFELT $ 6)
                                   (QREFELT $ 7)))
                                 (|Union|
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) (QREFELT $ 6)
                                    (QREFELT $ 7))
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) (QREFELT $ 6)
                                    (QREFELT $ 7)))
                                  (|Record|
                                   (|:| |ope|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))))
                                   (|:| |dext| (|PositiveInteger|))
                                   (|:| |alpha| (|Expression| (|Integer|)))
                                   (|:| |rami|
                                        (|UnivariatePolynomial| (QREFELT $ 6)
                                                                (|Expression|
                                                                 (|Integer|))))))
                                 #1#)))) 

(SDEFUN |LODOF2;ramification_of|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         (|coefr| |Expression| (|Integer|)) (|n| |PositiveInteger|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|ftmp| #1#)
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|mlc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#2=#:G806 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |coefr| (|spadConstant| $ 12) (QREFELT $ 242))
              (COND ((EQL |n| 1) (PROGN (LETT #2# |f|) (GO #3=#:G805))))))
            (LETT |res| (|spadConstant| $ 18)) (LETT |ftmp| |f|)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)))
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)))
                      (LETT |mlc|
                            (SPADCALL
                             (CONS #'|LODOF2;ramification_of!0|
                                   (VECTOR $ |coefr|))
                             |lc| (QREFELT $ 244)))
                      (LETT |mlc| (SPADCALL |mlc| |n| (QREFELT $ 245)))
                      (LETT |extra|
                            (SPADCALL (SPADCALL |mlc| |dg| (QREFELT $ 34))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 1 |n| (QREFELT $ 51)) |dg|
                                         (QREFELT $ 246))
                                        (QREFELT $ 247))
                                       (QREFELT $ 193))
                                      (QREFELT $ 150)))
                      (LETT |res| (SPADCALL |res| |extra| (QREFELT $ 35)))
                      (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (SPADCALL (EXPT |n| (SPADCALL |f| (QREFELT $ 41))) |res|
                       (QREFELT $ 248)))))
          #3# (EXIT #2#)))) 

(SDEFUN |LODOF2;ramification_of!0| ((|x| NIL) ($$ NIL))
        (PROG (|coefr| $)
          (LETT |coefr| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |coefr| |x| (QREFELT $ 233)))))) 

(SDEFUN |LODOF2;testro;LodoEPiLodo;36|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|coefr| |Expression| (|Integer|)) (|n| |PositiveInteger|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;ramification_of| (|LODOF2;convertL3toLL| |f| $) |coefr| |n| $)) 

(SDEFUN |LODOF2;factor_op|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((#1=#:G825 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#2=#:G811 NIL) (#3=#:G827 NIL) (|i| NIL) (#4=#:G810 NIL)
          (#5=#:G826 NIL)
          (|fnr|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fnr| (|LODOF2;factor_newton| |f| |factorizer| |option| $))
            (EXIT
             (COND
              ((EQUAL |option| "semireg")
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |i| NIL) (LETT #5# |fnr|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (PROG2
                                               (LETT #4#
                                                     (|LODOF2;factor_riccati|
                                                      |i| |factorizer| |option|
                                                      $))
                                               (QCDR #4#)
                                             (|check_union2| (QEQCAR #4# 0)
                                                             (|List|
                                                              (|Record|
                                                               (|:| |op|
                                                                    (|LinearOrdinaryDifferentialOperator3|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (|UnivariateTaylorSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))))
                                                               (|:| |ram|
                                                                    (|UnivariatePolynomial|
                                                                     (QREFELT $
                                                                              6)
                                                                     (|Expression|
                                                                      (|Integer|))))
                                                               (|:| |expart|
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7)))))
                                                             (|Union|
                                                              (|List|
                                                               (|Record|
                                                                (|:| |op|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))))
                                                                (|:| |ram|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (|Expression|
                                                                       (|Integer|))))
                                                                (|:| |expart|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7)))))
                                                              (|List|
                                                               (|Union|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7)))
                                                                (|Record|
                                                                 (|:| |ope|
                                                                      (|LinearOrdinaryDifferentialOperator3|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (|UnivariateTaylorSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $ 7))
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $
                                                                         7))))
                                                                 (|:| |dext|
                                                                      (|PositiveInteger|))
                                                                 (|:| |alpha|
                                                                      (|Expression|
                                                                       (|Integer|)))
                                                                 (|:| |rami|
                                                                      (|UnivariatePolynomial|
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (|Expression|
                                                                        (|Integer|))))))))
                                                             #4#))
                                           (QREFELT $ 226)))))
                         (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (PROGN (LETT #1# (CONS 0 |res|)) (GO #6=#:G824)))))
              ('T
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |i| NIL) (LETT #3# |fnr|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (PROG2
                                               (LETT #2#
                                                     (|LODOF2;factor_riccati|
                                                      |i| |factorizer| |option|
                                                      $))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 1)
                                                             (|List|
                                                              (|Union|
                                                               (|LinearOrdinaryDifferentialOperator3|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (|UnivariateTaylorSeries|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (QREFELT $ 6)
                                                                 (QREFELT $ 7))
                                                                (|UnivariateLaurentSeries|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (QREFELT $ 6)
                                                                 (QREFELT $
                                                                          7)))
                                                               (|Record|
                                                                (|:| |ope|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))))
                                                                (|:| |dext|
                                                                     (|PositiveInteger|))
                                                                (|:| |alpha|
                                                                     (|Expression|
                                                                      (|Integer|)))
                                                                (|:| |rami|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (|Expression|
                                                                       (|Integer|)))))))
                                                             (|Union|
                                                              (|List|
                                                               (|Record|
                                                                (|:| |op|
                                                                     (|LinearOrdinaryDifferentialOperator3|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (|UnivariateTaylorSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))
                                                                      (|UnivariateLaurentSeries|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (QREFELT
                                                                        $ 7))))
                                                                (|:| |ram|
                                                                     (|UnivariatePolynomial|
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (|Expression|
                                                                       (|Integer|))))
                                                                (|:| |expart|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7)))))
                                                              (|List|
                                                               (|Union|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7)))
                                                                (|Record|
                                                                 (|:| |ope|
                                                                      (|LinearOrdinaryDifferentialOperator3|
                                                                       (|Expression|
                                                                        (|Integer|))
                                                                       (|UnivariateTaylorSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $ 7))
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (QREFELT
                                                                         $ 6)
                                                                        (QREFELT
                                                                         $
                                                                         7))))
                                                                 (|:| |dext|
                                                                      (|PositiveInteger|))
                                                                 (|:| |alpha|
                                                                      (|Expression|
                                                                       (|Integer|)))
                                                                 (|:| |rami|
                                                                      (|UnivariatePolynomial|
                                                                       (QREFELT
                                                                        $ 6)
                                                                       (|Expression|
                                                                        (|Integer|))))))))
                                                             #2#))
                                           (QREFELT $ 229)))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (PROGN (LETT #1# (CONS 1 |res|)) (GO #6#)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfo;LodoMSU;38|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (|LODOF2;factor_op| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;make_rightfactor|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|ric| |Record|
          (|:| |ope|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dext| (|PositiveInteger|))
          (|:| |alpha| (|Expression| (|Integer|)))
          (|:| |rami|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG ((#1=#:G837 NIL) (|d| (|PositiveInteger|)))
               (SEQ
                (EXIT
                 (SEQ (LETT |d| (SPADCALL (QVELT |ric| 3) (QREFELT $ 75)))
                      (LETT |d| (* |d| (QVELT |ric| 1)))
                      (COND
                       ((EQL |d| (SPADCALL |f| (QREFELT $ 41)))
                        (PROGN (LETT #1# |f|) (GO #2=#:G836))))
                      (EXIT (|LODOF2;lift_rightfactor| |d| |ric| $))))
                #2# (EXIT #1#)))) 

(SDEFUN |LODOF2;lift_rightfactor|
        ((|order| |PositiveInteger|)
         (|ric| |Record|
          (|:| |ope|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dext| (|PositiveInteger|))
          (|:| |alpha| (|Expression| (|Integer|)))
          (|:| |rami|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G923 NIL) (|i| NIL)
          (|num|
           #2=(|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                         |cen|))
          (#3=#:G922 NIL)
          (|coefs|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#4=#:G921 NIL) (#5=#:G920 NIL) (|den| #2#) (#6=#:G919 NIL) (|k| NIL)
          (#7=#:G918 NIL) (|j| NIL) (#8=#:G917 NIL)
          (|nums|
           (|List|
            (|SquareMatrix| |order|
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|))))
          (#9=#:G916 NIL) (#10=#:G915 NIL)
          (|denm|
           (|SquareMatrix| |order|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
          (#11=#:G914 NIL) (#12=#:G913 NIL)
          (|ll|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#13=#:G912 NIL) (#14=#:G911 NIL) (#15=#:G910 NIL) (#16=#:G909 NIL)
          (|nsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#17=#:G908 NIL)
          (|ser|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#18=#:G907 NIL) (#19=#:G906 NIL)
          (|pa| (|Vector| (|Expression| (|Integer|)))) (#20=#:G905 NIL)
          (#21=#:G904 NIL)
          (|system|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#22=#:G903 NIL) (#23=#:G902 NIL)
          (|cst|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (#24=#:G901 NIL) (#25=#:G900 NIL)
          (|nn| (|Stream| (|NonNegativeInteger|)))
          (|sysram|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#26=#:G899 NIL) (#27=#:G898 NIL) (|mindg| (|Integer|))
          (|rp|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#28=#:G897 NIL)
          (|s|
           (|Vector|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|r|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ram| (|NonNegativeInteger|)) (|cric| (|Expression| (|Integer|))))
         (SEQ (LETT |cric| (SPADCALL (QVELT |ric| 3) (QREFELT $ 192)))
              (LETT |ram| (SPADCALL (QVELT |ric| 3) (QREFELT $ 75)))
              (LETT |r|
                    (SPADCALL (SPADCALL (QVELT |ric| 0) 0 (QREFELT $ 54))
                              (QREFELT $ 216)))
              (LETT |rp| (|spadConstant| $ 14))
              (LETT |s| (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20)))
              (SPADCALL |s| 1 (|spadConstant| $ 14) (QREFELT $ 252))
              (LETT |mindg| 0)
              (SEQ (LETT |i| 1) (LETT #28# |order|) G190
                   (COND ((|greater_SI| |i| #28#) (GO G191)))
                   (SEQ
                    (LETT |rp|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT $ 253))
                                      (|spadConstant| $ 20) |rp|
                                      (QREFELT $ 254))
                            (SPADCALL |r| |rp| (QREFELT $ 255))
                            (QREFELT $ 223))
                           (SPADCALL |ram| (QREFELT $ 78)) (QREFELT $ 256)))
                    (SPADCALL |s| (+ |i| 1) |rp| (QREFELT $ 252))
                    (EXIT
                     (LETT |mindg|
                           (MIN |mindg| (SPADCALL |rp| 0 (QREFELT $ 42))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL (CONS #'|LODOF2;lift_rightfactor!0| (VECTOR |mindg| $))
                        |s| (QREFELT $ 259))
              (LETT |sysram|
                    (PROGN
                     (LETT #27# NIL)
                     (SEQ (LETT |i| 1) (LETT #26# |ram|) G190
                          (COND ((|greater_SI| |i| #26#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #27#
                                  (CONS
                                   (MAKEARR1 (+ |order| 1)
                                             (|spadConstant| $ 20))
                                   #27#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #27#)))))
              (LETT |nn|
                    (SPADCALL (CONS #'|LODOF2;lift_rightfactor!1| $) 0
                              (QREFELT $ 263)))
              (SEQ (LETT |i| 1) (LETT #25# |ram|) G190
                   (COND ((|greater_SI| |i| #25#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #24# (+ |order| 1)) G190
                          (COND ((|greater_SI| |j| #24#) (GO G191)))
                          (SEQ (LETT |ser| (SPADCALL |s| |j| (QREFELT $ 264)))
                               (LETT |cst|
                                     (SPADCALL
                                      (CONS #'|LODOF2;lift_rightfactor!2|
                                            (VECTOR |cric| |ser| |ram| $ |i|))
                                      |nn| (QREFELT $ 269)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |sysram| |i| (QREFELT $ 271)) |j|
                                 (SPADCALL |cst| (QREFELT $ 122))
                                 (QREFELT $ 252))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |system|
                    (PROGN
                     (LETT #23# NIL)
                     (SEQ (LETT |i| 1) (LETT #22# |order|) G190
                          (COND ((|greater_SI| |i| #22#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #23#
                                  (CONS
                                   (MAKEARR1 (+ |order| 1)
                                             (|spadConstant| $ 20))
                                   #23#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #23#)))))
              (LETT |pa|
                    (PROGN
                     (LETT #21# (GETREFV #29=(QVELT |ric| 1)))
                     (SEQ (LETT |i| 0) (LETT #20# (- #29# 1)) G190
                          (COND ((|greater_SI| |i| #20#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #21# |i|
                                    (SPADCALL (QVELT |ric| 2) |i|
                                              (QREFELT $ 233)))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     #21#))
              (SEQ (LETT |i| 1) (LETT #19# |ram|) G190
                   (COND ((|greater_SI| |i| #19#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #18# (+ |order| 1)) G190
                          (COND ((|greater_SI| |j| #18#) (GO G191)))
                          (SEQ
                           (LETT |ser|
                                 (SPADCALL
                                  (SPADCALL |sysram| |i| (QREFELT $ 271)) |j|
                                  (QREFELT $ 264)))
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #17# (QVELT |ric| 1)) G190
                                 (COND ((|greater_SI| |k| #17#) (GO G191)))
                                 (SEQ
                                  (LETT |nsr|
                                        (SPADCALL
                                         (CONS #'|LODOF2;lift_rightfactor!3|
                                               (VECTOR |k| $ |pa|))
                                         |ser| (QREFELT $ 280)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL |system|
                                              (+ (* (- |i| 1) (QVELT |ric| 1))
                                                 |k|)
                                              (QREFELT $ 271))
                                    |j| |nsr| (QREFELT $ 252))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |ll|
                    (PROGN
                     (LETT #16# NIL)
                     (SEQ (LETT |j| 1) (LETT #15# |order|) G190
                          (COND ((|greater_SI| |j| #15#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #16#
                                  (CONS
                                   (PROGN
                                    (LETT #14# NIL)
                                    (SEQ (LETT |i| 1) (LETT #13# |order|) G190
                                         (COND
                                          ((|greater_SI| |i| #13#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #14#
                                                 (CONS (|spadConstant| $ 20)
                                                       #14#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #14#))))
                                   #16#))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT (NREVERSE #16#)))))
              (SEQ (LETT |i| 1) (LETT #12# |order|) G190
                   (COND ((|greater_SI| |i| #12#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #11# |order|) G190
                          (COND ((|greater_SI| |j| #11#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL (SPADCALL |ll| |i| (QREFELT $ 282)) |j|
                                      (SPADCALL
                                       (SPADCALL |system| |i| (QREFELT $ 271))
                                       |j| (QREFELT $ 264))
                                      (QREFELT $ 283))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |denm|
                    (SPADCALL (SPADCALL |ll| (QREFELT $ 285))
                              (|compiledLookupCheck| '|squareMatrix|
                                                     (LIST '$
                                                           (LIST '|Matrix|
                                                                 (LIST
                                                                  '|UnivariateLaurentSeries|
                                                                  (LIST
                                                                   '|Expression|
                                                                   (LIST
                                                                    '|Integer|))
                                                                  (|devaluate|
                                                                   (ELT $ 6))
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        7)))))
                                                     (|SquareMatrix| |order|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (ELT $ 6)
                                                                      (ELT $
                                                                           7))))))
              (LETT |nums|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |i| 1) (LETT #9# |order|) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|empty| (LIST '$)
                                                           (|SquareMatrix|
                                                            |order|
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (ELT $ 6)
                                                             (ELT $ 7)))))
                                   #10#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #10#)))))
              (SEQ (LETT |i| 1) (LETT #8# |order|) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #7# |order|) G190
                         (COND ((|greater_SI| |j| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |k| 1) (LETT #6# |order|) G190
                                (COND ((|greater_SI| |k| #6#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL |k| |i|)
                                    (SPADCALL
                                     (SPADCALL |ll| |j| (QREFELT $ 282)) |k|
                                     (SPADCALL
                                      (SPADCALL |system| |j| (QREFELT $ 271))
                                      (+ |order| 1) (QREFELT $ 264))
                                     (QREFELT $ 283)))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL |ll| |j| (QREFELT $ 282)) |k|
                                     (SPADCALL
                                      (SPADCALL |system| |j| (QREFELT $ 271))
                                      |k| (QREFELT $ 264))
                                     (QREFELT $ 283))))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |nums| |i|
                               (SPADCALL (SPADCALL |ll| (QREFELT $ 285))
                                         (|compiledLookupCheck| '|squareMatrix|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|UnivariateLaurentSeries|
                                                                        (LIST
                                                                         '|Expression|
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7)))))
                                                                (|SquareMatrix|
                                                                 |order|
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (ELT $ 6)
                                                                  (ELT $ 7)))))
                               (|compiledLookupCheck| '|setelt!|
                                                      (LIST
                                                       (LIST '|SquareMatrix|
                                                             |order|
                                                             (LIST
                                                              '|UnivariateLaurentSeries|
                                                              (LIST
                                                               '|Expression|
                                                               (LIST
                                                                '|Integer|))
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              (|devaluate|
                                                               (ELT $ 7))))
                                                       '$ (LIST '|Integer|)
                                                       (LIST '|SquareMatrix|
                                                             |order|
                                                             (LIST
                                                              '|UnivariateLaurentSeries|
                                                              (LIST
                                                               '|Expression|
                                                               (LIST
                                                                '|Integer|))
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              (|devaluate|
                                                               (ELT $ 7)))))
                                                      (|List|
                                                       (|SquareMatrix| |order|
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (ELT $
                                                                             6)
                                                                        (ELT $
                                                                             7))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |den|
                    (SPADCALL |denm|
                              (|compiledLookupCheck| '|minordet|
                                                     (LIST
                                                      (LIST
                                                       '|UnivariateLaurentSeries|
                                                       (LIST '|Expression|
                                                             (LIST '|Integer|))
                                                       (|devaluate| (ELT $ 6))
                                                       (|devaluate| (ELT $ 7)))
                                                      '$)
                                                     (|SquareMatrix| |order|
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (ELT $ 6)
                                                                      (ELT $
                                                                           7))))))
              (LETT |coefs|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |order|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT (LETT #5# (CONS (|spadConstant| $ 20) #5#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (SEQ (LETT |i| 1) (LETT #3# |order|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |num|
                          (SPADCALL
                           (SPADCALL |nums| |i|
                                     (|compiledLookupCheck| '|elt|
                                                            (LIST
                                                             (LIST
                                                              '|SquareMatrix|
                                                              |order|
                                                              (LIST
                                                               '|UnivariateLaurentSeries|
                                                               (LIST
                                                                '|Expression|
                                                                (LIST
                                                                 '|Integer|))
                                                               (|devaluate|
                                                                (ELT $ 6))
                                                               (|devaluate|
                                                                (ELT $ 7))))
                                                             '$
                                                             (LIST '|Integer|))
                                                            (|List|
                                                             (|SquareMatrix|
                                                              |order|
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (ELT $ 6)
                                                               (ELT $ 7))))))
                           (|compiledLookupCheck| '|minordet|
                                                  (LIST
                                                   (LIST
                                                    '|UnivariateLaurentSeries|
                                                    (LIST '|Expression|
                                                          (LIST '|Integer|))
                                                    (|devaluate| (ELT $ 6))
                                                    (|devaluate| (ELT $ 7)))
                                                   '$)
                                                  (|SquareMatrix| |order|
                                                                  (|UnivariateLaurentSeries|
                                                                   (|Expression|
                                                                    (|Integer|))
                                                                   (ELT $ 6)
                                                                   (ELT $
                                                                        7))))))
                    (EXIT
                     (SPADCALL |coefs| |i|
                               (SPADCALL (SPADCALL |num| |den| (QREFELT $ 257))
                                         (QREFELT $ 216))
                               (QREFELT $ 283))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (|spadConstant| $ 14) |order| (QREFELT $ 34)))
              (SEQ (LETT |i| 0) (LETT #1# (- |order| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |coefs| (+ |i| 1)
                                                (QREFELT $ 115))
                                      |i| (QREFELT $ 34))
                                     (QREFELT $ 35)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;lift_rightfactor!3| ((|x| NIL) ($$ NIL))
        (PROG (|pa| $ |k|)
          (LETT |pa| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G857 NIL) (|psq| NIL))
                   (SEQ (LETT |psq| (SPADCALL |pa| |x| (QREFELT $ 275)))
                        (EXIT
                         (COND
                          ((SPADCALL |psq| (CONS 1 "failed") (QREFELT $ 276))
                           |x|)
                          ('T
                           (SPADCALL
                            (SPADCALL
                             (PROG2 (LETT #1# |psq|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|Vector|
                                                (|Fraction| (|Integer|)))
                                               (|Union|
                                                (|Vector|
                                                 (|Fraction| (|Integer|)))
                                                "failed")
                                               #1#))
                             |k| (QREFELT $ 278))
                            (QREFELT $ 247))))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!2| ((|x| NIL) ($$ NIL))
        (PROG (|i| $ |ram| |ser| |cric|)
          (LETT |i| (QREFELT $$ 4))
          (LETT $ (QREFELT $$ 3))
          (LETT |ram| (QREFELT $$ 2))
          (LETT |ser| (QREFELT $$ 1))
          (LETT |cric| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|dg| NIL))
                   (SEQ
                    (LETT |dg|
                          (SPADCALL
                           (SPADCALL |i| (|spadConstant| $ 175)
                                     (QREFELT $ 138))
                           (SPADCALL |x| |ram| (QREFELT $ 265))
                           (QREFELT $ 134)))
                    (EXIT
                     (CONS |x|
                           (SPADCALL (SPADCALL |ser| |dg| (QREFELT $ 57))
                                     (SPADCALL |cric| |x| (QREFELT $ 266))
                                     (QREFELT $ 79)))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!1| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 175) (QREFELT $ 260))) 

(SDEFUN |LODOF2;lift_rightfactor!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |mindg|)
          (LETT $ (QREFELT $$ 1))
          (LETT |mindg| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (|spadConstant| $ 12) |mindg| (QREFELT $ 149))
                      (QREFELT $ 257)))))) 

(SDEFUN |LODOF2;same_charclass?|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|g| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G959 NIL) (#2=#:G962 NIL) (|i| NIL)
          (|fff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|ffnp|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|ff|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G454 NIL)
          (|gr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|rr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|gg|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G455 NIL) (#5=#:G947 NIL)
          (|r|
           (|List|
            (|List|
             (|Record|
              (|:| |point|
                   (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
              (|:| |slope| (|Fraction| (|Integer|)))
              (|:| |npoly|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G961 NIL) (|j| NIL) (#7=#:G960 NIL)
          (|cx| (|Expression| (|Integer|))) (|fd| (|Expression| (|Integer|)))
          (|dm1| (|NonNegativeInteger|)) (|d| (|NonNegativeInteger|))
          (|c2| #8=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c| #8#)
          (|r21|
           #9=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (|r11| #9#)
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41))
                        (SPADCALL |g| (QREFELT $ 41)) (QREFELT $ 208))
              (PROGN (LETT #1# NIL) (GO #10=#:G958))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 286))
              (LETT |f|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 257))
                     |f| (QREFELT $ 160)))))
            (COND
             ((SPADCALL (SPADCALL |g| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 286))
              (LETT |g|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |g| (QREFELT $ 37)) (QREFELT $ 257))
                     |g| (QREFELT $ 160)))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 41)) 1)
              (SEQ
               (LETT |il|
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| |g| (QREFELT $ 168)) 0
                                (QREFELT $ 54))
                      0 (QREFELT $ 215)))
               (EXIT
                (PROGN
                 (LETT #1#
                       (COND
                        ((EQL (SPADCALL |il| 0 (QREFELT $ 42)) 0)
                         (SPADCALL (SPADCALL |il| 0 (QREFELT $ 57))
                                   (QREFELT $ 81)))
                        ('T NIL)))
                 (GO #10#))))))
            (LETT |r|
                  (SPADCALL (CONS (|function| |LODOF2;newtonpolygon|) $)
                            (LIST |f| |g|) (QREFELT $ 294)))
            (LETT |r11|
                  (SPADCALL (SPADCALL |r| 1 (QREFELT $ 295)) 1
                            (QREFELT $ 196)))
            (LETT |r21|
                  (SPADCALL (SPADCALL |r| 2 (QREFELT $ 295)) 1
                            (QREFELT $ 196)))
            (COND
             ((SPADCALL (QVELT |r11| 1) (|spadConstant| $ 68) (QREFELT $ 111))
              (SEQ (LETT |c| (QVELT |r11| 2)) (LETT |c2| (QVELT |r21| 2))
                   (LETT |d| (SPADCALL |c| (QREFELT $ 75)))
                   (LETT |dm1| (- |d| 1))
                   (LETT |fd| (SPADCALL |d| (QREFELT $ 78)))
                   (LETT |cx|
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| |dm1| (QREFELT $ 76))
                                    (SPADCALL |c2| |dm1| (QREFELT $ 76))
                                    (QREFELT $ 77))
                          |fd| (QREFELT $ 79)))
                   (COND
                    ((NULL (SPADCALL |cx| (QREFELT $ 81)))
                     (PROGN (LETT #1# NIL) (GO #10#))))
                   (EXIT
                    (LETT |r|
                          (LIST
                           (CONS
                            (VECTOR (QVELT |r11| 0) (QVELT |r11| 1)
                                    (SPADCALL (QVELT |r11| 2)
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                               (SPADCALL |cx| (QREFELT $ 232))
                                               (QREFELT $ 86))
                                              (QREFELT $ 85)))
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT |j| 2)
                                  (LETT #6#
                                        (LENGTH
                                         (SPADCALL |r| 1 (QREFELT $ 295))))
                                  G190
                                  (COND ((|greater_SI| |j| #6#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |r| 1 (QREFELT $ 295))
                                            |j| (QREFELT $ 196))
                                           #7#))))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT (NREVERSE #7#)))))
                           (SPADCALL |r| 2 (QREFELT $ 295))))))))
            (COND
             ((SPADCALL (SPADCALL |r| 1 (QREFELT $ 295))
                        (SPADCALL |r| 2 (QREFELT $ 295)) (QREFELT $ 296))
              (PROGN (LETT #1# NIL) (GO #10#))))
            (LETT |gg|
                  (PROG2
                      (LETT #4#
                            (SPADCALL
                             (PROG2
                                 (LETT #5#
                                       (|LODOF2;factor_op| |g| |factorizer|
                                        "alg factor" $))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 1)
                                               (|List|
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #5#))
                             (QREFELT $ 200)))
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 1)
                                    (|Record|
                                     (|:| |ope|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))))
                                     (|:| |dext| (|PositiveInteger|))
                                     (|:| |alpha| (|Expression| (|Integer|)))
                                     (|:| |rami|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|)))))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                    #4#)))
            (LETT |rr|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QVELT |gg| 0) 0 (QREFELT $ 54)) 0
                             (QREFELT $ 215))
                   (QREFELT $ 216)))
            (LETT |gr| (QVELT |gg| 3))
            (LETT |ff|
                  (PROG2
                      (LETT #3#
                            (|LODOF2;substitute| (CONS 1 |rr|)
                             (CONS 0
                                   (|LODOF2;ramification_of| |f|
                                    (SPADCALL |gr| (QREFELT $ 192))
                                    (SPADCALL |gr| (QREFELT $ 75)) $))
                             $))
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 0)
                                    (|LinearOrdinaryDifferentialOperator3|
                                     (|Expression| (|Integer|))
                                     (|UnivariateTaylorSeries|
                                      (|Expression| (|Integer|)) (QREFELT $ 6)
                                      (QREFELT $ 7))
                                     (|UnivariateLaurentSeries|
                                      (|Expression| (|Integer|)) (QREFELT $ 6)
                                      (QREFELT $ 7)))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                    #3#)))
            (LETT |ffnp| (|LODOF2;newtonpolygon| |ff| $))
            (COND
             ((SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 196)) 1)
                        (|spadConstant| $ 68) (QREFELT $ 69))
              (PROGN (LETT #1# NIL) (GO #10#))))
            (LETT |fff|
                  (SPADCALL
                   (|LODOF2;factorUP|
                    (SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 196)) 2)
                              (SPADCALL
                               (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 196)) 2)
                               (QREFELT $ 192))
                              (QREFELT $ 297))
                    |factorizer| $)
                   (QREFELT $ 205)))
            (SEQ (LETT |i| NIL) (LETT #2# |fff|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (SPADCALL (QVELT |i| 1) (QREFELT $ 75)) 1)
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL (QVELT |i| 1) 0 (QREFELT $ 76))
                                  (SPADCALL (QVELT |i| 1) 1 (QREFELT $ 76))
                                  (QREFELT $ 79))
                        (QREFELT $ 81))
                       (PROGN (LETT #1# 'T) (GO #10#))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #10# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsc;2LodoMB;42|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|g| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Boolean|))
        (|LODOF2;same_charclass?| (|LODOF2;convertL3toLL| |f| $)
         (|LODOF2;convertL3toLL| |g| $) |factorizer| $)) 

(SDEFUN |LODOF2;try_factorization|
        ((|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|max_order| |Integer|) (|bound| |List| (|Fraction| (|Integer|)))
         (|sng| |Record|
          (|:| |point| (|Union| (|Expression| (|Integer|)) #1="infinity"))
          (|:| |lpf|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dxt| (|PositiveInteger|)))
         (|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|eb| |Integer|) (|min_order| |Integer|) (|option| |String|)
         ($ |Union|
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          "failed"))
        (SPROG
         ((#2=#:G1004 NIL)
          (|re|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|srl|
           #3=(|LinearOrdinaryDifferentialOperator1|
               (|Fraction|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G985 NIL) (|ftmp| #3#)
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #5=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #5#) (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|old_x| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|zero_sing| (|Boolean|))
          (|sr|
           #6=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariatePolynomial|
                                                      |var|
                                                      (|Expression|
                                                       (|Integer|)))
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       |var|
                                                       (|Expression|
                                                        (|Integer|))))))
          (#7=#:G982 NIL) (#8=#:G981 #6#) (#9=#:G983 #6#) (#10=#:G1016 NIL)
          (|j| NIL)
          (|flm|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#11=#:G976 NIL)
          (|tf2|
           (|Union|
            (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            #12="failed"))
          (|n| (|Integer|))
          (|flst|
           (|List|
            (|List|
             (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                       |cen|))))
          (#13=#:G1015 NIL) (|fc| NIL) (#14=#:G1014 NIL) (#15=#:G1013 NIL)
          (|ff| NIL) (#16=#:G1012 NIL)
          (|fls|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#17=#:G1011 NIL) (#18=#:G1010 NIL) (#19=#:G1009 NIL)
          (#20=#:G1008 NIL) (#21=#:G1007 NIL) (#22=#:G1006 NIL)
          (#23=#:G1005 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (MAX (SPADCALL |r| (QREFELT $ 41)) |min_order|))
                 (LETT #23# |max_order|) G190 (COND ((> |i| #23#) (GO G191)))
                 (SEQ (LETT |fls| (|LODOF2;flist| |r| |i| $)) (LETT |n| 0)
                      (SEQ (LETT |ff| NIL) (LETT #22# |fls|) G190
                           (COND
                            ((OR (ATOM #22#)
                                 (PROGN (LETT |ff| (CAR #22#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |fc| NIL) (LETT #21# |ff|) G190
                                  (COND
                                   ((OR (ATOM #21#)
                                        (PROGN (LETT |fc| (CAR #21#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |n|
                                          (MIN |n|
                                               (SPADCALL |fc| 0
                                                         (QREFELT $ 42))))))
                                  (LETT #21# (CDR #21#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #22# (CDR #22#)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((< |n| 0)
                        (LETT |fls|
                              (PROGN
                               (LETT #20# NIL)
                               (SEQ (LETT |ff| NIL) (LETT #19# |fls|) G190
                                    (COND
                                     ((OR (ATOM #19#)
                                          (PROGN (LETT |ff| (CAR #19#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #20#
                                            (CONS
                                             (PROGN
                                              (LETT #18# NIL)
                                              (SEQ (LETT |fc| NIL)
                                                   (LETT #17# |ff|) G190
                                                   (COND
                                                    ((OR (ATOM #17#)
                                                         (PROGN
                                                          (LETT |fc|
                                                                (CAR #17#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #18#
                                                           (CONS
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (|spadConstant| $
                                                                              12)
                                                              (- |n|)
                                                              (QREFELT $ 149))
                                                             |fc|
                                                             (QREFELT $ 255))
                                                            #18#))))
                                                   (LETT #17# (CDR #17#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #18#))))
                                             #20#))))
                                    (LETT #19# (CDR #19#)) (GO G190) G191
                                    (EXIT (NREVERSE #20#)))))))
                      (LETT |flst|
                            (PROGN
                             (LETT #16# NIL)
                             (SEQ (LETT |ff| NIL) (LETT #15# |fls|) G190
                                  (COND
                                   ((OR (ATOM #15#)
                                        (PROGN (LETT |ff| (CAR #15#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #16#
                                          (CONS
                                           (PROGN
                                            (LETT #14# NIL)
                                            (SEQ (LETT |fc| NIL)
                                                 (LETT #13# |ff|) G190
                                                 (COND
                                                  ((OR (ATOM #13#)
                                                       (PROGN
                                                        (LETT |fc| (CAR #13#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #14#
                                                         (CONS
                                                          (SPADCALL |fc|
                                                                    (QREFELT $
                                                                             299))
                                                          #14#))))
                                                 (LETT #13# (CDR #13#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #14#))))
                                           #16#))))
                                  (LETT #15# (CDR #15#)) (GO G190) G191
                                  (EXIT (NREVERSE #16#)))))
                      (LETT |n| (LENGTH |flst|))
                      (LETT |tf2|
                            (|LODOF2;try_factorization2| |flst| |n| |bound|
                             |eb| $))
                      (EXIT
                       (COND
                        ((SPADCALL |tf2| (CONS 1 "failed") (QREFELT $ 301))
                         (SEQ
                          (LETT |flm|
                                (PROG2 (LETT #11# |tf2|)
                                    (QCDR #11#)
                                  (|check_union2| (QEQCAR #11# 0)
                                                  (|List|
                                                   (|SparseUnivariatePolynomial|
                                                    (|Expression|
                                                     (|Integer|))))
                                                  (|Union|
                                                   (|List|
                                                    (|SparseUnivariatePolynomial|
                                                     (|Expression|
                                                      (|Integer|))))
                                                   #12#)
                                                  #11#)))
                          (LETT |sr|
                                (PROGN
                                 (LETT #7# NIL)
                                 (SEQ (LETT |j| 0)
                                      (LETT #10# (- (LENGTH |flm|) 1)) G190
                                      (COND
                                       ((|greater_SI| |j| #10#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #9#
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |flm| (+ |j| 1)
                                                            (QREFELT $ 303))
                                                  (QREFELT $ 101))
                                                 (QREFELT $ 237))
                                                (SPADCALL
                                                 (|spadConstant| $ 304) |j|
                                                 (QREFELT $ 305))
                                                (QREFELT $ 306)))
                                         (COND
                                          (#7#
                                           (LETT #8#
                                                 (SPADCALL #8# #9#
                                                           (QREFELT $ 307))))
                                          ('T
                                           (PROGN
                                            (LETT #8# #9#)
                                            (LETT #7# 'T)))))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#7# #8#) ('T (|spadConstant| $ 22)))))
                          (LETT |sr|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 304)
                                           (SPADCALL |sr| (QREFELT $ 26))
                                           (QREFELT $ 310))
                                 |sr| (QREFELT $ 306)))
                          (COND
                           ((EQUAL |option| "use adjoint")
                            (LETT |sr| (SPADCALL |sr| (QREFELT $ 311)))))
                          (LETT |srl| (SPADCALL |sr| (QREFELT $ 314)))
                          (LETT |zero_sing|
                                (COND
                                 ((QEQCAR (QVELT |sng| 0) 0)
                                  (SPADCALL
                                   (PROG2 (LETT #4# (QVELT |sng| 0))
                                       (QCDR #4#)
                                     (|check_union2| (QEQCAR #4# 0)
                                                     (|Expression| (|Integer|))
                                                     (|Union|
                                                      (|Expression|
                                                       (|Integer|))
                                                      #1#)
                                                     #4#))
                                   (|spadConstant| $ 19) (QREFELT $ 242)))
                                 ('T NIL)))
                          (COND
                           ((NULL |zero_sing|)
                            (SEQ (LETT |ftmp| |srl|)
                                 (LETT |srl| (|spadConstant| $ 315))
                                 (LETT |old_x|
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58)))
                                 (LETT |newx|
                                       (COND
                                        ((SPADCALL (QVELT |sng| 0)
                                                   (CONS 1 "infinity")
                                                   (QREFELT $ 317))
                                         (SPADCALL (|spadConstant| $ 153)
                                                   |old_x| (QREFELT $ 318)))
                                        ('T
                                         (SPADCALL
                                          (SPADCALL |old_x|
                                                    (SPADCALL
                                                     (PROG2
                                                         (LETT #4#
                                                               (QVELT |sng| 0))
                                                         (QCDR #4#)
                                                       (|check_union2|
                                                        (QEQCAR #4# 0)
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|Union|
                                                         (|Expression|
                                                          (|Integer|))
                                                         #1#)
                                                        #4#))
                                                     (QREFELT $ 232))
                                                    (QREFELT $ 86))
                                          (QREFELT $ 237)))))
                                 (LETT |newd|
                                       (COND
                                        ((SPADCALL (QVELT |sng| 0)
                                                   (CONS 1 "infinity")
                                                   (QREFELT $ 317))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |old_x| 2
                                                      (QREFELT $ 319))
                                            (QREFELT $ 237))
                                           (SPADCALL (QREFELT $ 320))
                                           (QREFELT $ 321))
                                          (QREFELT $ 322)))
                                        ('T (SPADCALL (QREFELT $ 320)))))
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL |ftmp|
                                                    (|spadConstant| $ 315)
                                                    (QREFELT $ 323)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |lc|
                                              (SPADCALL |ftmp|
                                                        (QREFELT $ 324)))
                                        (LETT |dg|
                                              (SPADCALL |ftmp|
                                                        (QREFELT $ 325)))
                                        (LETT |lcn|
                                              (|LODOF2;subsup|
                                               (SPADCALL |lc| (QREFELT $ 29))
                                               |newx| $))
                                        (LETT |lcd|
                                              (|LODOF2;subsup|
                                               (SPADCALL |lc| (QREFELT $ 27))
                                               |newx| $))
                                        (LETT |slc|
                                              (SPADCALL |lcn| |lcd|
                                                        (QREFELT $ 310)))
                                        (LETT |srl|
                                              (SPADCALL |srl|
                                                        (SPADCALL |slc|
                                                                  (SPADCALL
                                                                   |newd| |dg|
                                                                   (QREFELT $
                                                                            326))
                                                                  (QREFELT $
                                                                           321))
                                                        (QREFELT $ 327)))
                                        (EXIT
                                         (LETT |ftmp|
                                               (SPADCALL |ftmp|
                                                         (QREFELT $ 328)))))
                                       NIL (GO G190) G191 (EXIT NIL))))))
                          (EXIT
                           (COND
                            ((SPADCALL |option| "use adjoint" (QREFELT $ 329))
                             (SEQ
                              (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 330)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |re| (QREFELT $ 325)) 0
                                           (QREFELT $ 48))
                                 (PROGN
                                  (LETT #2#
                                        (CONS 0
                                              (LIST
                                               (SPADCALL |f| |re|
                                                         (QREFELT $ 331))
                                               |re|)))
                                  (GO #24=#:G1003)))))))
                            ('T
                             (SEQ
                              (COND
                               ((SPADCALL (QVELT |sng| 0) (CONS 1 "infinity")
                                          (QREFELT $ 317))
                                (LETT |re|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 153)
                                                 (SPADCALL
                                                  (|spadConstant| $ 12)
                                                  (SPADCALL |f|
                                                            (QREFELT $ 325))
                                                  (QREFELT $ 58))
                                                 (QREFELT $ 318))
                                       (QREFELT $ 332))))
                               ('T
                                (LETT |re|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 153)
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| $ 12) 1
                                                    (QREFELT $ 58))
                                                   (SPADCALL
                                                    (PROG2
                                                        (LETT #4#
                                                              (QVELT |sng| 0))
                                                        (QCDR #4#)
                                                      (|check_union2|
                                                       (QEQCAR #4# 0)
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|Union|
                                                        (|Expression|
                                                         (|Integer|))
                                                        #1#)
                                                       #4#))
                                                    (QREFELT $ 232))
                                                   (QREFELT $ 86))
                                                  (SPADCALL |f|
                                                            (QREFELT $ 325))
                                                  (QREFELT $ 70))
                                                 (QREFELT $ 318))
                                       (QREFELT $ 332)))))
                              (LETT |srl|
                                    (SPADCALL
                                     (SPADCALL |re|
                                               (SPADCALL |f| (QREFELT $ 324))
                                               (QREFELT $ 333))
                                     |srl| (QREFELT $ 334)))
                              (LETT |srl|
                                    (SPADCALL |srl|
                                              (SPADCALL (|spadConstant| $ 304)
                                                        (SPADCALL |srl|
                                                                  (QREFELT $
                                                                           324))
                                                        (QREFELT $ 310))
                                              (QREFELT $ 333)))
                              (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 335)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |re| (QREFELT $ 325)) 0
                                           (QREFELT $ 48))
                                 (PROGN
                                  (LETT #2#
                                        (CONS 0
                                              (LIST |re|
                                                    (SPADCALL |f| |re|
                                                              (QREFELT $
                                                                       336)))))
                                  (GO #24#))))))))))))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #24# (EXIT #2#)))) 

(SDEFUN |LODOF2;try_factorization2|
        ((|fl| |List|
          (|List|
           (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (|n| |Integer|) (|bound| |List| (|Fraction| (|Integer|)))
         (|eb| |Integer|)
         ($ |Union|
          (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          "failed"))
        (SPROG
         ((|nstep| (|Integer|)) (|acc| (|Integer|)) (#1=#:G1029 NIL)
          (|hps|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|lv|
           (|List|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
          (#2=#:G1035 NIL) (|g| NIL) (#3=#:G1034 NIL) (#4=#:G1033 NIL)
          (|f| NIL) (#5=#:G1032 NIL) (|vdim| (|NonNegativeInteger|))
          (|cnt| (|Integer|)) (|eta| (|List| (|NonNegativeInteger|)))
          (#6=#:G1031 NIL) (|i| NIL) (#7=#:G1030 NIL) (|cb| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cb|
                  (+
                   (SPADCALL
                    (SPADCALL |bound| (- (LENGTH |fl|) 1) (QREFELT $ 338))
                    (QREFELT $ 189))
                   |eb|))
            (LETT |eta|
                  (PROGN
                   (LETT #7# NIL)
                   (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                        (COND ((|greater_SI| |i| #6#) (GO G191)))
                        (SEQ (EXIT (LETT #7# (CONS |cb| #7#))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #7#)))))
            (LETT |cnt| (SPADCALL (LENGTH |fl|) (+ |cb| 1) (QREFELT $ 56)))
            (LETT |vdim| (LENGTH (|SPADfirst| |fl|)))
            (LETT |acc| (QUOTIENT2 (+ (+ |cnt| |vdim|) 3) |vdim|))
            (LETT |nstep|
                  (SPADCALL
                   (SPADCALL (SPADCALL |acc| 2 (QREFELT $ 339)) 3
                             (QREFELT $ 51))
                   (QREFELT $ 189)))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |lv|
                         (PROGN
                          (LETT #5# NIL)
                          (SEQ (LETT |f| NIL) (LETT #4# |fl|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |f| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (SPADCALL
                                         (PROGN
                                          (LETT #3# NIL)
                                          (SEQ (LETT |g| NIL) (LETT #2# |f|)
                                               G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |g| (CAR #2#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #3#
                                                       (CONS
                                                        (SPADCALL
                                                         (|LODOF2;convertUTStoUP|
                                                          |g| |acc| $)
                                                         (QREFELT $ 100))
                                                        #3#))))
                                               (LETT #2# (CDR #2#)) (GO G190)
                                               G191 (EXIT (NREVERSE #3#))))
                                         (QREFELT $ 341))
                                        #5#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (LETT |hps| (SPADCALL |lv| |eta| |acc| (QREFELT $ 346)))
                   (EXIT
                    (COND
                     ((EQL (ANCOLS |hps|) 1)
                      (PROGN
                       (LETT #1#
                             (CONS 0
                                   (SPADCALL (SPADCALL |hps| 1 (QREFELT $ 347))
                                             (QREFELT $ 348))))
                       (GO #8=#:G1028)))
                     ((EQL (ANCOLS |hps|) 0)
                      (PROGN (LETT #1# (CONS 1 "failed")) (GO #8#)))
                     ('T
                      (SEQ (LETT |acc| (+ |acc| |nstep|))
                           (EXIT
                            (LETT |nstep|
                                  (+
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 2 (QREFELT $ 51))
                                              |nstep| (QREFELT $ 349))
                                    (QREFELT $ 187))
                                   2))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #1#)))) 

(SDEFUN |LODOF2;flist|
        ((|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|order| |Integer|)
         ($ |List|
          (|List|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                      |cen|))))
        (SPROG
         ((|res|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#1=#:G1043 NIL) (|j| NIL) (#2=#:G1042 NIL)
          (|p|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G1041 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 0) (LETT #3# |order|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |p| (|LODOF2;xDn_modr| |i| |r| $))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (LIST
                                          (PROGN
                                           (LETT #2# NIL)
                                           (SEQ (LETT |j| 0)
                                                (LETT #1#
                                                      (-
                                                       (SPADCALL |r|
                                                                 (QREFELT $
                                                                          41))
                                                       1))
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #1#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (SPADCALL |p| |j|
                                                                   (QREFELT $
                                                                            54))
                                                         #2#))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#)))))
                                         (QREFELT $ 350)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;xDn_modr|
        ((|n| |Integer|)
         (|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|coefa|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|a|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G1047 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| (SPADCALL |r| (QREFELT $ 41)))
              (PROGN
               (LETT #1# (SPADCALL (|spadConstant| $ 14) |n| (QREFELT $ 34)))
               (GO #2=#:G1046))))
            (LETT |a| (|LODOF2;xDn_modr| (- |n| 1) |r| $))
            (LETT |coefa|
                  (SPADCALL |a| (- (SPADCALL |r| (QREFELT $ 41)) 1)
                            (QREFELT $ 54)))
            (EXIT
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34)) |a|
                         (QREFELT $ 162))
               (SPADCALL |a| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34))
                         (QREFELT $ 162))
               (QREFELT $ 35))
              (SPADCALL |coefa| |r| (QREFELT $ 160)) (QREFELT $ 168)))))
          #2# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
          (|List| (|Expression| (|Integer|))))
         (|y| |List| (|Expression| (|Integer|)))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1063 NIL) (#2=#:G1064 NIL) (|i| NIL)
          (|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|b|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 325)) 1 (QREFELT $ 49))
              (PROGN (LETT #1# (LIST |f|)) (GO #3=#:G1062))))
            (LETT |factorizer2|
                  (CONS #'|LODOF2;factor;LodoMLL;47!0|
                        (VECTOR |factorizer| |y|)))
            (LETT |b| (|LODOF2;factor_global| |f| |factorizer2| $))
            (EXIT
             (COND ((EQL (LENGTH |b|) 1) (PROGN (LETT #1# |b|) (GO #3#)))
                   ('T
                    (SEQ
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |b| 1 (QREFELT $ 352))
                                      |factorizer| |y| (QREFELT $ 355))
                            (SPADCALL (SPADCALL |b| 2 (QREFELT $ 352))
                                      |factorizer| |y| (QREFELT $ 355))
                            (QREFELT $ 356)))
                     (SEQ (LETT |i| 3) (LETT #2# (LENGTH |b|)) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL |b| |i| (QREFELT $ 352))
                                       |factorizer| |y| (QREFELT $ 355))
                                      (QREFELT $ 357))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (EXIT (PROGN (LETT #1# |res|) (GO #3#)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1))
          (LETT |factorizer| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;inf_singularity?|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |Boolean|))
        (SPROG
         ((#2=#:G1071 NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#3=#:G1074 NIL) (|e| NIL) (#4=#:G1073 NIL)
          (|fi|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|yu|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #5=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #5#)
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#6=#:G1072 NIL) (|i| NIL)
          (|ux|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|ftmp| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |fi| (|spadConstant| $ 315)) (LETT |ftmp| |f|)
                (LETT |ux|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 12) 2 (QREFELT $ 58))
                        (QREFELT $ 237))
                       (QREFELT $ 358)))
                (LETT |yu| (|spadConstant| $ 359))
                (SEQ (LETT |i| 0) (LETT #6# (SPADCALL |f| (QREFELT $ 325)))
                     G190 (COND ((|greater_SI| |i| #6#) (GO G191)))
                     (SEQ (LETT |lc| (SPADCALL |f| |i| (QREFELT $ 360)))
                          (LETT |lcn|
                                (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 29))
                                 (SPADCALL (|spadConstant| $ 153)
                                           (SPADCALL (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58))
                                           (QREFELT $ 318))
                                 $))
                          (LETT |lcd|
                                (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 27))
                                 (SPADCALL (|spadConstant| $ 153)
                                           (SPADCALL (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58))
                                           (QREFELT $ 318))
                                 $))
                          (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 310)))
                          (LETT |fi|
                                (SPADCALL |fi|
                                          (SPADCALL |slc| |yu| (QREFELT $ 321))
                                          (QREFELT $ 327)))
                          (EXIT
                           (LETT |yu|
                                 (SPADCALL
                                  (SPADCALL |ux| (SPADCALL (QREFELT $ 320))
                                            (QREFELT $ 321))
                                  |yu| (QREFELT $ 334)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (LETT |fi|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 304)
                                 (SPADCALL |fi| (QREFELT $ 324))
                                 (QREFELT $ 310))
                       |fi| (QREFELT $ 321)))
                (LETT |dlc|
                      (PROGN
                       (LETT #4# NIL)
                       (SEQ (LETT |e| (SPADCALL |fi| (QREFELT $ 362)))
                            (LETT #3# (SPADCALL |fi| (QREFELT $ 325))) G190
                            (COND ((> |e| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |fi| |e| (QREFELT $ 360))
                                      (QREFELT $ 27))
                                     #4#))))
                            (LETT |e| (+ |e| 1)) (GO G190) G191
                            (EXIT (NREVERSE #4#)))))
                (COND
                 ((SPADCALL
                   (SPADCALL (SPADCALL |dlc| (QREFELT $ 363))
                             (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                             (|spadConstant| $ 52) (QREFELT $ 85))
                   (|spadConstant| $ 52) (QREFELT $ 87))
                  (PROGN (LETT #2# 'T) (GO #7=#:G1070))))
                (EXIT NIL)))
          #7# (EXIT #2#)))) 

(SDEFUN |LODOF2;testis;LodoB;49|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |Boolean|))
        (|LODOF2;inf_singularity?| |f| $)) 

(SDEFUN |LODOF2;factor_global|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1180 NIL) (#2=#:G1145 NIL)
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #3="failed"))
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#4=#:G454 NIL) (#5=#:G1204 NIL) (|l| NIL)
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G1126 NIL)
          (|kk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|jj|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#7=#:G455 NIL)
          (|j1|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|iarf1|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#8=#:G1203 NIL) (|s| NIL) (#9=#:G1202 NIL) (|sop| NIL)
          (#10=#:G1201 NIL) (#11=#:G1199 NIL) (#12=#:G1200 NIL) (|sa| NIL)
          (#13=#:G1198 NIL)
          (|done_sa|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point|
                        (|Union| (|Expression| (|Integer|)) #14="infinity"))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (#15=#:G1197 NIL) (|all_one| (|Boolean|)) (#16=#:G1196 NIL)
          (#17=#:G1194 NIL) (|ssp| NIL) (#18=#:G1195 NIL)
          (|done_s|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (|gem|
           #19=(|List|
                (|Record|
                 (|:| |singularity|
                      (|Record|
                       (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                       (|:| |lpf|
                            (|LinearOrdinaryDifferentialOperator3|
                             (|Expression| (|Integer|))
                             (|UnivariateTaylorSeries|
                              (|Expression| (|Integer|)) |var| |cen|)
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))
                       (|:| |dxt| (|PositiveInteger|))))
                 (|:| |fos|
                      (|List|
                       (|Record|
                        (|:| |op|
                             (|LinearOrdinaryDifferentialOperator3|
                              (|Expression| (|Integer|))
                              (|UnivariateTaylorSeries|
                               (|Expression| (|Integer|)) |var| |cen|)
                              (|UnivariateLaurentSeries|
                               (|Expression| (|Integer|)) |var| |cen|)))
                        (|:| |ram|
                             (|UnivariatePolynomial| |var|
                                                     (|Expression|
                                                      (|Integer|))))
                        (|:| |expart|
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))))
                 (|:| |mge|
                      (|List|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|))))))
          (#20=#:G1193 NIL) (|ge| NIL) (|min_deg| (|PositiveInteger|))
          (|dl| (|List| (|PositiveInteger|))) (#21=#:G1192 NIL)
          (#22=#:G1191 NIL) (|eba| (|Integer|)) (|gema| #19#)
          (|eb| (|Integer|)) (|bound| (|List| (|Fraction| (|Integer|))))
          (#23=#:G1190 NIL) (|j| NIL) (#24=#:G1189 NIL) (#25=#:G1188 NIL)
          (|i| NIL) (|v| (|List| (|Fraction| (|Integer|)))) (#26=#:G1187 NIL)
          (|ji1x| #27=(|Integer|)) (|jix| #27#) (|ji1y| #28=(|Integer|))
          (|jiy| #28#) (#29=#:G1186 NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (#30=#:G1185 NIL) (#31=#:G1184 NIL) (#32=#:G1183 NIL)
          (#33=#:G1182 NIL) (#34=#:G1181 NIL)
          (|a|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 325)) 1 (QREFELT $ 49))
              (PROGN (LETT #1# (LIST |f|)) (GO #35=#:G1179))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 324)) (|spadConstant| $ 304)
                        (QREFELT $ 365))
              (SEQ
               (LETT |a|
                     (|LODOF2;factor_global|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 304)
                                 (SPADCALL |f| (QREFELT $ 324))
                                 (QREFELT $ 310))
                       |f| (QREFELT $ 321))
                      |factorizer| $))
               (EXIT
                (PROGN
                 (LETT #1#
                       (CONS
                        (SPADCALL (SPADCALL |f| (QREFELT $ 324))
                                  (SPADCALL |a| 1 (QREFELT $ 352))
                                  (QREFELT $ 321))
                        (PROGN
                         (LETT #34# NIL)
                         (SEQ (LETT |i| 2) (LETT #33# (LENGTH |a|)) G190
                              (COND ((|greater_SI| |i| #33#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #34#
                                      (CONS (SPADCALL |a| |i| (QREFELT $ 352))
                                            #34#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #34#))))))
                 (GO #35#))))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 325)) 2)
              (SPADCALL
               (SPADCALL "Better to use old factorizer" (QREFELT $ 366))
               (QREFELT $ 172))))
            (LETT |gem| (SPADCALL |f| |factorizer| "" (QREFELT $ 370)))
            (LETT |bound|
                  (PROGN
                   (LETT #32# NIL)
                   (SEQ (LETT |i| 1)
                        (LETT #31# (- (SPADCALL |f| (QREFELT $ 325)) 1)) G190
                        (COND ((|greater_SI| |i| #31#) (GO G191)))
                        (SEQ
                         (EXIT (LETT #32# (CONS (|spadConstant| $ 68) #32#))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #32#)))))
            (LETT |eb| -1)
            (SEQ (LETT |s| NIL) (LETT #30# |gem|) G190
                 (COND
                  ((OR (ATOM #30#) (PROGN (LETT |s| (CAR #30#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |np|
                        (|LODOF2;newtonpolygon| (QVELT (QVELT |s| 0) 1) $))
                  (LETT |np|
                        (SPADCALL |np|
                                  (LIST
                                   (VECTOR
                                    (CONS
                                     (SPADCALL (QVELT (QVELT |s| 0) 1)
                                               (QREFELT $ 41))
                                     0)
                                    (|spadConstant| $ 68)
                                    (|spadConstant| $ 52)))
                                  (QREFELT $ 62)))
                  (LETT |v| NIL)
                  (SEQ (LETT |i| 1) (LETT #29# (- (LENGTH |np|) 1)) G190
                       (COND ((|greater_SI| |i| #29#) (GO G191)))
                       (SEQ
                        (LETT |jiy|
                              (QCDR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 196)) 0)))
                        (LETT |ji1y|
                              (QCDR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 196))
                                      0)))
                        (LETT |jix|
                              (QCAR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 196)) 0)))
                        (LETT |ji1x|
                              (QCAR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 196))
                                      0)))
                        (EXIT
                         (SEQ (LETT |l| |jix|) (LETT #26# (- |ji1x| 1)) G190
                              (COND ((> |l| #26#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |v|
                                      (SPADCALL |v|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL |jiy|
                                                            (QREFELT $ 106))
                                                  (SPADCALL
                                                   (* (- |l| |jix|)
                                                      (- |ji1y| |jiy|))
                                                   (- |ji1x| |jix|)
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 108)))
                                                (QREFELT $ 371)))))
                              (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| 1)
                       (LETT #25# (- (SPADCALL |f| (QREFELT $ 325)) 1)) G190
                       (COND ((|greater_SI| |i| #25#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |bound| |i|
                                   (SPADCALL
                                    (SPADCALL |bound| |i| (QREFELT $ 338))
                                    (SPADCALL (QVELT (QVELT |s| 0) 2)
                                              (SPADCALL |v| (+ |i| 1)
                                                        (QREFELT $ 338))
                                              (QREFELT $ 372))
                                    (QREFELT $ 108))
                                   (QREFELT $ 373))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |eb| (+ |eb| (QVELT (QVELT |s| 0) 2)))))
                 (LETT #30# (CDR #30#)) (GO G190) G191 (EXIT NIL))
            (LETT |bound|
                  (PROGN
                   (LETT #24# NIL)
                   (SEQ (LETT |j| 1)
                        (LETT #23# (- (SPADCALL |f| (QREFELT $ 325)) 1)) G190
                        (COND ((|greater_SI| |j| #23#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #24#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bound|
                                             (- (SPADCALL |f| (QREFELT $ 325))
                                                |j|)
                                             (QREFELT $ 338))
                                   (QREFELT $ 374))
                                  (SPADCALL |j| (SPADCALL |eb| (QREFELT $ 106))
                                            (QREFELT $ 372))
                                  (QREFELT $ 108))
                                 #24#))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                        (EXIT (NREVERSE #24#)))))
            (LETT |eb| (|LODOF2;compute_bound| |gem| (|spadConstant| $ 19) $))
            (LETT |gema|
                  (SPADCALL |f| |factorizer| "use adjoint" (QREFELT $ 370)))
            (LETT |eba|
                  (|LODOF2;compute_bound| |gema| (|spadConstant| $ 19) $))
            (LETT |all_one| 'T) (LETT |done_s| NIL)
            (SEQ G190 (COND ((NULL (NULL (NULL |gem|))) (GO G191)))
                 (SEQ
                  (LETT |dl|
                        (PROGN
                         (LETT #22# NIL)
                         (SEQ (LETT |s| NIL) (LETT #21# |gem|) G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |s| (CAR #21#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #22#
                                      (CONS (QVELT (QVELT |s| 0) 2) #22#))))
                              (LETT #21# (CDR #21#)) (GO G190) G191
                              (EXIT (NREVERSE #22#)))))
                  (LETT |min_deg| (SPADCALL (ELT $ 378) |dl| (QREFELT $ 381)))
                  (EXIT
                   (SEQ (LETT |ge| NIL) (LETT #20# |gem|) G190
                        (COND
                         ((OR (ATOM #20#) (PROGN (LETT |ge| (CAR #20#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QVELT (QVELT |ge| 0) 2) |min_deg|)
                            (SEQ
                             (LETT |gem| (SPADCALL |ge| |gem| (QREFELT $ 382)))
                             (LETT |vrs|
                                   (PROG2
                                       (LETT #6#
                                             (|LODOF2;factor_op|
                                              (QVELT (QVELT |ge| 0) 1)
                                              |factorizer| "all right factors"
                                              $))
                                       (QCDR #6#)
                                     (|check_union2| (QEQCAR #6# 1)
                                                     (|List|
                                                      (|Union|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|)))))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #6#)))
                             (LETT |done_s|
                                   (SPADCALL |done_s|
                                             (LIST (CONS (QVELT |ge| 0) |vrs|))
                                             (QREFELT $ 385)))
                             (SEQ (LETT |sop| NIL) (LETT #18# |vrs|)
                                  (LETT |ssp| NIL) (LETT #17# (QVELT |ge| 1))
                                  G190
                                  (COND
                                   ((OR (ATOM #17#)
                                        (PROGN (LETT |ssp| (CAR #17#)) NIL)
                                        (ATOM #18#)
                                        (PROGN (LETT |sop| (CAR #18#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QVELT |ssp| 0)
                                                 (QREFELT $ 41))
                                       1)
                                      (COND
                                       ((EQL
                                         (SPADCALL
                                          (PROG2 (LETT #4# |sop|)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #4#))
                                          (QREFELT $ 41))
                                         1)
                                        (PROGN
                                         (LETT #1#
                                               (|LODOF2;factor_minmult1|
                                                |bound| (QVELT |ge| 0) |f| |eb|
                                                |eba|
                                                (PROG2 (LETT #4# |sop|)
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0)
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #4#))
                                                |factorizer| $))
                                         (GO #35#))))))))
                                  (LETT #17#
                                        (PROG1 (CDR #17#)
                                          (LETT #18# (CDR #18#))))
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (LETT |all_one|
                                    (COND
                                     (|all_one|
                                      (COND
                                       ((EQL (LENGTH |vrs|) 1)
                                        (EQL
                                         (SPADCALL
                                          (PROG2
                                              (LETT #4#
                                                    (SPADCALL |vrs| 1
                                                              (QREFELT $ 386)))
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #4#))
                                          (QREFELT $ 41))
                                         1))
                                       ('T NIL)))
                                     ('T NIL)))))))))
                        (LETT #20# (CDR #20#)) (GO G190) G191 (EXIT NIL))))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SPADCALL
               (SPADCALL "Better to use old factorizer" (QREFELT $ 366))
               (QREFELT $ 172))))
            (LETT |all_one| 'T) (LETT |done_sa| NIL)
            (SEQ (LETT |s| NIL) (LETT #16# |done_s|) G190
                 (COND
                  ((OR (ATOM #16#) (PROGN (LETT |s| (CAR #16#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |all_one|
                        (COND (|all_one| (EQL (LENGTH (QCDR |s|)) 1))
                              ('T NIL)))
                  (SEQ (LETT |sop| NIL) (LETT #15# (QCDR |s|)) G190
                       (COND
                        ((OR (ATOM #15#) (PROGN (LETT |sop| (CAR #15#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #4# |sop|)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #4#))
                               (SPADCALL
                                (SPADCALL (SPADCALL |f| (QREFELT $ 325)) 2
                                          (QREFELT $ 51))
                                (QREFELT $ 187))
                               |bound| (QCAR |s|) |f| |eb| 0 "" $))
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t|)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#)))
                            (GO #35#))))))
                       (LETT #15# (CDR #15#)) (GO G190) G191 (EXIT NIL))
                  (LETT |vrs|
                        (PROG2
                            (LETT #6#
                                  (|LODOF2;factor_op|
                                   (SPADCALL (QVELT (QCAR |s|) 1)
                                             (QREFELT $ 389))
                                   |factorizer| "all right factors" $))
                            (QCDR #6#)
                          (|check_union2| (QEQCAR #6# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #6#)))
                  (LETT |done_sa|
                        (SPADCALL |done_sa| (LIST (CONS (QCAR |s|) |vrs|))
                                  (QREFELT $ 385)))
                  (EXIT
                   (SEQ (LETT |sop| NIL) (LETT #13# |vrs|) G190
                        (COND
                         ((OR (ATOM #13#) (PROGN (LETT |sop| (CAR #13#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #4# |sop|)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #4#))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 325)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 187))
                                |bound| (QCAR |s|) |f| |eba| 0 "use adjoint"
                                $))
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
                            (PROGN
                             (LETT #1#
                                   (PROG2 (LETT #2# |t|)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #3#)
                                                     #2#)))
                             (GO #35#))))))
                        (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |sa| NIL) (LETT #12# |done_sa|) (LETT |s| NIL)
                 (LETT #11# |done_s|) G190
                 (COND
                  ((OR (ATOM #11#) (PROGN (LETT |s| (CAR #11#)) NIL)
                       (ATOM #12#) (PROGN (LETT |sa| (CAR #12#)) NIL))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |sop| NIL) (LETT #10# (QCDR |s|)) G190
                       (COND
                        ((OR (ATOM #10#) (PROGN (LETT |sop| (CAR #10#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #4# |sop|)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #4#))
                               (- (SPADCALL |f| (QREFELT $ 325)) 1) |bound|
                               (QCAR |s|) |f| |eb|
                               (+
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 325)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 187))
                                1)
                               "" $))
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t|)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#)))
                            (GO #35#))))))
                       (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |sop| NIL) (LETT #9# (QCDR |sa|)) G190
                        (COND
                         ((OR (ATOM #9#) (PROGN (LETT |sop| (CAR #9#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #4# |sop|)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #4#))
                                (- (SPADCALL |f| (QREFELT $ 325)) 1) |bound|
                                (QCAR |s|) |f| |eba|
                                (+
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 325)) 2
                                            (QREFELT $ 51))
                                  (QREFELT $ 187))
                                 1)
                                "use adjoint" $))
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
                            (PROGN
                             (LETT #1#
                                   (PROG2 (LETT #2# |t|)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #3#)
                                                     #2#)))
                             (GO #35#))))))
                        (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                 (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SEQ (LETT |s| NIL) (LETT #8# |done_s|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |s| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |iarf1|
                          (PROG2 (LETT #4# (|SPADfirst| (QCDR |s|)))
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 0)
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))
                                            #4#)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |iarf1| (QREFELT $ 41)) 1
                                 (QREFELT $ 48))
                       (SEQ
                        (LETT |j1|
                              (PROG2
                                  (LETT #6#
                                        (|LODOF2;factor_op| |iarf1|
                                         |factorizer| "alg factor" $))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #6#)))
                        (LETT |jj|
                              (PROG2 (LETT #7# (SPADCALL |j1| (QREFELT $ 200)))
                                  (QCDR #7#)
                                (|check_union2| (QEQCAR #7# 1)
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|)))))
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                #7#)))
                        (LETT |kk| (|LODOF2;make_rightfactor| |iarf1| |jj| $))
                        (LETT |t|
                              (|LODOF2;try_factorization| |kk|
                               (- (SPADCALL |f| (QREFELT $ 325)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "" $))
                        (COND
                         ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
                          (PROGN
                           (LETT #1#
                                 (PROG2 (LETT #2# |t|)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (|List|
                                                    (|LinearOrdinaryDifferentialOperator1|
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))
                                                   (|Union|
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    #3#)
                                                   #2#)))
                           (GO #35#))))
                        (LETT |vrs|
                              (PROG2
                                  (LETT #6#
                                        (|LODOF2;factor_op|
                                         (SPADCALL (QVELT (QCAR |s|) 1)
                                                   (QREFELT $ 389))
                                         |factorizer| "all right factors" $))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #6#)))
                        (LETT |r_left| (|spadConstant| $ 18))
                        (SEQ (LETT |l| NIL) (LETT #5# |vrs|) G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#)) NIL)
                                   (NULL
                                    (SPADCALL |r_left| (|spadConstant| $ 18)
                                              (QREFELT $ 227))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|LODOF2;same_charclass?|
                                  (PROG2 (LETT #4# |l|)
                                      (QCDR #4#)
                                    (|check_union2| (QEQCAR #4# 0)
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))))
                                                    #4#))
                                  (SPADCALL |kk| (QREFELT $ 389)) |factorizer|
                                  $)
                                 (LETT |r_left|
                                       (PROG2 (LETT #4# |l|)
                                           (QCDR #4#)
                                         (|check_union2| (QEQCAR #4# 0)
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7)))
                                                         (|Union|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))
                                                          (|Record|
                                                           (|:| |ope|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))))
                                                           (|:| |dext|
                                                                (|PositiveInteger|))
                                                           (|:| |alpha|
                                                                (|Expression|
                                                                 (|Integer|)))
                                                           (|:| |rami|
                                                                (|UnivariatePolynomial|
                                                                 (QREFELT $ 6)
                                                                 (|Expression|
                                                                  (|Integer|))))))
                                                         #4#)))))))
                             (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                        (LETT |t|
                              (|LODOF2;try_factorization| |r_left|
                               (- (SPADCALL |f| (QREFELT $ 325)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "use adjoint" $))
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t|)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#)))
                            (GO #35#))))))))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))))
            (SPADCALL (SPADCALL "Try the old factorizer" (QREFELT $ 366))
                      (QREFELT $ 172))
            (EXIT (LIST |f|))))
          #35# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfg;LodoML;51|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (|LODOF2;factor_global| |f| |factorizer| $)) 

(SDEFUN |LODOF2;factor_minmult1|
        ((|bound| |List| (|Fraction| (|Integer|)))
         (|sng| |Record|
          (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
          (|:| |lpf|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dxt| (|PositiveInteger|)))
         (|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|eb| |Integer|) (|eba| |Integer|)
         (|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1227 NIL) (#2=#:G1209 NIL)
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #3="failed"))
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#4=#:G454 NIL) (#5=#:G1228 NIL) (|i| NIL)
          (|w|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G1218 NIL) (|fl| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fl|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT $ 325)) 2 (QREFELT $ 51))
                   (QREFELT $ 187)))
            (LETT |t|
                  (|LODOF2;try_factorization| |r| |fl| |bound| |sng| |f| |eb| 0
                   "" $))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t|)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#)))
               (GO #7=#:G1226))))
            (LETT |w|
                  (PROG2
                      (LETT #6#
                            (|LODOF2;factor_op|
                             (SPADCALL (QVELT |sng| 1) (QREFELT $ 389))
                             |factorizer| "all right factors" $))
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 1)
                                    (|List|
                                     (|Union|
                                      (|LinearOrdinaryDifferentialOperator3|
                                       (|Expression| (|Integer|))
                                       (|UnivariateTaylorSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT $ 6) (QREFELT $ 7))
                                       (|UnivariateLaurentSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT $ 6) (QREFELT $ 7)))
                                      (|Record|
                                       (|:| |ope|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))))
                                       (|:| |dext| (|PositiveInteger|))
                                       (|:| |alpha| (|Expression| (|Integer|)))
                                       (|:| |rami|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))))))
                                    (|Union|
                                     (|List|
                                      (|Record|
                                       (|:| |op|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))))
                                       (|:| |ram|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|))))
                                       (|:| |expart|
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))))
                                     (|List|
                                      (|Union|
                                       (|LinearOrdinaryDifferentialOperator3|
                                        (|Expression| (|Integer|))
                                        (|UnivariateTaylorSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT $ 6) (QREFELT $ 7))
                                        (|UnivariateLaurentSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT $ 6) (QREFELT $ 7)))
                                       (|Record|
                                        (|:| |ope|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))))
                                        (|:| |dext| (|PositiveInteger|))
                                        (|:| |alpha|
                                             (|Expression| (|Integer|)))
                                        (|:| |rami|
                                             (|UnivariatePolynomial|
                                              (QREFELT $ 6)
                                              (|Expression| (|Integer|))))))))
                                    #6#)))
            (LETT |r_left| (|spadConstant| $ 18))
            (SEQ (LETT |i| NIL) (LETT #5# |w|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL)
                       (NULL
                        (SPADCALL |r_left| (|spadConstant| $ 18)
                                  (QREFELT $ 227))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((|LODOF2;same_charclass?|
                      (PROG2 (LETT #4# |i|)
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 0)
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7)))
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Record|
                                          (|:| |ope|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |dext| (|PositiveInteger|))
                                          (|:| |alpha|
                                               (|Expression| (|Integer|)))
                                          (|:| |rami|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))))
                                        #4#))
                      (SPADCALL |r| (QREFELT $ 389)) |factorizer| $)
                     (LETT |r_left|
                           (PROG2 (LETT #4# |i|)
                               (QCDR #4#)
                             (|check_union2| (QEQCAR #4# 0)
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))))
                                             #4#)))))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |r_left| (|spadConstant| $ 18) (QREFELT $ 227))
              (|error| "bug")))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left| |fl| |bound| |sng| |f|
                   |eba| 0 "use adjoint" $))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t|)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#)))
               (GO #7#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r|
                   (- (SPADCALL |f| (QREFELT $ 325)) 1) |bound| |sng| |f| |eb|
                   (+ |fl| 1) "" $))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t|)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#)))
               (GO #7#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left|
                   (- (SPADCALL |f| (QREFELT $ 325)) 1) |bound| |sng| |f| |eba|
                   (+ |fl| 1) "use adjoint" $))
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 388))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t|)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#)))
               (GO #7#))))
            (EXIT (LIST |f|))))
          #7# (EXIT #1#)))) 

(SDEFUN |LODOF2;l_p|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|p| |Union| (|Expression| (|Integer|)) #2="infinity")
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|llr|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp| #1#)
          (|lpf|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #3=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #3#)
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#4=#:G1230 NIL) (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |lpf| (|spadConstant| $ 315))
              (COND
               ((SPADCALL |p| (CONS 0 (|spadConstant| $ 19)) (QREFELT $ 317))
                (LETT |lpf| |f|))
               ('T
                (SEQ (LETT |ftmp| |f|)
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |ftmp| (|spadConstant| $ 315)
                                        (QREFELT $ 323)))
                             (GO G191)))
                           (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 324)))
                                (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 325)))
                                (COND
                                 ((SPADCALL |p| (CONS 1 "infinity")
                                            (QREFELT $ 317))
                                  (LETT |newx|
                                        (SPADCALL (|spadConstant| $ 153)
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58))
                                                  (QREFELT $ 318))))
                                 ('T
                                  (LETT |newx|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 12) 1
                                                    (QREFELT $ 58))
                                          (SPADCALL
                                           (PROG2 (LETT #4# |p|)
                                               (QCDR #4#)
                                             (|check_union2| (QEQCAR #4# 0)
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|Union|
                                                              (|Expression|
                                                               (|Integer|))
                                                              #2#)
                                                             #4#))
                                           (QREFELT $ 232))
                                          (QREFELT $ 59))
                                         (QREFELT $ 237)))))
                                (LETT |lcn|
                                      (|LODOF2;subsup|
                                       (SPADCALL |lc| (QREFELT $ 29)) |newx|
                                       $))
                                (LETT |lcd|
                                      (|LODOF2;subsup|
                                       (SPADCALL |lc| (QREFELT $ 27)) |newx|
                                       $))
                                (LETT |slc|
                                      (SPADCALL |lcn| |lcd| (QREFELT $ 310)))
                                (COND
                                 ((SPADCALL |p| (CONS 1 "infinity")
                                            (QREFELT $ 317))
                                  (LETT |newd|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 12) 1
                                                      (QREFELT $ 58))
                                            2 (QREFELT $ 70))
                                           (QREFELT $ 237))
                                          (SPADCALL (QREFELT $ 320))
                                          (QREFELT $ 321))
                                         (QREFELT $ 322))))
                                 ('T (LETT |newd| (SPADCALL (QREFELT $ 320)))))
                                (LETT |lpf|
                                      (SPADCALL |lpf|
                                                (SPADCALL |slc|
                                                          (SPADCALL |newd| |dg|
                                                                    (QREFELT $
                                                                             326))
                                                          (QREFELT $ 321))
                                                (QREFELT $ 327)))
                                (EXIT
                                 (LETT |ftmp|
                                       (SPADCALL |ftmp| (QREFELT $ 328)))))
                           NIL (GO G190) G191 (EXIT NIL))))))
              (LETT |llr|
                    (|LODOF2;convertL3toLL| (SPADCALL |lpf| (QREFELT $ 391))
                     $))
              (EXIT
               (SPADCALL
                (SPADCALL (|spadConstant| $ 14) (SPADCALL |llr| (QREFELT $ 37))
                          (QREFELT $ 257))
                |llr| (QREFELT $ 160)))))) 

(SDEFUN |LODOF2;testlp;LodoULodo;54|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|p| |Union| (|Expression| (|Integer|)) "infinity")
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;l_p| |f| |p| $)) 

(SDEFUN |LODOF2;subsup|
        ((|np| . #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|newx| |Fraction|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         ($ |Fraction|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|nptmp| #1#)
          (|res|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|)) (|lc| (|Expression| (|Integer|))))
         (SEQ (LETT |res| (|spadConstant| $ 393)) (LETT |nptmp| |np|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 154)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 192)))
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 75)))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 232))
                                         (SPADCALL |newx| |dg| (QREFELT $ 394))
                                         (QREFELT $ 395))
                                        (QREFELT $ 396)))
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 194)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;get_trace|
        ((|f| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (SPROG
         ((|fa| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|Sae|
           (|Join|
            (|MonogenicAlgebra| #1=(|Expression| (|Integer|))
                                (|UnivariatePolynomial| |var|
                                                        (|Expression|
                                                         (|Integer|))))
            (CATEGORY |package|
             (IF (|has| #1# (|Field|))
                 (IF (|has| #1# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|min_pol|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ (LETT |min_pol| (SPADCALL |k| (QREFELT $ 398)))
              (LETT |Sae|
                    (|SimpleAlgebraicExtension| (|Expression| (|Integer|))
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|)))
                                                (SPADCALL |min_pol|
                                                          (QREFELT $ 101))))
              (LETT |fa| (SPADCALL |f| |k| |min_pol| (QREFELT $ 401)))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |fa| (QREFELT $ 101))
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '$
                                                       (LIST
                                                        '|UnivariatePolynomial|
                                                        (|devaluate| (ELT $ 6))
                                                        (LIST '|Expression|
                                                              (LIST
                                                               '|Integer|))))
                                                 |Sae|))
                (|compiledLookupCheck| '|trace|
                                       (LIST
                                        (LIST '|Expression| (LIST '|Integer|))
                                        '$)
                                       |Sae|)))))) 

(SDEFUN |LODOF2;testgt;EKE;57|
        ((|f| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (|LODOF2;get_trace| |f| |k| $)) 

(SDEFUN |LODOF2;make_poly|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         ($ |SparseUnivariatePolynomial| (|Expression| (|Integer|))))
        (SPROG
         ((|ftmp| #1#)
          (|res| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ (LETT |res| (|spadConstant| $ 403)) (LETT |ftmp| |f|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)))
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| 0 (QREFELT $ 57)) |dg|
                                         (QREFELT $ 404))
                                        (QREFELT $ 405)))
                        (EXIT (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;compute_bound|
        ((|gem| |List|
          (|Record|
           (|:| |singularity|
                (|Record|
                 (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
                 (|:| |lpf|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |dxt| (|PositiveInteger|))))
           (|:| |fos|
                (|List|
                 (|Record|
                  (|:| |op|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |ram|
                       (|UnivariatePolynomial| |var|
                                               (|Expression| (|Integer|))))
                  (|:| |expart|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |mge|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))))
         (|rlc| |Expression| (|Integer|)) ($ |Integer|))
        (SPROG
         ((|res| (|Fraction| (|Integer|))) (#1=#:G1254 NIL) (#2=#:G1276 NIL)
          (|ma| (|Union| (|Fraction| (|Integer|)) #3="-infinity"))
          (|cq| (|Fraction| (|Integer|))) (|c| (|Expression| (|Integer|)))
          (#4=#:G1283 NIL) (|ke| NIL)
          (|ks| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|vpej| #5=(|Fraction| (|Integer|))) (|vpei| #5#)
          (|rjj| #6=(|NonNegativeInteger|)) (#7=#:G1281 NIL) (|jj| NIL)
          (#8=#:G1282 NIL) (|fpsjj| NIL) (|r| #6#) (#9=#:G1278 NIL) (|f| NIL)
          (#10=#:G1279 NIL) (|fps| NIL) (#11=#:G1280 NIL) (|ji| NIL)
          (#12=#:G1277 NIL) (|ge| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (|spadConstant| $ 68))
                (SEQ (LETT |ge| NIL) (LETT #12# |gem|) G190
                     (COND
                      ((OR (ATOM #12#) (PROGN (LETT |ge| (CAR #12#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |ma| (CONS 1 "-infinity"))
                          (SEQ (LETT |ji| 1)
                               (LETT #11# (LENGTH (QVELT |ge| 2)))
                               (LETT |fps| NIL) (LETT #10# (QVELT |ge| 1))
                               (LETT |f| NIL) (LETT #9# (QVELT |ge| 2)) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |f| (CAR #9#)) NIL)
                                     (ATOM #10#)
                                     (PROGN (LETT |fps| (CAR #10#)) NIL)
                                     (|greater_SI| |ji| #11#))
                                 (GO G191)))
                               (SEQ
                                (LETT |r|
                                      (SPADCALL (QVELT |fps| 1)
                                                (QREFELT $ 75)))
                                (LETT |c| (SPADCALL |f| 0 (QREFELT $ 57)))
                                (SEQ (LETT |fpsjj| NIL)
                                     (LETT #8#
                                           (SPADCALL (QVELT |ge| 1) |ji|
                                                     (QREFELT $ 407)))
                                     (LETT |jj| NIL)
                                     (LETT #7#
                                           (SPADCALL (QVELT |ge| 2) |ji|
                                                     (QREFELT $ 406)))
                                     G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT |jj| (CAR #7#)) NIL)
                                           (ATOM #8#)
                                           (PROGN
                                            (LETT |fpsjj| (CAR #8#))
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |rjj|
                                            (SPADCALL (QVELT |fpsjj| 1)
                                                      (QREFELT $ 75)))
                                      (LETT |vpei|
                                            (SPADCALL
                                             (SPADCALL |f| 0 (QREFELT $ 42))
                                             |r| (QREFELT $ 51)))
                                      (LETT |vpej|
                                            (SPADCALL
                                             (SPADCALL |jj| 0 (QREFELT $ 42))
                                             |rjj| (QREFELT $ 51)))
                                      (EXIT
                                       (LETT |c|
                                             (SPADCALL |c|
                                                       (SPADCALL
                                                        (SPADCALL |vpei| |vpej|
                                                                  (QREFELT $
                                                                           109))
                                                        (QREFELT $ 247))
                                                       (QREFELT $ 408)))))
                                     (LETT #7#
                                           (PROG1 (CDR #7#)
                                             (LETT #8# (CDR #8#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |ks| (SPADCALL |c| (QREFELT $ 410)))
                                (SEQ (LETT |ke| NIL) (LETT #4# |ks|) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |ke| (CAR #4#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((QEQCAR
                                          (SPADCALL
                                           (SPADCALL |ke| (QREFELT $ 411))
                                           (QREFELT $ 413))
                                          1)
                                         (SEQ
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |c| (QREFELT $ 414))
                                              |ke| |rlc| (QREFELT $ 415))
                                             (|spadConstant| $ 19)
                                             (QREFELT $ 242))
                                            (PROGN
                                             (LETT #2#
                                                   (|LODOF2;compute_bound|
                                                    |gem|
                                                    (SPADCALL |rlc|
                                                              (|spadConstant| $
                                                                              12)
                                                              (QREFELT $ 408))
                                                    $))
                                             (GO #13=#:G1275))))
                                          (EXIT
                                           (LETT |c|
                                                 (SPADCALL |c| |ke| |rlc|
                                                           (QREFELT $ 415))))))
                                        ('T
                                         (LETT |c|
                                               (SPADCALL
                                                (|LODOF2;get_trace| |c| |ke| $)
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |ke|
                                                            (QREFELT $ 398))
                                                  (QREFELT $ 416))
                                                 (QREFELT $ 78))
                                                (QREFELT $ 79)))))))
                                     (LETT #4# (CDR #4#)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |cq| (SPADCALL |c| (QREFELT $ 417)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |ma| (CONS 1 "-infinity")
                                             (QREFELT $ 419))
                                   (LETT |ma|
                                         (CONS 0
                                               (SPADCALL |cq|
                                                         (QREFELT $ 374)))))
                                  ('T
                                   (LETT |ma|
                                         (CONS 0
                                               (SPADCALL
                                                (SPADCALL |cq| (QREFELT $ 374))
                                                (PROG2 (LETT #1# |ma|)
                                                    (QCDR #1#)
                                                  (|check_union2|
                                                   (QEQCAR #1# 0)
                                                   (|Fraction| (|Integer|))
                                                   (|Union|
                                                    (|Fraction| (|Integer|))
                                                    #3#)
                                                   #1#))
                                                (QREFELT $ 420))))))))
                               (LETT #9#
                                     (PROG1 (CDR #9#)
                                       (LETT #10#
                                             (PROG1 (CDR #10#)
                                               (LETT |ji| (|inc_SI| |ji|))))))
                               (GO G190) G191 (EXIT NIL))
                          (COND
                           ((SPADCALL |ma| (CONS 1 "-infinity")
                                      (QREFELT $ 419))
                            (PROGN (LETT #2# 0) (GO #13#))))
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL (QVELT (QVELT |ge| 0) 2)
                                                     (PROG2 (LETT #1# |ma|)
                                                         (QCDR #1#)
                                                       (|check_union2|
                                                        (QEQCAR #1# 0)
                                                        (|Fraction|
                                                         (|Integer|))
                                                        (|Union|
                                                         (|Fraction|
                                                          (|Integer|))
                                                         #3#)
                                                        #1#))
                                                     (QREFELT $ 372))
                                           (QREFELT $ 108)))))
                     (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
                (EXIT (MAX 0 (SPADCALL |res| (QREFELT $ 187))))))
          #13# (EXIT #2#)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|p| |Union| (|Expression| (|Integer|)) #1="infinity")
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
          (|List| (|Expression| (|Integer|))))
         (|y| |List| (|Expression| (|Integer|)))
         ($ |List|
          (|Record|
           (|:| |ecs|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |ecr|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
           (|:| |ect|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |ecs|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ecr|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |ect|
                  (|Fraction|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|tr|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#2=#:G1286 NIL)
          (|ss|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#3=#:G1308 NIL) (|root| NIL) (#4=#:G1307 NIL)
          (|es| (|List| (|Expression| (|Integer|)))) (#5=#:G1306 NIL) (|g| NIL)
          (#6=#:G1305 NIL)
          (|s|
           #7=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|r| (|NonNegativeInteger|)) (#8=#:G1304 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #7#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#9=#:G1294 NIL)
          (|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (SEQ
          (LETT |factorizer2|
                (CONS #'|LODOF2;gen_exp;LodoUMLL;60!0|
                      (VECTOR |factorizer| |y|)))
          (LETT |v|
                (PROG2
                    (LETT #9#
                          (|LODOF2;factor_op| (|LODOF2;l_p| |f| |p| $)
                           |factorizer2| "semireg" $))
                    (QCDR #9#)
                  (|check_union2| (QEQCAR #9# 0)
                                  (|List|
                                   (|Record|
                                    (|:| |op|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))))
                                    (|:| |ram|
                                         (|UnivariatePolynomial| (QREFELT $ 6)
                                                                 (|Expression|
                                                                  (|Integer|))))
                                    (|:| |expart|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7)))))
                                  (|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))))
                                  #9#)))
          (LETT |res| NIL)
          (SEQ (LETT |e| NIL) (LETT #8# |v|) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |e| (CAR #8#)) NIL)) (GO G191)))
               (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 75)))
                    (LETT |s| (QVELT |e| 0))
                    (LETT |es|
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |g| NIL)
                                (LETT #5#
                                      (SPADCALL
                                       (SPADCALL (|LODOF2;make_poly| |s| $)
                                                 |factorizer2|)
                                       (QREFELT $ 423)))
                                G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |g| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL (QVELT |g| 1)
                                                   (QREFELT $ 424))
                                         #6#))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT (NREVERSE #6#)))))
                    (LETT |ss|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |root| NIL) (LETT #3# |es|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |root| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |root| (QREFELT $ 193))
                                           (QVELT |e| 2) (QREFELT $ 223))
                                          (SPADCALL |r| (QREFELT $ 78))
                                          (QREFELT $ 256))
                                         #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#)))))
                    (COND
                     ((SPADCALL |p| (CONS 1 "infinity") (QREFELT $ 317))
                      (LETT |tr|
                            (SPADCALL (|spadConstant| $ 153)
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (QREFELT $ 318))))
                     ('T
                      (LETT |tr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL
                               (PROG2 (LETT #2# |p|)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Expression| (|Integer|))
                                                 (|Union|
                                                  (|Expression| (|Integer|))
                                                  #1#)
                                                 #2#))
                               (QREFELT $ 232))
                              (QREFELT $ 86))
                             (QREFELT $ 237)))))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (LIST (VECTOR |ss| (QVELT |e| 1) |tr|))
                                     (QREFELT $ 427)))))
               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1))
          (LETT |factorizer| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;ge_minimal;LodoMSL;61|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|Record|
           (|:| |singularity|
                (|Record|
                 (|:| |point|
                      (|Union| (|Expression| (|Integer|)) #1="infinity"))
                 (|:| |lpf|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |dxt| (|PositiveInteger|))))
           (|:| |fos|
                (|List|
                 (|Record|
                  (|:| |op|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |ram|
                       (|UnivariatePolynomial| |var|
                                               (|Expression| (|Integer|))))
                  (|:| |expart|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |mge|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |singularity|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |fos|
                  (|List|
                   (|Record|
                    (|:| |op|
                         (|LinearOrdinaryDifferentialOperator3|
                          (|Expression| (|Integer|))
                          (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)
                          (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)))
                    (|:| |ram|
                         (|UnivariatePolynomial| |var|
                                                 (|Expression| (|Integer|))))
                    (|:| |expart|
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |mge|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|mg|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|ss|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ms| (|Expression| (|Integer|)))
          (|es| (|List| (|Fraction| (|Integer|)))) (#2=#:G1368 NIL) (|g| NIL)
          (#3=#:G1367 NIL)
          (|s|
           #4=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|r| (|NonNegativeInteger|)) (#5=#:G1366 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #4#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#6=#:G1327 NIL) (#7=#:G1365 NIL) (|sg| NIL)
          (|singularities|
           (|List|
            (|Record| (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                      (|:| |lpf|
                           (|LinearOrdinaryDifferentialOperator3|
                            (|Expression| (|Integer|))
                            (|UnivariateTaylorSeries|
                             (|Expression| (|Integer|)) |var| |cen|)
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|)))
                      (|:| |dxt| (|PositiveInteger|)))))
          (#8=#:G1364 NIL) (#9=#:G1363 NIL) (|root| (|Expression| (|Integer|)))
          (#10=#:G1362 NIL)
          (|dnf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (#11=#:G1361 NIL) (|p| NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#12=#:G1360 NIL) (#13=#:G1359 NIL))
         (SEQ
          (LETT |dlc|
                (PROGN
                 (LETT #13# NIL)
                 (SEQ (LETT |e| (SPADCALL |f| (QREFELT $ 362)))
                      (LETT #12# (SPADCALL |f| (QREFELT $ 325))) G190
                      (COND ((> |e| #12#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13#
                              (CONS
                               (SPADCALL (SPADCALL |f| |e| (QREFELT $ 360))
                                         (QREFELT $ 27))
                               #13#))))
                      (LETT |e| (+ |e| 1)) (GO G190) G191
                      (EXIT (NREVERSE #13#)))))
          (LETT |dlc| (SPADCALL |dlc| (QREFELT $ 431))) (LETT |dnf| NIL)
          (SEQ (LETT |p| NIL) (LETT #11# |dlc|) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |p| (CAR #11#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |dnf|
                       (SPADCALL |dnf|
                                 (SPADCALL
                                  (|LODOF2;factorUP| |p| |factorizer| $)
                                  (QREFELT $ 67))
                                 (QREFELT $ 432)))))
               (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((|LODOF2;inf_singularity?| |f| $)
            (LETT |singularities|
                  (LIST
                   (VECTOR (CONS 1 "infinity")
                           (|LODOF2;l_p| |f| (CONS 1 "infinity") $) 1))))
           ('T (LETT |singularities| NIL)))
          (SEQ (LETT |g| NIL) (LETT #10# |dnf|) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |g| (CAR #10#)) NIL)) (GO G191)))
               (SEQ
                (LETT |root|
                      (SPADCALL (SPADCALL (QCAR |g|) (QREFELT $ 100))
                                (QREFELT $ 424)))
                (EXIT
                 (LETT |singularities|
                       (CONS
                        (VECTOR (CONS 0 |root|)
                                (|LODOF2;l_p| |f| (CONS 0 |root|) $)
                                (SPADCALL (QCAR |g|) (QREFELT $ 75)))
                        |singularities|))))
               (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((EQUAL |option| "use adjoint")
            (LETT |singularities|
                  (PROGN
                   (LETT #9# NIL)
                   (SEQ (LETT |sg| NIL) (LETT #8# |singularities|) G190
                        (COND
                         ((OR (ATOM #8#) (PROGN (LETT |sg| (CAR #8#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9#
                                (CONS
                                 (VECTOR (QVELT |sg| 0)
                                         (SPADCALL (QVELT |sg| 1)
                                                   (QREFELT $ 389))
                                         (QVELT |sg| 2))
                                 #9#))))
                        (LETT #8# (CDR #8#)) (GO G190) G191
                        (EXIT (NREVERSE #9#)))))))
          (LETT |res| NIL)
          (SEQ (LETT |sg| NIL) (LETT #7# |singularities|) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |sg| (CAR #7#)) NIL)) (GO G191)))
               (SEQ
                (LETT |v|
                      (PROG2
                          (LETT #6#
                                (|LODOF2;factor_op| (QVELT |sg| 1) |factorizer|
                                 "semireg" $))
                          (QCDR #6#)
                        (|check_union2| (QEQCAR #6# 0)
                                        (|List|
                                         (|Record|
                                          (|:| |op|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |ram|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))
                                          (|:| |expart|
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #6#)))
                (LETT |mg| NIL)
                (SEQ (LETT |e| NIL) (LETT #5# |v|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 75)))
                          (LETT |s| (QVELT |e| 0))
                          (LETT |es|
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |g| NIL)
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (|LODOF2;make_poly| |s| $)
                                              |factorizer|)
                                             (QREFELT $ 423)))
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |g| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL (QVELT |g| 1)
                                                          (QREFELT $ 424))
                                                (QREFELT $ 417))
                                               #3#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#)))))
                          (LETT |ms|
                                (SPADCALL
                                 (SPADCALL (ELT $ 109) |es| (QREFELT $ 434))
                                 (QREFELT $ 247)))
                          (LETT |ss|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |ms| (QREFELT $ 193))
                                           (QVELT |e| 2) (QREFELT $ 223))
                                 (SPADCALL |r| (QREFELT $ 78))
                                 (QREFELT $ 256)))
                          (EXIT
                           (LETT |mg|
                                 (SPADCALL |mg| (LIST |ss|) (QREFELT $ 123)))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |res| (CONS (VECTOR |sg| |v| |mg|) |res|))))
               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorFactorizer2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2| (&REST #1=#:G1369)
  (SPROG NIL
         (PROG (#2=#:G1370)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperatorFactorizer2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |LinearOrdinaryDifferentialOperatorFactorizer2;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperatorFactorizer2|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperatorFactorizer2| DV$1
                      DV$2))
          (LETT $ (GETREFV 435))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperatorFactorizer2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorFactorizer2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|UnivariatePolynomial| (NRTEVAL (QREFELT $ 6)) 11)
              (|UnivariateTaylorSeries| 11 (NRTEVAL (QREFELT $ 6))
                                        (NRTEVAL (QREFELT $ 7)))
              (0 . |coerce|) (|Expression| 38) (5 . |One|)
              (|UnivariateLaurentSeries| 11 (NRTEVAL (QREFELT $ 6))
                                         (NRTEVAL (QREFELT $ 7)))
              (9 . |One|) (|NonNegativeInteger|) (13 . |univariatePolynomial|)
              (|LinearOrdinaryDifferentialOperator3| 11 9 13) (19 . |Zero|)
              (23 . |Zero|) (27 . |Zero|)
              (|LinearOrdinaryDifferentialOperator3| 11 8 25) (31 . |Zero|)
              (|Boolean|) (35 . ~=) (|Fraction| 8) (41 . |leadingCoefficient|)
              (46 . |denom|) (51 . |coerce|) (56 . |numer|)
              (|Union| $ '"failed") (61 . |recip|) (66 . *) (72 . |degree|)
              (77 . |monomial|) (83 . +) (89 . |reductum|)
              (94 . |leadingCoefficient|) (|Integer|) (99 . |order|) (104 . ~=)
              (110 . |degree|) (115 . |order|) (121 . ~=) (127 . |reductum|)
              (|Record| (|:| |x| 38) (|:| |y| 38)) (|List| 45) (132 . |elt|)
              (138 . >) (144 . <=) (|Fraction| 38) (150 . /) (156 . |Zero|)
              (160 . |denom|) (165 . |coefficient|) (171 . |numer|) (176 . *)
              (182 . |coefficient|) (188 . |monomial|) (194 . +)
              (|Record| (|:| |point| 45) (|:| |slope| 50) (|:| |npoly| 8))
              (|List| 60) (200 . |append|) |LODOF2;testnp;LodoL;6|
              (|Record| (|:| |factor| 8) (|:| |exponent| 15)) (|List| 64)
              (|Factored| 8) (206 . |factors|) (211 . |Zero|) (215 . ~=)
              (221 . ^) (|OneDimensionalArray| 8) (227 . |setelt!|) (|List| $)
              (234 . |tails|) (239 . |degree|) (244 . |coefficient|) (250 . -)
              (256 . |coerce|) (261 . /) (|IntegerRetractions| 11)
              (267 . |integer?|) (272 . ~=) (278 . |integer|) (283 . |coerce|)
              (288 . |eval|) (295 . -) (301 . =) (307 . >) (313 . |elt|)
              (319 . *) (325 . |setDifference|) (331 . |position|)
              (337 . |elt|) (|List| 17) (343 . |append|) (|Mapping| 103 99)
              (|String|) |LODOF2;testfn;LodoMSL;8|
              (|SparseUnivariatePolynomial| 11) (349 . |makeSUP|)
              (354 . |unmakeSUP|) (|Mapping| 8 99) (|Factored| 99)
              (|FactoredFunctions2| 99 8) (359 . |map|) (365 . |coerce|)
              (370 . *) (376 . +) (382 . |min|) (388 . |quo|) (394 . =)
              (|Record| (|:| |Qt| 17) (|:| |Rt| 17))
              |LODOF2;testf2;LodoUpFR;11| (|List| 13) (400 . |elt|)
              (|Record| (|:| |laurl| 114) (|:| |laurr| 114))
              |LODOF2;testll;FLodo2UpFIR;14|
              (|Record| (|:| |k| 38) (|:| |c| 11)) (|Stream| 118) (|List| 119)
              (406 . |elt|) (412 . |series|) (417 . |append|) (|Stream| 17)
              (|Mapping| 17 112) (|Stream| 112) (|StreamFunctions2| 112 17)
              (423 . |map|) (429 . |retract|)
              (|Record| (|:| |llc| 120) (|:| |rlc| 120))
              |LODOF2;testlc;FLodo2UpFIR;17| (|SingleInteger|) (434 . |One|)
              (438 . +) (|Mapping| 38 38) (|Stream| 38) (444 . |stream|)
              (450 . -) (456 . *) (|Union| 38 '"failed") (462 . |retractIfCan|)
              (467 . =) (|Mapping| 118 17 38) (|StreamFunctions3| 17 38 118)
              (473 . |map|) (480 . |append|) (|List| 118) (486 . |coerce|)
              (491 . |monomial|) (497 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (503 . |extendedEuclidean|) (509 . |One|) (513 . ~=)
              (519 . |rem|) (525 . -) (530 . |pi|) (534 . |pi|) (538 . |pi|)
              (542 . *) (548 . -) (553 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 163 '"failed") (559 . |extendedEuclidean|)
              (|PositiveInteger|) (566 . *) (572 . -) (|OutputForm|)
              (578 . |coerce|) (|Void|) (583 . |print|)
              (|Record| (|:| |main| 112) (|:| |nf| 112) (|:| |error| 17))
              |LODOF2;testln;FLodo2UpFIR;20| (588 . |One|) (592 . +)
              (|Record| (|:| |lr| 173) (|:| |n_lifts| 166)) (|Mapping| 177 177)
              (|Stream| 177) (598 . |stream|) (|Mapping| 112 177)
              (|StreamFunctions2| 177 112) (604 . |map|)
              |LODOF2;testlw;FLodo2UpFIS;22| (610 . |extendedEuclidean|)
              (616 . |positiveRemainder|) (622 . |floor|)
              |LODOF2;testcp;LodoFILodo;24| (627 . |ceiling|)
              |LODOF2;testco;LodoFIB;26| |LODOF2;testcx;LodoFUp;28|
              (632 . |leadingCoefficient|) (637 . |coerce|) (642 . |reductum|)
              |LODOF2;testpd;UpLodo;30| (647 . |elt|)
              (|Record| (|:| |ope| 17) (|:| |dext| 166) (|:| |alpha| 11)
                        (|:| |rami| 8))
              (|Union| 17 197) (|List| 198) (653 . |value|) (658 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 202) (|:| |factor| 8) (|:| |exponent| 15))
              (|List| 203) (663 . |factorList|) (668 . |retractIfCan|)
              (673 . ~=) (679 . ~=) (685 . |min|) (|Mapping| 38 38 38)
              (|List| 38) (691 . |reduce|) (697 . |elt|) (703 . <=)
              (709 . |truncate|) (715 . -) (720 . *) (|Symbol|)
              (726 . |variable|) (731 . ^) (737 . -) (742 . *) (748 . +)
              (|Record| (|:| |op| 17) (|:| |ram| 8) (|:| |expart| 13))
              (|List| 224) (754 . |append|) (760 . =) (766 . |rightQuotient|)
              (772 . |append|) (|SparseUnivariatePolynomial| $)
              (778 . |zeroOf|) (783 . |coerce|) (788 . ^) (794 . *)
              (|Union| 225 199) |LODOF2;testfr;LodoMSU;32| (800 . |coerce|)
              (805 . |coerce|) (810 . ^) (|Union| 8 13)
              |LODOF2;testsb;ULodoLodo;34| (816 . =) (|Mapping| 11 38)
              (822 . |multiplyCoefficients|) (828 . |multiplyExponents|)
              (834 . ^) (840 . |coerce|) (845 . *)
              |LODOF2;testro;LodoEPiLodo;36| |LODOF2;testfo;LodoMSU;38|
              (|Vector| 13) (851 . |setelt!|) (858 . D) (862 . |apply|)
              (869 . *) (875 . /) (881 . /) (|Mapping| 13 13) (887 . |map!|)
              (893 . +) (|Mapping| 15 15) (|Stream| 15) (899 . |stream|)
              (905 . |elt|) (911 . *) (917 . ^) (|Mapping| 118 15)
              (|StreamFunctions2| 15 118) (923 . |map|) (|List| 251)
              (929 . |elt|) (|Union| 277 '"failed") (|Vector| 11)
              (|IntegerLinearDependence| 11) (935 . |particularSolutionOverQ|)
              (941 . =) (|Vector| 50) (947 . |elt|) (|Mapping| 11 11)
              (953 . |map|) (|List| 114) (959 . |elt|) (965 . |setelt!|)
              (|Matrix| 13) (972 . |matrix|) (977 . ~=) (983 . |One|) (987 . /)
              (993 . |One|) (997 . |One|) (|List| 61) (|Mapping| 61 17)
              (|ListFunctions2| 17 61) (1001 . |map|) (1007 . |elt|)
              (1013 . ~=) (1019 . /) |LODOF2;testsc;2LodoMB;42|
              (1025 . |retract|) (|Union| 302 '"failed") (1030 . ~=)
              (|List| 99) (1036 . |elt|) (1042 . |One|) (1046 . |monomial|)
              (1052 . *) (1058 . +) (1064 . |One|) (1068 . /) (1074 . /)
              (1080 . |adjoint|) (|LinearOrdinaryDifferentialOperator1| 25)
              (|LODOConvertions| 11 8 25) (1085 . |convert|) (1090 . |Zero|)
              (|Union| 11 '#1="infinity") (1094 . =) (1100 . /) (1106 . ^)
              (1112 . D) (1116 . *) (1122 . -) (1127 . ~=)
              (1133 . |leadingCoefficient|) (1138 . |degree|) (1143 . ^)
              (1149 . +) (1155 . |reductum|) (1160 . ~=) (1166 . |rightGcd|)
              (1172 . |rightQuotient|) (1178 . |coerce|) (1183 . *) (1189 . *)
              (1195 . |leftGcd|) (1201 . |leftQuotient|) (|List| 50)
              (1207 . |elt|) (1213 . *) (|Vector| 99) (1219 . |vector|)
              (|Matrix| 99) (|List| 340) (|List| 15)
              (|VectorHermitePadeSolver|) (1224 . |hp_solve|) (1231 . |column|)
              (1237 . |members|) (1242 . *) (1248 . |append|) (|List| 312)
              (1254 . |elt|) (|Mapping| 103 99 354) (|List| 11)
              |LODOF2;factor;LodoMLL;47| (1260 . |concat|) (1266 . |concat!|)
              (1272 . -) (1277 . |One|) (1281 . |coefficient|) (1287 . /)
              (1293 . |minimumDegree|) (1298 . |lcm|) |LODOF2;testis;LodoB;49|
              (1303 . ~=) (1309 . |message|)
              (|Record| (|:| |point| 316) (|:| |lpf| 17) (|:| |dxt| 166))
              (|Record| (|:| |singularity| 367) (|:| |fos| 225)
                        (|:| |mge| 114))
              (|List| 368) |LODOF2;ge_minimal;LodoMSL;61| (1314 . |append|)
              (1320 . *) (1326 . |setelt!|) (1333 . -) (1338 . |min|)
              (|Character|) (1342 . |min|) (1348 . |min|)
              (|Mapping| 166 166 166) (|List| 166) (1354 . |reduce|)
              (1360 . |remove|) (|Record| (|:| |sing| 367) (|:| |arf| 199))
              (|List| 383) (1366 . |append|) (1372 . |elt|)
              (|Union| 351 '"failed") (1378 . ~=) (1384 . |adjoint|)
              |LODOF2;testfg;LodoML;51| (1389 . |convert|)
              |LODOF2;testlp;LodoULodo;54| (1394 . |Zero|) (1398 . ^)
              (1404 . *) (1410 . +) (|Kernel| $) (1416 . |minPoly|)
              (|Kernel| 11)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 399)
                                                     399 38
                                                     (|SparseMultivariatePolynomial|
                                                      38 399)
                                                     11)
              (1421 . |univariate|) |LODOF2;testgt;EKE;57| (1428 . |Zero|)
              (1432 . |monomial|) (1438 . +) (1444 . |rest|) (1450 . |rest|)
              (1456 . +) (|List| 397) (1462 . |kernels|) (1467 . |coerce|)
              (|Union| (|AlgebraicNumber|) '"failed") (1472 . |retractIfCan|)
              (1477 . |denominator|) (1482 . |eval|) (1489 . |degree|)
              (1494 . |retract|) (|Union| 50 '"-infinity") (1499 . =)
              (1505 . |max|)
              (|Record| (|:| |flag| 202) (|:| |factor| 99) (|:| |exponent| 15))
              (|List| 421) (1511 . |factorList|) (1516 . |rootOf|)
              (|Record| (|:| |ecs| 114) (|:| |ecr| 8) (|:| |ect| 25))
              (|List| 425) (1521 . |append|) |LODOF2;gen_exp;LodoUMLL;60|
              (|List| 8) (|CylindricalAlgebraicDecompositionUtilities| 11 8)
              (1527 . |squareFreeBasis|) (1532 . |append|) (|Mapping| 50 50 50)
              (1538 . |reduce|))
           '#(|testsc| 1544 |testsb| 1551 |testro| 1557 |testpd| 1564 |testnp|
              1569 |testlw| 1574 |testlp| 1584 |testln| 1590 |testll| 1600
              |testlc| 1610 |testis| 1620 |testgt| 1625 |testfr| 1631 |testfo|
              1638 |testfn| 1645 |testfg| 1652 |testf2| 1658 |testcx| 1665
              |testcp| 1671 |testco| 1678 |gen_exp| 1685 |ge_minimal| 1693
              |factor| 1700)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|testnp|
                                 ((|List|
                                   (|Record|
                                    (|:| |point|
                                         (|Record| (|:| |x| (|Integer|))
                                                   (|:| |y| (|Integer|))))
                                    (|:| |slope| (|Fraction| (|Integer|)))
                                    (|:| |npoly|
                                         (|UnivariatePolynomial| |#1|
                                                                 (|Expression|
                                                                  (|Integer|))))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))))
                                T)
                              '((|testfn|
                                 ((|List|
                                   (|LinearOrdinaryDifferentialOperator3|
                                    (|Expression| (|Integer|))
                                    (|UnivariateTaylorSeries|
                                     (|Expression| (|Integer|)) |#1| |#2|)
                                    (|UnivariateLaurentSeries|
                                     (|Expression| (|Integer|)) |#1| |#2|)))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T)
                              '((|testf2|
                                 ((|Record|
                                   (|:| |Qt|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|)) |#1| |#2|)
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|)))
                                   (|:| |Rt|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|)) |#1| |#2|)
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|testll|
                                 ((|Record|
                                   (|:| |laurl|
                                        (|List|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|)))
                                   (|:| |laurr|
                                        (|List|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testlc|
                                 ((|Record|
                                   (|:| |llc|
                                        (|List|
                                         (|Stream|
                                          (|Record| (|:| |k| (|Integer|))
                                                    (|:| |c|
                                                         (|Expression|
                                                          (|Integer|)))))))
                                   (|:| |rlc|
                                        (|List|
                                         (|Stream|
                                          (|Record| (|:| |k| (|Integer|))
                                                    (|:| |c|
                                                         (|Expression|
                                                          (|Integer|))))))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testln|
                                 ((|Record|
                                   (|:| |main|
                                        (|Record|
                                         (|:| |Qt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))
                                         (|:| |Rt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))))
                                   (|:| |nf|
                                        (|Record|
                                         (|:| |Qt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))
                                         (|:| |Rt|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|)) |#1|
                                                |#2|)))))
                                   (|:| |error|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|)) |#1| |#2|)
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|)) |#1|
                                          |#2|))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testlw|
                                 ((|Stream|
                                   (|Record|
                                    (|:| |Qt|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))
                                    (|:| |Rt|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))))
                                  (|Fraction| (|Integer|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testcp|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testco|
                                 ((|Boolean|)
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Fraction| (|Integer|)) (|Integer|)))
                                T)
                              '((|testcx|
                                 ((|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|testpd|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|UnivariatePolynomial| |#1|
                                                          (|Expression|
                                                           (|Integer|)))))
                                T)
                              '((|testfr|
                                 ((|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| |#1|
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|)
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial| |#1|
                                                                   (|Expression|
                                                                    (|Integer|))))))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T)
                              '((|testsb|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|Union|
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))))
                                T)
                              '((|testro|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Expression| (|Integer|))
                                  (|PositiveInteger|)))
                                T)
                              '((|testfo|
                                 ((|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|)) |#1|
                                            |#2|)))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| |#1|
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|)
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) |#1| |#2|))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|)) |#1|
                                             |#2|)))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial| |#1|
                                                                   (|Expression|
                                                                    (|Integer|))))))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T)
                              '((|testsc|
                                 ((|Boolean|)
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariatePolynomial| |#1|
                                                           (|Expression|
                                                            (|Integer|)))
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))))
                                T)
                              '((|testfg|
                                 ((|List|
                                   (|LinearOrdinaryDifferentialOperator1|
                                    (|Fraction|
                                     (|UnivariatePolynomial| |#1|
                                                             (|Expression|
                                                              (|Integer|))))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))))
                                T)
                              '((|testlp|
                                 ((|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|)
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) |#1| |#2|))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Union| (|Expression| (|Integer|))
                                           "infinity")))
                                T)
                              '((|factor|
                                 ((|List|
                                   (|LinearOrdinaryDifferentialOperator1|
                                    (|Fraction|
                                     (|UnivariatePolynomial| |#1|
                                                             (|Expression|
                                                              (|Integer|))))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|)))
                                   (|List| (|Expression| (|Integer|))))
                                  (|List| (|Expression| (|Integer|)))))
                                T)
                              '((|testis|
                                 ((|Boolean|)
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))))
                                T)
                              '((|testgt|
                                 ((|Expression| (|Integer|))
                                  (|Expression| (|Integer|))
                                  (|Kernel| (|Expression| (|Integer|)))))
                                T)
                              '((|gen_exp|
                                 ((|List|
                                   (|Record|
                                    (|:| |ecs|
                                         (|List|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))
                                    (|:| |ecr|
                                         (|UnivariatePolynomial| |#1|
                                                                 (|Expression|
                                                                  (|Integer|))))
                                    (|:| |ect|
                                         (|Fraction|
                                          (|UnivariatePolynomial| |#1|
                                                                  (|Expression|
                                                                   (|Integer|)))))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Union| (|Expression| (|Integer|))
                                           "infinity")
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|)))
                                   (|List| (|Expression| (|Integer|))))
                                  (|List| (|Expression| (|Integer|)))))
                                T)
                              '((|ge_minimal|
                                 ((|List|
                                   (|Record|
                                    (|:| |singularity|
                                         (|Record|
                                          (|:| |point|
                                               (|Union|
                                                (|Expression| (|Integer|))
                                                #1#))
                                          (|:| |lpf|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 |#1| |#2|)
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 |#1| |#2|)))
                                          (|:| |dxt| (|PositiveInteger|))))
                                    (|:| |fos|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |#1| |#2|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |#1| |#2|)))
                                           (|:| |ram|
                                                (|UnivariatePolynomial| |#1|
                                                                        (|Expression|
                                                                         (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 |#1| |#2|)))))
                                    (|:| |mge|
                                         (|List|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|)) |#1|
                                           |#2|)))))
                                  (|LinearOrdinaryDifferentialOperator1|
                                   (|Fraction|
                                    (|UnivariatePolynomial| |#1|
                                                            (|Expression|
                                                             (|Integer|)))))
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|))))
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 434
                                            '(1 9 0 8 10 0 11 0 12 0 13 0 14 2
                                              9 8 0 15 16 0 17 0 18 0 11 0 19 0
                                              13 0 20 0 21 0 22 2 21 23 0 0 24
                                              1 21 25 0 26 1 25 8 0 27 1 13 0 9
                                              28 1 25 8 0 29 1 13 30 0 31 2 13
                                              0 9 0 32 1 21 15 0 33 2 17 0 13
                                              15 34 2 17 0 0 0 35 1 21 0 0 36 1
                                              17 13 0 37 1 13 38 0 39 2 17 23 0
                                              0 40 1 17 15 0 41 2 13 38 0 38 42
                                              2 15 23 0 0 43 1 17 0 0 44 2 46
                                              45 0 38 47 2 15 23 0 0 48 2 38 23
                                              0 0 49 2 50 0 38 38 51 0 8 0 52 1
                                              50 38 0 53 2 17 13 0 15 54 1 50
                                              38 0 55 2 38 0 15 0 56 2 13 11 0
                                              38 57 2 8 0 11 15 58 2 8 0 0 0 59
                                              2 61 0 0 0 62 1 66 65 0 67 0 50 0
                                              68 2 50 23 0 0 69 2 8 0 0 15 70 3
                                              71 8 0 38 8 72 1 65 73 0 74 1 8
                                              15 0 75 2 8 11 0 15 76 2 11 0 0 0
                                              77 1 11 0 38 78 2 11 0 0 0 79 1
                                              80 23 11 81 2 11 23 0 0 82 1 80
                                              38 11 83 1 8 0 38 84 3 8 0 0 0 0
                                              85 2 8 0 0 0 86 2 8 23 0 0 87 2
                                              38 23 0 0 88 2 71 8 0 38 89 2 8 0
                                              0 0 90 2 65 0 0 0 91 2 65 38 64 0
                                              92 2 65 64 0 38 93 2 94 0 0 0 95
                                              1 8 99 0 100 1 8 0 99 101 2 104
                                              66 102 103 105 1 50 0 38 106 2 50
                                              0 38 0 107 2 50 0 0 0 108 2 50 0
                                              0 0 109 2 8 0 0 0 110 2 50 23 0 0
                                              111 2 114 13 0 38 115 2 120 119 0
                                              38 121 1 13 0 119 122 2 114 0 0 0
                                              123 2 127 124 125 126 128 1 50 38
                                              0 129 0 132 0 133 2 38 0 0 0 134
                                              2 136 0 135 38 137 2 38 0 0 0 138
                                              2 38 0 0 0 139 1 50 140 0 141 2
                                              140 23 0 0 142 3 144 119 143 124
                                              136 145 2 120 0 0 0 146 1 119 0
                                              147 148 2 13 0 11 38 149 2 17 0 0
                                              13 150 2 8 151 0 0 152 0 8 0 153
                                              2 8 23 0 0 154 2 8 0 0 0 155 1 8
                                              0 0 156 0 11 0 157 0 13 0 158 0 9
                                              0 159 2 17 0 13 0 160 1 17 0 0
                                              161 2 17 0 0 0 162 3 8 164 0 0 0
                                              165 2 38 0 166 0 167 2 17 0 0 0
                                              168 1 17 169 0 170 1 169 171 0
                                              172 0 166 0 175 2 166 0 0 0 176 2
                                              179 0 178 177 180 2 182 126 181
                                              179 183 2 38 151 0 0 185 2 38 0 0
                                              0 186 1 50 38 0 187 1 50 38 0 189
                                              1 8 11 0 192 1 13 0 11 193 1 8 0
                                              0 194 2 61 60 0 38 196 1 199 198
                                              0 200 1 17 0 13 201 1 66 204 0
                                              205 1 8 140 0 206 2 140 23 0 0
                                              207 2 38 23 0 0 208 2 38 0 0 0
                                              209 2 211 38 210 0 212 2 204 203
                                              0 38 213 2 15 23 0 0 214 2 13 0 0
                                              38 215 1 13 0 0 216 2 13 0 11 0
                                              217 1 13 218 0 219 2 13 0 0 38
                                              220 1 11 0 0 221 2 11 0 15 0 222
                                              2 13 0 0 0 223 2 225 0 0 0 226 2
                                              17 23 0 0 227 2 17 0 0 0 228 2
                                              199 0 0 0 229 1 11 0 230 231 1 8
                                              0 11 232 2 11 0 0 38 233 2 11 0
                                              38 0 234 1 25 0 8 237 1 21 0 25
                                              238 2 17 0 0 15 239 2 11 23 0 0
                                              242 2 13 0 243 0 244 2 13 0 0 166
                                              245 2 50 0 0 38 246 1 11 0 50 247
                                              2 17 0 38 0 248 3 251 13 0 38 13
                                              252 0 17 0 253 3 17 13 0 13 13
                                              254 2 13 0 0 0 255 2 13 0 0 11
                                              256 2 13 0 0 0 257 2 251 0 258 0
                                              259 2 15 0 0 0 260 2 262 0 261 15
                                              263 2 251 13 0 38 264 2 15 0 0 0
                                              265 2 11 0 0 15 266 2 268 119 267
                                              262 269 2 270 251 0 38 271 2 274
                                              272 273 11 275 2 272 23 0 0 276 2
                                              277 50 0 38 278 2 13 0 279 0 280
                                              2 281 114 0 38 282 3 114 13 0 38
                                              13 283 1 284 0 281 285 2 13 23 0
                                              0 286 0 17 0 287 2 17 0 0 13 288
                                              0 50 0 289 0 9 0 290 2 293 291
                                              292 94 294 2 291 61 0 38 295 2 61
                                              23 0 0 296 2 8 0 0 11 297 1 13 9
                                              0 299 2 300 23 0 0 301 2 302 99 0
                                              38 303 0 25 0 304 2 21 0 25 15
                                              305 2 21 0 25 0 306 2 21 0 0 0
                                              307 0 21 0 308 2 21 0 0 25 309 2
                                              25 0 0 0 310 1 21 0 0 311 1 313
                                              312 21 314 0 312 0 315 2 316 23 0
                                              0 317 2 25 0 8 8 318 2 8 0 0 166
                                              319 0 312 0 320 2 312 0 25 0 321
                                              1 312 0 0 322 2 312 23 0 0 323 1
                                              312 25 0 324 1 312 15 0 325 2 312
                                              0 0 15 326 2 312 0 0 0 327 1 312
                                              0 0 328 2 97 23 0 0 329 2 312 0 0
                                              0 330 2 312 0 0 0 331 1 312 0 25
                                              332 2 312 0 0 25 333 2 312 0 0 0
                                              334 2 312 0 0 0 335 2 312 0 0 0
                                              336 2 337 50 0 38 338 2 132 0 38
                                              0 339 1 340 0 302 341 3 345 342
                                              343 344 15 346 2 342 340 0 38 347
                                              1 340 302 0 348 2 50 0 0 38 349 2
                                              281 0 0 0 350 2 351 312 0 38 352
                                              2 351 0 0 0 356 2 351 0 0 0 357 1
                                              25 0 0 358 0 312 0 359 2 312 25 0
                                              15 360 2 312 0 0 25 361 1 312 15
                                              0 362 1 8 0 73 363 2 25 23 0 0
                                              365 1 169 0 97 366 2 337 0 0 0
                                              371 2 50 0 15 0 372 3 337 50 0 38
                                              50 373 1 50 0 0 374 0 132 0 375 2
                                              376 0 0 0 377 2 166 0 0 0 378 2
                                              380 166 379 0 381 2 369 0 368 0
                                              382 2 384 0 0 0 385 2 199 198 0
                                              38 386 2 387 23 0 0 388 1 17 0 0
                                              389 1 313 21 312 391 0 25 0 393 2
                                              25 0 0 15 394 2 25 0 8 0 395 2 25
                                              0 0 0 396 1 11 230 397 398 3 400
                                              99 11 399 99 401 0 99 0 403 2 99
                                              0 11 15 404 2 99 0 0 0 405 2 114
                                              0 0 15 406 2 225 0 0 15 407 2 11
                                              0 0 0 408 1 11 409 0 410 1 11 0
                                              397 411 1 11 412 0 413 1 11 0 0
                                              414 3 11 0 0 397 0 415 1 99 15 0
                                              416 1 11 50 0 417 2 418 23 0 0
                                              419 2 50 0 0 0 420 1 103 422 0
                                              423 1 11 0 230 424 2 426 0 0 0
                                              427 1 430 429 429 431 2 65 0 0 0
                                              432 2 337 50 433 0 434 3 0 23 21
                                              21 96 298 2 0 17 240 21 241 3 0
                                              17 21 11 166 249 1 0 17 8 195 1 0
                                              61 21 63 6 0 126 50 21 8 8 50 38
                                              184 2 0 17 312 316 392 6 0 173 50
                                              21 8 8 50 38 174 6 0 116 50 21 8
                                              8 50 38 117 6 0 130 50 21 8 8 50
                                              38 131 1 0 23 312 364 2 0 11 11
                                              399 402 3 0 235 21 96 97 236 3 0
                                              235 21 96 97 250 3 0 94 21 96 97
                                              98 2 0 351 312 96 390 3 0 112 21
                                              8 50 113 2 0 8 21 50 191 3 0 17
                                              21 50 38 188 3 0 23 21 50 38 190
                                              4 0 426 312 316 353 354 428 3 0
                                              369 312 96 97 370 3 0 351 312 353
                                              354 355)))))
           '|lookupComplete|)) 