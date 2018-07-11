
(SDEFUN |RPOLCAT-;coerce;SOf;1| ((|p| S) ($ |OutputForm|))
        (SPROG
         ((#1=#:G535 NIL) (|dp| (|NonNegativeInteger|)) (|tp| (S)) (|ip| (S)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 11))
             (SPADCALL (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 14)))
            (#2='T
             (SEQ
              (SEQ (LETT |ip| (SPADCALL |p| (QREFELT $ 15)))
                   (EXIT
                    (COND
                     ((SPADCALL |ip| (|spadConstant| $ 16) (QREFELT $ 18))
                      (COND
                       ((SPADCALL (LETT |tp| (SPADCALL |p| (QREFELT $ 19)))
                                  (QREFELT $ 20))
                        (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 22)))
                             (EXIT
                              (COND
                               ((EQL |dp| 1)
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                                 (QREFELT $ 24)))
                                 (GO #3=#:G534)))
                               (#2#
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                                  (QREFELT $ 24))
                                        (SPADCALL |dp| (QREFELT $ 25))
                                        (QREFELT $ 26)))
                                 (GO #3#)))))))
                       (#2#
                        (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 22)))
                             (EXIT
                              (COND
                               ((EQL |dp| 1)
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                                  (QREFELT $ 24))
                                        (SPADCALL |tp| (QREFELT $ 27))
                                        (QREFELT $ 28)))
                                 (GO #3#)))
                               (#2#
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |p| (QREFELT $ 23))
                                          (QREFELT $ 24))
                                         (SPADCALL |dp| (QREFELT $ 25))
                                         (QREFELT $ 26))
                                        (SPADCALL |tp| (QREFELT $ 27))
                                        (QREFELT $ 28)))
                                 (GO #3#)))))))))
                     ((SPADCALL (LETT |tp| (SPADCALL |p| (QREFELT $ 19)))
                                (QREFELT $ 20))
                      (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 22)))
                           (EXIT
                            (COND
                             ((EQL |dp| 1)
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 23))
                                                (QREFELT $ 24))
                                               (QREFELT $ 29)))
                               (GO #3#)))
                             (#2#
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |p| (QREFELT $ 23))
                                                 (QREFELT $ 24))
                                                (SPADCALL |dp| (QREFELT $ 25))
                                                (QREFELT $ 26))
                                               (QREFELT $ 29)))
                               (GO #3#)))))))
                     ((EQL (SPADCALL |p| (QREFELT $ 22)) 1)
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                                  (QREFELT $ 24))
                                        (QREFELT $ 29))
                              (SPADCALL |tp| (QREFELT $ 27)) (QREFELT $ 28)))
                       (GO #3#))))))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                     (QREFELT $ 24))
                           (SPADCALL (SPADCALL |p| (QREFELT $ 22))
                                     (QREFELT $ 25))
                           (QREFELT $ 26))
                          (QREFELT $ 29))
                (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 27))
                (QREFELT $ 28)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |RPOLCAT-;mvar;SV;2| ((|p| S) ($ V))
        (SPROG ((#1=#:G537 NIL))
               (COND
                ((SPADCALL |p| (QREFELT $ 11))
                 (|error| "Error in mvar from RPOLCAT : #1 is constant."))
                ('T
                 (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                   (|Union| (QREFELT $ 9) "failed") #1#)))))) 

(SDEFUN |RPOLCAT-;mdeg;SNni;3| ((|p| S) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G542 NIL))
               (COND ((SPADCALL |p| (QREFELT $ 11)) 0)
                     ('T
                      (SPADCALL |p|
                                (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                                  (|Union| (QREFELT $ 9)
                                                           "failed")
                                                  #1#))
                                (QREFELT $ 34)))))) 

(SDEFUN |RPOLCAT-;init;2S;4| ((|p| S) ($ S))
        (SPROG ((|v| (V)) (#1=#:G547 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 11))
                  (|error| "Error in mvar from RPOLCAT : #1 is constant."))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                           (|Union| (QREFELT $ 9) "failed")
                                           #1#)))
                   (EXIT
                    (SPADCALL |p| |v| (SPADCALL |p| |v| (QREFELT $ 34))
                              (QREFELT $ 36))))))))) 

(SDEFUN |RPOLCAT-;leadingCoefficient;SVS;5| ((|p| S) (|v| V) ($ S))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND ((ZEROP (LETT |d| (SPADCALL |p| |v| (QREFELT $ 34)))) |p|)
                     ('T (SPADCALL |p| |v| |d| (QREFELT $ 36)))))) 

(SDEFUN |RPOLCAT-;head;2S;6| ((|p| S) ($ S))
        (SPROG ((|d| (|NonNegativeInteger|)) (|v| (V)) (#1=#:G555 NIL))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 11)) |p|)
                      ('T
                       (SEQ
                        (LETT |v|
                              (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                                (|Union| (QREFELT $ 9)
                                                         "failed")
                                                #1#)))
                        (LETT |d| (SPADCALL |p| |v| (QREFELT $ 34)))
                        (EXIT
                         (SPADCALL (SPADCALL |p| |v| |d| (QREFELT $ 36)) |v|
                                   |d| (QREFELT $ 39))))))))) 

(SDEFUN |RPOLCAT-;reductum;SVS;7| ((|p| S) (|v| V) ($ S))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP (LETT |d| (SPADCALL |p| |v| (QREFELT $ 34))))
                 (|spadConstant| $ 41))
                ('T
                 (SPADCALL |p|
                           (SPADCALL (SPADCALL |p| |v| |d| (QREFELT $ 36)) |v|
                                     |d| (QREFELT $ 39))
                           (QREFELT $ 42)))))) 

(SDEFUN |RPOLCAT-;tail;2S;8| ((|p| S) ($ S))
        (COND ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 41))
              ('T (SPADCALL |p| (SPADCALL |p| (QREFELT $ 44)) (QREFELT $ 42))))) 

(SDEFUN |RPOLCAT-;deepestTail;2S;9| ((|p| S) ($ S))
        (COND ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 41))
              ((OR (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 11))
                   (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                             (SPADCALL (SPADCALL |p| (QREFELT $ 19))
                                       (QREFELT $ 23))
                             (QREFELT $ 46)))
               (SPADCALL |p| (QREFELT $ 19)))
              ('T (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 47))))) 

(SDEFUN |RPOLCAT-;iteratedInitials;SL;10| ((|p| S) ($ |List| S))
        (SEQ
         (COND ((SPADCALL |p| (QREFELT $ 11)) NIL)
               ('T
                (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 15)))
                     (EXIT (CONS |p| (SPADCALL |p| (QREFELT $ 50))))))))) 

(SDEFUN |RPOLCAT-;localDeepestInitial| ((|p| S) ($ S))
        (COND ((SPADCALL |p| (QREFELT $ 11)) |p|)
              ('T
               (|RPOLCAT-;localDeepestInitial| (SPADCALL |p| (QREFELT $ 15))
                $)))) 

(SDEFUN |RPOLCAT-;deepestInitial;2S;12| ((|p| S) ($ S))
        (COND
         ((SPADCALL |p| (QREFELT $ 11))
          (|error| "Error in deepestInitial from RPOLCAT : #1 is constant."))
         ('T (|RPOLCAT-;localDeepestInitial| (SPADCALL |p| (QREFELT $ 15)) $)))) 

(SDEFUN |RPOLCAT-;monic?;SB;13| ((|p| S) ($ |Boolean|))
        (COND ((SPADCALL |p| (QREFELT $ 11)) NIL)
              ('T
               (QEQCAR (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 54))
                       0)))) 

(SDEFUN |RPOLCAT-;quasiMonic?;SB;14| ((|p| S) ($ |Boolean|))
        (COND ((SPADCALL |p| (QREFELT $ 11)) NIL)
              ('T (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 11))))) 

(SDEFUN |RPOLCAT-;mainMonomial;2S;15| ((|p| S) ($ S))
        (SPROG ((|v| (V)) (#1=#:G583 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 20))
                  (|error| "Error in mainMonomial from RPOLCAT : #1 is zero"))
                 ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 16))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                           (|Union| (QREFELT $ 9) "failed")
                                           #1#)))
                   (EXIT
                    (SPADCALL (|spadConstant| $ 16) |v|
                              (SPADCALL |p| |v| (QREFELT $ 34))
                              (QREFELT $ 39))))))))) 

(SDEFUN |RPOLCAT-;leastMonomial;2S;16| ((|p| S) ($ S))
        (SPROG ((|v| (V)) (#1=#:G590 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 20))
                  (|error| "Error in leastMonomial from RPOLCAT : #1 is zero"))
                 ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 16))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                           (|Union| (QREFELT $ 9) "failed")
                                           #1#)))
                   (EXIT
                    (SPADCALL (|spadConstant| $ 16) |v|
                              (SPADCALL |p| |v| (QREFELT $ 58))
                              (QREFELT $ 39))))))))) 

(SDEFUN |RPOLCAT-;mainCoefficients;SL;17| ((|p| S) ($ |List| S))
        (SPROG ((|v| (V)) (#1=#:G597 NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 20))
                  (|error|
                   "Error in mainCoefficients from RPOLCAT : #1 is zero"))
                 ((SPADCALL |p| (QREFELT $ 11)) (LIST |p|))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                           (|Union| (QREFELT $ 9) "failed")
                                           #1#)))
                   (EXIT
                    (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61))
                              (QREFELT $ 64))))))))) 

