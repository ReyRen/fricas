
(SDEFUN |HEUGCD;myNextPrime|
        ((|val| |Integer|) (|bound| |NonNegativeInteger|) ($ |Integer|))
        (SPADCALL |val| (QREFELT $ 10))) 

(SDEFUN |HEUGCD;constNotZero| ((|f| BP) ($ |Boolean|))
        (COND
         ((EQL (SPADCALL |f| (QREFELT $ 12)) 0)
          (NULL (SPADCALL |f| (QREFELT $ 14))))
         ('T NIL))) 

(SDEFUN |HEUGCD;negShiftz|
        ((|n| |Integer|) (|Modulus| |PositiveInteger|) ($ |Integer|))
        (COND ((< |n| 0) (LETT |n| (+ |n| |Modulus|)))
              ((SPADCALL |n| (QUOTIENT2 |Modulus| 2) (QREFELT $ 16))
               (- |n| |Modulus|))
              ('T |n|))) 

(SDEFUN |HEUGCD;height| ((|f| BP) ($ |PositiveInteger|))
        (SPROG ((|k| (|PositiveInteger|)) (#1=#:G405 NIL))
               (SEQ (LETT |k| 1)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |f| (|spadConstant| $ 15)
                                      (QREFELT $ 17)))
                           (GO G191)))
                         (SEQ
                          (LETT |k|
                                (MAX |k|
                                     (PROG1
                                         (LETT #1#
                                               (ABS
                                                (SPADCALL |f| (QREFELT $ 18))))
                                       (|check_subtype2| (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #1#))))
                          (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 19)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |k|)))) 

(SDEFUN |HEUGCD;genpoly|
        ((|dval| . #1=(|Integer|)) (|value| |PositiveInteger|) ($ BP))
        (SPROG ((|val| #1#) (|d| (BP)) (|val1| (|Integer|)) (|i| NIL))
               (SEQ (LETT |d| (|spadConstant| $ 15)) (LETT |val| |dval|)
                    (SEQ (LETT |i| 0) G190
                         (COND
                          ((NULL (SPADCALL |val| 0 (QREFELT $ 20))) (GO G191)))
                         (SEQ
                          (LETT |val1|
                                (|HEUGCD;negShiftz| (REM |val| |value|) |value|
                                 $))
                          (LETT |d|
                                (SPADCALL |d|
                                          (SPADCALL |val1| |i| (QREFELT $ 21))
                                          (QREFELT $ 22)))
                          (EXIT
                           (LETT |val| (QUOTIENT2 (- |val| |val1|) |value|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |d|)))) 

(SDEFUN |HEUGCD;smallest_to_front|
        ((|l| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG
         ((|ress| (|List| (|Integer|))) (|smallest| (|Integer|))
          (#1=#:G418 NIL) (|p| NIL))
         (SEQ (LETT |ress| NIL) (LETT |smallest| (|SPADfirst| |l|))
              (SEQ (LETT |p| NIL) (LETT #1# (CDR |l|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((< |p| |smallest|)
                       (SEQ (LETT |ress| (CONS |smallest| |ress|))
                            (EXIT (LETT |smallest| |p|))))
                      ('T (LETT |ress| (CONS |p| |ress|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |smallest| |ress|))))) 

(SDEFUN |HEUGCD;lintgcd;LI;7| ((|lval| |List| (|Integer|)) ($ |Integer|))
        (SPROG ((|val| (|Integer|)) (#1=#:G424 NIL) (|val1| NIL))
               (SEQ
                (COND ((NULL |lval|) 0) ((SPADCALL 1 |lval| (QREFELT $ 25)) 1)
                      ('T
                       (SEQ (LETT |lval| (|HEUGCD;smallest_to_front| |lval| $))
                            (LETT |val| (|SPADfirst| |lval|))
                            (SEQ (LETT |val1| NIL) (LETT #1# (CDR |lval|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |val1| (CAR #1#)) NIL)
                                       (NULL
                                        (SPADCALL |val| 1 (QREFELT $ 20))))
                                   (GO G191)))
                                 (SEQ (EXIT (LETT |val| (GCD |val| |val1|))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |val|))))))) 

(SDEFUN |HEUGCD;content;LL;8| ((|listf| |List| BP) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G428 NIL) (|f| NIL) (#2=#:G427 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# |listf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |f| (QREFELT $ 27))
                                         (QREFELT $ 26))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |HEUGCD;contprim|
        ((|listf| |List| BP)
         ($ |List| (|Record| (|:| |cont| (|Integer|)) (|:| |prim| BP))))
        (SPROG
         ((#1=#:G431 NIL) (|c| (|Integer|)) (#2=#:G436 NIL) (|f| NIL)
          (#3=#:G435 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL)
           (SEQ (LETT |f| NIL) (LETT #2# |listf|) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (CONS
                          (LETT |c|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 27))
                                          (QREFELT $ 26)))
                          (PROG2 (LETT #1# (SPADCALL |f| |c| (QREFELT $ 31)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                            (|Union| (QREFELT $ 6) "failed")
                                            #1#)))
                         #3#))))
                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |HEUGCD;constcase|
        ((|listdeg| |List| (|NonNegativeInteger|)) (|listf| |List| BP)
         ($ |List| BP))
        (SPROG
         ((#1=#:G452 NIL) (|lcf| NIL) (#2=#:G451 NIL) (|d| (|Integer|))
          (|lclistf| (|List| (|Integer|))) (#3=#:G450 NIL) (|f| NIL)
          (#4=#:G449 NIL) (#5=#:G440 NIL) (#6=#:G439 #7=(|Boolean|))
          (#8=#:G441 #7#) (#9=#:G448 NIL) (|n| NIL) (|lind| (|List| BP)))
         (SEQ
          (LETT |lind|
                (SPADCALL (CONS (|function| |HEUGCD;constNotZero|) $) |listf|
                          (QREFELT $ 33)))
          (EXIT
           (COND
            ((NULL |lind|)
             (COND
              ((SPADCALL 1 |listdeg| (QREFELT $ 35))
               (|HEUGCD;lincase| |listdeg| |listf| $))
              (#10='T (|HEUGCD;localgcd| |listf| $))))
            ((PROGN
              (LETT #5# NIL)
              (SEQ (LETT |n| NIL) (LETT #9# |listdeg|) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |n| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #8# (SPADCALL |n| 0 (QREFELT $ 36)))
                      (COND (#5# (LETT #6# (COND (#6# 'T) ('T #8#))))
                            ('T (PROGN (LETT #6# #8#) (LETT #5# 'T)))))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (COND (#5# #6#) (#10# NIL)))
             (CONS (|spadConstant| $ 23) |listf|))
            (#10#
             (SEQ
              (LETT |lclistf|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |f| NIL) (LETT #3# |listf|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |f| (QREFELT $ 18)) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |d| (SPADCALL |lclistf| (QREFELT $ 26)))
              (EXIT
               (COND ((EQL |d| 1) (CONS (|spadConstant| $ 23) |listf|))
                     (#10#
                      (CONS (SPADCALL |d| (QREFELT $ 37))
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |lcf| NIL) (LETT #1# |lclistf|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |lcf| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL (QUOTIENT2 |lcf| |d|)
                                                     (QREFELT $ 37))
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))))))))))))) 

(SDEFUN |HEUGCD;testDivide|
        ((|listf| |List| BP) (|g| BP) ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((|result| (|List| BP)) (#1=#:G464 NIL) (|f1| (|Union| BP "failed"))
          (#2=#:G465 NIL) (|f| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |result| NIL)
                (SEQ (LETT |f| NIL) (LETT #2# |listf|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 38)))
                           (EXIT
                            (COND
                             ((QEQCAR |f1| 1)
                              (PROGN
                               (LETT #1# (CONS 1 "failed"))
                               (GO #3=#:G463))))))
                      (EXIT (LETT |result| (CONS (QCDR |f1|) |result|))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |result|)))))
          #3# (EXIT #1#)))) 

(SDEFUN |HEUGCD;lincase|
        ((|listdeg| |List| (|NonNegativeInteger|)) (|listf| |List| BP)
         ($ |List| BP))
        (SPROG
         ((|result| (|List| BP)) (#1=#:G478 NIL) (|f1| (|Union| BP "failed"))
          (#2=#:G479 NIL) (|f| NIL) (|g| (BP)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL 1 |listdeg| (QREFELT $ 41)))
                (LETT |g| (SPADCALL |listf| |n| (QREFELT $ 42)))
                (LETT |result| (LIST |g|))
                (SEQ (LETT |f| NIL) (LETT #2# |listf|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 38)))
                           (EXIT
                            (COND
                             ((QEQCAR |f1| 1)
                              (PROGN
                               (LETT #1# (CONS (|spadConstant| $ 23) |listf|))
                               (GO #3=#:G477))))))
                      (EXIT (LETT |result| (CONS (QCDR |f1|) |result|))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (REVERSE |result|))))
          #3# (EXIT #1#)))) 

(SDEFUN |HEUGCD;mindegpol| ((|f| BP) (|g| BP) ($ BP))
        (COND
         ((< (SPADCALL |g| (QREFELT $ 12)) (SPADCALL |f| (QREFELT $ 12))) |g|)
         ('T |f|))) 

(SDEFUN |HEUGCD;localgcd| ((|listf| |List| BP) ($ |List| BP))
        (SPROG
         ((#1=#:G496 NIL) (#2=#:G515 NIL) (|f| NIL) (#3=#:G514 NIL) (|gg| (BP))
          (|answr| (|PositiveInteger|)) (#4=#:G501 NIL)
          (|nvalue| (|NonNegativeInteger|)) (#5=#:G508 NIL)
          (|result| (|List| BP)) (|flag| (|Boolean|))
          (|f1| (|Union| BP "failed")) (#6=#:G513 NIL) (|d| (BP))
          (|contd| (|Integer|)) (|dd| (BP)) (|dval| (|Integer|))
          (|listval| (|List| (|Integer|))) (#7=#:G512 NIL) (#8=#:G511 NIL)
          (|k| NIL) (|minf| (BP)) (#9=#:G492 NIL) (#10=#:G491 (BP))
          (#11=#:G493 (BP)) (#12=#:G510 NIL) (|hgt| #13=(|PositiveInteger|))
          (#14=#:G488 NIL) (#15=#:G487 #13#) (#16=#:G489 #13#)
          (#17=#:G509 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |hgt|
                  (PROGN
                   (LETT #14# NIL)
                   (SEQ (LETT |f| NIL) (LETT #17# |listf|) G190
                        (COND
                         ((OR (ATOM #17#) (PROGN (LETT |f| (CAR #17#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |f| (QREFELT $ 14)))
                            (PROGN
                             (LETT #16# (|HEUGCD;height| |f| $))
                             (COND (#14# (LETT #15# (MIN #15# #16#)))
                                   ('T
                                    (PROGN
                                     (LETT #15# #16#)
                                     (LETT #14# 'T)))))))))
                        (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))
                   (COND (#14# #15#) (#18='T (|IdentityError| '|min|)))))
            (LETT |answr| (+ 2 (* 2 |hgt|)))
            (LETT |minf|
                  (PROGN
                   (LETT #9# NIL)
                   (SEQ (LETT |f| NIL) (LETT #12# |listf|) G190
                        (COND
                         ((OR (ATOM #12#) (PROGN (LETT |f| (CAR #12#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |f| (QREFELT $ 14)))
                            (PROGN
                             (LETT #11# |f|)
                             (COND
                              (#9#
                               (LETT #10# (|HEUGCD;mindegpol| #10# #11# $)))
                              ('T (PROGN (LETT #10# #11#) (LETT #9# 'T)))))))))
                        (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
                   (COND (#9# #10#) (#18# (|IdentityError| '|mindegpol|)))))
            (LETT |result| (|HEUGCD;testDivide| |listf| |minf| $))
            (EXIT
             (COND ((QEQCAR |result| 0) (CONS |minf| (QCDR |result|)))
                   (#18#
                    (SEQ
                     (SEQ (LETT |k| 1) G190
                          (COND ((|greater_SI| |k| 10) (GO G191)))
                          (SEQ
                           (LETT |listval|
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
                                               (CONS
                                                (SPADCALL |f| |answr|
                                                          (QREFELT $ 44))
                                                #8#))))
                                       (LETT #7# (CDR #7#)) (GO G190) G191
                                       (EXIT (NREVERSE #8#)))))
                           (LETT |dval| (SPADCALL |listval| (QREFELT $ 26)))
                           (LETT |dd| (|HEUGCD;genpoly| |dval| |answr| $))
                           (LETT |contd| (SPADCALL |dd| (QREFELT $ 45)))
                           (LETT |d|
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |dd| |contd|
                                                     (QREFELT $ 31)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                                   (|Union| (QREFELT $ 6)
                                                            #19="failed")
                                                   #1#)))
                           (LETT |result| (LIST |d|)) (LETT |flag| 'T)
                           (SEQ (LETT |f| NIL) (LETT #6# |listf|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |f| (CAR #6#)) NIL)
                                      (NULL |flag|))
                                  (GO G191)))
                                (SEQ
                                 (LETT |f1| (SPADCALL |f| |d| (QREFELT $ 38)))
                                 (EXIT
                                  (COND ((QEQCAR |f1| 1) (LETT |flag| NIL))
                                        ('T
                                         (LETT |result|
                                               (CONS (QCDR |f1|) |result|))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (COND
                            (|flag|
                             (PROGN
                              (LETT #5# (REVERSE |result|))
                              (GO #20=#:G507))))
                           (LETT |nvalue|
                                 (QUOTIENT2 (* |answr| 832040) 317811))
                           (COND
                            ((EQL (REM (+ |nvalue| |answr|) 2) 0)
                             (LETT |nvalue| (+ |nvalue| 1))))
                           (EXIT
                            (LETT |answr|
                                  (PROG1 (LETT #4# |nvalue|)
                                    (|check_subtype2| (> #4# 0)
                                                      '(|PositiveInteger|)
                                                      '(|NonNegativeInteger|)
                                                      #4#)))))
                          (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                     (LETT |gg| (SPADCALL |listf| (QREFELT $ 46)))
                     (EXIT
                      (CONS |gg|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |f| NIL) (LETT #2# |listf|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |f| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (PROG2
                                               (LETT #1#
                                                     (SPADCALL |f| |gg|
                                                               (QREFELT $ 38)))
                                               (QCDR #1#)
                                             (|check_union2| (QEQCAR #1# 0)
                                                             (QREFELT $ 6)
                                                             (|Union|
                                                              (QREFELT $ 6)
                                                              #19#)
                                                             #1#))
                                           #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))))))))))
          #20# (EXIT #5#)))) 

(SDEFUN |HEUGCD;internal|
        ((|flag| |Union| "gcdprim" "gcd" "gcdcofactprim" "gcdcofact")
         (|listf| |List| BP) ($ |List| BP))
        (SPROG
         ((|ans| (|List| BP)) (#1=#:G560 NIL) (|p| NIL) (#2=#:G561 NIL)
          (|q| NIL) (#3=#:G559 NIL) (|result| (BP)) (|#G53| (|List| BP))
          (|#G52| (BP)) (#4=#:G548 NIL) (|fa| #5=(|U32Vector|)) (|ga| #5#)
          (#6=#:G547 NIL) (|lcg| (|Integer|)) (#7=#:G558 NIL) (|g| NIL)
          (|f| (BP)) (|listdeg| (|List| (|NonNegativeInteger|)))
          (#8=#:G557 NIL) (#9=#:G556 NIL) (|minpol| (BP)) (#10=#:G555 NIL)
          (|term| NIL) (#11=#:G554 NIL) (|contgcd| (|Integer|))
          (|Cgcd| (|List| (|Integer|))) (#12=#:G553 NIL) (#13=#:G552 NIL)
          (|contlistf|
           (|List| (|Record| (|:| |cont| (|Integer|)) (|:| |prim| BP))))
          (#14=#:G525 NIL) (#15=#:G551 NIL) (#16=#:G550 NIL) (|minpol1| (BP))
          (|mdeg| #17=(|NonNegativeInteger|)) (#18=#:G522 NIL)
          (#19=#:G521 #17#) (#20=#:G523 #17#) (#21=#:G549 NIL)
          (|nlf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |listf| NIL (QREFELT $ 47))
             (LIST (|spadConstant| $ 23)))
            (#22='T
             (SEQ (LETT |nlf| (LENGTH |listf|))
                  (EXIT
                   (COND
                    ((EQL |nlf| 1)
                     (LIST (|SPADfirst| |listf|) (|spadConstant| $ 23)))
                    (#22#
                     (SEQ (LETT |minpol| (|spadConstant| $ 23))
                          (LETT |mdeg|
                                (PROGN
                                 (LETT #18# NIL)
                                 (SEQ (LETT |f| NIL) (LETT #21# |listf|) G190
                                      (COND
                                       ((OR (ATOM #21#)
                                            (PROGN (LETT |f| (CAR #21#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #20#
                                               (SPADCALL |f| (QREFELT $ 48)))
                                         (COND
                                          (#18# (LETT #19# (MIN #19# #20#)))
                                          ('T
                                           (PROGN
                                            (LETT #19# #20#)
                                            (LETT #18# 'T)))))))
                                      (LETT #21# (CDR #21#)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#18# #19#)
                                       (#22# (|IdentityError| '|min|)))))
                          (COND
                           ((SPADCALL |mdeg| 0 (QREFELT $ 36))
                            (SEQ
                             (LETT |minpol1|
                                   (SPADCALL 1 |mdeg| (QREFELT $ 21)))
                             (LETT |listf|
                                   (PROGN
                                    (LETT #16# NIL)
                                    (SEQ (LETT |f| NIL) (LETT #15# |listf|)
                                         G190
                                         (COND
                                          ((OR (ATOM #15#)
                                               (PROGN
                                                (LETT |f| (CAR #15#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #16#
                                                 (CONS
                                                  (PROG2
                                                      (LETT #14#
                                                            (SPADCALL |f|
                                                                      |minpol1|
                                                                      (QREFELT
                                                                       $ 38)))
                                                      (QCDR #14#)
                                                    (|check_union2|
                                                     (QEQCAR #14# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              "failed")
                                                     #14#))
                                                  #16#))))
                                         (LETT #15# (CDR #15#)) (GO G190) G191
                                         (EXIT (NREVERSE #16#)))))
                             (EXIT
                              (LETT |minpol|
                                    (SPADCALL |minpol| |minpol1|
                                              (QREFELT $ 49)))))))
                          (LETT |Cgcd| NIL) (LETT |contgcd| 1)
                          (COND
                           ((OR (QEQCAR |flag| 1) (QEQCAR |flag| 3))
                            (SEQ
                             (LETT |contlistf| (|HEUGCD;contprim| |listf| $))
                             (LETT |Cgcd|
                                   (PROGN
                                    (LETT #13# NIL)
                                    (SEQ (LETT |term| NIL)
                                         (LETT #12# |contlistf|) G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |term| (CAR #12#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #13#
                                                 (CONS (QCAR |term|) #13#))))
                                         (LETT #12# (CDR #12#)) (GO G190) G191
                                         (EXIT (NREVERSE #13#)))))
                             (LETT |contgcd| (SPADCALL |Cgcd| (QREFELT $ 26)))
                             (LETT |listf|
                                   (PROGN
                                    (LETT #11# NIL)
                                    (SEQ (LETT |term| NIL)
                                         (LETT #10# |contlistf|) G190
                                         (COND
                                          ((OR (ATOM #10#)
                                               (PROGN
                                                (LETT |term| (CAR #10#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #11#
                                                 (CONS (QCDR |term|) #11#))))
                                         (LETT #10# (CDR #10#)) (GO G190) G191
                                         (EXIT (NREVERSE #11#)))))
                             (EXIT
                              (LETT |minpol|
                                    (SPADCALL |contgcd| |minpol|
                                              (QREFELT $ 50)))))))
                          (LETT |listdeg|
                                (PROGN
                                 (LETT #9# NIL)
                                 (SEQ (LETT |f| NIL) (LETT #8# |listf|) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN (LETT |f| (CAR #8#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #9#
                                              (CONS
                                               (SPADCALL |f| (QREFELT $ 12))
                                               #9#))))
                                      (LETT #8# (CDR #8#)) (GO G190) G191
                                      (EXIT (NREVERSE #9#)))))
                          (LETT |f| (|SPADfirst| |listf|))
                          (COND
                           ((SPADCALL
                             (SPADCALL (SPADCALL |f| (QREFELT $ 18))
                                       (QREFELT $ 7) (QREFELT $ 51))
                             0 (QREFELT $ 20))
                            (SEQ
                             (LETT |fa|
                                   (SPADCALL (SPADCALL |f| (QREFELT $ 53))
                                             (QREFELT $ 7) (QREFELT $ 56)))
                             (EXIT
                              (SEQ
                               (EXIT
                                (SEQ (LETT |g| NIL) (LETT #7# (CDR |listf|))
                                     G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT |g| (CAR #7#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |lcg|
                                            (SPADCALL |g| (QREFELT $ 18)))
                                      (COND
                                       ((EQL
                                         (SPADCALL |lcg| (QREFELT $ 7)
                                                   (QREFELT $ 51))
                                         0)
                                        (PROGN
                                         (LETT #6# |$NoValue|)
                                         (GO #23=#:G538))))
                                      (LETT |ga|
                                            (SPADCALL
                                             (SPADCALL |g| (QREFELT $ 53))
                                             (QREFELT $ 7) (QREFELT $ 56)))
                                      (LETT |fa|
                                            (SPADCALL |fa| |ga| (QREFELT $ 7)
                                                      (QREFELT $ 57)))
                                      (EXIT
                                       (COND
                                        ((EQL (SPADCALL |fa| (QREFELT $ 58)) 0)
                                         (PROGN
                                          (LETT #4# (CONS |minpol| |listf|))
                                          (GO #24=#:G546))))))
                                     (LETT #7# (CDR #7#)) (GO G190) G191
                                     (EXIT NIL)))
                               #23# (EXIT #6#))))))
                          (LETT |ans|
                                (COND
                                 ((SPADCALL 0 |listdeg| (QREFELT $ 35))
                                  (|HEUGCD;constcase| |listdeg| |listf| $))
                                 ((SPADCALL 1 |listdeg| (QREFELT $ 35))
                                  (|HEUGCD;lincase| |listdeg| |listf| $))
                                 (#22# (|HEUGCD;localgcd| |listf| $))))
                          (PROGN
                           (LETT |#G52|
                                 (SPADCALL (|SPADfirst| |ans|) |minpol|
                                           (QREFELT $ 49)))
                           (LETT |#G53| (CDR |ans|))
                           (LETT |result| |#G52|)
                           (LETT |ans| |#G53|))
                          (COND
                           ((QEQCAR |flag| 3)
                            (LETT |ans|
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |q| NIL) (LETT #2# |ans|)
                                        (LETT |p| NIL) (LETT #1# |Cgcd|) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN (LETT |p| (CAR #1#)) NIL)
                                              (ATOM #2#)
                                              (PROGN (LETT |q| (CAR #2#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL
                                                  (QUOTIENT2 |p| |contgcd|) |q|
                                                  (QREFELT $ 50))
                                                 #3#))))
                                        (LETT #1#
                                              (PROG1 (CDR #1#)
                                                (LETT #2# (CDR #2#))))
                                        (GO G190) G191
                                        (EXIT (NREVERSE #3#)))))))
                          (EXIT (CONS |result| |ans|))))))))))
          #24# (EXIT #4#)))) 

(SDEFUN |HEUGCD;gcdprim;LBP;16| ((|listf| |List| BP) ($ BP))
        (|SPADfirst| (|HEUGCD;internal| (CONS 0 "gcdprim") |listf| $))) 

(SDEFUN |HEUGCD;gcdcofactprim;2L;17| ((|listf| |List| BP) ($ |List| BP))
        (|HEUGCD;internal| (CONS 2 "gcdcofactprim") |listf| $)) 

(SDEFUN |HEUGCD;gcd;LBP;18| ((|listf| |List| BP) ($ BP))
        (|SPADfirst| (|HEUGCD;internal| (CONS 1 "gcd") |listf| $))) 

(SDEFUN |HEUGCD;gcdcofact;2L;19| ((|listf| |List| BP) ($ |List| BP))
        (|HEUGCD;internal| (CONS 3 "gcdcofact") |listf| $)) 

(DECLAIM (NOTINLINE |HeuGcd;|)) 

(DEFUN |HeuGcd| (#1=#:G586)
  (SPROG NIL
         (PROG (#2=#:G587)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|HeuGcd|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|HeuGcd;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|HeuGcd|)))))))))) 

(DEFUN |HeuGcd;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|HeuGcd| DV$1))
          (LETT $ (GETREFV 63))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HeuGcd| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 4010021)
          (QSETREFV $ 43
                    (|InnerModularGcd| (|Integer|) |#1| 67108859
                                       (CONS (|function| |HEUGCD;myNextPrime|)
                                             $)))
          $))) 

(MAKEPROP '|HeuGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|bigPrime| (|Integer|)
              (|IntegerPrimesPackage| 8) (0 . |nextPrime|)
              (|NonNegativeInteger|) (5 . |degree|) (|Boolean|) (10 . |zero?|)
              (15 . |Zero|) (19 . >) (25 . ~=) (31 . |leadingCoefficient|)
              (36 . |reductum|) (41 . ~=) (47 . |monomial|) (53 . +)
              (59 . |One|) (|List| 8) (63 . |member?|) |HEUGCD;lintgcd;LI;7|
              (69 . |coefficients|) (|List| 6) |HEUGCD;content;LL;8|
              (|Union| $ '"failed") (74 . |exquo|) (|Mapping| 13 6)
              (80 . |select|) (|List| 11) (86 . |member?|) (92 . >)
              (98 . |coerce|) (103 . |exquo|) (|PositiveInteger|) (109 . |One|)
              (113 . |position|) (119 . |elt|) 'IMG (125 . |elt|)
              (131 . |content|) (136 . |modularGcdPrimitive|) (141 . =)
              (147 . |minimumDegree|) (152 . *) (158 . *)
              (164 . |positiveRemainder|) (|SparseUnivariatePolynomial| 8)
              (170 . |makeSUP|) (|U32Vector|) (|U32VectorPolynomialOperations|)
              (175 . |to_mod_pa|) (181 . |gcd|) (188 . |degree|)
              |HEUGCD;gcdprim;LBP;16| |HEUGCD;gcdcofactprim;2L;17|
              |HEUGCD;gcd;LBP;18| |HEUGCD;gcdcofact;2L;19|)
           '#(|lintgcd| 193 |gcdprim| 198 |gcdcofactprim| 203 |gcdcofact| 208
              |gcd| 213 |content| 218)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|gcd| (|#1| (|List| |#1|))) T)
                                   '((|gcdprim| (|#1| (|List| |#1|))) T)
                                   '((|gcdcofact|
                                      ((|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|gcdcofactprim|
                                      ((|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|content|
                                      ((|List| (|Integer|)) (|List| |#1|)))
                                     T)
                                   '((|lintgcd|
                                      ((|Integer|) (|List| (|Integer|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 62
                                            '(1 9 8 8 10 1 6 11 0 12 1 6 13 0
                                              14 0 6 0 15 2 8 13 0 0 16 2 6 13
                                              0 0 17 1 6 8 0 18 1 6 0 0 19 2 8
                                              13 0 0 20 2 6 0 8 11 21 2 6 0 0 0
                                              22 0 6 0 23 2 24 13 8 0 25 1 6 24
                                              0 27 2 6 30 0 8 31 2 28 0 32 0 33
                                              2 34 13 11 0 35 2 11 13 0 0 36 1
                                              6 0 8 37 2 6 30 0 0 38 0 39 0 40
                                              2 34 8 11 0 41 2 28 6 0 8 42 2 6
                                              8 0 8 44 1 6 8 0 45 1 43 6 28 46
                                              2 28 13 0 0 47 1 6 11 0 48 2 6 0
                                              0 0 49 2 6 0 8 0 50 2 8 0 0 0 51
                                              1 6 52 0 53 2 55 54 52 8 56 3 55
                                              54 54 54 8 57 1 55 8 54 58 1 0 8
                                              24 26 1 0 6 28 59 1 0 28 28 60 1
                                              0 28 28 62 1 0 6 28 61 1 0 24 28
                                              29)))))
           '|lookupComplete|)) 
