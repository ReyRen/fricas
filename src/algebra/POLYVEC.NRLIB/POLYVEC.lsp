
(SDEFUN |POLYVEC;copy_first;2UvIV;1|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G397 NIL) (|j| NIL) (|ns| (|SingleInteger|)))
               (SEQ (LETT |ns| |n|)
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (|sub_SI| |ns| 1)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;copy_slice;2Uv2IV;2|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|m| |Integer|) (|n| |Integer|)
         ($ |Void|))
        (SPROG
         ((#1=#:G401 NIL) (|j| NIL) (|ns| #2=(|SingleInteger|)) (|ms| #2#))
         (SEQ (LETT |ms| |m|) (LETT |ns| |n|)
              (EXIT
               (SEQ (LETT |j| |ms|)
                    (LETT #1# (|sub_SI| (|add_SI| |ms| |ns|) 1)) G190
                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                    (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POLYVEC;eval_at;Uv4I;3|
        ((|v| |U32Vector|) (|deg| |Integer|) (|pt| |Integer|) (|p| |Integer|)
         ($ |Integer|))
        (SPROG ((|i| (|SingleInteger|)) (|res| (|Integer|)))
               (SEQ (LETT |i| |deg|) (LETT |res| 0)
                    (SEQ G190
                         (COND ((NULL (NULL (|less_SI| |i| 0))) (GO G191)))
                         (SEQ
                          (LETT |res|
                                (QSMULADDMOD64_32 |pt| |res| (ELT_U32 |v| |i|)
                                                  |p|))
                          (EXIT (LETT |i| (|sub_SI| |i| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |POLYVEC;to_mod_pa;SupIUv;4|
        ((|s| |SparseUnivariatePolynomial| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ncoeffs| (|U32Vector|))
          (|n0| (|SingleInteger|)))
         (SEQ
          (COND ((SPADCALL |s| (QREFELT $ 14)) (GETREFV_U32 1 0))
                ('T
                 (SEQ (LETT |n0| (SPADCALL |s| (QREFELT $ 17)))
                      (LETT |ncoeffs| (GETREFV_U32 (|add_SI| |n0| 1) 0))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |s| (QREFELT $ 14))))
                             (GO G191)))
                           (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 17)))
                                (SETELT_U32 |ncoeffs| |n|
                                            (SPADCALL
                                             (SPADCALL |s| (QREFELT $ 18)) |p|
                                             (QREFELT $ 19)))
                                (EXIT
                                 (LETT |s| (SPADCALL |s| (QREFELT $ 20)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |ncoeffs|))))))) 

(SDEFUN |POLYVEC;pa_to_sup;UvSup;5|
        ((|v| |U32Vector|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G415 NIL)
          (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QV_LEN_U32 |v|)) (LETT |res| (|spadConstant| $ 22))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (ELT_U32 |v| |i|) |i| (QREFELT $ 23))
                            |res| (QREFELT $ 24)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |POLYVEC;vector_add_mul;2Uv4IV;6|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|m| |Integer|) (|n| |Integer|)
         (|c| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G419 NIL) (|i| NIL) (|ns| #2=(|SingleInteger|)) (|ms| #2#))
         (SEQ (LETT |ms| |m|) (LETT |ns| |n|)
              (EXIT
               (SEQ (LETT |i| |ms|) (LETT #1# |ns|) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT_U32 |v1| |i|
                                  (QSMULADDMOD64_32 |c| (ELT_U32 |v2| |i|)
                                                    (ELT_U32 |v1| |i|) |p|))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POLYVEC;mul_by_binomial;Uv3IV;7|
        ((|v| |U32Vector|) (|n| |Integer|) (|pt| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((|prev_coeff| (|Integer|)) (|pp| (|Integer|)) (#1=#:G424 NIL)
          (|i| NIL) (|ns| (|SingleInteger|)))
         (SEQ (LETT |prev_coeff| 0) (LETT |ns| |n|)
              (EXIT
               (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| |ns| 1)) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ (LETT |pp| (ELT_U32 |v| |i|))
                         (SETELT_U32 |v| |i|
                                     (QSMULADDMOD64_32 |pt| |pp| |prev_coeff|
                                                       |p|))
                         (EXIT (LETT |prev_coeff| |pp|)))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POLYVEC;mul_by_binomial;Uv2IV;8|
        ((|v| |U32Vector|) (|pt| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPADCALL |v| (QV_LEN_U32 |v|) |pt| |p| (QREFELT $ 27))) 

(SDEFUN |POLYVEC;mul_by_scalar;Uv3IV;9|
        ((|v| |U32Vector|) (|n| |Integer|) (|c| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG ((#1=#:G429 NIL) (|i| NIL) (|ns| (|SingleInteger|)))
               (SEQ (LETT |ns| |n|)
                    (EXIT
                     (SEQ (LETT |i| 0) (LETT #1# |ns|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v| |i|
                                        (QSMULMOD32 |c| (ELT_U32 |v| |i|)
                                                    |p|))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;degree;UvI;10| ((|v| |U32Vector|) ($ |Integer|))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G435 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QV_LEN_U32 |v|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1)) G190 (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (EQL (ELT_U32 |v| |i|) 0))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# |i|) (GO #3=#:G433)))
                            (GO #4=#:G431))))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL)))
                 #4# (EXIT #1#))
                (EXIT -1)))
          #3# (EXIT #2#)))) 

(SDEFUN |POLYVEC;vector_combination;UvIUv4IV;11|
        ((|v1| |U32Vector|) (|c1| |Integer|) (|v2| |U32Vector|)
         (|c2| |Integer|) (|n| |Integer|) (|delta| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((#1=#:G447 NIL) (|i| NIL) (#2=#:G446 NIL) (#3=#:G445 NIL)
          (#4=#:G444 NIL) (|ds| #5=(|SingleInteger|)) (|ns| #5#))
         (SEQ (LETT |ns| |n|) (LETT |ds| |delta|)
              (EXIT
               (COND
                ((EQL |c1| 1)
                 (SEQ (LETT |i| |ds|) (LETT #4# |ns|) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT_U32 |v1| |i|
                                    (QSMULADDMOD64_32 |c2|
                                                      (ELT_U32 |v2|
                                                               (|sub_SI| |i|
                                                                         |ds|))
                                                      (ELT_U32 |v1| |i|)
                                                      |p|))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                ((|less_SI| (|add_SI| |ns| 1) |ds|)
                 (SEQ (LETT |i| 0) (LETT #3# |ns|) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT_U32 |v1| |i|
                                    (QSMULMOD32 (ELT_U32 |v1| |i|) |c1| |p|))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                ('T
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (|sub_SI| |ds| 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT_U32 |v1| |i|
                                     (QSMULMOD32 (ELT_U32 |v1| |i|) |c1|
                                                 |p|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |i| |ds|) (LETT #1# |ns|) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |v1| |i|
                                      (QSDOT2MOD64_32 (ELT_U32 |v1| |i|) |c1|
                                                      (ELT_U32 |v2|
                                                               (|sub_SI| |i|
                                                                         |ds|))
                                                      |c2| |p|))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT NIL)))))))))) 

(SDEFUN |POLYVEC;divide!;3UvIV;12|
        ((|r0| |U32Vector|) (|r1| |U32Vector|) (|res| |U32Vector|)
         (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G454 NIL) (|dr0| #2=(|SingleInteger|)) (#3=#:G455 NIL)
          (|c1| (|Integer|)) (|delta| (|SingleInteger|)) (|c0| (|Integer|))
          (|dr1| #2#))
         (SEQ (LETT |dr0| (SPADCALL |r0| (QREFELT $ 30)))
              (LETT |dr1| (SPADCALL |r1| (QREFELT $ 30)))
              (LETT |c0| (ELT_U32 |r1| |dr1|))
              (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 32)))
              (EXIT
               (SEQ
                (EXIT
                 (SEQ G190
                      (COND ((NULL (NULL (|less_SI| |dr0| |dr1|))) (GO G191)))
                      (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|))
                           (LETT |c1|
                                 (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|))
                           (SETELT_U32 |res| |delta| |c1|)
                           (LETT |c1| (- |p| |c1|)) (SETELT_U32 |r0| |dr0| 0)
                           (LETT |dr0| (|sub_SI| |dr0| 1))
                           (COND
                            ((|less_SI| |dr0| 0)
                             (PROGN (LETT #3# |$NoValue|) (GO #4=#:G451))))
                           (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p|
                                     (QREFELT $ 31))
                           (EXIT
                            (SEQ
                             (EXIT
                              (SEQ G190
                                   (COND
                                    ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                     (GO G191)))
                                   (SEQ (LETT |dr0| (|sub_SI| |dr0| 1))
                                        (EXIT
                                         (COND
                                          ((|less_SI| |dr0| 0)
                                           (PROGN
                                            (LETT #1# |$NoValue|)
                                            (GO #5=#:G449))))))
                                   NIL (GO G190) G191 (EXIT NIL)))
                             #5# (EXIT #1#))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #3#)))))) 

(SDEFUN |POLYVEC;remainder!;2UvIV;13|
        ((|r0| |U32Vector|) (|r1| |U32Vector|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G462 NIL) (|dr0| #2=(|SingleInteger|)) (#3=#:G463 NIL)
          (|c1| (|Integer|)) (|delta| (|SingleInteger|)) (|c0| (|Integer|))
          (|dr1| #2#))
         (SEQ (LETT |dr0| (SPADCALL |r0| (QREFELT $ 30)))
              (LETT |dr1| (SPADCALL |r1| (QREFELT $ 30)))
              (LETT |c0| (ELT_U32 |r1| |dr1|))
              (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 32)))
              (EXIT
               (SEQ
                (EXIT
                 (SEQ G190
                      (COND ((NULL (NULL (|less_SI| |dr0| |dr1|))) (GO G191)))
                      (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|))
                           (LETT |c1|
                                 (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|))
                           (LETT |c1| (- |p| |c1|)) (SETELT_U32 |r0| |dr0| 0)
                           (LETT |dr0| (|sub_SI| |dr0| 1))
                           (COND
                            ((|less_SI| |dr0| 0)
                             (PROGN (LETT #3# |$NoValue|) (GO #4=#:G459))))
                           (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p|
                                     (QREFELT $ 31))
                           (EXIT
                            (SEQ
                             (EXIT
                              (SEQ G190
                                   (COND
                                    ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                     (GO G191)))
                                   (SEQ (LETT |dr0| (|sub_SI| |dr0| 1))
                                        (EXIT
                                         (COND
                                          ((|less_SI| |dr0| 0)
                                           (PROGN
                                            (LETT #1# |$NoValue|)
                                            (GO #5=#:G457))))))
                                   NIL (GO G190) G191 (EXIT NIL)))
                             #5# (EXIT #1#))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #3#)))))) 

(SDEFUN |POLYVEC;gcd;2UvIUv;14|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G481 NIL) (|c| #2=(|Integer|)) (|dr1| #3=(|SingleInteger|))
          (|r1| #4=(|U32Vector|)) (|dr0| #3#) (|r0| #4#)
          (|tmp| #5=(|SingleInteger|)) (|tmpp| (|U32Vector|)) (#6=#:G480 NIL)
          (|c0| #2#) (|c1| (|Integer|)) (|delta| #5#))
         (SEQ
          (EXIT
           (SEQ (LETT |dr0| (SPADCALL |y| (QREFELT $ 30)))
                (COND
                 ((|less_SI| |dr0| 0)
                  (SEQ (LETT |tmpp| |x|) (LETT |x| |y|) (LETT |y| |tmpp|)
                       (LETT |dr1| |dr0|)
                       (EXIT (LETT |dr0| (SPADCALL |y| (QREFELT $ 30))))))
                 (#7='T (LETT |dr1| (SPADCALL |x| (QREFELT $ 30)))))
                (EXIT
                 (COND
                  ((|less_SI| |dr0| 0)
                   (PROGN (LETT #1# (GETREFV_U32 1 0)) (GO #8=#:G479)))
                  (#7#
                   (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0))
                        (SPADCALL |r0| |y| (|add_SI| |dr0| 1) (QREFELT $ 9))
                        (EXIT
                         (COND
                          ((|less_SI| |dr1| 0)
                           (SEQ (LETT |c| (ELT_U32 |r0| |dr0|))
                                (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)))
                                (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                                (EXIT (PROGN (LETT #1# |r0|) (GO #8#)))))
                          (#7#
                           (SEQ (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0))
                                (SPADCALL |r1| |x| (|add_SI| |dr1| 1)
                                          (QREFELT $ 9))
                                (SEQ G190
                                     (COND
                                      ((NULL (|less_SI| 0 |dr1|)) (GO G191)))
                                     (SEQ
                                      (SEQ G190
                                           (COND
                                            ((NULL
                                              (NULL (|less_SI| |dr0| |dr1|)))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |delta|
                                                  (|sub_SI| |dr0| |dr1|))
                                            (LETT |c1|
                                                  (|sub_SI| |p|
                                                            (ELT_U32 |r0|
                                                                     |dr0|)))
                                            (LETT |c0| (ELT_U32 |r1| |dr1|))
                                            (COND
                                             ((SPADCALL |c0| 1 (QREFELT $ 35))
                                              (COND
                                               ((SPADCALL |delta| 30
                                                          (QREFELT $ 36))
                                                (SEQ
                                                 (LETT |c0|
                                                       (SPADCALL |c0| |p|
                                                                 (QREFELT $
                                                                          32)))
                                                 (SPADCALL |r1| |dr1| |c0| |p|
                                                           (QREFELT $ 29))
                                                 (EXIT (LETT |c0| 1)))))))
                                            (SETELT_U32 |r0| |dr0| 0)
                                            (LETT |dr0| (|sub_SI| |dr0| 1))
                                            (SPADCALL |r0| |c0| |r1| |c1| |dr0|
                                                      |delta| |p|
                                                      (QREFELT $ 31))
                                            (EXIT
                                             (SEQ
                                              (EXIT
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (EQL
                                                        (ELT_U32 |r0| |dr0|)
                                                        0))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |dr0|
                                                           (|sub_SI| |dr0| 1))
                                                     (EXIT
                                                      (COND
                                                       ((|less_SI| |dr0| 0)
                                                        (PROGN
                                                         (LETT #6# |$NoValue|)
                                                         (GO #9=#:G469))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL)))
                                              #9# (EXIT #6#))))
                                           NIL (GO G190) G191 (EXIT NIL))
                                      (LETT |tmpp| |r0|) (LETT |tmp| |dr0|)
                                      (LETT |r0| |r1|) (LETT |dr0| |dr1|)
                                      (LETT |r1| |tmpp|)
                                      (EXIT (LETT |dr1| |tmp|)))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((|less_SI| |dr1| 0)
                                   (SEQ (LETT |c| (ELT_U32 |r0| |dr0|))
                                        (LETT |c|
                                              (SPADCALL |c| |p|
                                                        (QREFELT $ 32)))
                                        (SPADCALL |r0| |dr0| |c| |p|
                                                  (QREFELT $ 29))
                                        (EXIT |r0|)))
                                  (#7#
                                   (SEQ (SETELT_U32 |r1| 0 1)
                                        (EXIT
                                         (PROGN
                                          (LETT #1# |r1|)
                                          (GO #8#)))))))))))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |POLYVEC;gcd;Pa3IUv;15|
        ((|a| |PrimitiveArray| (|U32Vector|)) (|lo| |Integer|) (|hi| |Integer|)
         (|p| |Integer|) ($ |U32Vector|))
        (SPROG ((|res| (|U32Vector|)) (#1=#:G485 NIL) (|i| NIL))
               (SEQ (LETT |res| (QAREF1 |a| |lo|))
                    (SEQ (LETT |i| (+ |lo| 1)) (LETT #1# |hi|) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (QAREF1 |a| |i|) |res| |p|
                                           (QREFELT $ 37)))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |POLYVEC;lcm2|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|tmp2| #1=(|U32Vector|)) (|tmp1| #1#) (|dpp| #2=(|Integer|))
          (|dv2| #2#) (|pp| (|U32Vector|)))
         (SEQ (LETT |pp| (SPADCALL |v1| |v2| |p| (QREFELT $ 37)))
              (LETT |dv2| (SPADCALL |v2| (QREFELT $ 30)))
              (LETT |dpp| (SPADCALL |pp| (QREFELT $ 30)))
              (EXIT
               (COND ((EQL |dv2| |dpp|) |v1|)
                     ((EQL |dpp| 0) (SPADCALL |v1| |v2| |p| (QREFELT $ 40)))
                     ('T
                      (SEQ (LETT |tmp1| (GETREFV_U32 (+ |dv2| 1) 0))
                           (LETT |tmp2| (GETREFV_U32 (+ (- |dv2| |dpp|) 1) 0))
                           (SPADCALL |tmp1| |v2| (+ |dv2| 1) (QREFELT $ 9))
                           (SPADCALL |tmp1| |pp| |tmp2| |p| (QREFELT $ 33))
                           (EXIT
                            (SPADCALL |v1| |tmp2| |p| (QREFELT $ 40)))))))))) 

(SDEFUN |POLYVEC;lcm;Pa3IUv;17|
        ((|a| |PrimitiveArray| (|U32Vector|)) (|lo| |Integer|) (|hi| |Integer|)
         (|p| |Integer|) ($ |U32Vector|))
        (SPROG ((|res| (|U32Vector|)) (#1=#:G492 NIL) (|i| NIL))
               (SEQ (LETT |res| (QAREF1 |a| |lo|))
                    (SEQ (LETT |i| (+ |lo| 1)) (LETT #1# |hi|) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (|POLYVEC;lcm2| (QAREF1 |a| |i|) |res| |p|
                                  $))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |POLYVEC;mul;2UvIUv;18|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|zcoeffs| (|U32Vector|)) (|zdeg0| (|NonNegativeInteger|))
          (|zdeg| (|SingleInteger|)) (|ycoeffs| (|U32Vector|))
          (|xcoeffs| #1=(|U32Vector|)) (|ydeg| #2=(|SingleInteger|))
          (|xdeg| #2#) (|tmp| #2#) (|tmpp| #1#))
         (SEQ (LETT |xdeg| (SPADCALL |x| (QREFELT $ 30)))
              (LETT |ydeg| (SPADCALL |y| (QREFELT $ 30)))
              (COND
               ((SPADCALL |xdeg| |ydeg| (QREFELT $ 43))
                (SEQ (LETT |tmpp| |x|) (LETT |tmp| |xdeg|) (LETT |x| |y|)
                     (LETT |xdeg| |ydeg|) (LETT |y| |tmpp|)
                     (EXIT (LETT |ydeg| |tmp|)))))
              (LETT |xcoeffs| |x|) (LETT |ycoeffs| |y|)
              (EXIT
               (COND ((|less_SI| |xdeg| 0) |x|)
                     ('T
                      (SEQ
                       (COND
                        ((|eql_SI| |xdeg| 0)
                         (COND
                          ((EQL (ELT_U32 |xcoeffs| 0) 1)
                           (EXIT (SPADCALL |y| (QREFELT $ 44)))))))
                       (LETT |zdeg| (|add_SI| |xdeg| |ydeg|))
                       (LETT |zdeg0| (|add_SI| |zdeg| 1))
                       (LETT |zcoeffs| (GETREFV_U32 |zdeg0| 0))
                       (|POLYVEC;inner_mul| |xcoeffs| |ycoeffs| |zcoeffs|
                        |xdeg| |ydeg| |zdeg| |p| $)
                       (EXIT |zcoeffs|)))))))) 

(SDEFUN |POLYVEC;inner_mul|
        ((|x| . #1=(|U32Vector|)) (|y| |U32Vector|) (|z| |U32Vector|)
         (|xdeg| . #2=(|SingleInteger|)) (|ydeg| |SingleInteger|)
         (|zdeg| |SingleInteger|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((|ss| (|Integer|)) (#3=#:G515 NIL) (|j| NIL) (#4=#:G514 NIL)
          (|i| NIL) (#5=#:G513 NIL) (#6=#:G512 NIL) (#7=#:G511 NIL)
          (#8=#:G510 NIL) (|tmp| #2#) (|tmpp| #1#))
         (SEQ
          (COND
           ((|less_SI| |ydeg| |xdeg|)
            (SEQ (LETT |tmpp| |x|) (LETT |tmp| |xdeg|) (LETT |x| |y|)
                 (LETT |xdeg| |ydeg|) (LETT |y| |tmpp|)
                 (EXIT (LETT |ydeg| |tmp|)))))
          (LETT |xdeg|
                (COND ((|less_SI| |zdeg| |xdeg|) |zdeg|) (#9='T |xdeg|)))
          (LETT |ydeg| (COND ((|less_SI| |zdeg| |ydeg|) |zdeg|) (#9# |ydeg|)))
          (SEQ (LETT |i| 0) (LETT #8# |xdeg|) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ (LETT |ss| (ELT_U32 |z| |i|))
                    (SEQ (LETT |j| 0) (LETT #7# |i|) G190
                         (COND ((|greater_SI| |j| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (QSMULADD64_32 (ELT_U32 |x| (- |i| |j|))
                                                (ELT_U32 |y| |j|) |ss|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SETELT_U32 |z| |i| (QSMOD64_32 |ss| |p|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (|add_SI| |xdeg| 1)) (LETT #6# |ydeg|) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ (LETT |ss| (ELT_U32 |z| |i|))
                    (SEQ (LETT |j| 0) (LETT #5# |xdeg|) G190
                         (COND ((|greater_SI| |j| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (QSMULADD64_32 (ELT_U32 |x| |j|)
                                                (ELT_U32 |y| (- |i| |j|))
                                                |ss|))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SETELT_U32 |z| |i| (QSMOD64_32 |ss| |p|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SEQ (LETT |i| (|add_SI| |ydeg| 1)) (LETT #4# |zdeg|) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ (LETT |ss| (ELT_U32 |z| |i|))
                     (SEQ (LETT |j| (|sub_SI| |i| |xdeg|)) (LETT #3# |ydeg|)
                          G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |ss|
                                  (QSMULADD64_32
                                   (ELT_U32 |x| (|sub_SI| |i| |j|))
                                   (ELT_U32 |y| |j|) |ss|))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                     (EXIT (SETELT_U32 |z| |i| (QSMOD64_32 |ss| |p|))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POLYVEC;truncated_mul_add;3Uv2IV;20|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|z| |U32Vector|) (|m| |Integer|)
         (|p| |Integer|) ($ |Void|))
        (SPROG ((|ydeg| #1=(|SingleInteger|)) (|xdeg| #1#))
               (SEQ (LETT |xdeg| (- (QV_LEN_U32 |x|) 1))
                    (LETT |ydeg| (- (QV_LEN_U32 |y|) 1))
                    (EXIT
                     (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p|
                      $))))) 

(SDEFUN |POLYVEC;truncated_multiplication;2Uv2IUv;21|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|m| |Integer|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG ((|z| (|U32Vector|)) (|ydeg| #1=(|SingleInteger|)) (|xdeg| #1#))
               (SEQ (LETT |xdeg| (- (QV_LEN_U32 |x|) 1))
                    (LETT |ydeg| (- (QV_LEN_U32 |y|) 1))
                    (LETT |z| (GETREFV_U32 (|add_SI| |m| 1) 0))
                    (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $)
                    (EXIT |z|)))) 

(SDEFUN |POLYVEC;pow;UvPiNniIUv;22|
        ((|x| |U32Vector|) (|n| |PositiveInteger|) (|d| |NonNegativeInteger|)
         (|p| |Integer|) ($ |U32Vector|))
        (COND ((EQL |n| 1) |x|)
              ((ODDP |n|)
               (SPADCALL |x|
                         (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 46))
                                   (ASH |n| -1) |d| |p| (QREFELT $ 48))
                         |d| |p| (QREFELT $ 46)))
              ('T
               (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 46)) (ASH |n| -1)
                         |d| |p| (QREFELT $ 48))))) 

(SDEFUN |POLYVEC;differentiate;UvIUv;23|
        ((|x| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|i1| (|NonNegativeInteger|)) (#1=#:G530 NIL) (|i| NIL)
          (|r| (|U32Vector|)) (#2=#:G524 NIL) (|d| (|Integer|)))
         (SEQ (LETT |d| (- (QV_LEN_U32 |x|) 1))
              (EXIT
               (COND ((ZEROP |d|) (GETREFV_U32 0 0))
                     ('T
                      (SEQ
                       (LETT |r|
                             (GETREFV_U32
                              (PROG1 (LETT #2# |d|)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              0))
                       (SEQ (LETT |i| 0) (LETT #1# (- |d| 1)) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ (LETT |i1| (+ |i| 1))
                                 (EXIT
                                  (SETELT_U32 |r| |i|
                                              (QSMULMOD32 |i1|
                                                          (ELT_U32 |x| |i1|)
                                                          |p|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |r|)))))))) 

(SDEFUN |POLYVEC;differentiate;UvNniIUv;24|
        ((|x| |U32Vector|) (|n| |NonNegativeInteger|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|f| (|Integer|)) (#1=#:G539 NIL) (|k| NIL) (|j| #2=(|Integer|))
          (#3=#:G538 NIL) (|i| NIL) (|r| (|U32Vector|)) (|d| #2#))
         (SEQ
          (COND ((ZEROP |n|) |x|)
                (#4='T
                 (SEQ (LETT |d| (- (QV_LEN_U32 |x|) 1))
                      (EXIT
                       (COND ((< |d| |n|) (GETREFV_U32 0 0))
                             (#4#
                              (SEQ (LETT |r| (GETREFV_U32 (+ (- |d| |n|) 1) 0))
                                   (SEQ (LETT |i| |n|) (LETT #3# |d|) G190
                                        (COND ((> |i| #3#) (GO G191)))
                                        (SEQ (LETT |j| (- |i| |n|))
                                             (LETT |f| (+ |j| 1))
                                             (SEQ (LETT |k| (+ |j| 2))
                                                  (LETT #1# |i|) G190
                                                  (COND
                                                   ((> |k| #1#) (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |f|
                                                          (QSMULMOD32 |f| |k|
                                                                      |p|))))
                                                  (LETT |k| (+ |k| 1))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (SETELT_U32 |r| |j|
                                                          (QSMULMOD32 |f|
                                                                      (ELT_U32
                                                                       |x| |i|)
                                                                      |p|))))
                                        (LETT |i| (+ |i| 1)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT |r|))))))))))) 

(SDEFUN |POLYVEC;extended_gcd;2UvIL;25|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|)
         ($ |List| (|U32Vector|)))
        (SPROG
         ((|c| #1=(|Integer|)) (#2=#:G556 NIL) (|t1| #3=(|U32Vector|))
          (|t0| #3#) (|#G128| #3#) (|#G127| #3#) (|s1| #3#) (|s0| #3#)
          (|#G126| #3#) (|#G125| #3#) (|dr1| #4=(|SingleInteger|)) (|dr0| #4#)
          (|#G124| #5=(|SingleInteger|)) (|#G123| #4#) (|r1| #3#) (|r0| #3#)
          (|#G122| #3#) (|#G121| #3#) (#6=#:G555 NIL) (|c0| #1#)
          (|c1| (|Integer|)) (|delta| #5#) (|ds| #7=(|SingleInteger|))
          (|dt| #7#) (|swapped| (|Boolean|)) (|#G119| (|U32Vector|))
          (|#G118| (|U32Vector|)))
         (SEQ
          (EXIT
           (SEQ (LETT |dr0| (SPADCALL |x| (QREFELT $ 30))) (LETT |swapped| NIL)
                (COND
                 ((|less_SI| |dr0| 0)
                  (SEQ
                   (PROGN
                    (LETT |#G118| |y|)
                    (LETT |#G119| |x|)
                    (LETT |x| |#G118|)
                    (LETT |y| |#G119|))
                   (LETT |dr1| |dr0|)
                   (LETT |dr0| (SPADCALL |x| (QREFELT $ 30)))
                   (EXIT (LETT |swapped| 'T))))
                 (#8='T (LETT |dr1| (SPADCALL |y| (QREFELT $ 30)))))
                (EXIT
                 (COND
                  ((|less_SI| |dr1| 0)
                   (COND
                    ((|less_SI| |dr0| 0)
                     (PROGN
                      (LETT #2#
                            (LIST (GETREFV_U32 1 0) (GETREFV_U32 1 0)
                                  (GETREFV_U32 1 1)))
                      (GO #9=#:G554)))
                    (#8#
                     (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0))
                          (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                          (LETT |c| (ELT_U32 |r0| |dr0|))
                          (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)))
                          (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                          (LETT |t0| (GETREFV_U32 1 |c|))
                          (EXIT
                           (COND
                            (|swapped|
                             (PROGN
                              (LETT #2# (LIST |r0| (GETREFV_U32 1 0) |t0|))
                              (GO #9#)))
                            (#8#
                             (PROGN
                              (LETT #2# (LIST |r0| |t0| (GETREFV_U32 1 0)))
                              (GO #9#)))))))))
                  (|swapped| (|error| "impossible"))
                  (#8#
                   (SEQ
                    (LETT |dt|
                          (COND
                           ((SPADCALL |dr0| 0 (QREFELT $ 43))
                            (|sub_SI| |dr0| 1))
                           (#8# 0)))
                    (LETT |ds|
                          (COND
                           ((SPADCALL |dr1| 0 (QREFELT $ 43))
                            (|sub_SI| |dr1| 1))
                           (#8# 0)))
                    (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0))
                    (LETT |t0| (GETREFV_U32 (|add_SI| |dt| 1) 0))
                    (LETT |s0| (GETREFV_U32 (|add_SI| |ds| 1) 0))
                    (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                    (SETELT_U32 |s0| 0 1)
                    (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0))
                    (LETT |t1| (GETREFV_U32 (|add_SI| |dt| 1) 0))
                    (LETT |s1| (GETREFV_U32 (|add_SI| |ds| 1) 0))
                    (SPADCALL |r1| |y| (|add_SI| |dr1| 1) (QREFELT $ 9))
                    (SETELT_U32 |t1| 0 1)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |dr1| 0 (QREFELT $ 43))) (GO G191)))
                         (SEQ
                          (SEQ G190
                               (COND
                                ((NULL (SPADCALL |dr0| |dr1| (QREFELT $ 51)))
                                 (GO G191)))
                               (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|))
                                    (LETT |c1|
                                          (|sub_SI| |p| (ELT_U32 |r0| |dr0|)))
                                    (LETT |c0| (ELT_U32 |r1| |dr1|))
                                    (COND
                                     ((SPADCALL |c0| 1 (QREFELT $ 35))
                                      (COND
                                       ((SPADCALL |delta| 30 (QREFELT $ 43))
                                        (SEQ
                                         (LETT |c0|
                                               (SPADCALL |c0| |p|
                                                         (QREFELT $ 32)))
                                         (SPADCALL |r1| |dr1| |c0| |p|
                                                   (QREFELT $ 29))
                                         (SPADCALL |t1| |dt| |c0| |p|
                                                   (QREFELT $ 29))
                                         (SPADCALL |s1| |ds| |c0| |p|
                                                   (QREFELT $ 29))
                                         (EXIT (LETT |c0| 1)))))))
                                    (SETELT_U32 |r0| |dr0| 0)
                                    (LETT |dr0| (|sub_SI| |dr0| 1))
                                    (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta|
                                              |p| (QREFELT $ 31))
                                    (SPADCALL |t0| |c0| |t1| |c1| |dt| |delta|
                                              |p| (QREFELT $ 31))
                                    (SPADCALL |s0| |c0| |s1| |c1| |ds| |delta|
                                              |p| (QREFELT $ 31))
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (EQL (ELT_U32 |r0| |dr0|) 0))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |dr0| (|sub_SI| |dr0| 1))
                                             (EXIT
                                              (COND
                                               ((|less_SI| |dr0| 0)
                                                (PROGN
                                                 (LETT #6# |$NoValue|)
                                                 (GO #10=#:G545))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #10# (EXIT #6#))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (PROGN
                           (LETT |#G121| |r1|)
                           (LETT |#G122| |r0|)
                           (LETT |r0| |#G121|)
                           (LETT |r1| |#G122|))
                          (PROGN
                           (LETT |#G123| |dr1|)
                           (LETT |#G124| |dr0|)
                           (LETT |dr0| |#G123|)
                           (LETT |dr1| |#G124|))
                          (PROGN
                           (LETT |#G125| |s1|)
                           (LETT |#G126| |s0|)
                           (LETT |s0| |#G125|)
                           (LETT |s1| |#G126|))
                          (EXIT
                           (PROGN
                            (LETT |#G127| |t1|)
                            (LETT |#G128| |t0|)
                            (LETT |t0| |#G127|)
                            (LETT |t1| |#G128|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |dr1| 0 (QREFELT $ 51))
                       (SEQ (LETT |c| (ELT_U32 |r1| 0))
                            (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)))
                            (SETELT_U32 |r1| 0 1)
                            (SPADCALL |s1| |ds| |c| |p| (QREFELT $ 29))
                            (SPADCALL |t1| |dt| |c| |p| (QREFELT $ 29))
                            (EXIT
                             (PROGN
                              (LETT #2# (LIST |r1| |s1| |t1|))
                              (GO #9#)))))
                      (#8#
                       (SEQ (LETT |c| (ELT_U32 |r0| |dr0|))
                            (LETT |c| (SPADCALL |c| |p| (QREFELT $ 32)))
                            (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 29))
                            (SPADCALL |s0| |ds| |c| |p| (QREFELT $ 29))
                            (SPADCALL |t0| |dt| |c| |p| (QREFELT $ 29))
                            (EXIT (LIST |r0| |s0| |t0|))))))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |POLYVEC;resultant;2Uv2I;26|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |Integer|))
        (SPROG
         ((|res| (|SingleInteger|)) (#1=#:G571 NIL)
          (|dr0| #2=(|SingleInteger|)) (|c1| (|Integer|))
          (|delta| (|SingleInteger|)) (|c0| (|Integer|)) (|dr1| #2#)
          (|#G139| #2#) (|#G138| #2#) (|r1| #3=(|U32Vector|)) (|r0| #3#)
          (|#G137| #3#) (|#G136| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |dr0| (SPADCALL |x| (QREFELT $ 30)))
                (EXIT
                 (COND ((|less_SI| |dr0| 0) 0)
                       (#4='T
                        (SEQ (LETT |dr1| (SPADCALL |y| (QREFELT $ 30)))
                             (EXIT
                              (COND ((|less_SI| |dr1| 0) 0)
                                    (#4#
                                     (SEQ
                                      (LETT |r0|
                                            (GETREFV_U32 (|add_SI| |dr0| 1) 0))
                                      (SPADCALL |r0| |x| (|add_SI| |dr0| 1)
                                                (QREFELT $ 9))
                                      (LETT |r1|
                                            (GETREFV_U32 (|add_SI| |dr1| 1) 0))
                                      (SPADCALL |r1| |y| (|add_SI| |dr1| 1)
                                                (QREFELT $ 9))
                                      (LETT |res| 1)
                                      (EXIT
                                       (SEQ G190 NIL
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((|less_SI| |dr0| |dr1|)
                                                (SEQ
                                                 (PROGN
                                                  (LETT |#G136| |r1|)
                                                  (LETT |#G137| |r0|)
                                                  (LETT |r0| |#G136|)
                                                  (LETT |r1| |#G137|))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT |#G138| |dr1|)
                                                   (LETT |#G139| |dr0|)
                                                   (LETT |dr0| |#G138|)
                                                   (LETT |dr1| |#G139|)))))
                                               ('T
                                                (SEQ
                                                 (LETT |c0|
                                                       (ELT_U32 |r1| |dr1|))
                                                 (EXIT
                                                  (COND
                                                   ((|eql_SI| |dr1| 0)
                                                    (SEQ
                                                     (SEQ G190
                                                          (COND
                                                           ((NULL
                                                             (|less_SI| 0
                                                                        |dr0|))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |res|
                                                                 (QSMULMOD32
                                                                  |res| |c0|
                                                                  |p|))
                                                           (EXIT
                                                            (LETT |dr0|
                                                                  (|sub_SI|
                                                                   |dr0| 1))))
                                                          NIL (GO G190) G191
                                                          (EXIT NIL))
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #1# |res|)
                                                       (GO #5=#:G570)))))
                                                   ('T
                                                    (SEQ
                                                     (LETT |delta|
                                                           (|sub_SI| |dr0|
                                                                     |dr1|))
                                                     (LETT |c1|
                                                           (|sub_SI| |p|
                                                                     (ELT_U32
                                                                      |r0|
                                                                      |dr0|)))
                                                     (COND
                                                      ((SPADCALL |c0| 1
                                                                 (QREFELT $
                                                                          35))
                                                       (LETT |c1|
                                                             (QSMULMOD32 |c1|
                                                                         (SPADCALL
                                                                          |c0|
                                                                          |p|
                                                                          (QREFELT
                                                                           $
                                                                           32))
                                                                         |p|))))
                                                     (SETELT_U32 |r0| |dr0| 0)
                                                     (LETT |dr0|
                                                           (|sub_SI| |dr0| 1))
                                                     (SPADCALL |r0| 1 |r1| |c1|
                                                               |dr0| |delta|
                                                               |p|
                                                               (QREFELT $ 31))
                                                     (LETT |res|
                                                           (QSMULMOD32 |res|
                                                                       |c0|
                                                                       |p|))
                                                     (EXIT
                                                      (SEQ G190
                                                           (COND
                                                            ((NULL
                                                              (EQL
                                                               (ELT_U32 |r0|
                                                                        |dr0|)
                                                               0))
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |dr0|
                                                                  (|sub_SI|
                                                                   |dr0| 1))
                                                            (EXIT
                                                             (COND
                                                              ((|less_SI| |dr0|
                                                                          0)
                                                               (PROGN
                                                                (LETT #1# 0)
                                                                (GO #5#)))
                                                              ('T
                                                               (LETT |res|
                                                                     (QSMULMOD32
                                                                      |res|
                                                                      |c0|
                                                                      |p|))))))
                                                           NIL (GO G190) G191
                                                           (EXIT
                                                            NIL))))))))))))
                                            NIL (GO G190) G191
                                            (EXIT NIL)))))))))))))
          #5# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |U32VectorPolynomialOperations;|)) 

(DEFUN |U32VectorPolynomialOperations| ()
  (SPROG NIL
         (PROG (#1=#:G573)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|U32VectorPolynomialOperations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|U32VectorPolynomialOperations|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|U32VectorPolynomialOperations;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|U32VectorPolynomialOperations|)))))))))) 

(DEFUN |U32VectorPolynomialOperations;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|U32VectorPolynomialOperations|))
          (LETT $ (GETREFV 55))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|U32VectorPolynomialOperations| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|U32VectorPolynomialOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|U32Vector|) (|Integer|)
              |POLYVEC;copy_first;2UvIV;1| |POLYVEC;copy_slice;2Uv2IV;2|
              |POLYVEC;eval_at;Uv4I;3| (|Boolean|)
              (|SparseUnivariatePolynomial| 8) (0 . |zero?|) (5 . |One|)
              (|NonNegativeInteger|) (9 . |degree|) (14 . |leadingCoefficient|)
              (19 . |positiveRemainder|) (25 . |reductum|)
              |POLYVEC;to_mod_pa;SupIUv;4| (30 . |Zero|) (34 . |monomial|)
              (40 . +) |POLYVEC;pa_to_sup;UvSup;5|
              |POLYVEC;vector_add_mul;2Uv4IV;6|
              |POLYVEC;mul_by_binomial;Uv3IV;7|
              |POLYVEC;mul_by_binomial;Uv2IV;8| |POLYVEC;mul_by_scalar;Uv3IV;9|
              |POLYVEC;degree;UvI;10| |POLYVEC;vector_combination;UvIUv4IV;11|
              (46 . |invmod|) |POLYVEC;divide!;3UvIV;12|
              |POLYVEC;remainder!;2UvIV;13| (52 . ~=) (58 . >)
              |POLYVEC;gcd;2UvIUv;14| (|PrimitiveArray| 7)
              |POLYVEC;gcd;Pa3IUv;15| |POLYVEC;mul;2UvIUv;18|
              |POLYVEC;lcm;Pa3IUv;17| (|SingleInteger|) (64 . >) (70 . |copy|)
              |POLYVEC;truncated_mul_add;3Uv2IV;20|
              |POLYVEC;truncated_multiplication;2Uv2IUv;21| (|PositiveInteger|)
              |POLYVEC;pow;UvPiNniIUv;22| |POLYVEC;differentiate;UvIUv;23|
              |POLYVEC;differentiate;UvNniIUv;24| (75 . >=) (|List| 7)
              |POLYVEC;extended_gcd;2UvIL;25| |POLYVEC;resultant;2Uv2I;26|)
           '#(|vector_combination| 81 |vector_add_mul| 92
              |truncated_multiplication| 102 |truncated_mul_add| 110
              |to_mod_pa| 119 |resultant| 125 |remainder!| 132 |pow| 139
              |pa_to_sup| 147 |mul_by_scalar| 152 |mul_by_binomial| 160 |mul|
              175 |lcm| 182 |gcd| 190 |extended_gcd| 205 |eval_at| 212
              |divide!| 220 |differentiate| 228 |degree| 241 |copy_slice| 246
              |copy_first| 254)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|copy_first|
                                 ((|Void|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|copy_slice|
                                 ((|Void|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|eval_at|
                                 ((|Integer|) (|U32Vector|) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|vector_add_mul|
                                 ((|Void|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|) (|Integer|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|mul_by_binomial|
                                 ((|Void|) (|U32Vector|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|mul_by_binomial|
                                 ((|Void|) (|U32Vector|) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|mul_by_scalar|
                                 ((|Void|) (|U32Vector|) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|mul|
                                 ((|U32Vector|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|truncated_multiplication|
                                 ((|U32Vector|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|truncated_mul_add|
                                 ((|Void|) (|U32Vector|) (|U32Vector|)
                                  (|U32Vector|) (|Integer|) (|Integer|)))
                                T)
                              '((|pow|
                                 ((|U32Vector|) (|U32Vector|)
                                  (|PositiveInteger|) (|NonNegativeInteger|)
                                  (|Integer|)))
                                T)
                              '((|differentiate|
                                 ((|U32Vector|) (|U32Vector|) (|Integer|)))
                                T)
                              '((|differentiate|
                                 ((|U32Vector|) (|U32Vector|)
                                  (|NonNegativeInteger|) (|Integer|)))
                                T)
                              '((|divide!|
                                 ((|Void|) (|U32Vector|) (|U32Vector|)
                                  (|U32Vector|) (|Integer|)))
                                T)
                              '((|remainder!|
                                 ((|Void|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|vector_combination|
                                 ((|Void|) (|U32Vector|) (|Integer|)
                                  (|U32Vector|) (|Integer|) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|to_mod_pa|
                                 ((|U32Vector|)
                                  (|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|pa_to_sup|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|U32Vector|)))
                                T)
                              '((|gcd|
                                 ((|U32Vector|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|)))
                                T)
                              '((|gcd|
                                 ((|U32Vector|)
                                  (|PrimitiveArray| (|U32Vector|)) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|lcm|
                                 ((|U32Vector|)
                                  (|PrimitiveArray| (|U32Vector|)) (|Integer|)
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|degree| ((|Integer|) (|U32Vector|))) T)
                              '((|extended_gcd|
                                 ((|List| (|U32Vector|)) (|U32Vector|)
                                  (|U32Vector|) (|Integer|)))
                                T)
                              '((|resultant|
                                 ((|Integer|) (|U32Vector|) (|U32Vector|)
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 54
                                            '(1 13 12 0 14 0 13 0 15 1 13 16 0
                                              17 1 13 8 0 18 2 8 0 0 0 19 1 13
                                              0 0 20 0 13 0 22 2 13 0 8 16 23 2
                                              13 0 0 0 24 2 8 0 0 0 32 2 8 12 0
                                              0 35 2 8 12 0 0 36 2 42 12 0 0 43
                                              1 7 0 0 44 2 42 12 0 0 51 7 0 6 7
                                              8 7 8 8 8 8 31 6 0 6 7 7 8 8 8 8
                                              26 4 0 7 7 7 8 8 46 5 0 6 7 7 7 8
                                              8 45 2 0 7 13 8 21 3 0 8 7 7 8 54
                                              3 0 6 7 7 8 34 4 0 7 7 47 16 8 48
                                              1 0 13 7 25 4 0 6 7 8 8 8 29 4 0
                                              6 7 8 8 8 27 3 0 6 7 8 8 28 3 0 7
                                              7 7 8 40 4 0 7 38 8 8 8 41 3 0 7
                                              7 7 8 37 4 0 7 38 8 8 8 39 3 0 52
                                              7 7 8 53 4 0 8 7 8 8 8 11 4 0 6 7
                                              7 7 8 33 2 0 7 7 8 49 3 0 7 7 16
                                              8 50 1 0 8 7 30 4 0 6 7 7 8 8 10
                                              3 0 6 7 7 8 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|U32VectorPolynomialOperations| 'NILADIC T) 