(SDEFUN |RPOLCAT-;mainMonomials;SL;18| ((|p| S) ($ |List| S))
        (SPROG
         ((#1=#:G612 NIL) (|m| NIL) (#2=#:G611 NIL)
          (|lm| (|List| (|SparseUnivariatePolynomial| S))) (|v| (V))
          (#3=#:G604 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 20))
            (|error| "Error in mainMonomials from RPOLCAT : #1 is zero"))
           ((SPADCALL |p| (QREFELT $ 11)) (LIST (|spadConstant| $ 16)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2 (LETT #3# (SPADCALL |p| (QREFELT $ 32)))
                       (QCDR #3#)
                     (|check_union2| (QEQCAR #3# 0) (QREFELT $ 9)
                                     (|Union| (QREFELT $ 9) "failed") #3#)))
             (LETT |lm|
                   (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61)) (QREFELT $ 66)))
             (EXIT
              (PROGN
               (LETT #2# NIL)
               (SEQ (LETT |m| NIL) (LETT #1# |lm|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL (|spadConstant| $ 16) |v|
                                       (SPADCALL |m| (QREFELT $ 67))
                                       (QREFELT $ 39))
                             #2#))))
                    (LETT #1# (CDR #1#)) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |RPOLCAT-;RittWuCompare;2SU;19|
        ((|a| S) (|b| S) ($ |Union| (|Boolean|) #1="failed"))
        (SPROG ((|lc| (|Union| (|Boolean|) #1#)))
               (SEQ
                (COND
                 ((SPADCALL |b| (QREFELT $ 11))
                  (COND
                   ((SPADCALL |a| (QREFELT $ 11)) (EXIT (CONS 1 "failed"))))))
                (EXIT
                 (COND ((SPADCALL |b| (QREFELT $ 11)) (CONS 0 NIL))
                       ((OR (SPADCALL |a| (QREFELT $ 11))
                            (SPADCALL (SPADCALL |a| (QREFELT $ 23))
                                      (SPADCALL |b| (QREFELT $ 23))
                                      (QREFELT $ 69)))
                        (CONS 0 'T))
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 23))
                                  (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 46))
                        (CONS 0 NIL))
                       ((< (SPADCALL |a| (QREFELT $ 22))
                           (SPADCALL |b| (QREFELT $ 22)))
                        (CONS 0 'T))
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 22))
                                  (SPADCALL |b| (QREFELT $ 22)) (QREFELT $ 71))
                        (CONS 0 NIL))
                       (#2='T
                        (SEQ
                         (LETT |lc|
                               (SPADCALL (SPADCALL |a| (QREFELT $ 15))
                                         (SPADCALL |b| (QREFELT $ 15))
                                         (QREFELT $ 73)))
                         (EXIT
                          (COND ((QEQCAR |lc| 0) |lc|)
                                (#2#
                                 (SPADCALL (SPADCALL |a| (QREFELT $ 19))
                                           (SPADCALL |b| (QREFELT $ 19))
                                           (QREFELT $ 73)))))))))))) 

(SDEFUN |RPOLCAT-;infRittWu?;2SB;20| ((|a| S) (|b| S) ($ |Boolean|))
        (SPROG ((|lc| (|Union| (|Boolean|) "failed")))
               (SEQ (LETT |lc| (SPADCALL |a| |b| (QREFELT $ 73)))
                    (EXIT (COND ((QEQCAR |lc| 0) (QCDR |lc|)) ('T NIL)))))) 

(SDEFUN |RPOLCAT-;supRittWu?;2SB;21| ((|a| S) (|b| S) ($ |Boolean|))
        (SPADCALL |b| |a| (QREFELT $ 76))) 

(SDEFUN |RPOLCAT-;prem;3S;22| ((|a| S) (|b| S) ($ S))
        (SPROG
         ((|cP|
           (|Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |remainder| S))))
         (SEQ (LETT |cP| (SPADCALL |a| |b| (QREFELT $ 79)))
              (EXIT
               (SPADCALL
                (SPADCALL (QVELT |cP| 0) (QVELT |cP| 1) (QREFELT $ 80))
                (QVELT |cP| 2) (QREFELT $ 81)))))) 

(SDEFUN |RPOLCAT-;pquo;3S;23| ((|a| S) (|b| S) ($ S))
        (SPROG
         ((|c| (S))
          (|cPS|
           (|Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| S) (|:| |remainder| S))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 84)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 80)))
              (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 81)))))) 

(SDEFUN |RPOLCAT-;prem;2SVS;24| ((|a| S) (|b| S) (|v| V) ($ S))
        (SPROG
         ((|cP|
           (|Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |remainder| S))))
         (SEQ (LETT |cP| (SPADCALL |a| |b| |v| (QREFELT $ 86)))
              (EXIT
               (SPADCALL
                (SPADCALL (QVELT |cP| 0) (QVELT |cP| 1) (QREFELT $ 80))
                (QVELT |cP| 2) (QREFELT $ 81)))))) 

(SDEFUN |RPOLCAT-;pquo;2SVS;25| ((|a| S) (|b| S) (|v| V) ($ S))
        (SPROG
         ((|c| (S))
          (|cPS|
           (|Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| S) (|:| |remainder| S))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| |v| (QREFELT $ 88)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 80)))
              (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 81)))))) 

(SDEFUN |RPOLCAT-;lazyPrem;3S;26| ((|a| S) (|b| S) ($ S))
        (SEQ
         (COND
          ((NULL (SPADCALL |b| (QREFELT $ 11)))
           (COND
            ((SPADCALL |b| (QREFELT $ 90))
             (EXIT (SPADCALL |a| |b| (QREFELT $ 91)))))))
         (EXIT (QVELT (SPADCALL |a| |b| (QREFELT $ 79)) 2)))) 

(SDEFUN |RPOLCAT-;lazyPquo;3S;27| ((|a| S) (|b| S) ($ S))
        (QVELT (SPADCALL |a| |b| (QREFELT $ 84)) 2)) 

(SDEFUN |RPOLCAT-;lazyPrem;2SVS;28| ((|a| S) (|b| S) (|v| V) ($ S))
        (SPROG
         ((|test| (|Integer|)) (|term| (S)) (#1=#:G654 NIL) (|lcav| (S))
          (|lcbv| (S)) (|dav| #2=(|NonNegativeInteger|)) (|dbv| #2#))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 20))
            (|error|
             "Error in lazyPrem : (%,%,V) -> % from RPOLCAT : #2 is zero"))
           ((SPADCALL |b| (QREFELT $ 11)) (|spadConstant| $ 41))
           ((SPADCALL |v| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
            (SPADCALL |a| |b| (QREFELT $ 95)))
           (#3='T
            (SEQ (LETT |dbv| (SPADCALL |b| |v| (QREFELT $ 34)))
                 (EXIT
                  (COND ((ZEROP |dbv|) (|spadConstant| $ 41))
                        (#3#
                         (SEQ (LETT |dav| (SPADCALL |a| |v| (QREFELT $ 34)))
                              (EXIT
                               (COND ((ZEROP |dav|) |a|)
                                     (#3#
                                      (SEQ (LETT |test| (- |dav| |dbv|))
                                           (LETT |lcbv|
                                                 (SPADCALL |b| |v|
                                                           (QREFELT $ 96)))
                                           (SEQ G190
                                                (COND
                                                 ((NULL
                                                   (COND
                                                    ((SPADCALL |a|
                                                               (QREFELT $ 20))
                                                     NIL)
                                                    ('T
                                                     (NULL (MINUSP |test|)))))
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |lcav|
                                                       (SPADCALL |a| |v|
                                                                 (QREFELT $
                                                                          96)))
                                                 (LETT |term|
                                                       (SPADCALL |lcav| |v|
                                                                 (PROG1
                                                                     (LETT #1#
                                                                           |test|)
                                                                   (|check_subtype2|
                                                                    (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                                 (QREFELT $
                                                                          39)))
                                                 (LETT |a|
                                                       (SPADCALL
                                                        (SPADCALL |lcbv| |a|
                                                                  (QREFELT $
                                                                           81))
                                                        (SPADCALL |term| |b|
                                                                  (QREFELT $
                                                                           81))
                                                        (QREFELT $ 42)))
                                                 (EXIT
                                                  (LETT |test|
                                                        (-
                                                         (SPADCALL |a| |v|
                                                                   (QREFELT $
                                                                            34))
                                                         |dbv|))))
                                                NIL (GO G190) G191 (EXIT NIL))
                                           (EXIT |a|))))))))))))))) 

(SDEFUN |RPOLCAT-;lazyPquo;2SVS;29| ((|a| S) (|b| S) (|v| V) ($ S))
        (QVELT (SPADCALL |a| |b| |v| (QREFELT $ 88)) 2)) 

(SDEFUN |RPOLCAT-;headReduce;3S;30| ((|a| S) (|b| S) ($ S))
        (SPROG
         ((|lrc|
           (|Record| (|:| |polnum| S) (|:| |polden| S)
                     (|:| |power| (|NonNegativeInteger|))))
          (|ha| (S)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 11))
            (|error|
             "Error in headReduce : (%,%) -> Boolean from TSETCAT : #2 is constant"))
           ((SPADCALL |a| (QREFELT $ 11)) |a|)
           ((SPADCALL (SPADCALL |a| (QREFELT $ 23))
                      (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
            (SPADCALL |a| |b| (QREFELT $ 95)))
           ('T
            (SEQ
             (SEQ G190
                  (COND
                   ((NULL
                     (NULL
                      (SPADCALL (LETT |ha| (SPADCALL |a| (QREFELT $ 44))) |b|
                                (QREFELT $ 99))))
                    (GO G191)))
                  (SEQ (LETT |lrc| (SPADCALL |ha| |b| (QREFELT $ 101)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |a| (QREFELT $ 19))
                                    (QREFELT $ 20))
                          (LETT |a| (QVELT |lrc| 0)))
                         ('T
                          (LETT |a|
                                (SPADCALL (QVELT |lrc| 0)
                                          (SPADCALL
                                           (SPADCALL (QVELT |lrc| 1)
                                                     (QVELT |lrc| 2)
                                                     (QREFELT $ 80))
                                           (SPADCALL |a| (QREFELT $ 19))
                                           (QREFELT $ 81))
                                          (QREFELT $ 102)))))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |a|))))))) 

(SDEFUN |RPOLCAT-;initiallyReduce;3S;31| ((|a| S) (|b| S) ($ S))
        (SPROG
         ((|ia| (S)) (|ma| (S)) (|ta| (S))
          (|iamodb|
           (|Record| (|:| |polnum| S) (|:| |polden| S)
                     (|:| |power| (|NonNegativeInteger|))))
          (|v| (V)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 11))
            (|error|
             "Error in initiallyReduce : (%,%) -> Boolean from TSETCAT : #2 is constant"))
           ((SPADCALL |a| (QREFELT $ 11)) |a|)
           (#1='T
            (SEQ (LETT |v| (SPADCALL |b| (QREFELT $ 23)))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) |v| (QREFELT $ 94))
                    (SPADCALL |a| |b| (QREFELT $ 95)))
                   (#1#
                    (SEQ (LETT |ia| |a|) (LETT |ma| (|spadConstant| $ 16))
                         (LETT |ta| (|spadConstant| $ 41))
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((SPADCALL |ia| (QREFELT $ 11)) NIL)
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ia| (QREFELT $ 23))
                                         (SPADCALL |b| (QREFELT $ 23))
                                         (QREFELT $ 104)))))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |ia| (QREFELT $ 23))
                                           (SPADCALL |b| (QREFELT $ 23))
                                           (QREFELT $ 94))
                                 (COND
                                  ((>= (SPADCALL |ia| (QREFELT $ 22))
                                       (SPADCALL |b| (QREFELT $ 22)))
                                   (SEQ
                                    (LETT |iamodb|
                                          (SPADCALL |ia| |b| (QREFELT $ 101)))
                                    (LETT |ia| (QVELT |iamodb| 0))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |ta| (QREFELT $ 20)))
                                       (LETT |ta|
                                             (SPADCALL
                                              (SPADCALL (QVELT |iamodb| 1)
                                                        (QVELT |iamodb| 2)
                                                        (QREFELT $ 80))
                                              |ta| (QREFELT $ 81)))))))))))
                               (EXIT
                                (COND
                                 ((SPADCALL |ia| (QREFELT $ 20))
                                  (SEQ (LETT |ia| |ta|)
                                       (LETT |ma| (|spadConstant| $ 16))
                                       (EXIT
                                        (LETT |ta| (|spadConstant| $ 41)))))
                                 ((NULL (SPADCALL |ia| (QREFELT $ 11)))
                                  (SEQ
                                   (LETT |ta|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ia| (QREFELT $ 19)) |ma|
                                           (QREFELT $ 81))
                                          |ta| (QREFELT $ 102)))
                                   (LETT |ma|
                                         (SPADCALL
                                          (SPADCALL |ia| (QREFELT $ 105)) |ma|
                                          (QREFELT $ 81)))
                                   (EXIT
                                    (LETT |ia|
                                          (SPADCALL |ia| (QREFELT $ 15)))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SPADCALL (SPADCALL |ia| |ma| (QREFELT $ 81)) |ta|
                                    (QREFELT $ 102))))))))))))) 

