
(SDEFUN |SYSSOLP;makeR2F| ((|r| R) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (SPADCALL |r| (QREFELT $ 8)) (QREFELT $ 10))) 

(SDEFUN |SYSSOLP;makeP2F|
        ((|p| |Polynomial| (|Fraction| (|Polynomial| R)))
         ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G403 NIL) (|v| NIL) (|lv| (|List| (|Symbol|))))
               (SEQ (LETT |lv| (SPADCALL |p| (QREFELT $ 13)))
                    (EXIT
                     (COND
                      ((SPADCALL |lv| NIL (QREFELT $ 15))
                       (SPADCALL |p| (QREFELT $ 16)))
                      ('T
                       (SEQ
                        (SEQ (LETT |v| NIL) (LETT #1# |lv|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |p| (SPADCALL |p| |v| (QREFELT $ 19)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (SPADCALL |p| (QREFELT $ 16)))))))))) 

(SDEFUN |SYSSOLP;makeEq|
        ((|p| |Polynomial| (|Fraction| (|Polynomial| R)))
         (|lv| |List| (|Symbol|)) ($ |Equation| (|Fraction| (|Polynomial| R))))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| (|Polynomial| R)))
          (#1=#:G408 NIL) (#2=#:G409 NIL) (|x| NIL) (|lx| (|List| (|Symbol|)))
          (|np| (|Polynomial| R)) (|z| (|Symbol|)))
         (SEQ (LETT |z| (SPADCALL |lv| (QREFELT $ 20)))
              (LETT |np| (SPADCALL (|SYSSOLP;makeP2F| |p| $) (QREFELT $ 21)))
              (LETT |lx| (SPADCALL |np| (QREFELT $ 22)))
              (SEQ
               (EXIT
                (SEQ (LETT |x| NIL) (LETT #2# |lv|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |lx| (QREFELT $ 23))
                         (PROGN (LETT #1# |$NoValue|) (GO #3=#:G405))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #1#))
              (LETT |up| (SPADCALL |np| |x| (QREFELT $ 25)))
              (EXIT
               (COND
                ((EQL (SPADCALL |up| (QREFELT $ 28)) 1)
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 30)) (QREFELT $ 10))
                  (SPADCALL
                   (SPADCALL (SPADCALL |up| 0 (QREFELT $ 33))
                             (SPADCALL |up| (QREFELT $ 34)) (QREFELT $ 35))
                   (QREFELT $ 36))
                  (QREFELT $ 38)))
                ('T
                 (SPADCALL (SPADCALL |np| (QREFELT $ 10)) (|spadConstant| $ 32)
                           (QREFELT $ 38)))))))) 

(SDEFUN |SYSSOLP;varInF| ((|v| |Symbol|) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (SPADCALL |v| (QREFELT $ 30)) (QREFELT $ 10))) 

(SDEFUN |SYSSOLP;newInF| ((|n| |Integer|) ($ |Fraction| (|Polynomial| R)))
        (|SYSSOLP;varInF| (SPADCALL (QREFELT $ 39)) $)) 

(SDEFUN |SYSSOLP;testDegree|
        ((|f| |Polynomial| R) (|lv| |List| (|Symbol|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G413 NIL) (#2=#:G412 #3=(|Boolean|)) (#4=#:G414 #3#)
          (#5=#:G416 NIL) (|vv| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |vv| NIL) (LETT #5# |lv|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |vv| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL |f| |vv| (QREFELT $ 40)) 0
                                   (QREFELT $ 41)))
                   (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T NIL)))))) 

(SDEFUN |SYSSOLP;triangularSystems;LLL;7|
        ((|lf| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Polynomial| R))))
        (SPROG
         ((#1=#:G453 NIL) (|pf| NIL) (#2=#:G452 NIL) (#3=#:G451 NIL) (|pr| NIL)
          (#4=#:G450 NIL)
          (|parRes|
           (|List|
            (|List|
             (|DistributedMultivariatePolynomial| |lv| (|Polynomial| R)))))
          (#5=#:G427 NIL) (#6=#:G426 #7=(|Boolean|)) (#8=#:G428 #7#)
          (#9=#:G449 NIL) (|fq| NIL) (#10=#:G448 NIL) (#11=#:G447 NIL)
          (|gb|
           (CATEGORY |package|
            (SIGNATURE |credPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |redPol| (|dmp| |dmp| (|List| |dmp|)))
            (SIGNATURE |gbasis|
             ((|List| |dmp|) (|List| |dmp|) (|Integer|) (|Integer|)))
            (SIGNATURE |gbasisExtend|
             ((|List| |dmp|) (|List| |dmp|) (|List| |dmp|) (|Integer|)
              (|Integer|)))
            (SIGNATURE |critT|
             ((|Boolean|)
              (|Record|
               (|:| |lcmfij|
                    #12=(|DirectProduct| (|call| LENGTH |lv|)
                                         (|NonNegativeInteger|)))
               (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |dmp|)
               (|:| |polj| |dmp|))))
            (SIGNATURE |critM| ((|Boolean|) #12# #12#))
            (SIGNATURE |critB| ((|Boolean|) #12# #12# #12# #12#))
            (SIGNATURE |critBonD|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              |dmp|
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMTonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |critMonD1|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              #12#
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |redPo|
             ((|Record| (|:| |poly| |dmp|) (|:| |mult| (|Polynomial| R))) |dmp|
              (|List| |dmp|)))
            (SIGNATURE |hMonic| (|dmp| |dmp|))
            (SIGNATURE |updatF|
             ((|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))
              |dmp| (|NonNegativeInteger|)
              (|List|
               (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |pol| |dmp|)))))
            (SIGNATURE |sPol|
             (|dmp|
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |updatD|
             ((|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))
              (|List|
               (|Record| (|:| |lcmfij| #12#)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |dmp|) (|:| |polj| |dmp|)))))
            (SIGNATURE |minGbasis| ((|List| |dmp|) (|List| |dmp|)))
            (SIGNATURE |lepol| ((|Integer|) |dmp|))
            (SIGNATURE |prinshINFO| ((|Void|) |dmp|))
            (SIGNATURE |prindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |fprindINFO|
             ((|Integer|)
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              |dmp| |dmp| (|Integer|) (|Integer|) (|Integer|) (|Integer|)))
            (SIGNATURE |prinpolINFO| ((|Void|) (|List| |dmp|)))
            (SIGNATURE |prinb| ((|Void|) (|Integer|)))
            (SIGNATURE |critpOrder|
             ((|Boolean|)
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))))
            (SIGNATURE |makeCrit|
             ((|Record| (|:| |lcmfij| #12#)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |dmp|) (|:| |polj| |dmp|))
              (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |pol| |dmp|))
              |dmp| (|NonNegativeInteger|)))
            (SIGNATURE |virtualDegree| ((|NonNegativeInteger|) |dmp|))))
          (|lp| (|List| |dmp|)) (#13=#:G446 NIL) (|f| NIL) (#14=#:G445 NIL)
          (|lq| (|List| |dmp|)) (|df| (|Polynomial| R)) (#15=#:G444 NIL)
          (#16=#:G443 NIL) (|lvv| (|List| OV)) (#17=#:G421 NIL)
          (#18=#:G442 NIL) (|vv| NIL) (#19=#:G441 NIL)
          (|push|
           (CATEGORY |package| (SIGNATURE |pushdown| (|dmp| |dmp| OV))
            (SIGNATURE |pushdown| (|dmp| |dmp| (|List| OV)))
            (SIGNATURE |pushup| (|dmp| |dmp| OV))
            (SIGNATURE |pushup| (|dmp| |dmp| (|List| OV)))
            (SIGNATURE |map|
             (|dmp| (|Mapping| |dmp| (|Polynomial| R)) |dmp|))))
          (DP
           (|DirectProductCategory| (|call| LENGTH |lv|)
                                    (|NonNegativeInteger|)))
          (OV
           (|Join| (|OrderedFinite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|)))
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| $ "failed") (|Symbol|))))))
          (|dmp|
           (|Join|
            (|PolynomialCategory| (|Polynomial| R)
                                  (|DirectProduct| (|#| |lv|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lv|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| ($ $ (|List| (|Integer|)))))))
          (#20=#:G440 NIL) (|ff| NIL) (#21=#:G439 NIL)
          (|fp| (|Factored| (|Polynomial| R))) (|p| (|Polynomial| R)))
         (SEQ
          (COND ((OR (NULL |lv|) (NULL |lf|)) NIL)
                ((EQL (LENGTH |lf|) 1)
                 (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lf|) (QREFELT $ 21)))
                      (LETT |fp| (SPADCALL |p| (QREFELT $ 44)))
                      (EXIT
                       (PROGN
                        (LETT #21# NIL)
                        (SEQ (LETT |ff| NIL)
                             (LETT #20# (SPADCALL |fp| (QREFELT $ 48))) G190
                             (COND
                              ((OR (ATOM #20#)
                                   (PROGN (LETT |ff| (CAR #20#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|SYSSOLP;testDegree| (QVELT |ff| 1) |lv| $)
                                 (LETT #21#
                                       (CONS (LIST (QVELT |ff| 1)) #21#))))))
                             (LETT #20# (CDR #20#)) (GO G190) G191
                             (EXIT (NREVERSE #21#)))))))
                (#22='T
                 (SEQ
                  (LETT |dmp|
                        (|DistributedMultivariatePolynomial| |lv|
                                                             (|Polynomial|
                                                              (QREFELT $ 6))))
                  (LETT OV (|OrderedVariableList| |lv|))
                  (LETT DP
                        (|DirectProduct| (LENGTH |lv|) (|NonNegativeInteger|)))
                  (LETT |push| (|PushVariables| (QREFELT $ 6) DP OV |dmp|))
                  (LETT |lvv|
                        (PROGN
                         (LETT #19# NIL)
                         (SEQ (LETT |vv| NIL) (LETT #18# |lv|) G190
                              (COND
                               ((OR (ATOM #18#)
                                    (PROGN (LETT |vv| (CAR #18#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #19#
                                      (CONS
                                       (PROG2
                                           (LETT #17#
                                                 (SPADCALL |vv|
                                                           (|compiledLookupCheck|
                                                            '|variable|
                                                            (LIST
                                                             (LIST '|Union| '$
                                                                   '#23="failed")
                                                             (LIST '|Symbol|))
                                                            OV)))
                                           (QCDR #17#)
                                         (|check_union2| (QEQCAR #17# 0) OV
                                                         (|Union| OV #23#)
                                                         #17#))
                                       #19#))))
                              (LETT #18# (CDR #18#)) (GO G190) G191
                              (EXIT (NREVERSE #19#)))))
                  (LETT |lq|
                        (PROGN
                         (LETT #16# NIL)
                         (SEQ (LETT |f| NIL) (LETT #15# |lf|) G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |f| (CAR #15#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |df| (SPADCALL |f| (QREFELT $ 49)))
                                   (|spadConstant| $ 50) (QREFELT $ 51))
                                  (LETT #16#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |df|
                                                    (|compiledLookupCheck|
                                                     '|coerce|
                                                     (LIST '$
                                                           (LIST '|Polynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 6))))
                                                     |dmp|))
                                          |lvv|
                                          (|compiledLookupCheck| '|pushup|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         OV)))
                                                                 |push|))
                                         #16#))))))
                              (LETT #15# (CDR #15#)) (GO G190) G191
                              (EXIT (NREVERSE #16#)))))
                  (LETT |lp|
                        (PROGN
                         (LETT #14# NIL)
                         (SEQ (LETT |f| NIL) (LETT #13# |lf|) G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |f| (CAR #13#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |f| (QREFELT $ 21))
                                                  (|compiledLookupCheck|
                                                   '|coerce|
                                                   (LIST '$
                                                         (LIST '|Polynomial|
                                                               (|devaluate|
                                                                (ELT $ 6))))
                                                   |dmp|))
                                        |lvv|
                                        (|compiledLookupCheck| '|pushup|
                                                               (LIST
                                                                (|devaluate|
                                                                 |dmp|)
                                                                (|devaluate|
                                                                 |dmp|)
                                                                (LIST '|List|
                                                                      (|devaluate|
                                                                       OV)))
                                                               |push|))
                                       #14#))))
                              (LETT #13# (CDR #13#)) (GO G190) G191
                              (EXIT (NREVERSE #14#)))))
                  (LETT |parRes|
                        (SPADCALL |lp| |lvv|
                                  (|compiledLookupCheck| '|groebSolve|
                                                         (LIST
                                                          (LIST '|List|
                                                                (LIST '|List|
                                                                      (LIST
                                                                       '|DistributedMultivariatePolynomial|
                                                                       |lv|
                                                                       (LIST
                                                                        '|Polynomial|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|DistributedMultivariatePolynomial|
                                                                 |lv|
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        6)))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|OrderedVariableList|
                                                                 |lv|)))
                                                         (|GroebnerSolve| |lv|
                                                                          (|Polynomial|
                                                                           (ELT
                                                                            $
                                                                            6))
                                                                          (ELT
                                                                           $
                                                                           6)))))
                  (COND
                   ((SPADCALL |lq| NIL
                              (|compiledLookupCheck| '~=
                                                     (LIST (LIST '|Boolean|) '$
                                                           '$)
                                                     (|List| |dmp|)))
                    (SEQ
                     (LETT |gb|
                           (|GroebnerInternalPackage|
                            (|Polynomial| (QREFELT $ 6))
                            (|DirectProduct| (LENGTH |lv|)
                                             (|NonNegativeInteger|))
                            |dmp|))
                     (EXIT
                      (LETT |parRes|
                            (PROGN
                             (LETT #11# NIL)
                             (SEQ (LETT |pr| NIL) (LETT #10# |parRes|) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN (LETT |pr| (CAR #10#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |fq| NIL) (LETT #9# |lq|)
                                            G190
                                            (COND
                                             ((OR (ATOM #9#)
                                                  (PROGN
                                                   (LETT |fq| (CAR #9#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #8#
                                                     (SPADCALL
                                                      (SPADCALL |fq| |pr|
                                                                (|compiledLookupCheck|
                                                                 '|redPol|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (|devaluate|
                                                                   |dmp|)
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |dmp|)))
                                                                 |gb|))
                                                      (SPADCALL
                                                       (|compiledLookupCheck|
                                                        '|Zero| (LIST '$)
                                                        |dmp|))
                                                      (|compiledLookupCheck|
                                                       '~=
                                                       (LIST (LIST '|Boolean|)
                                                             '$ '$)
                                                       |dmp|)))
                                               (COND
                                                (#5#
                                                 (LETT #6#
                                                       (COND (#6# #8#)
                                                             ('T NIL))))
                                                ('T
                                                 (PROGN
                                                  (LETT #6# #8#)
                                                  (LETT #5# 'T)))))))
                                            (LETT #9# (CDR #9#)) (GO G190) G191
                                            (EXIT NIL))
                                       (COND (#5# #6#) (#22# 'T)))
                                      (LETT #11# (CONS |pr| #11#))))))
                                  (LETT #10# (CDR #10#)) (GO G190) G191
                                  (EXIT (NREVERSE #11#)))))))))
                  (EXIT
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |pr| NIL) (LETT #3# |parRes|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |pr| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |pf| NIL) (LETT #1# |pr|) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |pf| (CAR #1#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |pf| |lvv|
                                                            (|compiledLookupCheck|
                                                             '|pushdown|
                                                             (LIST
                                                              (|devaluate|
                                                               |dmp|)
                                                              (|devaluate|
                                                               |dmp|)
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     OV)))
                                                             |push|))
                                                  (|compiledLookupCheck|
                                                   '|retract|
                                                   (LIST
                                                    (LIST '|Polynomial|
                                                          (|devaluate|
                                                           (ELT $ 6)))
                                                    '$)
                                                   |dmp|))
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#))))
                                  #4#))))
                         (LETT #3# (CDR #3#)) (GO G190) G191
                         (EXIT (NREVERSE #4#))))))))))) 

(SDEFUN |SYSSOLP;solve;FL;8|
        ((|pol| |Fraction| (|Polynomial| R))
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |pol| (QREFELT $ 55))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pol| (QREFELT $ 21))
                                     (QREFELT $ 22))
                           (SPADCALL (SPADCALL |pol| (QREFELT $ 49))
                                     (QREFELT $ 22))
                           (QREFELT $ 56))
                          (QREFELT $ 57)))
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 41))
                           (|error| "too many variables"))
                          (#1#
                           (SPADCALL |pol| (|SPADfirst| |lv|)
                                     (QREFELT $ 59))))))))))) 

(SDEFUN |SYSSOLP;solve;EL;9|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R)))
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((|lv| (|List| (|Symbol|))) (|pol| (|Fraction| (|Polynomial| R))))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL |eq| (QREFELT $ 61))
                          (SPADCALL |eq| (QREFELT $ 62)) (QREFELT $ 63)))
          (EXIT
           (COND
            ((SPADCALL |pol| (QREFELT $ 55))
             (|error| "equation is always satisfied"))
            (#1='T
             (SEQ
              (LETT |lv|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) (QREFELT $ 22))
                      (SPADCALL (SPADCALL |pol| (QREFELT $ 49)) (QREFELT $ 22))
                      (QREFELT $ 56))
                     (QREFELT $ 57)))
              (EXIT
               (COND ((NULL |lv|) (|error| "inconsistent equation"))
                     ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 41))
                      (|error| "too many variables"))
                     (#1#
                      (SPADCALL |pol| (|SPADfirst| |lv|)
                                (QREFELT $ 59)))))))))))) 

(SDEFUN |SYSSOLP;solve;ESL;10|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R))) (|var| |Symbol|)
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 61))
                   (SPADCALL |eq| (QREFELT $ 62)) (QREFELT $ 63))
         |var| (QREFELT $ 59))) 

(SDEFUN |SYSSOLP;solve;FSL;11|
        ((|pol| |Fraction| (|Polynomial| R)) (|var| |Symbol|)
         ($ |List| (|Equation| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((#1=#:G469 NIL) (|ff| NIL) (#2=#:G468 NIL)
          (|fp| (|Factored| (|Polynomial| R))) (|p| (|Polynomial| R)))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
            (SEQ
             (LETT |p|
                   (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) |var|
                             (QREFELT $ 66)))
             (LETT |fp| (SPADCALL |p| (QREFELT $ 44)))
             (EXIT
              (PROGN
               (LETT #2# NIL)
               (SEQ (LETT |ff| NIL) (LETT #1# (SPADCALL |fp| (QREFELT $ 48)))
                    G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (|SYSSOLP;makeEq|
                              (SPADCALL (CONS (|function| |SYSSOLP;makeR2F|) $)
                                        (QVELT |ff| 1) (QREFELT $ 69))
                              (LIST |var|) $)
                             #2#))))
                    (LETT #1# (CDR #1#)) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T NIL))))) 

(SDEFUN |SYSSOLP;makePolys|
        ((|l| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|Fraction| (|Polynomial| R))))
        (SPROG ((#1=#:G473 NIL) (|e| NIL) (#2=#:G472 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |e| (QREFELT $ 61))
                                         (SPADCALL |e| (QREFELT $ 62))
                                         (QREFELT $ 63))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SYSSOLP;linSolve|
        ((|lp| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |Union| (|List| (|Equation| (|Fraction| (|Polynomial| R))))
          "failed"))
        (SPROG
         ((|eqs| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
          (#1=#:G493 NIL) (|i| NIL) (#2=#:G492 NIL)
          (|sym| (|Fraction| (|Polynomial| R))) (#3=#:G491 NIL) (|p| NIL)
          (|zeron| (|Vector| (|Fraction| (|Polynomial| R))))
          (|rhs| (|Vector| (|Fraction| (|Polynomial| R)))) (#4=#:G480 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Polynomial| R))) "failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Polynomial| R)))))))
          (|lr| (|List| (|Polynomial| R))) (#5=#:G490 NIL) (|f| NIL)
          (#6=#:G489 NIL))
         (SEQ
          (LETT |lr|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |f| NIL) (LETT #5# |lp|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |f| (QREFELT $ 21)) #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |rec| (SPADCALL |lr| |lv| (QREFELT $ 74)))
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |rhs|
                         (PROG2 (LETT #4# (QCAR |rec|))
                             (QCDR #4#)
                           (|check_union2| (QEQCAR #4# 0)
                                           (|Vector|
                                            (|Fraction|
                                             (|Polynomial| (QREFELT $ 6))))
                                           (|Union|
                                            (|Vector|
                                             (|Fraction|
                                              (|Polynomial| (QREFELT $ 6))))
                                            "failed")
                                           #4#)))
                   (LETT |zeron| (SPADCALL (LENGTH |lv|) (QREFELT $ 76)))
                   (SEQ (LETT |p| NIL) (LETT #3# (QCDR |rec|)) G190
                        (COND
                         ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |p| |zeron| (QREFELT $ 77))
                            (SEQ (LETT |sym| (|SYSSOLP;newInF| 1 $))
                                 (EXIT
                                  (SEQ (LETT |i| 1) (LETT #2# (LENGTH |lv|))
                                       G190
                                       (COND
                                        ((|greater_SI| |i| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rhs| |i|
                                                   (SPADCALL
                                                    (SPADCALL |rhs| |i|
                                                              (QREFELT $ 79))
                                                    (SPADCALL |sym|
                                                              (SPADCALL |p| |i|
                                                                        (QREFELT
                                                                         $ 79))
                                                              (QREFELT $ 80))
                                                    (QREFELT $ 81))
                                                   (QREFELT $ 82))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))))))))
                        (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                   (LETT |eqs| NIL)
                   (SEQ (LETT |i| 1) (LETT #1# (LENGTH |lv|)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |eqs|
                                (SPADCALL |eqs|
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |lv| |i|
                                                        (QREFELT $ 83))
                                              (QREFELT $ 30))
                                             (QREFELT $ 10))
                                            (SPADCALL |rhs| |i| (QREFELT $ 79))
                                            (QREFELT $ 84)))
                                          (QREFELT $ 85)))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 |eqs|))))))))) 

(SDEFUN |SYSSOLP;solve;LL;14|
        ((|lr| |List| (|Fraction| (|Polynomial| R)))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|lv| #1=(|List| (|Symbol|))) (#2=#:G495 NIL) (#3=#:G494 #1#)
          (#4=#:G496 #1#) (#5=#:G499 NIL) (|p| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |p| NIL) (LETT #5# |lr|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 21))
                                          (QREFELT $ 22))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 49))
                                          (QREFELT $ 22))
                                (QREFELT $ 86)))
                         (COND
                          (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 86))))
                          ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT (SPADCALL |lr| |lv| (QREFELT $ 88)))))) 

(SDEFUN |SYSSOLP;solve;LL;15|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((|lv| #1=(|List| (|Symbol|))) (#2=#:G501 NIL) (#3=#:G500 #1#)
          (#4=#:G502 #1#) (#5=#:G505 NIL) (|p| NIL)
          (|lr| (|List| (|Fraction| (|Polynomial| R)))))
         (SEQ (LETT |lr| (|SYSSOLP;makePolys| |le| $))
              (LETT |lv|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |p| NIL) (LETT #5# |lr|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 21))
                                              (QREFELT $ 22))
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 49))
                                              (QREFELT $ 22))
                                    (QREFELT $ 86)))
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 86))))
                              ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T (|IdentityError| '|setUnion|)))))
              (EXIT (SPADCALL |lr| |lv| (QREFELT $ 88)))))) 

(SDEFUN |SYSSOLP;solve;LLL;16|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPADCALL (|SYSSOLP;makePolys| |le| $) |lv| (QREFELT $ 88))) 

(SDEFUN |SYSSOLP;checkLinear|
        ((|lr| |List| (|Fraction| (|Polynomial| R))) (|vl| |List| (|Symbol|))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G514 NIL) (#2=#:G513 #3=(|Boolean|)) (#4=#:G515 #3#)
          (#5=#:G523 NIL) (|pol| NIL) (#6=#:G518 NIL) (#7=#:G509 NIL)
          (#8=#:G508 #9=(|Boolean|)) (#10=#:G510 #9#) (#11=#:G522 NIL)
          (|x| NIL) (#12=#:G521 NIL) (|f| NIL) (|ld| (|List| (|Polynomial| R)))
          (#13=#:G520 NIL) (#14=#:G519 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ld|
                  (PROGN
                   (LETT #14# NIL)
                   (SEQ (LETT |pol| NIL) (LETT #13# |lr|) G190
                        (COND
                         ((OR (ATOM #13#) (PROGN (LETT |pol| (CAR #13#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #14#
                                (CONS (SPADCALL |pol| (QREFELT $ 49)) #14#))))
                        (LETT #13# (CDR #13#)) (GO G190) G191
                        (EXIT (NREVERSE #14#)))))
            (SEQ (LETT |f| NIL) (LETT #12# |ld|) G190
                 (COND
                  ((OR (ATOM #12#) (PROGN (LETT |f| (CAR #12#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((PROGN
                      (LETT #7# NIL)
                      (SEQ (LETT |x| NIL)
                           (LETT #11# (SPADCALL |f| (QREFELT $ 22))) G190
                           (COND
                            ((OR (ATOM #11#) (PROGN (LETT |x| (CAR #11#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #10# (SPADCALL |x| |vl| (QREFELT $ 23)))
                              (COND (#7# (LETT #8# (COND (#8# 'T) ('T #10#))))
                                    ('T
                                     (PROGN (LETT #8# #10#) (LETT #7# 'T)))))))
                           (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                      (COND (#7# #8#) ('T NIL)))
                     (PROGN (LETT #6# NIL) (GO #15=#:G517))))))
                 (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN
              (LETT #1# NIL)
              (SEQ (LETT |pol| NIL) (LETT #5# |lr|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #4#
                            (<
                             (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) |vl|
                                       (QREFELT $ 92))
                             2))
                      (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL))))
                            ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) ('T 'T))))))
          #15# (EXIT #6#)))) 

(SDEFUN |SYSSOLP;solve;LLL;18|
        ((|lr| |List| (|Fraction| (|Polynomial| R))) (|vl| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G539 NIL) (|f| NIL) (#2=#:G538 NIL) (#3=#:G537 NIL) (|pr| NIL)
          (#4=#:G536 NIL) (|parRes| (|List| (|List| (|Polynomial| R))))
          (|eqns| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))
          (|rhs| (|Fraction| (|Polynomial| R)))
          (|lhs| (|Fraction| (|Polynomial| R))) (#5=#:G535 NIL) (|i| NIL)
          (|soln|
           (|Union| (|List| (|Equation| (|Fraction| (|Polynomial| R))))
                    "failed")))
         (SEQ
          (COND ((NULL |vl|) NIL)
                ((|SYSSOLP;checkLinear| |lr| |vl| $)
                 (SEQ (LETT |soln| (|SYSSOLP;linSolve| |lr| |vl| $))
                      (EXIT
                       (COND ((QEQCAR |soln| 1) NIL)
                             (#6='T
                              (SEQ (LETT |eqns| NIL)
                                   (SEQ (LETT |i| 1) (LETT #5# (LENGTH |vl|))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #5#) (GO G191)))
                                        (SEQ
                                         (LETT |lhs|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |vl| |i|
                                                           (QREFELT $ 83))
                                                 (QREFELT $ 30))
                                                (QREFELT $ 10)))
                                         (LETT |rhs|
                                               (SPADCALL
                                                (SPADCALL (QCDR |soln|) |i|
                                                          (QREFELT $ 93))
                                                (QREFELT $ 62)))
                                         (EXIT
                                          (LETT |eqns|
                                                (SPADCALL |eqns|
                                                          (LIST
                                                           (SPADCALL |lhs|
                                                                     |rhs|
                                                                     (QREFELT $
                                                                              84)))
                                                          (QREFELT $ 85)))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (LIST |eqns|))))))))
                ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
                 (SEQ (LETT |parRes| (SPADCALL |lr| |vl| (QREFELT $ 54)))
                      (EXIT
                       (PROGN
                        (LETT #4# NIL)
                        (SEQ (LETT |pr| NIL) (LETT #3# |parRes|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |pr| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4#
                                     (CONS
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ (LETT |f| NIL) (LETT #1# |pr|) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |f| (CAR #1#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (|SYSSOLP;makeEq|
                                                      (SPADCALL
                                                       (CONS
                                                        (|function|
                                                         |SYSSOLP;makeR2F|)
                                                        $)
                                                       |f| (QREFELT $ 69))
                                                      |vl| $)
                                                     #2#))))
                                            (LETT #1# (CDR #1#)) (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      #4#))))
                             (LETT #3# (CDR #3#)) (GO G190) G191
                             (EXIT (NREVERSE #4#)))))))
                (#6# (LIST NIL)))))) 

(DECLAIM (NOTINLINE |SystemSolvePackage;|)) 

(DEFUN |SystemSolvePackage| (#1=#:G540)
  (SPROG NIL
         (PROG (#2=#:G541)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SystemSolvePackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SystemSolvePackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SystemSolvePackage|)))))))))) 

(DEFUN |SystemSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SystemSolvePackage| DV$1))
          (LETT $ (GETREFV 94))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SystemSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SystemSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (0 . |coerce|) (|Fraction| 7) (5 . |coerce|) (|List| 17)
              (|Polynomial| 9) (10 . |variables|) (|Boolean|) (15 . =)
              (21 . |retract|) (|Symbol|)
              (|MPolyCatRationalFunctionFactorizer| (|IndexedExponents| 17) 17
                                                    6 12)
              (26 . |pushdown|) (32 . |last|) (37 . |numer|) (42 . |variables|)
              (47 . |member?|) (|SparseUnivariatePolynomial| $)
              (53 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (59 . |degree|) (64 . |One|)
              (68 . |coerce|) (73 . |Zero|) (77 . |Zero|) (81 . |coefficient|)
              (87 . |leadingCoefficient|) (92 . /) (98 . -) (|Equation| 9)
              (103 . |equation|) (109 . |new|) (113 . |degree|) (119 . >)
              (|Factored| 7)
              (|GeneralizedMultivariateFactorize| 17 (|IndexedExponents| 17) 6
                                                  6 7)
              (125 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 45) (|:| |factor| 7) (|:| |exponent| 26))
              (|List| 46) (130 . |factorList|) (135 . |denom|) (140 . |One|)
              (144 . ~=) (|List| 72) (|List| 9)
              |SYSSOLP;triangularSystems;LLL;7| (150 . |zero?|)
              (155 . |concat|) (161 . |removeDuplicates|) (|List| 37)
              |SYSSOLP;solve;FSL;11| |SYSSOLP;solve;FL;8| (166 . |lhs|)
              (171 . |rhs|) (176 . -) |SYSSOLP;solve;EL;9|
              |SYSSOLP;solve;ESL;10| (182 . |primitivePart|) (|Mapping| 9 6)
              (|PolynomialFunctions2| 6 9) (188 . |map|) (|Union| 75 '"failed")
              (|Record| (|:| |particular| 70) (|:| |basis| (|List| 75)))
              (|List| 7)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 17) 17 7)
              (194 . |linSolve|) (|Vector| 9) (200 . |zero|) (205 . ~=)
              (|Integer|) (211 . |elt|) (217 . *) (223 . +) (229 . |setelt!|)
              (236 . |elt|) (242 . =) (248 . |append|) (254 . |setUnion|)
              (|List| 58) |SYSSOLP;solve;LLL;18| |SYSSOLP;solve;LL;14|
              |SYSSOLP;solve;LL;15| |SYSSOLP;solve;LLL;16|
              (260 . |totalDegree|) (266 . |elt|))
           '#(|triangularSystems| 272 |solve| 278) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|Symbol|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List|
                                    (|Equation|
                                     (|Fraction| (|Polynomial| |#1|)))))
                                  (|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Fraction| (|Polynomial| |#1|)) (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Equation| (|Fraction| (|Polynomial| |#1|)))
                                  (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Fraction| (|Polynomial| |#1|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|Equation|
                                    (|Fraction| (|Polynomial| |#1|))))
                                  (|Equation|
                                   (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|triangularSystems|
                                 ((|List| (|List| (|Polynomial| |#1|)))
                                  (|List| (|Fraction| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 93
                                            '(1 7 0 6 8 1 9 0 7 10 1 12 11 0 13
                                              2 11 14 0 0 15 1 12 9 0 16 2 18
                                              12 12 17 19 1 11 17 0 20 1 9 7 0
                                              21 1 7 11 0 22 2 11 14 17 0 23 2
                                              7 24 0 17 25 1 27 26 0 28 0 6 0
                                              29 1 7 0 17 30 0 6 0 31 0 9 0 32
                                              2 27 7 0 26 33 1 27 7 0 34 2 9 0
                                              7 7 35 1 9 0 0 36 2 37 0 9 9 38 0
                                              17 0 39 2 7 26 0 17 40 2 26 14 0
                                              0 41 1 43 42 7 44 1 42 47 0 48 1
                                              9 7 0 49 0 7 0 50 2 7 14 0 0 51 1
                                              9 14 0 55 2 11 0 0 0 56 1 11 0 0
                                              57 1 37 9 0 61 1 37 9 0 62 2 9 0
                                              0 0 63 2 7 0 0 17 66 2 68 12 67 7
                                              69 2 73 71 72 11 74 1 75 0 26 76
                                              2 75 14 0 0 77 2 75 9 0 78 79 2 9
                                              0 0 0 80 2 9 0 0 0 81 3 75 9 0 78
                                              9 82 2 11 17 0 78 83 2 37 0 9 9
                                              84 2 58 0 0 0 85 2 11 0 0 0 86 2
                                              7 26 0 11 92 2 58 37 0 78 93 2 0
                                              52 53 11 54 2 0 87 58 11 91 2 0
                                              87 53 11 88 1 0 87 58 90 1 0 87
                                              53 89 2 0 58 37 17 65 2 0 58 9 17
                                              59 1 0 58 9 60 1 0 58 37 64)))))
           '|lookupComplete|)) 