(SDEFUN |RPOLCAT-;lazyPremWithDefault;2SR;32|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
          (|:| |remainder| S)))
        (SPROG
         ((#1=#:G703 NIL) (|test| (|Integer|)) (|delta| (|Integer|))
          (|term| (S)) (#2=#:G699 NIL) (#3=#:G693 NIL)
          (|db| (|NonNegativeInteger|)) (|lcb| (S)) (|xb| (V)) (|xa| (V)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 11))
            (|error|
             "Error in lazyPremWithDefault from RPOLCAT : #2 is constant"))
           ((SPADCALL |a| (QREFELT $ 11)) (VECTOR (|spadConstant| $ 16) 0 |a|))
           (#4='T
            (SEQ (LETT |xa| (SPADCALL |a| (QREFELT $ 23)))
                 (LETT |xb| (SPADCALL |b| (QREFELT $ 23)))
                 (EXIT
                  (COND
                   ((SPADCALL |xa| |xb| (QREFELT $ 69))
                    (VECTOR (|spadConstant| $ 16) 0 |a|))
                   (#4#
                    (SEQ (LETT |lcb| (SPADCALL |b| (QREFELT $ 15)))
                         (LETT |db| (SPADCALL |b| (QREFELT $ 22)))
                         (LETT |test|
                               (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|))
                         (LETT |delta| (MAX (+ |test| 1) 0))
                         (COND
                          ((SPADCALL |xa| |xb| (QREFELT $ 94))
                           (SEQ (LETT |b| (SPADCALL |b| (QREFELT $ 19)))
                                (EXIT
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                          ('T (NULL (MINUSP |test|)))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |term|
                                             (SPADCALL
                                              (SPADCALL |a| (QREFELT $ 15))
                                              |xb|
                                              (PROG1 (LETT #3# |test|)
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (QREFELT $ 39)))
                                       (LETT |a|
                                             (SPADCALL
                                              (SPADCALL |lcb|
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           19))
                                                        (QREFELT $ 81))
                                              (SPADCALL |term| |b|
                                                        (QREFELT $ 81))
                                              (QREFELT $ 42)))
                                       (LETT |delta| (- |delta| 1))
                                       (EXIT
                                        (LETT |test|
                                              (-
                                               (SPADCALL |a| |xb|
                                                         (QREFELT $ 34))
                                               |db|))))
                                      NIL (GO G190) G191 (EXIT NIL)))))
                          (#4#
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                         ('T (NULL (MINUSP |test|)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |term|
                                       (SPADCALL
                                        (SPADCALL |a| |xb| (QREFELT $ 96)) |xb|
                                        (PROG1 (LETT #2# |test|)
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                        (QREFELT $ 39)))
                                 (LETT |a|
                                       (SPADCALL
                                        (SPADCALL |lcb| |a| (QREFELT $ 81))
                                        (SPADCALL |term| |b| (QREFELT $ 81))
                                        (QREFELT $ 42)))
                                 (LETT |delta| (- |delta| 1))
                                 (EXIT
                                  (LETT |test|
                                        (- (SPADCALL |a| |xb| (QREFELT $ 34))
                                           |db|))))
                                NIL (GO G190) G191 (EXIT NIL))))
                         (EXIT
                          (VECTOR |lcb|
                                  (PROG1 (LETT #1# |delta|)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  |a|)))))))))))) 

(SDEFUN |RPOLCAT-;lazyPremWithDefault;2SVR;33|
        ((|a| S) (|b| S) (|v| V)
         ($ |Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
          (|:| |remainder| S)))
        (SPROG
         ((#1=#:G717 NIL) (|test| (|Integer|)) (|delta| (|Integer|))
          (|term| (S)) (#2=#:G713 NIL) (|lcav| (S)) (|lcbv| (S))
          (|dav| #3=(|NonNegativeInteger|)) (|dbv| #3#))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 20))
            (|error|
             "Error in lazyPremWithDefault : (%,%,V) -> % from RPOLCAT : #2 is zero"))
           ((SPADCALL |b| (QREFELT $ 11)) (VECTOR |b| 1 (|spadConstant| $ 41)))
           ((SPADCALL |v| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
            (SPADCALL |a| |b| (QREFELT $ 79)))
           (#4='T
            (SEQ (LETT |dbv| (SPADCALL |b| |v| (QREFELT $ 34)))
                 (EXIT
                  (COND ((ZEROP |dbv|) (VECTOR |b| 1 (|spadConstant| $ 41)))
                        (#4#
                         (SEQ (LETT |dav| (SPADCALL |a| |v| (QREFELT $ 34)))
                              (EXIT
                               (COND
                                ((ZEROP |dav|)
                                 (VECTOR (|spadConstant| $ 16) 0 |a|))
                                (#4#
                                 (SEQ (LETT |test| (- |dav| |dbv|))
                                      (LETT |delta| (MAX (+ |test| 1) 0))
                                      (LETT |lcbv|
                                            (SPADCALL |b| |v| (QREFELT $ 96)))
                                      (SEQ G190
                                           (COND
                                            ((NULL
                                              (COND
                                               ((SPADCALL |a| (QREFELT $ 20))
                                                NIL)
                                               ('T (NULL (MINUSP |test|)))))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |lcav|
                                                  (SPADCALL |a| |v|
                                                            (QREFELT $ 96)))
                                            (LETT |term|
                                                  (SPADCALL |lcav| |v|
                                                            (PROG1
                                                                (LETT #2#
                                                                      |test|)
                                                              (|check_subtype2|
                                                               (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                                            (QREFELT $ 39)))
                                            (LETT |a|
                                                  (SPADCALL
                                                   (SPADCALL |lcbv| |a|
                                                             (QREFELT $ 81))
                                                   (SPADCALL |term| |b|
                                                             (QREFELT $ 81))
                                                   (QREFELT $ 42)))
                                            (LETT |delta| (- |delta| 1))
                                            (EXIT
                                             (LETT |test|
                                                   (-
                                                    (SPADCALL |a| |v|
                                                              (QREFELT $ 34))
                                                    |dbv|))))
                                           NIL (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (VECTOR |lcbv|
                                               (PROG1 (LETT #1# |delta|)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               |a|)))))))))))))))) 

(SDEFUN |RPOLCAT-;pseudoDivide;2SR;34|
        ((|a| S) (|b| S) ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((|c| (S))
          (|cPS|
           (|Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| S) (|:| |remainder| S))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 84)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 80)))
              (EXIT
               (CONS (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 81))
                     (SPADCALL |c| (QVELT |cPS| 3) (QREFELT $ 81))))))) 

(SDEFUN |RPOLCAT-;lazyPseudoDivide;2SR;35|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
          (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((#1=#:G743 NIL) (|test| (|Integer|)) (|delta| (|Integer|)) (|q| (S))
          (|term| (S)) (#2=#:G739 NIL) (#3=#:G733 NIL)
          (|db| (|NonNegativeInteger|)) (|lcb| (S)) (|xb| (V)) (|xa| (V)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 11))
            (|error|
             "Error in lazyPseudoDivide from RPOLCAT : #2 is constant"))
           ((SPADCALL |a| (QREFELT $ 11))
            (VECTOR (|spadConstant| $ 16) 0 (|spadConstant| $ 41) |a|))
           (#4='T
            (SEQ (LETT |xa| (SPADCALL |a| (QREFELT $ 23)))
                 (LETT |xb| (SPADCALL |b| (QREFELT $ 23)))
                 (EXIT
                  (COND
                   ((SPADCALL |xa| |xb| (QREFELT $ 69))
                    (VECTOR (|spadConstant| $ 16) 0 (|spadConstant| $ 41) |a|))
                   (#4#
                    (SEQ (LETT |lcb| (SPADCALL |b| (QREFELT $ 15)))
                         (LETT |db| (SPADCALL |b| (QREFELT $ 22)))
                         (LETT |q| (|spadConstant| $ 41))
                         (LETT |test|
                               (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|))
                         (LETT |delta| (MAX (+ |test| 1) 0))
                         (COND
                          ((SPADCALL |xa| |xb| (QREFELT $ 94))
                           (SEQ (LETT |b| (SPADCALL |b| (QREFELT $ 19)))
                                (EXIT
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                          ('T (NULL (MINUSP |test|)))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |term|
                                             (SPADCALL
                                              (SPADCALL |a| (QREFELT $ 15))
                                              |xb|
                                              (PROG1 (LETT #3# |test|)
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (QREFELT $ 39)))
                                       (LETT |a|
                                             (SPADCALL
                                              (SPADCALL |lcb|
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           19))
                                                        (QREFELT $ 81))
                                              (SPADCALL |term| |b|
                                                        (QREFELT $ 81))
                                              (QREFELT $ 42)))
                                       (LETT |q|
                                             (SPADCALL
                                              (SPADCALL |lcb| |q|
                                                        (QREFELT $ 81))
                                              |term| (QREFELT $ 102)))
                                       (LETT |delta| (- |delta| 1))
                                       (EXIT
                                        (LETT |test|
                                              (-
                                               (SPADCALL |a| |xb|
                                                         (QREFELT $ 34))
                                               |db|))))
                                      NIL (GO G190) G191 (EXIT NIL)))))
                          (#4#
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                         ('T (NULL (MINUSP |test|)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |term|
                                       (SPADCALL
                                        (SPADCALL |a| |xb| (QREFELT $ 96)) |xb|
                                        (PROG1 (LETT #2# |test|)
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                        (QREFELT $ 39)))
                                 (LETT |a|
                                       (SPADCALL
                                        (SPADCALL |lcb| |a| (QREFELT $ 81))
                                        (SPADCALL |term| |b| (QREFELT $ 81))
                                        (QREFELT $ 42)))
                                 (LETT |q|
                                       (SPADCALL
                                        (SPADCALL |lcb| |q| (QREFELT $ 81))
                                        |term| (QREFELT $ 102)))
                                 (LETT |delta| (- |delta| 1))
                                 (EXIT
                                  (LETT |test|
                                        (- (SPADCALL |a| |xb| (QREFELT $ 34))
                                           |db|))))
                                NIL (GO G190) G191 (EXIT NIL))))
                         (EXIT
                          (VECTOR |lcb|
                                  (PROG1 (LETT #1# |delta|)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  |q| |a|)))))))))))) 

(SDEFUN |RPOLCAT-;lazyPseudoDivide;2SVR;36|
        ((|a| S) (|b| S) (|v| V)
         ($ |Record| (|:| |coef| S) (|:| |gap| (|NonNegativeInteger|))
          (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((#1=#:G757 NIL) (|test| (|Integer|)) (|delta| (|Integer|)) (|q| (S))
          (|term| (S)) (#2=#:G753 NIL) (|lcav| (S)) (|lcbv| (S))
          (|dav| #3=(|NonNegativeInteger|)) (|dbv| #3#))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 20))
            (|error|
             "Error in lazyPseudoDivide : (%,%,V) -> % from RPOLCAT : #2 is zero"))
           ((SPADCALL |b| (QREFELT $ 11))
            (VECTOR |b| 1 |a| (|spadConstant| $ 41)))
           ((SPADCALL |v| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
            (SPADCALL |a| |b| (QREFELT $ 84)))
           (#4='T
            (SEQ (LETT |dbv| (SPADCALL |b| |v| (QREFELT $ 34)))
                 (EXIT
                  (COND
                   ((ZEROP |dbv|) (VECTOR |b| 1 |a| (|spadConstant| $ 41)))
                   (#4#
                    (SEQ (LETT |dav| (SPADCALL |a| |v| (QREFELT $ 34)))
                         (EXIT
                          (COND
                           ((ZEROP |dav|)
                            (VECTOR (|spadConstant| $ 16) 0
                                    (|spadConstant| $ 41) |a|))
                           (#4#
                            (SEQ (LETT |test| (- |dav| |dbv|))
                                 (LETT |delta| (MAX (+ |test| 1) 0))
                                 (LETT |lcbv|
                                       (SPADCALL |b| |v| (QREFELT $ 96)))
                                 (LETT |q| (|spadConstant| $ 41))
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                          ('T (NULL (MINUSP |test|)))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |lcav|
                                             (SPADCALL |a| |v| (QREFELT $ 96)))
                                       (LETT |term|
                                             (SPADCALL |lcav| |v|
                                                       (PROG1 (LETT #2# |test|)
                                                         (|check_subtype2|
                                                          (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                                       (QREFELT $ 39)))
                                       (LETT |a|
                                             (SPADCALL
                                              (SPADCALL |lcbv| |a|
                                                        (QREFELT $ 81))
                                              (SPADCALL |term| |b|
                                                        (QREFELT $ 81))
                                              (QREFELT $ 42)))
                                       (LETT |q|
                                             (SPADCALL
                                              (SPADCALL |lcbv| |q|
                                                        (QREFELT $ 81))
                                              |term| (QREFELT $ 102)))
                                       (LETT |delta| (- |delta| 1))
                                       (EXIT
                                        (LETT |test|
                                              (-
                                               (SPADCALL |a| |v|
                                                         (QREFELT $ 34))
                                               |dbv|))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (VECTOR |lcbv|
                                          (PROG1 (LETT #1# |delta|)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          |q| |a|)))))))))))))))) 

(SDEFUN |RPOLCAT-;monicModulo;3S;37| ((|a| S) (|b| S) ($ S))
        (SPROG ((#1=#:G766 NIL) (|rec| (|Union| S "failed")) (|ib| (S)))
               (SEQ
                (COND
                 ((SPADCALL |b| (QREFELT $ 11))
                  (|error|
                   "Error in monicModulo from RPOLCAT : #2 is constant"))
                 (#2='T
                  (SEQ
                   (LETT |rec|
                         (SPADCALL (LETT |ib| (SPADCALL |b| (QREFELT $ 15)))
                                   (QREFELT $ 54)))
                   (EXIT
                    (COND
                     ((QEQCAR |rec| 1)
                      (|error|
                       "Error in monicModulo from RPOLCAT : #2 is not monic"))
                     ((SPADCALL |a| (QREFELT $ 11)) |a|)
                     (#2#
                      (SPADCALL |ib|
                                (QVELT
                                 (SPADCALL
                                  (SPADCALL
                                   (PROG2 (LETT #1# |rec|)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              #3="failed")
                                                     #1#))
                                   |a| (QREFELT $ 81))
                                  (SPADCALL
                                   (PROG2 (LETT #1# |rec|)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              #3#)
                                                     #1#))
                                   |b| (QREFELT $ 81))
                                  (QREFELT $ 79))
                                 2)
                                (QREFELT $ 81))))))))))) 

(SDEFUN |RPOLCAT-;lazyResidueClass;2SR;38|
        ((|a| S) (|b| S)
         ($ |Record| (|:| |polnum| S) (|:| |polden| S)
          (|:| |power| (|NonNegativeInteger|))))
        (SPROG
         ((|test| (|Integer|)) (|pow| (|NonNegativeInteger|)) (|term| (S))
          (#1=#:G782 NIL) (#2=#:G776 NIL) (|db| (|NonNegativeInteger|))
          (|lcb| (S)) (|xb| (V)) (|xa| (V)))
         (SEQ
          (COND
           ((SPADCALL |b| (QREFELT $ 20)) (VECTOR |a| (|spadConstant| $ 16) 0))
           ((SPADCALL |b| (QREFELT $ 11))
            (VECTOR (|spadConstant| $ 41) (|spadConstant| $ 16) 0))
           ((SPADCALL |a| (QREFELT $ 11)) (VECTOR |a| (|spadConstant| $ 16) 0))
           (#3='T
            (SEQ (LETT |xa| (SPADCALL |a| (QREFELT $ 23)))
                 (LETT |xb| (SPADCALL |b| (QREFELT $ 23)))
                 (EXIT
                  (COND
                   ((SPADCALL |xa| |xb| (QREFELT $ 69))
                    (VECTOR |a| (|spadConstant| $ 16) 0))
                   ((SPADCALL |b| (QREFELT $ 90))
                    (VECTOR (SPADCALL |a| |b| (QREFELT $ 91))
                            (|spadConstant| $ 16) 0))
                   (#3#
                    (SEQ (LETT |lcb| (SPADCALL |b| (QREFELT $ 15)))
                         (LETT |db| (SPADCALL |b| (QREFELT $ 22)))
                         (LETT |test|
                               (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|))
                         (LETT |pow| 0)
                         (COND
                          ((SPADCALL |xa| |xb| (QREFELT $ 94))
                           (SEQ (LETT |b| (SPADCALL |b| (QREFELT $ 19)))
                                (EXIT
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                          ('T (NULL (MINUSP |test|)))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |term|
                                             (SPADCALL
                                              (SPADCALL |a| (QREFELT $ 15))
                                              |xb|
                                              (PROG1 (LETT #2# |test|)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 39)))
                                       (LETT |a|
                                             (SPADCALL
                                              (SPADCALL |lcb|
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           19))
                                                        (QREFELT $ 81))
                                              (SPADCALL |term| |b|
                                                        (QREFELT $ 81))
                                              (QREFELT $ 42)))
                                       (LETT |pow| (+ |pow| 1))
                                       (EXIT
                                        (LETT |test|
                                              (-
                                               (SPADCALL |a| |xb|
                                                         (QREFELT $ 34))
                                               |db|))))
                                      NIL (GO G190) G191 (EXIT NIL)))))
                          (#3#
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((SPADCALL |a| (QREFELT $ 20)) NIL)
                                         ('T (NULL (MINUSP |test|)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |term|
                                       (SPADCALL
                                        (SPADCALL |a| |xb| (QREFELT $ 96)) |xb|
                                        (PROG1 (LETT #1# |test|)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 39)))
                                 (LETT |a|
                                       (SPADCALL
                                        (SPADCALL |lcb| |a| (QREFELT $ 81))
                                        (SPADCALL |term| |b| (QREFELT $ 81))
                                        (QREFELT $ 42)))
                                 (LETT |pow| (+ |pow| 1))
                                 (EXIT
                                  (LETT |test|
                                        (- (SPADCALL |a| |xb| (QREFELT $ 34))
                                           |db|))))
                                NIL (GO G190) G191 (EXIT NIL))))
                         (EXIT (VECTOR |a| |lcb| |pow|)))))))))))) 

(SDEFUN |RPOLCAT-;reduced?;2SB;39| ((|a| S) (|b| S) ($ |Boolean|))
        (< (SPADCALL |a| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 34))
           (SPADCALL |b| (QREFELT $ 22)))) 

(SDEFUN |RPOLCAT-;reduced?;SLB;40| ((|p| S) (|lq| |List| S) ($ |Boolean|))
        (SEQ
         (COND ((SPADCALL |p| (QREFELT $ 11)) 'T)
               ('T
                (SEQ
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((NULL |lq|) NIL)
                               ('T
                                (SPADCALL |p| (|SPADfirst| |lq|)
                                          (QREFELT $ 99)))))
                        (GO G191)))
                      (SEQ (EXIT (LETT |lq| (CDR |lq|)))) NIL (GO G190) G191
                      (EXIT NIL))
                 (EXIT (NULL |lq|))))))) 

(SDEFUN |RPOLCAT-;headReduced?;2SB;41| ((|a| S) (|b| S) ($ |Boolean|))
        (SPADCALL (SPADCALL |a| (QREFELT $ 44)) |b| (QREFELT $ 99))) 

(SDEFUN |RPOLCAT-;headReduced?;SLB;42| ((|p| S) (|lq| |List| S) ($ |Boolean|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 44)) |lq| (QREFELT $ 118))) 

(SDEFUN |RPOLCAT-;initiallyReduced?;2SB;43| ((|a| S) (|b| S) ($ |Boolean|))
        (COND
         ((SPADCALL |b| (QREFELT $ 11))
          (|error|
           "Error in initiallyReduced? : (%,%) -> Bool. from RPOLCAT : #2 is constant"))
         ((OR (SPADCALL |a| (QREFELT $ 11))
              (SPADCALL (SPADCALL |a| (QREFELT $ 23))
                        (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 69)))
          'T)
         ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
                    (QREFELT $ 94))
          (SPADCALL |a| |b| (QREFELT $ 99)))
         ('T (SPADCALL (SPADCALL |a| (QREFELT $ 15)) |b| (QREFELT $ 120))))) 

(SDEFUN |RPOLCAT-;initiallyReduced?;SLB;44|
        ((|p| S) (|lq| |List| S) ($ |Boolean|))
        (SEQ
         (COND ((SPADCALL |p| (QREFELT $ 11)) 'T)
               ('T
                (SEQ
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((NULL |lq|) NIL)
                               ('T
                                (SPADCALL |p| (|SPADfirst| |lq|)
                                          (QREFELT $ 120)))))
                        (GO G191)))
                      (SEQ (EXIT (LETT |lq| (CDR |lq|)))) NIL (GO G190) G191
                      (EXIT NIL))
                 (EXIT (NULL |lq|))))))) 

(SDEFUN |RPOLCAT-;normalized?;2SB;45| ((|a| S) (|b| S) ($ |Boolean|))
        (COND
         ((SPADCALL |b| (QREFELT $ 11))
          (|error|
           "Error in  normalized? : (%,%) -> Boolean from TSETCAT : #2 is constant"))
         ((OR (SPADCALL |a| (QREFELT $ 11))
              (SPADCALL (SPADCALL |a| (QREFELT $ 23))
                        (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 69)))
          'T)
         ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
                    (QREFELT $ 94))
          NIL)
         ('T (SPADCALL (SPADCALL |a| (QREFELT $ 15)) |b| (QREFELT $ 123))))) 

(SDEFUN |RPOLCAT-;normalized?;SLB;46| ((|p| S) (|lq| |List| S) ($ |Boolean|))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND ((NULL |lq|) NIL)
                       ('T (SPADCALL |p| (|SPADfirst| |lq|) (QREFELT $ 123)))))
                (GO G191)))
              (SEQ (EXIT (LETT |lq| (CDR |lq|)))) NIL (GO G190) G191
              (EXIT NIL))
         (EXIT (NULL |lq|)))) 

(SDEFUN |RPOLCAT-;iexactQuo;3R;47| ((|r| R) (|s| R) ($ R))
        (SPADCALL |r| |s| (QREFELT $ 126))) 

(SDEFUN |RPOLCAT-;iexactQuo;3R;48| ((|r| R) (|s| R) ($ R))
        (SPROG ((#1=#:G821 NIL))
               (PROG2 (LETT #1# (SPADCALL |r| |s| (QREFELT $ 128)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) "failed") #1#)))) 

(SDEFUN |RPOLCAT-;exactQuo| ((|r| R) (|s| R) ($ R))
        (SPADCALL |r| |s| (QREFELT $ 129))) 

(SDEFUN |RPOLCAT-;exactQuotient;SRS;50| ((|p| S) (|r| R) ($ S))
        (SPROG ((#1=#:G826 NIL))
               (PROG2 (LETT #1# (SPADCALL |p| |r| (QREFELT $ 130)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                 (|Union| (QREFELT $ 6) "failed") #1#)))) 

(SDEFUN |RPOLCAT-;exactQuotient;3S;51| ((|a| S) (|b| S) ($ S))
        (SPROG ((#1=#:G830 NIL))
               (COND
                ((SPADCALL |b| (QREFELT $ 11))
                 (SPADCALL |a| (SPADCALL |b| (QREFELT $ 12)) (QREFELT $ 132)))
                ('T
                 (PROG2 (LETT #1# (SPADCALL |a| |b| (QREFELT $ 133)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                   (|Union| (QREFELT $ 6) "failed") #1#)))))) 

(SDEFUN |RPOLCAT-;exactQuotient!;3S;52| ((|a| S) (|b| S) ($ S))
        (SPROG ((#1=#:G835 NIL))
               (COND
                ((SPADCALL |b| (QREFELT $ 11))
                 (SPADCALL |a| (SPADCALL |b| (QREFELT $ 12)) (QREFELT $ 135)))
                ('T
                 (LETT |a|
                       (PROG2 (LETT #1# (SPADCALL |a| |b| (QREFELT $ 133)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                         (|Union| (QREFELT $ 6) "failed")
                                         #1#))))))) 

(SDEFUN |RPOLCAT-;primPartElseUnitCanonical;2S;53| ((|p| S) ($ S))
        (SPADCALL |p| (QREFELT $ 137))) 

(SDEFUN |RPOLCAT-;primPartElseUnitCanonical!;2S;54| ((|p| S) ($ S))
        (LETT |p| (SPADCALL |p| (QREFELT $ 137)))) 

(SDEFUN |RPOLCAT-;primPartElseUnitCanonical;2S;55| ((|p| S) ($ S))
        (SPADCALL |p| (QREFELT $ 140))) 

(SDEFUN |RPOLCAT-;primitivePart!;2S;56| ((|p| S) ($ S))
        (SPROG ((|cp| (R)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 20)) |p|)
                      (#1='T
                       (SEQ
                        (SEQ (LETT |cp| (SPADCALL |p| (QREFELT $ 141)))
                             (EXIT
                              (COND
                               ((SPADCALL |cp| (|spadConstant| $ 17)
                                          (QREFELT $ 142))
                                (LETT |p| (SPADCALL |p| (QREFELT $ 137))))
                               (#1#
                                (LETT |p|
                                      (SPADCALL
                                       (SPADCALL |p| |cp| (QREFELT $ 135))
                                       (QREFELT $ 137)))))))
                        (EXIT |p|))))))) 

(SDEFUN |RPOLCAT-;primPartElseUnitCanonical!;2S;57| ((|p| S) ($ S))
        (SPADCALL |p| (QREFELT $ 144))) 

(SDEFUN |RPOLCAT-;primPartElseUnitCanonical;2S;58| ((|p| S) ($ S))
        (SPADCALL |p| (QREFELT $ 137))) 

(SDEFUN |RPOLCAT-;primPartElseUnitCanonical!;2S;59| ((|p| S) ($ S))
        (LETT |p| (SPADCALL |p| (QREFELT $ 137)))) 

(SDEFUN |RPOLCAT-;gcd;RSR;60| ((|r| R) (|p| S) ($ R))
        (COND
         ((OR (SPADCALL |r| (|spadConstant| $ 17) (QREFELT $ 142))
              (SPADCALL |p| (QREFELT $ 20)))
          |r|)
         ((SPADCALL |p| (QREFELT $ 11))
          (SPADCALL |r| (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 145)))
         ('T
          (SPADCALL
           (SPADCALL |r| (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 146))
           (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 146))))) 

(SDEFUN |RPOLCAT-;mainContent;2S;61| ((|p| S) ($ S))
        (SPROG
         ((#1=#:G853 NIL) (#2=#:G852 (S)) (#3=#:G854 (S)) (#4=#:G857 NIL)
          (#5=#:G382 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 20)) |p|)
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT #5# NIL) (LETT #4# (SPADCALL |p| (QREFELT $ 148)))
                       G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3# #5#)
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 149))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 41))))))))) 

(SDEFUN |RPOLCAT-;mainPrimitivePart;2S;62| ((|p| S) ($ S))
        (SPROG ((#1=#:G859 NIL))
               (COND ((SPADCALL |p| (QREFELT $ 20)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p| (SPADCALL |p| (QREFELT $ 151))
                                            (QREFELT $ 133)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))
                        (QREFELT $ 153))
                       1))))) 

(SDEFUN |RPOLCAT-;mainSquareFreePart;2S;63| ((|p| S) ($ S))
        (SPROG
         ((|sfp| (|SparseUnivariatePolynomial| S)) (|v| (V)) (#1=#:G865 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 11)) |p|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                          (|Union| (QREFELT $ 9) "failed")
                                          #1#)))
                  (LETT |sfp|
                        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61))
                                  (QREFELT $ 155)))
                  (EXIT (SPADCALL |sfp| |v| (QREFELT $ 156))))))))) 

(SDEFUN |RPOLCAT-;convert;SP;64| ((|p| S) ($ |Polynomial| R))
        (SPROG ((|d| (|NonNegativeInteger|)) (|v| (V)))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 11))
                  (SPADCALL (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 159)))
                 ('T
                  (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 23)))
                       (LETT |d| (SPADCALL |p| (QREFELT $ 22)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |p| (QREFELT $ 15))
                                    (QREFELT $ 160))
                          (SPADCALL
                           (SPADCALL (SPADCALL |v| (QREFELT $ 162))
                                     (QREFELT $ 163))
                           |d| (QREFELT $ 164))
                          (QREFELT $ 165))
                         (SPADCALL (SPADCALL |p| (QREFELT $ 19))
                                   (QREFELT $ 160))
                         (QREFELT $ 166))))))))) 

(SDEFUN |RPOLCAT-;coerce;SP;65| ((|p| S) ($ |Polynomial| R))
        (SPADCALL |p| (QREFELT $ 160))) 

(SDEFUN |RPOLCAT-;localRetract| ((|p| |Polynomial| R) ($ S))
        (SPROG
         ((|newp| (S)) (|xvimvp| (S)) (|c| (S)) (|d| (|NonNegativeInteger|))
          (|vimvp| (V)) (|imvp| (|PositiveInteger|)) (#1=#:G883 NIL)
          (|mvp| (|Symbol|)) (#2=#:G881 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 174))
            (SPADCALL (SPADCALL |p| (QREFELT $ 175)) (QREFELT $ 176)))
           ('T
            (SEQ
             (LETT |mvp|
                   (PROG2 (LETT #2# (SPADCALL |p| (QREFELT $ 178)))
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) (|Symbol|)
                                     (|Union| (|Symbol|) "failed") #2#)))
             (LETT |imvp|
                   (PROG1
                       (LETT #1#
                             (SPADCALL |mvp| (QREFELT $ 173) (QREFELT $ 180)))
                     (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                       '(|Integer|) #1#)))
             (LETT |vimvp| (SPADCALL |imvp| (QREFELT $ 172)))
             (LETT |newp| (|spadConstant| $ 41))
             (SEQ G190
                  (COND
                   ((NULL
                     (NULL
                      (ZEROP (LETT |d| (SPADCALL |p| |mvp| (QREFELT $ 181))))))
                    (GO G191)))
                  (SEQ
                   (LETT |c|
                         (|RPOLCAT-;localRetract|
                          (SPADCALL |p| |mvp| |d| (QREFELT $ 182)) $))
                   (LETT |xvimvp| (SPADCALL |c| |vimvp| |d| (QREFELT $ 39)))
                   (LETT |newp| (SPADCALL |newp| |xvimvp| (QREFELT $ 102)))
                   (EXIT
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL
                                     (SPADCALL |p| |mvp| |d| (QREFELT $ 182))
                                     |mvp| |d| (QREFELT $ 183))
                                    (QREFELT $ 184)))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL |newp| (|RPOLCAT-;localRetract| |p| $)
                        (QREFELT $ 102))))))))) 

(SDEFUN |RPOLCAT-;localRetractPQ|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ S))
        (SPROG
         ((|newp| (S)) (|xvimvp| (S)) (|c| (S)) (|d| (|NonNegativeInteger|))
          (|vimvp| (V)) (|imvp| (|PositiveInteger|)) (#1=#:G893 NIL)
          (|mvp| (|Symbol|)) (#2=#:G891 NIL))
         (SEQ
          (COND
           ((SPADCALL |pq| (QREFELT $ 186))
            (SPADCALL
             (SPADCALL (SPADCALL |pq| (QREFELT $ 188)) (QREFELT $ 189))
             (QREFELT $ 176)))
           ('T
            (SEQ
             (LETT |mvp|
                   (PROG2 (LETT #2# (SPADCALL |pq| (QREFELT $ 190)))
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) (|Symbol|)
                                     (|Union| (|Symbol|) "failed") #2#)))
             (LETT |imvp|
                   (PROG1
                       (LETT #1#
                             (SPADCALL |mvp| (QREFELT $ 173) (QREFELT $ 180)))
                     (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                       '(|Integer|) #1#)))
             (LETT |vimvp| (SPADCALL |imvp| (QREFELT $ 172)))
             (LETT |newp| (|spadConstant| $ 41))
             (SEQ G190
                  (COND
                   ((NULL
                     (NULL
                      (ZEROP
                       (LETT |d| (SPADCALL |pq| |mvp| (QREFELT $ 191))))))
                    (GO G191)))
                  (SEQ
                   (LETT |c|
                         (|RPOLCAT-;localRetractPQ|
                          (SPADCALL |pq| |mvp| |d| (QREFELT $ 192)) $))
                   (LETT |xvimvp| (SPADCALL |c| |vimvp| |d| (QREFELT $ 39)))
                   (LETT |newp| (SPADCALL |newp| |xvimvp| (QREFELT $ 102)))
                   (EXIT
                    (LETT |pq|
                          (SPADCALL |pq|
                                    (SPADCALL
                                     (SPADCALL |pq| |mvp| |d| (QREFELT $ 192))
                                     |mvp| |d| (QREFELT $ 193))
                                    (QREFELT $ 194)))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL |newp| (|RPOLCAT-;localRetractPQ| |pq| $)
                        (QREFELT $ 102))))))))) 

(SDEFUN |RPOLCAT-;localRetractPZ| ((|pz| |Polynomial| (|Integer|)) ($ S))
        (SPROG
         ((|newp| (S)) (|xvimvp| (S)) (|c| (S)) (|d| (|NonNegativeInteger|))
          (|vimvp| (V)) (|imvp| (|PositiveInteger|)) (#1=#:G903 NIL)
          (|mvp| (|Symbol|)) (#2=#:G901 NIL))
         (SEQ
          (COND
           ((SPADCALL |pz| (QREFELT $ 196))
            (SPADCALL
             (SPADCALL (SPADCALL |pz| (QREFELT $ 197)) (QREFELT $ 198))
             (QREFELT $ 176)))
           ('T
            (SEQ
             (LETT |mvp|
                   (PROG2 (LETT #2# (SPADCALL |pz| (QREFELT $ 199)))
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) (|Symbol|)
                                     (|Union| (|Symbol|) "failed") #2#)))
             (LETT |imvp|
                   (PROG1
                       (LETT #1#
                             (SPADCALL |mvp| (QREFELT $ 173) (QREFELT $ 180)))
                     (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                       '(|Integer|) #1#)))
             (LETT |vimvp| (SPADCALL |imvp| (QREFELT $ 172)))
             (LETT |newp| (|spadConstant| $ 41))
             (SEQ G190
                  (COND
                   ((NULL
                     (NULL
                      (ZEROP
                       (LETT |d| (SPADCALL |pz| |mvp| (QREFELT $ 200))))))
                    (GO G191)))
                  (SEQ
                   (LETT |c|
                         (|RPOLCAT-;localRetractPZ|
                          (SPADCALL |pz| |mvp| |d| (QREFELT $ 201)) $))
                   (LETT |xvimvp| (SPADCALL |c| |vimvp| |d| (QREFELT $ 39)))
                   (LETT |newp| (SPADCALL |newp| |xvimvp| (QREFELT $ 102)))
                   (EXIT
                    (LETT |pz|
                          (SPADCALL |pz|
                                    (SPADCALL
                                     (SPADCALL |pz| |mvp| |d| (QREFELT $ 201))
                                     |mvp| |d| (QREFELT $ 202))
                                    (QREFELT $ 203)))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL |newp| (|RPOLCAT-;localRetractPZ| |pz| $)
                        (QREFELT $ 102))))))))) 

(SDEFUN |RPOLCAT-;retractable?| ((|p| |Polynomial| R) ($ |Boolean|))
        (SPROG ((|lvp| (|List| (|Symbol|))))
               (SEQ (LETT |lvp| (SPADCALL |p| (QREFELT $ 204)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lvp|) NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| |lvp|)
                                             (QREFELT $ 173)
                                             (QREFELT $ 205)))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |lvp| (CDR |lvp|)))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (EXIT (NULL |lvp|))))) 

(SDEFUN |RPOLCAT-;retractablePQ?|
        ((|p| |Polynomial| (|Fraction| (|Integer|))) ($ |Boolean|))
        (SPROG ((|lvp| (|List| (|Symbol|))))
               (SEQ (LETT |lvp| (SPADCALL |p| (QREFELT $ 206)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lvp|) NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| |lvp|)
                                             (QREFELT $ 173)
                                             (QREFELT $ 205)))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |lvp| (CDR |lvp|)))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (EXIT (NULL |lvp|))))) 

(SDEFUN |RPOLCAT-;retractablePZ?|
        ((|p| |Polynomial| (|Integer|)) ($ |Boolean|))
        (SPROG ((|lvp| (|List| (|Symbol|))))
               (SEQ (LETT |lvp| (SPADCALL |p| (QREFELT $ 207)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lvp|) NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| |lvp|)
                                             (QREFELT $ 173)
                                             (QREFELT $ 205)))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |lvp| (CDR |lvp|)))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (EXIT (NULL |lvp|))))) 

(SDEFUN |RPOLCAT-;localRetractIfCan|
        ((|p| |Polynomial| R) ($ |Union| S "failed"))
        (COND ((NULL (|RPOLCAT-;retractable?| |p| $)) (CONS 1 "failed"))
              ('T (CONS 0 (|RPOLCAT-;localRetract| |p| $))))) 

(SDEFUN |RPOLCAT-;localRetractIfCanPQ|
        ((|p| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (COND ((NULL (|RPOLCAT-;retractablePQ?| |p| $)) (CONS 1 "failed"))
              ('T (CONS 0 (|RPOLCAT-;localRetractPQ| |p| $))))) 

(SDEFUN |RPOLCAT-;localRetractIfCanPZ|
        ((|p| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (COND ((NULL (|RPOLCAT-;retractablePZ?| |p| $)) (CONS 1 "failed"))
              ('T (CONS 0 (|RPOLCAT-;localRetractPZ| |p| $))))) 

(SDEFUN |RPOLCAT-;ZToR| ((|z| |Integer|) ($ R)) (SPADCALL |z| (QREFELT $ 198))) 

(SDEFUN |RPOLCAT-;PZToPR| ((|pz| |Polynomial| (|Integer|)) ($ |Polynomial| R))
        (SPADCALL (CONS (|function| |RPOLCAT-;ZToR|) $) |pz| (QREFELT $ 210))) 

(SDEFUN |RPOLCAT-;QToR| ((|q| |Fraction| (|Integer|)) ($ R))
        (SPADCALL |q| (QREFELT $ 189))) 

(SDEFUN |RPOLCAT-;PQToPR|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Polynomial| R))
        (SPADCALL (CONS (|function| |RPOLCAT-;QToR|) $) |pq| (QREFELT $ 213))) 

(SDEFUN |RPOLCAT-;retract;PS;79|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pq| (QREFELT $ 214)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;80|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ S))
        (SPADCALL |pq| (QREFELT $ 216))) 

(SDEFUN |RPOLCAT-;ZToQ| ((|z| |Integer|) ($ |Fraction| (|Integer|)))
        (SPADCALL |z| (QREFELT $ 220))) 

(SDEFUN |RPOLCAT-;RToQ| ((|r| R) ($ |Fraction| (|Integer|)))
        (SPADCALL |r| (QREFELT $ 221))) 

(SDEFUN |RPOLCAT-;PZToPQ|
        ((|pz| |Polynomial| (|Integer|))
         ($ |Polynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |RPOLCAT-;ZToQ|) $) |pz| (QREFELT $ 223))) 

(SDEFUN |RPOLCAT-;PRToPQ|
        ((|pr| |Polynomial| R) ($ |Polynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |RPOLCAT-;RToQ|) $) |pr| (QREFELT $ 225))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;85|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (SPROG ((|pq| (|Polynomial| (|Fraction| (|Integer|)))))
               (SEQ (LETT |pq| (|RPOLCAT-;PZToPQ| |pz| $))
                    (EXIT (SPADCALL |pq| (QREFELT $ 214)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;86|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(SDEFUN |RPOLCAT-;convert;PS;87| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|lrif| (|Union| S "failed")))
               (SEQ (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $))
                    (EXIT
                     (COND
                      ((QEQCAR |lrif| 1)
                       (|error| "failed in convert: PR->% from RPOLCAT"))
                      ('T (QCDR |lrif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;88| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|pq| (|Polynomial| (|Fraction| (|Integer|)))))
               (SEQ (LETT |pq| (|RPOLCAT-;PRToPQ| |pr| $))
                    (EXIT (SPADCALL |pq| (QREFELT $ 216)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;89|
        ((|pr| |Polynomial| R) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;90|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;91|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (SPROG ((|pr| (|Polynomial| R)))
               (SEQ (LETT |pr| (|RPOLCAT-;PQToPR| |pq| $))
                    (EXIT (SPADCALL |pr| (QREFELT $ 230)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;92|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (SPROG ((|pr| (|Polynomial| R)))
               (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $))
                    (EXIT (SPADCALL |pr| (QREFELT $ 230)))))) 

(SDEFUN |RPOLCAT-;retract;PS;93| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pr| (QREFELT $ 230)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;94| ((|pr| |Polynomial| R) ($ S))
        (SPADCALL |pr| (QREFELT $ 232))) 

(SDEFUN |RPOLCAT-;retract;PS;95| ((|pz| |Polynomial| (|Integer|)) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pz| (QREFELT $ 233)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;96| ((|pz| |Polynomial| (|Integer|)) ($ S))
        (SPADCALL |pz| (QREFELT $ 235))) 

(SDEFUN |RPOLCAT-;RToZ| ((|r| R) ($ |Integer|)) (SPADCALL |r| (QREFELT $ 238))) 

(SDEFUN |RPOLCAT-;PRToPZ| ((|pr| |Polynomial| R) ($ |Polynomial| (|Integer|)))
        (SPADCALL (CONS (|function| |RPOLCAT-;RToZ|) $) |pr| (QREFELT $ 240))) 

(SDEFUN |RPOLCAT-;convert;PS;99| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|lrif| (|Union| S "failed")))
               (SEQ (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $))
                    (EXIT
                     (COND
                      ((QEQCAR |lrif| 1)
                       (|error| "failed in convert: PR->% from RPOLCAT"))
                      ('T (QCDR |lrif|))))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;100|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(SDEFUN |RPOLCAT-;convert;PS;101| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|pz| (|Polynomial| (|Integer|))))
               (SEQ (LETT |pz| (|RPOLCAT-;PRToPZ| |pr| $))
                    (EXIT (SPADCALL |pz| (QREFELT $ 235)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;102|
        ((|pr| |Polynomial| R) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;103|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;104|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (SPROG ((|pr| (|Polynomial| R)))
               (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $))
                    (EXIT (SPADCALL |pr| (QREFELT $ 230)))))) 

(SDEFUN |RPOLCAT-;retract;PS;105| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pr| (QREFELT $ 230)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;106| ((|pr| |Polynomial| R) ($ S))
        (SPADCALL |pr| (QREFELT $ 232))) 

(SDEFUN |RPOLCAT-;ZToR| ((|z| |Integer|) ($ R)) (SPADCALL |z| (QREFELT $ 198))) 

(SDEFUN |RPOLCAT-;PZToPR| ((|pz| |Polynomial| (|Integer|)) ($ |Polynomial| R))
        (SPADCALL (CONS (|function| |RPOLCAT-;ZToR|) $) |pz| (QREFELT $ 210))) 

(SDEFUN |RPOLCAT-;QToR| ((|q| |Fraction| (|Integer|)) ($ R))
        (SPADCALL |q| (QREFELT $ 189))) 

(SDEFUN |RPOLCAT-;PQToPR|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Polynomial| R))
        (SPADCALL (CONS (|function| |RPOLCAT-;QToR|) $) |pq| (QREFELT $ 213))) 

(SDEFUN |RPOLCAT-;retract;PS;111|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pq| (QREFELT $ 214)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;112|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ S))
        (SPADCALL |pq| (QREFELT $ 216))) 

(SDEFUN |RPOLCAT-;ZToQ| ((|z| |Integer|) ($ |Fraction| (|Integer|)))
        (SPADCALL |z| (QREFELT $ 220))) 

(SDEFUN |RPOLCAT-;RToQ| ((|r| R) ($ |Fraction| (|Integer|)))
        (SPADCALL |r| (QREFELT $ 221))) 

(SDEFUN |RPOLCAT-;PZToPQ|
        ((|pz| |Polynomial| (|Integer|))
         ($ |Polynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |RPOLCAT-;ZToQ|) $) |pz| (QREFELT $ 223))) 

(SDEFUN |RPOLCAT-;PRToPQ|
        ((|pr| |Polynomial| R) ($ |Polynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |RPOLCAT-;RToQ|) $) |pr| (QREFELT $ 225))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;117|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (SPROG ((|pq| (|Polynomial| (|Fraction| (|Integer|)))))
               (SEQ (LETT |pq| (|RPOLCAT-;PZToPQ| |pz| $))
                    (EXIT (SPADCALL |pq| (QREFELT $ 214)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;118|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(SDEFUN |RPOLCAT-;convert;PS;119| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|lrif| (|Union| S "failed")))
               (SEQ (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $))
                    (EXIT
                     (COND
                      ((QEQCAR |lrif| 1)
                       (|error| "failed in convert: PR->% from RPOLCAT"))
                      ('T (QCDR |lrif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;120| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|pq| (|Polynomial| (|Fraction| (|Integer|)))))
               (SEQ (LETT |pq| (|RPOLCAT-;PRToPQ| |pr| $))
                    (EXIT (SPADCALL |pq| (QREFELT $ 216)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;121|
        ((|pr| |Polynomial| R) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;122|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;123|
        ((|pq| |Polynomial| (|Fraction| (|Integer|))) ($ |Union| S "failed"))
        (SPROG ((|pr| (|Polynomial| R)))
               (SEQ (LETT |pr| (|RPOLCAT-;PQToPR| |pq| $))
                    (EXIT (SPADCALL |pr| (QREFELT $ 230)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;124|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (SPROG ((|pr| (|Polynomial| R)))
               (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $))
                    (EXIT (SPADCALL |pr| (QREFELT $ 230)))))) 

(SDEFUN |RPOLCAT-;retract;PS;125| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pr| (QREFELT $ 230)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;126| ((|pr| |Polynomial| R) ($ S))
        (SPADCALL |pr| (QREFELT $ 232))) 

(SDEFUN |RPOLCAT-;retract;PS;127| ((|pz| |Polynomial| (|Integer|)) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pz| (QREFELT $ 233)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;128| ((|pz| |Polynomial| (|Integer|)) ($ S))
        (SPADCALL |pz| (QREFELT $ 235))) 

(SDEFUN |RPOLCAT-;RToZ| ((|r| R) ($ |Integer|)) (SPADCALL |r| (QREFELT $ 238))) 

(SDEFUN |RPOLCAT-;PRToPZ| ((|pr| |Polynomial| R) ($ |Polynomial| (|Integer|)))
        (SPADCALL (CONS (|function| |RPOLCAT-;RToZ|) $) |pr| (QREFELT $ 240))) 

(SDEFUN |RPOLCAT-;convert;PS;131| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|lrif| (|Union| S "failed")))
               (SEQ (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $))
                    (EXIT
                     (COND
                      ((QEQCAR |lrif| 1)
                       (|error| "failed in convert: PR->% from RPOLCAT"))
                      ('T (QCDR |lrif|))))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;132|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(SDEFUN |RPOLCAT-;convert;PS;133| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|pz| (|Polynomial| (|Integer|))))
               (SEQ (LETT |pz| (|RPOLCAT-;PRToPZ| |pr| $))
                    (EXIT (SPADCALL |pz| (QREFELT $ 235)))))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;134|
        ((|pr| |Polynomial| R) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;135|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;136|
        ((|pz| |Polynomial| (|Integer|)) ($ |Union| S "failed"))
        (SPROG ((|pr| (|Polynomial| R)))
               (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $))
                    (EXIT (SPADCALL |pr| (QREFELT $ 230)))))) 

(SDEFUN |RPOLCAT-;retract;PS;137| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pr| (QREFELT $ 230)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;138| ((|pr| |Polynomial| R) ($ S))
        (SPADCALL |pr| (QREFELT $ 232))) 

(SDEFUN |RPOLCAT-;retractIfCan;PU;139|
        ((|pr| |Polynomial| R) ($ |Union| S "failed"))
        (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(SDEFUN |RPOLCAT-;retract;PS;140| ((|pr| |Polynomial| R) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ (LETT |rif| (SPADCALL |pr| (QREFELT $ 230)))
                    (EXIT
                     (COND
                      ((QEQCAR |rif| 1)
                       (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
                      ('T (QCDR |rif|))))))) 

(SDEFUN |RPOLCAT-;convert;PS;141| ((|pr| |Polynomial| R) ($ S))
        (SPADCALL |pr| (QREFELT $ 232))) 

(SDEFUN |RPOLCAT-;convert;SS;142| ((|pol| S) ($ |String|))
        (SPROG
         ((|stpol| #1=(|String|)) (|n| (|Integer|)) (|sdpol| #1#)
          (|svpol| (|String|)) (|sipol| #1#) (|tpol| (S))
          (|dpol| (|NonNegativeInteger|)) (|vpol| (V)) (|ipol| (S)))
         (SEQ
          (COND
           ((SPADCALL |pol| (QREFELT $ 11))
            (STRINGIMAGE
             (SPADCALL (SPADCALL |pol| (QREFELT $ 12)) (QREFELT $ 238))))
           (#2='T
            (SEQ (LETT |ipol| (SPADCALL |pol| (QREFELT $ 15)))
                 (LETT |vpol| (SPADCALL |pol| (QREFELT $ 23)))
                 (LETT |dpol| (SPADCALL |pol| (QREFELT $ 22)))
                 (LETT |tpol| (SPADCALL |pol| (QREFELT $ 19)))
                 (COND
                  ((SPADCALL |ipol| (|spadConstant| $ 16) (QREFELT $ 18))
                   (LETT |sipol| (|make_full_CVEC| 0)))
                  ((SPADCALL (SPADCALL |ipol| (QREFELT $ 241))
                             (|spadConstant| $ 16) (QREFELT $ 18))
                   (LETT |sipol| "-"))
                  (#2#
                   (SEQ (LETT |sipol| (SPADCALL |ipol| (QREFELT $ 243)))
                        (EXIT
                         (COND
                          ((SPADCALL |ipol| (QREFELT $ 244))
                           (LETT |sipol| (STRCONC |sipol| "*")))
                          (#2#
                           (LETT |sipol|
                                 (SPADCALL (LIST "(" |sipol| ")*")
                                           (QREFELT $ 245)))))))))
                 (LETT |svpol|
                       (SPADCALL (SPADCALL |vpol| (QREFELT $ 162))
                                 (QREFELT $ 246)))
                 (COND ((EQL |dpol| 1) (LETT |sdpol| (|make_full_CVEC| 0)))
                       (#2# (LETT |sdpol| (STRCONC "^" (STRINGIMAGE |dpol|)))))
                 (COND
                  ((SPADCALL |tpol| (QREFELT $ 20))
                   (LETT |stpol| (|make_full_CVEC| 0)))
                  ((SPADCALL |tpol| (QREFELT $ 11))
                   (SEQ
                    (LETT |n|
                          (SPADCALL (SPADCALL |tpol| (QREFELT $ 12))
                                    (QREFELT $ 238)))
                    (EXIT
                     (COND
                      ((SPADCALL |n| 0 (QREFELT $ 71))
                       (LETT |stpol| (STRCONC " +" (STRINGIMAGE |n|))))
                      (#2# (LETT |stpol| (STRINGIMAGE |n|)))))))
                  (#2#
                   (SEQ (LETT |stpol| (SPADCALL |tpol| (QREFELT $ 243)))
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL
                             (SPADCALL (SPADCALL |stpol| 1 (QREFELT $ 249))
                                       (QREFELT $ 250))
                             (LIST "+" "-") (QREFELT $ 252)))
                           (LETT |stpol| (STRCONC " + " |stpol|))))))))
                 (EXIT
                  (SPADCALL (LIST |sipol| |svpol| |sdpol| |stpol|)
                            (QREFELT $ 245))))))))) 

(DECLAIM (NOTINLINE |RecursivePolynomialCategory&;|)) 

(DEFUN |RecursivePolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G878 NIL) (#2=#:G1163 NIL) (|i| NIL) (#3=#:G1162 NIL) (|pv$| NIL)
    ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT DV$3 (|devaluate| |#3|))
     (LETT DV$4 (|devaluate| |#4|))
     (LETT |dv$| (LIST '|RecursivePolynomialCategory&| DV$1 DV$2 DV$3 DV$4))
     (LETT $ (GETREFV 260))
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#2| '(|GcdDomain|))
                                         (|HasCategory| |#2|
                                                        '(|IntegralDomain|))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#4|
                                                        '(|ConvertibleTo|
                                                          (|Symbol|)))))))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (QSETREFV $ 9 |#4|)
     (SETF |pv$| (QREFELT $ 3))
     (COND
      ((|testBitVector| |pv$| 2)
       (PROGN
        (COND
         ((|HasCategory| |#2| '(|EuclideanDomain|))
          (QSETREFV $ 127
                    (CONS (|dispatchFunction| |RPOLCAT-;iexactQuo;3R;47|) $)))
         ('T
          (QSETREFV $ 127
                    (CONS (|dispatchFunction| |RPOLCAT-;iexactQuo;3R;48|) $))))
        (QSETREFV $ 131
                  (CONS (|dispatchFunction| |RPOLCAT-;exactQuotient;SRS;50|)
                        $))
        (QSETREFV $ 134
                  (CONS (|dispatchFunction| |RPOLCAT-;exactQuotient;3S;51|) $))
        (QSETREFV $ 136
                  (CONS (|dispatchFunction| |RPOLCAT-;exactQuotient!;3S;52|)
                        $))
        (COND
         ((|testBitVector| |pv$| 1)
          (COND
           ((|HasCategory| |#2| '(|Field|))
            (PROGN
             (QSETREFV $ 138
                       (CONS
                        (|dispatchFunction|
                         |RPOLCAT-;primPartElseUnitCanonical;2S;53|)
                        $))
             (QSETREFV $ 139
                       (CONS
                        (|dispatchFunction|
                         |RPOLCAT-;primPartElseUnitCanonical!;2S;54|)
                        $))))
           ('T
            (PROGN
             (QSETREFV $ 138
                       (CONS
                        (|dispatchFunction|
                         |RPOLCAT-;primPartElseUnitCanonical;2S;55|)
                        $))
             (QSETREFV $ 143
                       (CONS
                        (|dispatchFunction| |RPOLCAT-;primitivePart!;2S;56|)
                        $))
             (QSETREFV $ 139
                       (CONS
                        (|dispatchFunction|
                         |RPOLCAT-;primPartElseUnitCanonical!;2S;57|)
                        $))))))
         ('T
          (PROGN
           (QSETREFV $ 138
                     (CONS
                      (|dispatchFunction|
                       |RPOLCAT-;primPartElseUnitCanonical;2S;58|)
                      $))
           (QSETREFV $ 139
                     (CONS
                      (|dispatchFunction|
                       |RPOLCAT-;primPartElseUnitCanonical!;2S;59|)
                      $))))))))
     (COND
      ((|testBitVector| |pv$| 1)
       (PROGN
        (QSETREFV $ 147 (CONS (|dispatchFunction| |RPOLCAT-;gcd;RSR;60|) $))
        (QSETREFV $ 150
                  (CONS (|dispatchFunction| |RPOLCAT-;mainContent;2S;61|) $))
        (QSETREFV $ 154
                  (CONS (|dispatchFunction| |RPOLCAT-;mainPrimitivePart;2S;62|)
                        $))
        (QSETREFV $ 157
                  (CONS
                   (|dispatchFunction| |RPOLCAT-;mainSquareFreePart;2S;63|)
                   $)))))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 167 (CONS (|dispatchFunction| |RPOLCAT-;convert;SP;64|) $))
        (QSETREFV $ 168 (CONS (|dispatchFunction| |RPOLCAT-;coerce;SP;65|) $))
        NIL
        NIL
        NIL
        NIL
        NIL
        NIL
        (COND
         ((|HasCategory| |#4| '(|Finite|))
          (PROGN
           (QSETREFV $ 170 (SPADCALL (QREFELT $ 169)))
           NIL
           (QSETREFV $ 173
                     (PROGN
                      (LETT #3# NIL)
                      (SEQ (LETT |i| 1) (LETT #2# (QREFELT $ 170)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL
                                     (SPADCALL
                                      (PROG1 (LETT #1# |i|)
                                        (|check_subtype2| (> #1# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                      (QREFELT $ 172))
                                     (QREFELT $ 162))
                                    #3#))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT (NREVERSE #3#)))))
           (COND ((|testBitVector| |pv$| 5)))
           (COND ((|testBitVector| |pv$| 4))))))
        (COND
         ((|testBitVector| |pv$| 4)
          (PROGN
           (QSETREFV $ 208
                     (|MPolyCatFunctions2| (|Symbol|)
                                           (|IndexedExponents| (|Symbol|))
                                           (|IndexedExponents| (|Symbol|))
                                           (|Integer|) |#2|
                                           (|Polynomial| (|Integer|))
                                           (|Polynomial| |#2|)))
           (COND
            ((|testBitVector| |pv$| 5)
             (PROGN
              (QSETREFV $ 211
                        (|MPolyCatFunctions2| (|Symbol|)
                                              (|IndexedExponents| (|Symbol|))
                                              (|IndexedExponents| (|Symbol|))
                                              (|Fraction| (|Integer|)) |#2|
                                              (|Polynomial|
                                               (|Fraction| (|Integer|)))
                                              (|Polynomial| |#2|)))
              (QSETREFV $ 215
                        (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;79|) $))
              (QSETREFV $ 217
                        (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;80|) $))
              (COND
               ((|HasCategory| |#2| '(|QuotientFieldCategory| (|Integer|)))
                (PROGN
                 (QSETREFV $ 218
                           (|MPolyCatFunctions2| (|Symbol|)
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 (|Integer|)
                                                 (|Fraction| (|Integer|))
                                                 (|Polynomial| (|Integer|))
                                                 (|Polynomial|
                                                  (|Fraction| (|Integer|)))))
                 (QSETREFV $ 219
                           (|MPolyCatFunctions2| (|Symbol|)
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 |#2| (|Fraction| (|Integer|))
                                                 (|Polynomial| |#2|)
                                                 (|Polynomial|
                                                  (|Fraction| (|Integer|)))))
                 (QSETREFV $ 226
                           (CONS
                            (|dispatchFunction| |RPOLCAT-;retractIfCan;PU;85|)
                            $))
                 (COND
                  ((|HasCategory| |#4| '(|Finite|))
                   (PROGN
                    (QSETREFV $ 227
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;86|)
                               $))
                    (QSETREFV $ 228
                              (CONS
                               (|dispatchFunction| |RPOLCAT-;convert;PS;87|)
                               $))))
                  ('T
                   (QSETREFV $ 228
                             (CONS
                              (|dispatchFunction| |RPOLCAT-;convert;PS;88|)
                              $))))))
               ('T
                (PROGN
                 (COND
                  ((|HasCategory| |#4| '(|Finite|))
                   (PROGN
                    (QSETREFV $ 229
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;89|)
                               $))
                    (QSETREFV $ 227
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;90|)
                               $))))
                  ('T
                   (QSETREFV $ 227
                             (CONS
                              (|dispatchFunction|
                               |RPOLCAT-;retractIfCan;PU;91|)
                              $))))
                 (QSETREFV $ 226
                           (CONS
                            (|dispatchFunction| |RPOLCAT-;retractIfCan;PU;92|)
                            $))
                 (QSETREFV $ 231
                           (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;93|)
                                 $))
                 (QSETREFV $ 228
                           (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;94|)
                                 $))))))))
           (COND
            ((|testBitVector| |pv$| 4)
             (COND ((|testBitVector| |pv$| 5))
                   ('T
                    (PROGN
                     (QSETREFV $ 234
                               (CONS
                                (|dispatchFunction| |RPOLCAT-;retract;PS;95|)
                                $))
                     (QSETREFV $ 236
                               (CONS
                                (|dispatchFunction| |RPOLCAT-;convert;PS;96|)
                                $))
                     (COND
                      ((|HasCategory| |#2| '(|IntegerNumberSystem|))
                       (PROGN
                        (QSETREFV $ 237
                                  (|MPolyCatFunctions2| (|Symbol|)
                                                        (|IndexedExponents|
                                                         (|Symbol|))
                                                        (|IndexedExponents|
                                                         (|Symbol|))
                                                        |#2| (|Integer|)
                                                        (|Polynomial| |#2|)
                                                        (|Polynomial|
                                                         (|Integer|))))
                        (COND
                         ((|HasCategory| |#4| '(|Finite|))
                          (PROGN
                           (QSETREFV $ 228
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;convert;PS;99|)
                                      $))
                           (QSETREFV $ 226
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;retractIfCan;PU;100|)
                                      $))))
                         ('T
                          (QSETREFV $ 228
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;convert;PS;101|)
                                     $))))))
                      ('T
                       (PROGN
                        (COND
                         ((|HasCategory| |#4| '(|Finite|))
                          (PROGN
                           (QSETREFV $ 229
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;retractIfCan;PU;102|)
                                      $))
                           (QSETREFV $ 226
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;retractIfCan;PU;103|)
                                      $))))
                         ('T
                          (QSETREFV $ 226
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;retractIfCan;PU;104|)
                                     $))))
                        (QSETREFV $ 231
                                  (CONS
                                   (|dispatchFunction|
                                    |RPOLCAT-;retract;PS;105|)
                                   $))
                        (QSETREFV $ 228
                                  (CONS
                                   (|dispatchFunction|
                                    |RPOLCAT-;convert;PS;106|)
                                   $))))))))))))
         ((|testBitVector| |pv$| 5)
          (PROGN
           (SETELT $ 208
                   (|MPolyCatFunctions2| (|Symbol|)
                                         (|IndexedExponents| (|Symbol|))
                                         (|IndexedExponents| (|Symbol|))
                                         (|Integer|) |#2|
                                         (|Polynomial| (|Integer|))
                                         (|Polynomial| |#2|)))
           (COND
            ((|testBitVector| |pv$| 5)
             (PROGN
              (SETELT $ 211
                      (|MPolyCatFunctions2| (|Symbol|)
                                            (|IndexedExponents| (|Symbol|))
                                            (|IndexedExponents| (|Symbol|))
                                            (|Fraction| (|Integer|)) |#2|
                                            (|Polynomial|
                                             (|Fraction| (|Integer|)))
                                            (|Polynomial| |#2|)))
              (QSETREFV $ 215
                        (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;111|)
                              $))
              (QSETREFV $ 217
                        (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;112|)
                              $))
              (COND
               ((|HasCategory| |#2| '(|QuotientFieldCategory| (|Integer|)))
                (PROGN
                 (SETELT $ 218
                         (|MPolyCatFunctions2| (|Symbol|)
                                               (|IndexedExponents| (|Symbol|))
                                               (|IndexedExponents| (|Symbol|))
                                               (|Integer|)
                                               (|Fraction| (|Integer|))
                                               (|Polynomial| (|Integer|))
                                               (|Polynomial|
                                                (|Fraction| (|Integer|)))))
                 (SETELT $ 219
                         (|MPolyCatFunctions2| (|Symbol|)
                                               (|IndexedExponents| (|Symbol|))
                                               (|IndexedExponents| (|Symbol|))
                                               |#2| (|Fraction| (|Integer|))
                                               (|Polynomial| |#2|)
                                               (|Polynomial|
                                                (|Fraction| (|Integer|)))))
                 (QSETREFV $ 226
                           (CONS
                            (|dispatchFunction| |RPOLCAT-;retractIfCan;PU;117|)
                            $))
                 (COND
                  ((|HasCategory| |#4| '(|Finite|))
                   (PROGN
                    (QSETREFV $ 227
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;118|)
                               $))
                    (QSETREFV $ 228
                              (CONS
                               (|dispatchFunction| |RPOLCAT-;convert;PS;119|)
                               $))))
                  ('T
                   (QSETREFV $ 228
                             (CONS
                              (|dispatchFunction| |RPOLCAT-;convert;PS;120|)
                              $))))))
               ('T
                (PROGN
                 (COND
                  ((|HasCategory| |#4| '(|Finite|))
                   (PROGN
                    (QSETREFV $ 229
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;121|)
                               $))
                    (QSETREFV $ 227
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;122|)
                               $))))
                  ('T
                   (QSETREFV $ 227
                             (CONS
                              (|dispatchFunction|
                               |RPOLCAT-;retractIfCan;PU;123|)
                              $))))
                 (QSETREFV $ 226
                           (CONS
                            (|dispatchFunction| |RPOLCAT-;retractIfCan;PU;124|)
                            $))
                 (QSETREFV $ 231
                           (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;125|)
                                 $))
                 (QSETREFV $ 228
                           (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;126|)
                                 $))))))))
           (COND
            ((|testBitVector| |pv$| 4)
             (COND ((|testBitVector| |pv$| 5))
                   ('T
                    (PROGN
                     (QSETREFV $ 234
                               (CONS
                                (|dispatchFunction| |RPOLCAT-;retract;PS;127|)
                                $))
                     (QSETREFV $ 236
                               (CONS
                                (|dispatchFunction| |RPOLCAT-;convert;PS;128|)
                                $))
                     (COND
                      ((|HasCategory| |#2| '(|IntegerNumberSystem|))
                       (PROGN
                        (SETELT $ 237
                                (|MPolyCatFunctions2| (|Symbol|)
                                                      (|IndexedExponents|
                                                       (|Symbol|))
                                                      (|IndexedExponents|
                                                       (|Symbol|))
                                                      |#2| (|Integer|)
                                                      (|Polynomial| |#2|)
                                                      (|Polynomial|
                                                       (|Integer|))))
                        (COND
                         ((|HasCategory| |#4| '(|Finite|))
                          (PROGN
                           (QSETREFV $ 228
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;convert;PS;131|)
                                      $))
                           (QSETREFV $ 226
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;retractIfCan;PU;132|)
                                      $))))
                         ('T
                          (QSETREFV $ 228
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;convert;PS;133|)
                                     $))))))
                      ('T
                       (PROGN
                        (COND
                         ((|HasCategory| |#4| '(|Finite|))
                          (PROGN
                           (QSETREFV $ 229
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;retractIfCan;PU;134|)
                                      $))
                           (QSETREFV $ 226
                                     (CONS
                                      (|dispatchFunction|
                                       |RPOLCAT-;retractIfCan;PU;135|)
                                      $))))
                         ('T
                          (QSETREFV $ 226
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;retractIfCan;PU;136|)
                                     $))))
                        (QSETREFV $ 231
                                  (CONS
                                   (|dispatchFunction|
                                    |RPOLCAT-;retract;PS;137|)
                                   $))
                        (QSETREFV $ 228
                                  (CONS
                                   (|dispatchFunction|
                                    |RPOLCAT-;convert;PS;138|)
                                   $)))))))))))))
        (COND ((OR (|testBitVector| |pv$| 4) (|testBitVector| |pv$| 5)))
              ('T
               (PROGN
                (COND
                 ((|HasCategory| |#4| '(|Finite|))
                  (QSETREFV $ 229
                            (CONS
                             (|dispatchFunction|
                              |RPOLCAT-;retractIfCan;PU;139|)
                             $))))
                (QSETREFV $ 231
                          (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;140|)
                                $))
                (QSETREFV $ 228
                          (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;141|)
                                $)))))
        (COND
         ((|testBitVector| |pv$| 3)
          (QSETREFV $ 253
                    (CONS (|dispatchFunction| |RPOLCAT-;convert;SS;142|)
                          $)))))))
     $)))) 

(MAKEPROP '|RecursivePolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (0 . |ground?|)
              (5 . |ground|) (|OutputForm|) (10 . |coerce|) (15 . |init|)
              (20 . |One|) (24 . |One|) (28 . =) (34 . |tail|) (39 . |zero?|)
              (|NonNegativeInteger|) (44 . |mdeg|) (49 . |mvar|)
              (54 . |coerce|) (59 . |coerce|) (64 . ^) (70 . |coerce|) (75 . +)
              (81 . *) |RPOLCAT-;coerce;SOf;1| (|Union| 9 '"failed")
              (87 . |mainVariable|) |RPOLCAT-;mvar;SV;2| (92 . |degree|)
              |RPOLCAT-;mdeg;SNni;3| (98 . |coefficient|) |RPOLCAT-;init;2S;4|
              |RPOLCAT-;leadingCoefficient;SVS;5| (105 . |monomial|)
              |RPOLCAT-;head;2S;6| (112 . |Zero|) (116 . -)
              |RPOLCAT-;reductum;SVS;7| (122 . |head|) |RPOLCAT-;tail;2S;8|
              (127 . >) (133 . |deepestTail|) |RPOLCAT-;deepestTail;2S;9|
              (|List| $) (138 . |iteratedInitials|)
              |RPOLCAT-;iteratedInitials;SL;10| |RPOLCAT-;deepestInitial;2S;12|
              (|Union| $ '"failed") (143 . |recip|) |RPOLCAT-;monic?;SB;13|
              |RPOLCAT-;quasiMonic?;SB;14| |RPOLCAT-;mainMonomial;2S;15|
              (148 . |minimumDegree|) |RPOLCAT-;leastMonomial;2S;16|
              (|SparseUnivariatePolynomial| $) (154 . |univariate|) (|List| 6)
              (|SparseUnivariatePolynomial| 6) (160 . |coefficients|)
              |RPOLCAT-;mainCoefficients;SL;17| (165 . |monomials|)
              (170 . |degree|) |RPOLCAT-;mainMonomials;SL;18| (175 . <)
              (|Integer|) (181 . >) (|Union| 10 '#1="failed")
              (187 . |RittWuCompare|) |RPOLCAT-;RittWuCompare;2SU;19|
              |RPOLCAT-;infRittWu?;2SB;20| (193 . |infRittWu?|)
              |RPOLCAT-;supRittWu?;2SB;21|
              (|Record| (|:| |coef| $) (|:| |gap| 21) (|:| |remainder| $))
              (199 . |lazyPremWithDefault|) (205 . ^) (211 . *)
              |RPOLCAT-;prem;3S;22|
              (|Record| (|:| |coef| $) (|:| |gap| 21) (|:| |quotient| $)
                        (|:| |remainder| $))
              (217 . |lazyPseudoDivide|) |RPOLCAT-;pquo;3S;23|
              (223 . |lazyPremWithDefault|) |RPOLCAT-;prem;2SVS;24|
              (230 . |lazyPseudoDivide|) |RPOLCAT-;pquo;2SVS;25|
              (237 . |monic?|) (242 . |monicModulo|) |RPOLCAT-;lazyPrem;3S;26|
              |RPOLCAT-;lazyPquo;3S;27| (248 . =) (254 . |lazyPrem|)
              (260 . |leadingCoefficient|) |RPOLCAT-;lazyPrem;2SVS;28|
              |RPOLCAT-;lazyPquo;2SVS;29| (266 . |reduced?|)
              (|Record| (|:| |polnum| $) (|:| |polden| $) (|:| |power| 21))
              (272 . |lazyResidueClass|) (278 . +) |RPOLCAT-;headReduce;3S;30|
              (284 . >=) (290 . |mainMonomial|)
              |RPOLCAT-;initiallyReduce;3S;31|
              |RPOLCAT-;lazyPremWithDefault;2SR;32|
              |RPOLCAT-;lazyPremWithDefault;2SVR;33|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |RPOLCAT-;pseudoDivide;2SR;34| |RPOLCAT-;lazyPseudoDivide;2SR;35|
              |RPOLCAT-;lazyPseudoDivide;2SVR;36| |RPOLCAT-;monicModulo;3S;37|
              |RPOLCAT-;lazyResidueClass;2SR;38| |RPOLCAT-;reduced?;2SB;39|
              |RPOLCAT-;reduced?;SLB;40| |RPOLCAT-;headReduced?;2SB;41|
              (295 . |reduced?|) |RPOLCAT-;headReduced?;SLB;42|
              (301 . |initiallyReduced?|) |RPOLCAT-;initiallyReduced?;2SB;43|
              |RPOLCAT-;initiallyReduced?;SLB;44| (307 . |normalized?|)
              |RPOLCAT-;normalized?;2SB;45| |RPOLCAT-;normalized?;SLB;46|
              (313 . |quo|) (319 . |iexactQuo|) (325 . |exquo|)
              (331 . |iexactQuo|) (337 . |exquo|) (343 . |exactQuotient|)
              (349 . |exactQuotient|) (355 . |exquo|) (361 . |exactQuotient|)
              (367 . |exactQuotient!|) (373 . |exactQuotient!|)
              (379 . |unitCanonical|) (384 . |primPartElseUnitCanonical|)
              (389 . |primPartElseUnitCanonical!|) (394 . |primitivePart|)
              (399 . |content|) (404 . =) (410 . |primitivePart!|)
              (415 . |primitivePart!|) (420 . |gcd|) (426 . |gcd|)
              (432 . |gcd|) (438 . |mainCoefficients|) (443 . |gcd|)
              (449 . |mainContent|) (454 . |mainContent|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (459 . |unitNormal|) (464 . |mainPrimitivePart|)
              (469 . |squareFreePart|) (474 . |multivariate|)
              (480 . |mainSquareFreePart|) (|Polynomial| 7) (485 . |coerce|)
              (490 . |convert|) (|Symbol|) (495 . |convert|) (500 . |coerce|)
              (505 . ^) (511 . *) (517 . +) (523 . |convert|) (528 . |coerce|)
              (533 . |size|) '|sizeV| (|PositiveInteger|) (537 . |index|) '|lv|
              (542 . |ground?|) (547 . |ground|) (552 . |coerce|)
              (|Union| 161 '"failed") (557 . |mainVariable|) (|List| 161)
              (562 . |position|) (568 . |degree|) (574 . |coefficient|)
              (581 . |monomial|) (588 . -) (|Polynomial| 187) (594 . |ground?|)
              (|Fraction| 70) (599 . |ground|) (604 . |coerce|)
              (609 . |mainVariable|) (614 . |degree|) (620 . |coefficient|)
              (627 . |monomial|) (634 . -) (|Polynomial| 70) (640 . |ground?|)
              (645 . |ground|) (650 . |coerce|) (655 . |mainVariable|)
              (660 . |degree|) (666 . |coefficient|) (673 . |monomial|)
              (680 . -) (686 . |variables|) (691 . |member?|)
              (697 . |variables|) (702 . |variables|) '|mpc2Z| (|Mapping| 7 70)
              (707 . |map|) '|mpc2Q| (|Mapping| 7 187) (713 . |map|)
              (719 . |retractIfCan|) (724 . |retract|) (729 . |retract|)
              (734 . |convert|) '|mpc2ZQ| '|mpc2RQ| (739 . |coerce|)
              (744 . |retract|) (|Mapping| 187 70) (749 . |map|)
              (|Mapping| 187 7) (755 . |map|) (761 . |retractIfCan|)
              (766 . |retractIfCan|) (771 . |convert|) (776 . |retractIfCan|)
              (781 . |retractIfCan|) (786 . |retract|) (791 . |retract|)
              (796 . |retractIfCan|) (801 . |retract|) (806 . |retract|)
              (811 . |convert|) '|mpc2RZ| (816 . |retract|) (|Mapping| 70 7)
              (821 . |map|) (827 . -) (|String|) (832 . |convert|)
              (837 . |monomial?|) (842 . |concat|) (847 . |string|)
              (852 . |Zero|) (|Character|) (856 . |elt|) (862 . |coerce|)
              (|List| 242) (867 . |member?|) (873 . |convert|) (|Pattern| 70)
              (|InputForm|) (|Pattern| (|Float|)) (|Union| 7 '#2="failed")
              (|Union| 187 '#2#) (|Union| 70 '#2#))
           '#(|tail| 878 |supRittWu?| 883 |retractIfCan| 889 |retract| 904
              |reductum| 919 |reduced?| 925 |quasiMonic?| 937 |pseudoDivide|
              942 |primitivePart!| 948 |primPartElseUnitCanonical!| 953
              |primPartElseUnitCanonical| 958 |prem| 963 |pquo| 976
              |normalized?| 989 |mvar| 1001 |monicModulo| 1006 |monic?| 1012
              |mdeg| 1017 |mainSquareFreePart| 1022 |mainPrimitivePart| 1027
              |mainMonomials| 1032 |mainMonomial| 1037 |mainContent| 1042
              |mainCoefficients| 1047 |leastMonomial| 1052 |leadingCoefficient|
              1057 |lazyResidueClass| 1063 |lazyPseudoDivide| 1069
              |lazyPremWithDefault| 1082 |lazyPrem| 1095 |lazyPquo| 1108
              |iteratedInitials| 1121 |initiallyReduced?| 1126
              |initiallyReduce| 1138 |init| 1144 |infRittWu?| 1149 |iexactQuo|
              1155 |headReduced?| 1161 |headReduce| 1173 |head| 1179 |gcd| 1184
              |exactQuotient!| 1190 |exactQuotient| 1196 |deepestTail| 1208
              |deepestInitial| 1213 |convert| 1218 |coerce| 1243
              |RittWuCompare| 1253)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|coerce| ((|Polynomial| |#2|) |#1|)) T)
                                   '((|convert| ((|Polynomial| |#2|) |#1|)) T)
                                   '((|convert| ((|String|) |#1|)) T)
                                   '((|mainSquareFreePart| (|#1| |#1|)) T)
                                   '((|mainPrimitivePart| (|#1| |#1|)) T)
                                   '((|mainContent| (|#1| |#1|)) T)
                                   '((|primitivePart!| (|#1| |#1|)) T)
                                   '((|gcd| (|#2| |#2| |#1|)) T)
                                   '((|iexactQuo| (|#2| |#2| |#2|)) T)
                                   '((|exactQuotient!| (|#1| |#1| |#1|)) T)
                                   '((|exactQuotient| (|#1| |#1| |#1|)) T)
                                   '((|exactQuotient!| (|#1| |#1| |#2|)) T)
                                   '((|exactQuotient| (|#1| |#1| |#2|)) T)
                                   '((|primPartElseUnitCanonical!| (|#1| |#1|))
                                     T)
                                   '((|primPartElseUnitCanonical| (|#1| |#1|))
                                     T)
                                   '((|convert| (|#1| (|Polynomial| |#2|))) T)
                                   '((|retract| (|#1| (|Polynomial| |#2|))) T)
                                   '((|retractIfCan|
                                      ((|Union| |#1| "failed")
                                       (|Polynomial| |#2|)))
                                     T)
                                   '((|convert|
                                      (|#1| (|Polynomial| (|Integer|))))
                                     T)
                                   '((|retract|
                                      (|#1| (|Polynomial| (|Integer|))))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| |#1| "failed")
                                       (|Polynomial| (|Integer|))))
                                     T)
                                   '((|convert|
                                      (|#1|
                                       (|Polynomial|
                                        (|Fraction| (|Integer|)))))
                                     T)
                                   '((|retract|
                                      (|#1|
                                       (|Polynomial|
                                        (|Fraction| (|Integer|)))))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| |#1| "failed")
                                       (|Polynomial|
                                        (|Fraction| (|Integer|)))))
                                     T)
                                   '((|initiallyReduce| (|#1| |#1| |#1|)) T)
                                   '((|headReduce| (|#1| |#1| |#1|)) T)
                                   '((|lazyResidueClass|
                                      ((|Record| (|:| |polnum| |#1|)
                                                 (|:| |polden| |#1|)
                                                 (|:| |power|
                                                      (|NonNegativeInteger|)))
                                       |#1| |#1|))
                                     T)
                                   '((|monicModulo| (|#1| |#1| |#1|)) T)
                                   '((|pseudoDivide|
                                      ((|Record| (|:| |quotient| |#1|)
                                                 (|:| |remainder| |#1|))
                                       |#1| |#1|))
                                     T)
                                   '((|lazyPseudoDivide|
                                      ((|Record| (|:| |coef| |#1|)
                                                 (|:| |gap|
                                                      (|NonNegativeInteger|))
                                                 (|:| |quotient| |#1|)
                                                 (|:| |remainder| |#1|))
                                       |#1| |#1| |#4|))
                                     T)
                                   '((|lazyPseudoDivide|
                                      ((|Record| (|:| |coef| |#1|)
                                                 (|:| |gap|
                                                      (|NonNegativeInteger|))
                                                 (|:| |quotient| |#1|)
                                                 (|:| |remainder| |#1|))
                                       |#1| |#1|))
                                     T)
                                   '((|lazyPremWithDefault|
                                      ((|Record| (|:| |coef| |#1|)
                                                 (|:| |gap|
                                                      (|NonNegativeInteger|))
                                                 (|:| |remainder| |#1|))
                                       |#1| |#1| |#4|))
                                     T)
                                   '((|lazyPremWithDefault|
                                      ((|Record| (|:| |coef| |#1|)
                                                 (|:| |gap|
                                                      (|NonNegativeInteger|))
                                                 (|:| |remainder| |#1|))
                                       |#1| |#1|))
                                     T)
                                   '((|lazyPquo| (|#1| |#1| |#1| |#4|)) T)
                                   '((|lazyPrem| (|#1| |#1| |#1| |#4|)) T)
                                   '((|lazyPquo| (|#1| |#1| |#1|)) T)
                                   '((|lazyPrem| (|#1| |#1| |#1|)) T)
                                   '((|pquo| (|#1| |#1| |#1| |#4|)) T)
                                   '((|prem| (|#1| |#1| |#1| |#4|)) T)
                                   '((|pquo| (|#1| |#1| |#1|)) T)
                                   '((|prem| (|#1| |#1| |#1|)) T)
                                   '((|normalized?|
                                      ((|Boolean|) |#1| (|List| |#1|)))
                                     T)
                                   '((|normalized?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|initiallyReduced?|
                                      ((|Boolean|) |#1| (|List| |#1|)))
                                     T)
                                   '((|initiallyReduced?|
                                      ((|Boolean|) |#1| |#1|))
                                     T)
                                   '((|headReduced?|
                                      ((|Boolean|) |#1| (|List| |#1|)))
                                     T)
                                   '((|headReduced?| ((|Boolean|) |#1| |#1|))
                                     T)
                                   '((|reduced?|
                                      ((|Boolean|) |#1| (|List| |#1|)))
                                     T)
                                   '((|reduced?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|supRittWu?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|infRittWu?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|RittWuCompare|
                                      ((|Union| (|Boolean|) #1#) |#1| |#1|))
                                     T)
                                   '((|mainMonomials| ((|List| |#1|) |#1|)) T)
                                   '((|mainCoefficients| ((|List| |#1|) |#1|))
                                     T)
                                   '((|leastMonomial| (|#1| |#1|)) T)
                                   '((|mainMonomial| (|#1| |#1|)) T)
                                   '((|quasiMonic?| ((|Boolean|) |#1|)) T)
                                   '((|monic?| ((|Boolean|) |#1|)) T)
                                   '((|reductum| (|#1| |#1| |#4|)) T)
                                   '((|leadingCoefficient| (|#1| |#1| |#4|)) T)
                                   '((|deepestInitial| (|#1| |#1|)) T)
                                   '((|iteratedInitials| ((|List| |#1|) |#1|))
                                     T)
                                   '((|deepestTail| (|#1| |#1|)) T)
                                   '((|tail| (|#1| |#1|)) T)
                                   '((|head| (|#1| |#1|)) T)
                                   '((|init| (|#1| |#1|)) T)
                                   '((|mdeg| ((|NonNegativeInteger|) |#1|)) T)
                                   '((|mvar| (|#4| |#1|)) T)
                                   '((|retract| (|#4| |#1|)) T)
                                   '((|retractIfCan| ((|Union| |#4| #2#) |#1|))
                                     T)
                                   '((|coerce| (|#1| |#4|)) T)
                                   '((|coerce| (|#1| (|Integer|))) T)
                                   '((|convert| ((|InputForm|) |#1|)) T)
                                   '((|convert| ((|Pattern| (|Integer|)) |#1|))
                                     T)
                                   '((|convert| ((|Pattern| (|Float|)) |#1|))
                                     T)
                                   '((|coerce| (|#1| |#1|)) T)
                                   '((|gcd| (|#1| |#1| |#1|)) T)
                                   '((|gcd| (|#1| (|List| |#1|))) T)
                                   '((|retract| (|#2| |#1|)) T)
                                   '((|retractIfCan| ((|Union| |#2| #2#) |#1|))
                                     T)
                                   '((|coerce| (|#1| |#2|)) T)
                                   '((|coerce| (|#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #2#)
                                       |#1|))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Integer|) #2#) |#1|))
                                     T)
                                   '((|retract| ((|Integer|) |#1|)) T)
                                   '((|reductum| (|#1| |#1|)) T)
                                   '((|leadingCoefficient| (|#2| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 253
                                            '(1 6 10 0 11 1 6 7 0 12 1 7 13 0
                                              14 1 6 0 0 15 0 6 0 16 0 7 0 17 2
                                              6 10 0 0 18 1 6 0 0 19 1 6 10 0
                                              20 1 6 21 0 22 1 6 9 0 23 1 9 13
                                              0 24 1 21 13 0 25 2 13 0 0 0 26 1
                                              6 13 0 27 2 13 0 0 0 28 2 13 0 0
                                              0 29 1 6 31 0 32 2 6 21 0 9 34 3
                                              6 0 0 9 21 36 3 6 0 0 9 21 39 0 6
                                              0 41 2 6 0 0 0 42 1 6 0 0 44 2 9
                                              10 0 0 46 1 6 0 0 47 1 6 49 0 50
                                              1 6 53 0 54 2 6 21 0 9 58 2 6 60
                                              0 9 61 1 63 62 0 64 1 63 49 0 66
                                              1 63 21 0 67 2 9 10 0 0 69 2 70
                                              10 0 0 71 2 6 72 0 0 73 2 6 10 0
                                              0 76 2 6 78 0 0 79 2 6 0 0 21 80
                                              2 6 0 0 0 81 2 6 83 0 0 84 3 6 78
                                              0 0 9 86 3 6 83 0 0 9 88 1 6 10 0
                                              90 2 6 0 0 0 91 2 9 10 0 0 94 2 6
                                              0 0 0 95 2 6 0 0 9 96 2 6 10 0 0
                                              99 2 6 100 0 0 101 2 6 0 0 0 102
                                              2 9 10 0 0 104 1 6 0 0 105 2 6 10
                                              0 49 118 2 6 10 0 0 120 2 6 10 0
                                              0 123 2 7 0 0 0 126 2 0 7 7 7 127
                                              2 7 53 0 0 128 2 6 7 7 7 129 2 6
                                              53 0 7 130 2 0 0 0 7 131 2 6 0 0
                                              7 132 2 6 53 0 0 133 2 0 0 0 0
                                              134 2 6 0 0 7 135 2 0 0 0 0 136 1
                                              6 0 0 137 1 0 0 0 138 1 0 0 0 139
                                              1 6 0 0 140 1 6 7 0 141 2 7 10 0
                                              0 142 1 0 0 0 143 1 6 0 0 144 2 7
                                              0 0 0 145 2 6 7 7 0 146 2 0 7 7 0
                                              147 1 6 49 0 148 2 6 0 0 0 149 1
                                              0 0 0 150 1 6 0 0 151 1 6 152 0
                                              153 1 0 0 0 154 1 63 0 0 155 2 6
                                              0 60 9 156 1 0 0 0 157 1 158 0 7
                                              159 1 6 158 0 160 1 9 161 0 162 1
                                              158 0 161 163 2 158 0 0 21 164 2
                                              158 0 0 0 165 2 158 0 0 0 166 1 0
                                              158 0 167 1 0 158 0 168 0 9 21
                                              169 1 9 0 171 172 1 158 10 0 174
                                              1 158 7 0 175 1 6 0 7 176 1 158
                                              177 0 178 2 179 70 161 0 180 2
                                              158 21 0 161 181 3 158 0 0 161 21
                                              182 3 158 0 0 161 21 183 2 158 0
                                              0 0 184 1 185 10 0 186 1 185 187
                                              0 188 1 7 0 187 189 1 185 177 0
                                              190 2 185 21 0 161 191 3 185 0 0
                                              161 21 192 3 185 0 0 161 21 193 2
                                              185 0 0 0 194 1 195 10 0 196 1
                                              195 70 0 197 1 7 0 70 198 1 195
                                              177 0 199 2 195 21 0 161 200 3
                                              195 0 0 161 21 201 3 195 0 0 161
                                              21 202 2 195 0 0 0 203 1 158 179
                                              0 204 2 179 10 161 0 205 1 185
                                              179 0 206 1 195 179 0 207 2 208
                                              158 209 195 210 2 211 158 212 185
                                              213 1 6 53 185 214 1 0 0 185 215
                                              1 6 0 185 216 1 0 0 185 217 1 187
                                              0 70 220 1 7 187 0 221 2 218 185
                                              222 195 223 2 219 185 224 158 225
                                              1 0 53 195 226 1 0 53 185 227 1 0
                                              0 158 228 1 0 53 158 229 1 6 53
                                              158 230 1 0 0 158 231 1 6 0 158
                                              232 1 6 53 195 233 1 0 0 195 234
                                              1 6 0 195 235 1 0 0 195 236 1 7
                                              70 0 238 2 237 195 239 158 240 1
                                              6 0 0 241 1 6 242 0 243 1 6 10 0
                                              244 1 242 0 49 245 1 161 242 0
                                              246 0 7 0 247 2 242 248 0 70 249
                                              1 242 0 248 250 2 251 10 242 0
                                              252 1 0 242 0 253 1 0 0 0 45 2 0
                                              10 0 0 77 1 0 53 158 229 1 0 53
                                              195 226 1 0 53 185 227 1 0 0 158
                                              231 1 0 0 195 234 1 0 0 185 215 2
                                              0 0 0 9 43 2 0 10 0 0 115 2 0 10
                                              0 49 116 1 0 10 0 56 2 0 109 0 0
                                              110 1 0 0 0 143 1 0 0 0 139 1 0 0
                                              0 138 3 0 0 0 0 9 87 2 0 0 0 0 82
                                              3 0 0 0 0 9 89 2 0 0 0 0 85 2 0
                                              10 0 49 125 2 0 10 0 0 124 1 0 9
                                              0 33 2 0 0 0 0 113 1 0 10 0 55 1
                                              0 21 0 35 1 0 0 0 157 1 0 0 0 154
                                              1 0 49 0 68 1 0 0 0 57 1 0 0 0
                                              150 1 0 49 0 65 1 0 0 0 59 2 0 0
                                              0 9 38 2 0 100 0 0 114 3 0 83 0 0
                                              9 112 2 0 83 0 0 111 2 0 78 0 0
                                              107 3 0 78 0 0 9 108 3 0 0 0 0 9
                                              97 2 0 0 0 0 92 3 0 0 0 0 9 98 2
                                              0 0 0 0 93 1 0 49 0 51 2 0 10 0
                                              49 122 2 0 10 0 0 121 2 0 0 0 0
                                              106 1 0 0 0 37 2 0 10 0 0 75 2 0
                                              7 7 7 127 2 0 10 0 49 119 2 0 10
                                              0 0 117 2 0 0 0 0 103 1 0 0 0 40
                                              2 0 7 7 0 147 2 0 0 0 0 136 2 0 0
                                              0 0 134 2 0 0 0 7 131 1 0 0 0 48
                                              1 0 0 0 52 1 0 158 0 167 1 0 242
                                              0 253 1 0 0 158 228 1 0 0 195 236
                                              1 0 0 185 217 1 0 158 0 168 1 0
                                              13 0 30 2 0 72 0 0 74)))))
           '|lookupComplete|)) 
