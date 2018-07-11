
(SDEFUN |FCTOOL;newFortranTempVar;S;1| (($ |Symbol|))
        (SPROG ((|def_type| (|Symbol|)) (|new_sym| (|Symbol|)))
               (SEQ (SETELT $ 6 (|add_SI| 1 (QREFELT $ 6)))
                    (LETT |new_sym|
                          (SPADCALL (STRCONC "T" (STRINGIMAGE (QREFELT $ 6)))
                                    (QREFELT $ 9)))
                    (LETT |def_type| |$defaultFortranType|)
                    (SPADCALL |new_sym|
                              (SPADCALL (SPADCALL |def_type| (QREFELT $ 11))
                                        (QREFELT $ 13))
                              (QREFELT $ 15))
                    (EXIT |new_sym|)))) 

(SDEFUN |FCTOOL;checkType;2S;2| ((|t| |String|) ($ |String|))
        (COND
         ((EQUAL |$fortranPrecision| '|double|)
          (COND ((EQUAL |t| "REAL") "DOUBLE PRECISION")
                ((EQUAL |t| "COMPLEX") "DOUBLE COMPLEX") (#1='T |t|)))
         (#1# |t|))) 

(SDEFUN |FCTOOL;fortranCleanUp| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|oldTok| (|String|)) (|m| (|List| (|String|))) (#1=#:G531 NIL)
          (|e| NIL))
         (SEQ (LETT |oldTok| "") (LETT |m| NIL)
              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQUAL |oldTok| "-")
                      (COND
                       ((NULL (EQUAL |e| "+")) (LETT |m| (CONS |e| |m|)))))
                     ('T (LETT |m| (CONS |e| |m|))))
                    (EXIT (LETT |oldTok| |e|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |FCTOOL;exp2FortFn|
        ((|op| . #1=(|String|)) (|args| |List| (|OutputForm|))
         (|nargs| |Integer|) ($ |List| (|String|)))
        (SPROG ((|s| (|List| #1#)) (#2=#:G536 NIL) (|arg| NIL))
               (SEQ (LETT |s| (LIST "(" |op|))
                    (EXIT
                     (COND ((EQL |nargs| 0) (CONS ")" |s|))
                           ('T
                            (SEQ
                             (SEQ (LETT |arg| NIL) (LETT #2# |args|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |arg| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |s|
                                          (CONS ","
                                                (SPADCALL
                                                 (|FCTOOL;exp2Fort2| |arg| 0
                                                  |op| $)
                                                 |s| (QREFELT $ 25))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS ")" (CDR |s|)))))))))) 

(SDEFUN |FCTOOL;exp2Fort2|
        ((|e| |OutputForm|) (|prec| |Integer|) (|oldOp| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|s| (|List| (|String|))) (#1=#:G555 NIL) (|op1| (|String|))
          (|args1| #2=(|List| (|OutputForm|))) (#3=#:G556 NIL) (|arg| NIL)
          (|nprec| (|Integer|)) (|p| (|Integer|)) (|op| (|String|))
          (|nargs| (|NonNegativeInteger|)) (|args| #2#) (|op0| (|OutputForm|)))
         (SEQ
          (COND ((NULL |e|) NIL)
                ((SPADCALL |e| (QREFELT $ 30)) (LIST (|object2String| |e|)))
                (#4='T
                 (SEQ (LETT |op0| (SPADCALL |e| (QREFELT $ 31)))
                      (LETT |args| (SPADCALL |e| (QREFELT $ 33)))
                      (LETT |nargs| (LENGTH |args|))
                      (LETT |op| (|object2String| |op0|))
                      (COND
                       ((EQL |nargs| 2)
                        (COND
                         ((EQUAL |op| "=")
                          (EXIT
                           (CONS "%l"
                                 (SPADCALL
                                  (|FCTOOL;exp2Fort2|
                                   (SPADCALL |args| 2 (QREFELT $ 35)) |prec|
                                   " " $)
                                  (CONS "="
                                        (|FCTOOL;exp2Fort2|
                                         (SPADCALL |args| 1 (QREFELT $ 35))
                                         |prec| " " $))
                                  (QREFELT $ 25))))))))
                      (EXIT
                       (COND
                        ((EQL |nargs| 0) (|FCTOOL;exp2FortFn| |op| |args| 0 $))
                        ((EQL |nargs| 1)
                         (SEQ
                          (LETT |p|
                                (SPADCALL |op| (QREFELT $ 18) (QREFELT $ 36)))
                          (EXIT
                           (COND
                            ((SPADCALL |p| 0 (QREFELT $ 37))
                             (SEQ
                              (LETT |nprec|
                                    (SPADCALL (QREFELT $ 19) |p|
                                              (QREFELT $ 39)))
                              (LETT |s|
                                    (SPADCALL
                                     (|FCTOOL;exp2Fort2| (|SPADfirst| |args|)
                                      |nprec| |op| $)
                                     (CONS |op| NIL) (QREFELT $ 25)))
                              (COND
                               ((EQUAL |op| "-")
                                (COND
                                 ((SPADCALL (|SPADfirst| |args|)
                                            (QREFELT $ 30))
                                  (EXIT |s|)))))
                              (EXIT
                               (COND
                                ((SPADCALL |nprec| |prec| (QREFELT $ 40))
                                 (CONS ")"
                                       (SPADCALL |s| (CONS "(" NIL)
                                                 (QREFELT $ 25))))
                                (#4# |s|)))))
                            (#4#
                             (|FCTOOL;exp2FortFn| |op| |args| |nargs| $))))))
                        ((EQUAL |op| "CMPLX")
                         (COND
                          ((SPADCALL |nargs| 2 (QREFELT $ 42))
                           (|error| "Bad number of arguments to CMPLX"))
                          (#4#
                           (CONS ")"
                                 (SPADCALL
                                  (|FCTOOL;exp2Fort2|
                                   (SPADCALL |args| (QREFELT $ 43)) |prec| |op|
                                   $)
                                  (CONS ","
                                        (SPADCALL
                                         (|FCTOOL;exp2Fort2|
                                          (|SPADfirst| |args|) |prec| |op| $)
                                         (CONS "(" NIL) (QREFELT $ 25)))
                                  (QREFELT $ 25))))))
                        (#4#
                         (COND
                          ((SPADCALL |op| (QREFELT $ 26) (QREFELT $ 44))
                           (SEQ
                            (LETT |p|
                                  (SPADCALL |op| (QREFELT $ 20)
                                            (QREFELT $ 36)))
                            (COND
                             ((EQL |p| 0)
                              (SEQ
                               (LETT |p|
                                     (SPADCALL |op| (QREFELT $ 22)
                                               (QREFELT $ 36)))
                               (EXIT
                                (LETT |nprec|
                                      (SPADCALL (QREFELT $ 23) |p|
                                                (QREFELT $ 39))))))
                             (#4#
                              (LETT |nprec|
                                    (SPADCALL (QREFELT $ 21) |p|
                                              (QREFELT $ 39)))))
                            (LETT |s| NIL)
                            (SEQ (LETT |arg| NIL) (LETT #3# |args|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |arg| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (COND
                                     ((EQUAL |op| "+")
                                      (COND
                                       ((NULL (SPADCALL |arg| (QREFELT $ 30)))
                                        (COND
                                         ((EQL
                                           (LENGTH
                                            (LETT |args1|
                                                  (SPADCALL |arg|
                                                            (QREFELT $ 33))))
                                           1)
                                          (SEQ
                                           (LETT |op1|
                                                 (|object2String|
                                                  (SPADCALL |arg|
                                                            (QREFELT $ 31))))
                                           (EXIT
                                            (COND
                                             ((EQUAL |op1| "-")
                                              (PROGN
                                               (LETT #1#
                                                     (SEQ
                                                      (COND
                                                       ((NULL |s|)
                                                        (LETT |s|
                                                              (LIST "junk"))))
                                                      (EXIT
                                                       (LETT |s|
                                                             (CONS |op|
                                                                   (SPADCALL
                                                                    (|FCTOOL;exp2Fort2|
                                                                     (|SPADfirst|
                                                                      |args1|)
                                                                     |nprec|
                                                                     |op| $)
                                                                    (CONS "-"
                                                                          (CDR
                                                                           |s|))
                                                                    (QREFELT $
                                                                             25)))))))
                                               (GO #5=#:G547))))))))))))
                                    (EXIT
                                     (LETT |s|
                                           (CONS |op|
                                                 (SPADCALL
                                                  (|FCTOOL;exp2Fort2| |arg|
                                                   |nprec| |op| $)
                                                  |s| (QREFELT $ 25)))))))
                                  #5# (EXIT #1#))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |s| (CDR |s|))
                            (COND
                             ((EQUAL |op| |oldOp|)
                              (COND
                               ((OR (EQUAL |op| "*") (EQUAL |op| "+"))
                                (EXIT |s|)))))
                            (EXIT
                             (COND
                              ((SPADCALL |nprec| |prec| (QREFELT $ 40))
                               (CONS ")"
                                     (SPADCALL |s| (CONS "(" NIL)
                                               (QREFELT $ 25))))
                              (#4# |s|)))))
                          (#4#
                           (|FCTOOL;exp2FortFn| |op| |args| |nargs|
                            $)))))))))))) 

(SDEFUN |FCTOOL;exp2Fort1| ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG
         ((|res| (|List| (|String|))) (|l1| (|List| (|String|)))
          (#1=#:G561 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (|FCTOOL;exp2Fort2| |e| 0 "" $))
                        (EXIT
                         (LETT |res| (SPADCALL |l1| |res| (QREFELT $ 25)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;tempLen| (($ |Integer|))
        (+ 1 (QCSIZE (STRINGIMAGE (QREFELT $ 6))))) 

(SDEFUN |FCTOOL;fortExpSize_f|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) ($ |Integer|))
        (SPROG
         ((#1=#:G564 NIL) (#2=#:G563 #3=(|Integer|)) (#4=#:G565 #3#)
          (#5=#:G567 NIL) (|a| NIL))
         (SEQ
          (+ (+ 1 (LENGTH |args|))
             (PROGN
              (LETT #1# NIL)
              (SEQ (LETT |a| NIL) (LETT #5# (CONS |op| |args|)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #4# (|FCTOOL;fortExpSize| |a| $))
                      (COND (#1# (LETT #2# (+ #2# #4#)))
                            ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) ('T 0))))))) 

(SDEFUN |FCTOOL;same_subtree|
        ((|op| |String|) (|e| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op2| (|String|)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 30)) NIL)
                      ('T
                       (SEQ
                        (LETT |op2|
                              (STRINGIMAGE (SPADCALL |e| (QREFELT $ 31))))
                        (EXIT (EQUAL |op| |op2|)))))))) 

(SDEFUN |FCTOOL;same_subtree2|
        ((|op| |Symbol|) (|e| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op2| (|OutputForm|)))
               (COND
                ((OR (SPADCALL |e| (QREFELT $ 30))
                     (NULL
                      (SPADCALL (LETT |op2| (SPADCALL |e| (QREFELT $ 31)))
                                (QREFELT $ 45))))
                 NIL)
                ('T (EQUAL |op| (SPADCALL |op2| (QREFELT $ 46))))))) 

(SDEFUN |FCTOOL;fortExpSize| ((|e| |OutputForm|) ($ |Integer|))
        (SPROG
         ((|narys| (|List| (|String|))) (|ops| (|String|))
          (|arg2| #1=(|OutputForm|)) (|arg1| #1#)
          (|args| (|List| (|OutputForm|))) (|op| (|OutputForm|))
          (|s| (|String|)))
         (SEQ
          (COND
           ((SPADCALL |e| (QREFELT $ 30))
            (SEQ (LETT |s| (STRINGIMAGE |e|)) (EXIT (QCSIZE |s|))))
           (#2='T
            (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 31)))
                 (LETT |args| (SPADCALL |e| (QREFELT $ 33)))
                 (EXIT
                  (COND
                   ((OR (SPADCALL (LENGTH |args|) 2 (QREFELT $ 37))
                        (< (LENGTH |args|) 2))
                    (|FCTOOL;fortExpSize_f| |op| |args| $))
                   ('T
                    (SEQ (LETT |arg1| (SPADCALL |args| 1 (QREFELT $ 35)))
                         (LETT |arg2| (SPADCALL |args| 2 (QREFELT $ 35)))
                         (LETT |ops| (STRINGIMAGE |op|))
                         (EXIT
                          (COND
                           ((EQUAL |ops| "CMPLX")
                            (+ (+ 5 (|FCTOOL;fortExpSize| |arg1| $))
                               (|FCTOOL;fortExpSize| |arg2| $)))
                           (#2#
                            (SEQ (LETT |narys| (LIST "+" "*"))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ops| |narys| (QREFELT $ 44))
                                    (SEQ
                                     (COND
                                      ((|FCTOOL;same_subtree| |ops| |arg1| $)
                                       (COND
                                        ((NULL
                                          (|FCTOOL;same_subtree| |ops| |arg2|
                                           $))
                                         (EXIT
                                          (|FCTOOL;fortExpSize_f| |op| |args|
                                           $)))))
                                      (#2#
                                       (EXIT
                                        (|FCTOOL;fortExpSize_f| |op| |args|
                                         $))))
                                     (EXIT
                                      (+ (+ 1 (|FCTOOL;fortExpSize| |arg1| $))
                                         (|FCTOOL;fortExpSize| |arg2| $)))))
                                   (#2#
                                    (|FCTOOL;fortExpSize_f| |op| |args|
                                     $)))))))))))))))))) 

(SDEFUN |FCTOOL;mk_assign2|
        ((|name| |OutputForm|) (|val| |OutputForm|) ($ |OutputForm|))
        (SPADCALL (QREFELT $ 48) (LIST |name| |val|) (QREFELT $ 50))) 

(SDEFUN |FCTOOL;mk_assign1|
        ((|name| |Symbol|) (|val| |OutputForm|) ($ |OutputForm|))
        (|FCTOOL;mk_assign2| (SPADCALL |name| (QREFELT $ 47)) |val| $)) 

(SDEFUN |FCTOOL;segment2l|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|))
         (|topSize| |Integer|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|newVar| #1=(|Symbol|)) (|new_e1| (|OutputForm|))
          (|newE| (|List| (|OutputForm|))) (|exprs| (|List| (|OutputForm|)))
          (|new_var_f| (|OutputForm|)) (|new_var| #1#) (|subSize| (|Integer|))
          (|subE| (|List| (|OutputForm|))) (#2=#:G596 NIL) (|e| NIL)
          (|maxSize| (|Integer|)))
         (SEQ
          (LETT |maxSize|
                (- (- |$maximumFortranExpressionLength| (|FCTOOL;tempLen| $))
                   1))
          (LETT |exprs| NIL) (LETT |newE| NIL)
          (LETT |topSize|
                (- |topSize|
                   (|FCTOOL;fortExpSize| (SPADCALL |op| NIL (QREFELT $ 50))
                    $)))
          (SEQ (LETT |e| NIL) (LETT #2# |args|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |subSize| (|FCTOOL;fortExpSize| |e| $))
                    (EXIT
                     (COND
                      ((SPADCALL |subSize| |maxSize| (QREFELT $ 37))
                       (SEQ (LETT |subE| (|FCTOOL;segment2| |e| |maxSize| $))
                            (LETT |exprs|
                                  (SPADCALL (CDR |subE|) |exprs|
                                            (QREFELT $ 51)))
                            (LETT |subSize|
                                  (|FCTOOL;fortExpSize| (|SPADfirst| |subE|)
                                   $))
                            (EXIT
                             (COND
                              ((SPADCALL |subSize| |topSize| (QREFELT $ 40))
                               (SEQ
                                (LETT |newE|
                                      (SPADCALL |newE|
                                                (CONS (|SPADfirst| |subE|) NIL)
                                                (QREFELT $ 51)))
                                (EXIT
                                 (LETT |topSize| (- |topSize| |subSize|)))))
                              ('T
                               (SEQ (LETT |new_var| (SPADCALL (QREFELT $ 16)))
                                    (LETT |new_var_f|
                                          (SPADCALL |new_var| (QREFELT $ 47)))
                                    (LETT |newE|
                                          (SPADCALL |newE|
                                                    (CONS |new_var_f| NIL)
                                                    (QREFELT $ 51)))
                                    (LETT |exprs|
                                          (CONS
                                           (|FCTOOL;mk_assign1| |new_var|
                                            (|SPADfirst| |subE|) $)
                                           |exprs|))
                                    (EXIT
                                     (LETT |topSize|
                                           (- |topSize|
                                              (|FCTOOL;fortExpSize| |new_var_f|
                                               $))))))))))
                      ('T
                       (SEQ
                        (LETT |newE|
                              (SPADCALL |newE| (CONS |e| NIL) (QREFELT $ 51)))
                        (EXIT (LETT |topSize| (- |topSize| |subSize|))))))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (LETT |new_e1| (SPADCALL |op| |newE| (QREFELT $ 50)))
          (EXIT
           (COND
            ((SPADCALL |topSize| 0 (QREFELT $ 37)) (CONS |new_e1| |exprs|))
            ('T
             (SEQ (LETT |newVar| (SPADCALL (QREFELT $ 16)))
                  (EXIT
                   (CONS (SPADCALL |newVar| (QREFELT $ 47))
                         (CONS (|FCTOOL;mk_assign1| |newVar| |new_e1| $)
                               |exprs|)))))))))) 

(SDEFUN |FCTOOL;segment2|
        ((|e| |OutputForm|) (|topSize| |Integer|) ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |e| (QREFELT $ 30)) (LIST |e|))
              ('T
               (|FCTOOL;segment2l| (SPADCALL |e| (QREFELT $ 31))
                (SPADCALL |e| (QREFELT $ 33)) |topSize| $)))) 

(SDEFUN |FCTOOL;segment1l|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|))
         (|maxSize| |Integer|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|safeSize| (|Integer|)) (|new_args| (|List| (|OutputForm|)))
          (|expressions| (|List| (|OutputForm|)))
          (|exprs| (|List| (|OutputForm|))) (|subSize| (|Integer|))
          (#1=#:G605 NIL) (|e| NIL))
         (SEQ (LETT |expressions| NIL) (LETT |new_args| NIL)
              (LETT |safeSize|
                    (-
                     (- |maxSize|
                        (SPADCALL (LENGTH |args|) (+ (|FCTOOL;tempLen| $) 1)
                                  (QREFELT $ 52)))
                     (|FCTOOL;fortExpSize| (SPADCALL |op| NIL (QREFELT $ 50))
                      $)))
              (SEQ (LETT |e| NIL) (LETT #1# |args|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |subSize| (|FCTOOL;fortExpSize| |e| $))
                        (EXIT
                         (COND
                          ((SPADCALL |subSize| |safeSize| (QREFELT $ 40))
                           (SEQ (LETT |safeSize| (- |safeSize| |subSize|))
                                (EXIT
                                 (LETT |new_args|
                                       (SPADCALL |new_args| (CONS |e| NIL)
                                                 (QREFELT $ 51))))))
                          ('T
                           (SEQ
                            (LETT |exprs| (|FCTOOL;segment2| |e| |safeSize| $))
                            (LETT |expressions|
                                  (SPADCALL (CDR |exprs|) |expressions|
                                            (QREFELT $ 51)))
                            (LETT |new_args|
                                  (SPADCALL |new_args|
                                            (CONS (|SPADfirst| |exprs|) NIL)
                                            (QREFELT $ 51)))
                            (EXIT
                             (LETT |safeSize|
                                   (- |safeSize|
                                      (|FCTOOL;fortExpSize|
                                       (|SPADfirst| |exprs|) $)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (SPADCALL |op| |new_args| (QREFELT $ 50))
                     |expressions|))))) 

(SDEFUN |FCTOOL;segment1|
        ((|e| |OutputForm|) (|maxSize| |Integer|) ($ |List| (|OutputForm|)))
        (COND ((< (|FCTOOL;fortExpSize| |e| $) |maxSize|) (LIST |e|))
              ((SPADCALL |e| (QREFELT $ 30))
               (|error| "segment1 expecting composite form"))
              ('T
               (|FCTOOL;segment1l| (SPADCALL |e| (QREFELT $ 31))
                (SPADCALL |e| (QREFELT $ 33)) |maxSize| $)))) 

(SDEFUN |FCTOOL;segment|
        ((|l| |List| (|OutputForm|)) ($ |List| (|OutputForm|)))
        (SPROG
         ((|s| (|List| (|OutputForm|))) (|exprs| (|List| (|OutputForm|)))
          (|var| (|OutputForm|)) (|args| (|List| (|OutputForm|)))
          (|e1s| (|Symbol|)) (|e1f| (|OutputForm|)) (#1=#:G619 NIL) (|e| NIL))
         (SEQ
          (COND ((NULL |$fortranSegment|) |l|)
                ('T
                 (SEQ (LETT |s| NIL)
                      (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 30))
                               (LETT |s| (CONS |e| |s|)))
                              ('T
                               (SEQ (LETT |e1f| (SPADCALL |e| (QREFELT $ 31)))
                                    (COND
                                     ((NULL (SPADCALL |e1f| (QREFELT $ 45)))
                                      (EXIT (LETT |s| (CONS |e| |s|)))))
                                    (LETT |e1s|
                                          (SPADCALL |e1f| (QREFELT $ 46)))
                                    (LETT |args| (SPADCALL |e| (QREFELT $ 33)))
                                    (EXIT
                                     (COND
                                      ((EQUAL |e1s| '=)
                                       (SEQ
                                        (LETT |var|
                                              (SPADCALL |args| 1
                                                        (QREFELT $ 35)))
                                        (LETT |exprs|
                                              (|FCTOOL;segment1|
                                               (SPADCALL |args| 2
                                                         (QREFELT $ 35))
                                               (-
                                                (|sub_SI|
                                                 |$maximumFortranExpressionLength|
                                                 1)
                                                (|FCTOOL;fortExpSize| |var| $))
                                               $))
                                        (EXIT
                                         (LETT |s|
                                               (CONS
                                                (SPADCALL |e1f|
                                                          (LIST |var|
                                                                (|SPADfirst|
                                                                 |exprs|))
                                                          (QREFELT $ 50))
                                                (SPADCALL (CDR |exprs|) |s|
                                                          (QREFELT $ 51)))))))
                                      ((EQUAL |e1s| 'RETURN)
                                       (SEQ
                                        (LETT |exprs|
                                              (|FCTOOL;segment1|
                                               (SPADCALL |args| 1
                                                         (QREFELT $ 35))
                                               (-
                                                (|sub_SI|
                                                 |$maximumFortranExpressionLength|
                                                 2)
                                                (|FCTOOL;fortExpSize|
                                                 (SPADCALL |args| 1
                                                           (QREFELT $ 35))
                                                 $))
                                               $))
                                        (EXIT
                                         (LETT |s|
                                               (CONS
                                                (SPADCALL |e1f|
                                                          (LIST
                                                           (|SPADfirst|
                                                            |exprs|))
                                                          (QREFELT $ 50))
                                                (SPADCALL (CDR |exprs|) |s|
                                                          (QREFELT $ 51)))))))
                                      ('T (LETT |s| (CONS |e| |s|))))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |s|)))))))) 

(SDEFUN |FCTOOL;fortError2| ((|msg| |String|) (|e| |OutputForm|) ($ |Exit|))
        (SEQ (|sayErrorly| "Fortran translation error" |msg|) (|mathPrint| |e|)
             (EXIT (|error| "")))) 

(SDEFUN |FCTOOL;fortError1| ((|e| |OutputForm|) ($ |Exit|))
        (|FCTOOL;fortError2| "   No corresponding Fortran structure for:" |e|
         $)) 

(SDEFUN |FCTOOL;fortError1l|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) ($ |Exit|))
        (|FCTOOL;fortError1|
         (SPADCALL (SPADCALL |op| (QREFELT $ 47)) |args| (QREFELT $ 50)) $)) 

(SDEFUN |FCTOOL;push_expr_stack| ((|e| |OutputForm|) ($ |Void|))
        (SETELT $ 53 (CONS |e| (QREFELT $ 53)))) 

(SDEFUN |FCTOOL;pop_expr_stack| (($ |OutputForm|))
        (SPROG ((|res| (|OutputForm|)))
               (SEQ (LETT |res| (|SPADfirst| (QREFELT $ 53)))
                    (SETELT $ 53 (CDR (QREFELT $ 53))) (EXIT |res|)))) 

(SDEFUN |FCTOOL;clear_used_intrinsics;V;24| (($ |Void|)) (SETELT $ 54 NIL)) 

(SDEFUN |FCTOOL;get_used_intrinsics;L;25| (($ |List| (|String|)))
        (SPROG ((#1=#:G631 NIL) (|sy| NIL) (#2=#:G630 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sy| NIL) (LETT #1# (QREFELT $ 54)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sy| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |sy| (QREFELT $ 57)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;record_intrinsic| ((|sy| |Symbol|) ($ |Void|))
        (COND
         ((NULL (SPADCALL |sy| (QREFELT $ 54) (QREFELT $ 60)))
          (SETELT $ 54 (CONS |sy| (QREFELT $ 54)))))) 

(SDEFUN |FCTOOL;fortranifyIntrinsicFunctionName|
        ((|sy| |Symbol|) (|nargs| |Integer|) ($ |Symbol|))
        (SPROG
         ((#1=#:G645 NIL) (#2=#:G646 NIL) (|r1| NIL)
          (|use_double| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |use_double|
                  (COND (|$useIntrinsicFunctions| NIL)
                        (#3='T (EQUAL |$fortranPrecision| '|double|))))
            (COND
             ((EQUAL |sy| '|atan|)
              (COND
               ((EQL |nargs| 2)
                (EXIT
                 (COND
                  (|$useIntrinsicFunctions|
                   (SEQ (|FCTOOL;record_intrinsic| 'ATAN2 $) (EXIT 'ATAN2)))
                  (|use_double| 'DATAN2) (#3# 'ATAN2)))))))
            (SEQ (LETT |r1| NIL) (LETT #2# (QREFELT $ 61)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |r1| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL (QVELT |r1| 0) |sy|)
                     (COND
                      (|$useIntrinsicFunctions|
                       (SEQ (|FCTOOL;record_intrinsic| (QVELT |r1| 1) $)
                            (EXIT
                             (PROGN
                              (LETT #1# (QVELT |r1| 1))
                              (GO #4=#:G644)))))
                      (|use_double| (PROGN (LETT #1# (QVELT |r1| 2)) (GO #4#)))
                      ('T (PROGN (LETT #1# (QVELT |r1| 1)) (GO #4#))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT |sy|)))
          #4# (EXIT #1#)))) 

(SDEFUN |FCTOOL;fortranifyFunctionName|
        ((|sy| |Symbol|) (|nargs| |Integer|) ($ |Symbol|))
        (SPROG ((#1=#:G652 NIL) (#2=#:G653 NIL) (|p1| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |p1| NIL) (LETT #2# (QREFELT $ 62)) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |p1| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQUAL (QCAR |p1|) |sy|)
                           (PROGN (LETT #1# (QCDR |p1|)) (GO #3=#:G651))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (|FCTOOL;fortranifyIntrinsicFunctionName| |sy| |nargs| $))))
                #3# (EXIT #1#)))) 

(SDEFUN |FCTOOL;mkFortFn|
        ((|name| . #1=(|OutputForm|)) (|args| |List| (|OutputForm|))
         (|nargs| |Integer|) ($ |OutputForm|))
        (SPROG ((#2=#:G660 NIL) (|arg| NIL) (#3=#:G659 NIL) (|nn| #1#))
               (SEQ
                (LETT |nn|
                      (COND ((NULL (SPADCALL |name| (QREFELT $ 45))) |name|)
                            ('T
                             (SPADCALL
                              (|FCTOOL;fortranifyFunctionName|
                               (SPADCALL |name| (QREFELT $ 46)) |nargs| $)
                              (QREFELT $ 47)))))
                (EXIT
                 (SPADCALL |nn|
                           (PROGN
                            (LETT #3# NIL)
                            (SEQ (LETT |arg| NIL) (LETT #2# |args|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |arg| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS (|FCTOOL;fortPre1| |arg| $)
                                               #3#))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           (QREFELT $ 50)))))) 

(SDEFUN |FCTOOL;mkMat| ((|args| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ (LETT |save_fortInts2Floats| |$fortInts2Floats|)
                    (EXIT
                     (|finally|
                      (SEQ (SETF |$fortInts2Floats| NIL)
                           (EXIT
                            (|FCTOOL;mkFortFn| (|SPADfirst| |args|)
                             (CDR |args|) (LENGTH (CDR |args|)) $)))
                      (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;fortPreRoot| ((|e| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ (LETT |save_fortInts2Floats| |$fortInts2Floats|)
                    (EXIT
                     (|finally|
                      (SEQ (SETF |$fortInts2Floats| 'T)
                           (EXIT (|FCTOOL;fortPre1| |e| $)))
                      (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;exp2FortSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|nargs| |Integer|)
         ($ |OutputForm|))
        (SPROG
         ((|as1| (|OutputForm|)) (#1=#:G745 NIL) (|c| NIL) (|cx| NIL)
          (|rx_f| (|OutputForm|)) (#2=#:G744 NIL) (|r| NIL) (|rx| NIL)
          (|si| (|Integer|)) (|rows| (|List| (|OutputForm|)))
          (|var| (|OutputForm|)) (#3=#:G743 NIL) (|e| NIL) (|i| NIL)
          (|elts| #4=(|List| (|OutputForm|))) (#5=#:G742 NIL) (|ii| NIL)
          (|i2| #6=(|Integer|)) (|i1| #6#) (|sArgs| #4#)
          (|sOp| #7=(|OutputForm|)) (|op1| #7#) (|old_Ints2Floats| (|Boolean|))
          (|tailPart| (|List| (|String|))) (#8=#:G741 NIL) (|x| NIL)
          (#9=#:G740 NIL) (|n_args| #4#) (|arg| (|OutputForm|)))
         (SEQ
          (COND
           ((EQUAL |op| 'CONCAT)
            (COND
             ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 35)) (QREFELT $ 45))
              (COND
               ((SPADCALL
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 35)) (QREFELT $ 46))
                 (LIST '< '> '<= '>= '~ '|and| '|or|) (QREFELT $ 60))
                (EXIT
                 (SEQ
                  (LETT |n_args|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 35))
                                    (QREFELT $ 33))
                          1 (QREFELT $ 35))
                         (QREFELT $ 33)))
                  (EXIT
                   (|FCTOOL;mkFortFn| (|SPADfirst| |args|) |n_args|
                    (LENGTH |n_args|) $))))))))))
          (COND
           ((EQUAL |op| 'CONCAT)
            (COND
             ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 35)) (QREFELT $ 45))
              (COND
               ((EQUAL
                 (SPADCALL (SPADCALL |args| 2 (QREFELT $ 35)) (QREFELT $ 46))
                 'EQ)
                (EXIT
                 (|FCTOOL;mkFortFn| (SPADCALL |args| 2 (QREFELT $ 35))
                  (LIST (|SPADfirst| |args|)
                        (SPADCALL |args| 3 (QREFELT $ 35)))
                  2 $))))))))
          (EXIT
           (COND
            ((EQUAL |op| 'QUOTE)
             (COND
              ((SPADCALL (LETT |arg| (|SPADfirst| |args|)) (QREFELT $ 30))
               (STRINGIMAGE |arg|))
              (#10='T
               (SEQ (LETT |n_args| (SPADCALL |arg| (QREFELT $ 33)))
                    (LETT |tailPart|
                          (PROGN
                           (LETT #9# NIL)
                           (SEQ (LETT |x| NIL) (LETT #8# |n_args|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |x| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #9#
                                        (CONS
                                         (STRCONC ","
                                                  (SPADCALL |x|
                                                            (QREFELT $ 63)))
                                         #9#))))
                                (LETT #8# (CDR #8#)) (GO G190) G191
                                (EXIT (NREVERSE #9#)))))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS "["
                             (CONS
                              (SPADCALL (SPADCALL |arg| (QREFELT $ 31))
                                        (QREFELT $ 63))
                              (SPADCALL |tailPart| (CONS "]" NIL)
                                        (QREFELT $ 25))))
                       (QREFELT $ 64))
                      (QREFELT $ 65)))))))
            ((EQUAL |op| 'PAREN)
             (SEQ
              (LETT |op1|
                    (SPADCALL (SPADCALL |args| 1 (QREFELT $ 35))
                              (QREFELT $ 31)))
              (COND
               ((SPADCALL |op1| (QREFELT $ 45))
                (COND
                 ((NULL (EQUAL (SPADCALL |op1| (QREFELT $ 46)) 'CONCATB))
                  (EXIT
                   (|FCTOOL;fortPre1| (SPADCALL |args| 1 (QREFELT $ 35)) $)))))
               (#10#
                (EXIT
                 (|FCTOOL;fortPre1| (SPADCALL |args| 1 (QREFELT $ 35)) $))))
              (EXIT
               (|FCTOOL;mkMat|
                (SPADCALL (SPADCALL |args| 1 (QREFELT $ 35)) (QREFELT $ 33))
                $))))
            ((EQUAL |op| 'SUB)
             (SEQ (LETT |old_Ints2Floats| |$fortInts2Floats|)
                  (EXIT
                   (|finally|
                    (SEQ (SETF |$fortInts2Floats| NIL)
                         (EXIT
                          (|FCTOOL;mkFortFn| (|SPADfirst| |args|) (CDR |args|)
                           (LENGTH (CDR |args|)) $)))
                    (SETF |$fortInts2Floats| |old_Ints2Floats|)))))
            ((OR (EQUAL |op| 'BRACE) (EQUAL |op| 'BRACKET))
             (SEQ
              (COND
               ((EQL (LENGTH |args|) 2)
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |args| 2 (QREFELT $ 35))
                             (QREFELT $ 30)))
                  (COND
                   ((SPADCALL
                     (LETT |op1|
                           (SPADCALL (SPADCALL |args| 2 (QREFELT $ 35))
                                     (QREFELT $ 31)))
                     (QREFELT $ 45))
                    (COND
                     ((EQUAL (SPADCALL |op1| (QREFELT $ 46)) 'AGGLST)
                      (EXIT
                       (SEQ (LETT |var| (SPADCALL |args| 1 (QREFELT $ 35)))
                            (LETT |elts|
                                  (SPADCALL (SPADCALL |args| 2 (QREFELT $ 35))
                                            (QREFELT $ 33)))
                            (LETT |si| |$fortranArrayStartingIndex|)
                            (COND
                             ((EQL (LENGTH |elts|) 1)
                              (COND
                               ((NULL
                                 (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 35))
                                           (QREFELT $ 30)))
                                (SEQ
                                 (LETT |sOp|
                                       (SPADCALL
                                        (SPADCALL |elts| 1 (QREFELT $ 35))
                                        (QREFELT $ 31)))
                                 (LETT |sArgs|
                                       (SPADCALL
                                        (SPADCALL |elts| 1 (QREFELT $ 35))
                                        (QREFELT $ 33)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |sOp| (QREFELT $ 45))
                                    (COND
                                     ((EQUAL (SPADCALL |sOp| (QREFELT $ 46))
                                             'SEGMENT)
                                      (COND
                                       ((EQL (LENGTH |sArgs|) 1)
                                        (|FCTOOL;fortError1|
                                         (|SPADfirst| |elts|) $))
                                       (#10#
                                        (SEQ
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |sArgs| 1 (QREFELT $ 35))
                                            (QREFELT $ 66))
                                           (COND
                                            ((NULL
                                              (SPADCALL
                                               (SPADCALL |sArgs| 2
                                                         (QREFELT $ 35))
                                               (QREFELT $ 66)))
                                             (EXIT
                                              (|FCTOOL;fortError2|
                                               #11="   Cannot expand segment: "
                                               (|SPADfirst| |elts|) $)))))
                                          (#10#
                                           (EXIT
                                            (|FCTOOL;fortError2| #11#
                                             (|SPADfirst| |elts|) $))))
                                         (LETT |i1|
                                               (SPADCALL
                                                (SPADCALL |sArgs| 1
                                                          (QREFELT $ 35))
                                                (QREFELT $ 67)))
                                         (LETT |i2|
                                               (SPADCALL
                                                (SPADCALL |sArgs| 2
                                                          (QREFELT $ 35))
                                                (QREFELT $ 67)))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |i1| |i2| (QREFELT $ 37))
                                            (|FCTOOL;fortError1|
                                             (SPADCALL
                                              "Lower bound of segment exceeds upper bound."
                                              (QREFELT $ 65))
                                             $))
                                           (#10#
                                            (SEQ
                                             (SEQ (LETT |i| |si|)
                                                  (LETT |ii| |i1|)
                                                  (LETT #5# |i2|) G190
                                                  (COND
                                                   ((> |ii| #5#) (GO G191)))
                                                  (SEQ
                                                   (LETT |as1|
                                                         (|FCTOOL;mk_assign2|
                                                          (SPADCALL |var|
                                                                    (LIST
                                                                     (SPADCALL
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 68)))
                                                                    (QREFELT $
                                                                             50))
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |ii|
                                                                     (QREFELT $
                                                                              68))
                                                           $)
                                                          $))
                                                   (EXIT
                                                    (|FCTOOL;push_expr_stack|
                                                     |as1| $)))
                                                  (LETT |ii|
                                                        (PROG1 (+ |ii| 1)
                                                          (LETT |i|
                                                                (+ |i| 1))))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |elts|
                                                    NIL)))))))))))))))))))
                            (SEQ (LETT |i| |si|) (LETT |e| NIL)
                                 (LETT #3# |elts|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |e| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |as1|
                                        (|FCTOOL;mk_assign2|
                                         (SPADCALL |var|
                                                   (LIST
                                                    (SPADCALL |i|
                                                              (QREFELT $ 68)))
                                                   (QREFELT $ 50))
                                         (|FCTOOL;fortPre1| |e| $) $))
                                  (EXIT (|FCTOOL;push_expr_stack| |as1| $)))
                                 (LETT #3#
                                       (PROG1 (CDR #3#) (LETT |i| (+ |i| 1))))
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT (|FCTOOL;pop_expr_stack| $))))))))))))
              (EXIT
               (PROGN
                (|FCTOOL;fortError1l| |op| |args| $)
                (|userError| #12="Did not really exit.")))))
            ((OR (EQUAL |op| 'CONCAT) (EQUAL |op| 'CONCATB))
             (COND ((EQL |nargs| 0) NIL)
                   ((EQL |nargs| 1) (|FCTOOL;fortPre1| (|SPADfirst| |args|) $))
                   (#10#
                    (SEQ
                     (COND
                      ((EQL |nargs| 2)
                       (COND
                        ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 35))
                                   (QREFELT $ 45))
                         (COND
                          ((EQUAL
                            (SPADCALL (SPADCALL |args| 2 (QREFELT $ 35))
                                      (QREFELT $ 46))
                            '!)
                           (EXIT
                            (|FCTOOL;mkFortFn| 'FACTORIAL
                             (LIST (|SPADfirst| |args|)) 1 $))))))))
                     (EXIT
                      (PROGN
                       (|FCTOOL;fortError1l| |op| |args| $)
                       (|userError| #12#)))))))
            ('T
             (COND
              ((EQUAL |op| 'MATRIX)
               (SEQ (LETT |var| (SPADCALL |args| 1 (QREFELT $ 35)))
                    (LETT |rows| (CDR (CDR |args|)))
                    (LETT |si| |$fortranArrayStartingIndex|)
                    (SEQ (LETT |rx| |si|) (LETT |r| NIL) (LETT #2# |rows|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |rx_f| (SPADCALL |rx| (QREFELT $ 68)))
                              (EXIT
                               (SEQ (LETT |cx| |si|) (LETT |c| NIL)
                                    (LETT #1# (SPADCALL |r| (QREFELT $ 33)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |c| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |as1|
                                           (|FCTOOL;mk_assign2|
                                            (SPADCALL |var|
                                                      (LIST |rx_f|
                                                            (SPADCALL |cx|
                                                                      (QREFELT
                                                                       $ 68)))
                                                      (QREFELT $ 50))
                                            (|FCTOOL;fortPre1| |c| $) $))
                                     (EXIT (|FCTOOL;push_expr_stack| |as1| $)))
                                    (LETT #1#
                                          (PROG1 (CDR #1#)
                                            (LETT |cx| (+ |cx| 1))))
                                    (GO G190) G191 (EXIT NIL))))
                         (LETT #2# (PROG1 (CDR #2#) (LETT |rx| (+ |rx| 1))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT (|FCTOOL;pop_expr_stack| $))))
              (#10#
               (PROGN
                (|FCTOOL;fortError1l| |op| |args| $)
                (|userError| #12#)))))))))) 

(SDEFUN |FCTOOL;is_imaginary| ((|x| |OutputForm|) ($ |Boolean|))
        (COND ((NULL (SPADCALL |x| (QREFELT $ 45))) NIL)
              ('T (EQUAL (SPADCALL |x| (QREFELT $ 46)) '|%i|)))) 

(SDEFUN |FCTOOL;fix2FortranFloat| ((|i| |Integer|) ($ |OutputForm|))
        (SPROG ((|ss| (|String|)))
               (SEQ (LETT |ss| (STRINGIMAGE |i|))
                    (LETT |ss|
                          (STRCONC |ss|
                                   (COND
                                    ((EQUAL |$fortranPrecision| '|double|)
                                     ".0D0")
                                    ('T ".0"))))
                    (EXIT (SPADCALL |ss| (QREFELT $ 65)))))) 

(SDEFUN |FCTOOL;checkPrecision1| ((|s| |String|) ($ |String|))
        (SPROG ((|p2| #1=(|Integer|)) (|p1| #1#) (|s2| (|String|)))
               (SEQ
                (COND
                 ((|eql_SI| (SPADCALL |s| 1 (QREFELT $ 72))
                            (|STR_to_CHAR| "\""))
                  |s|)
                 (#2='T
                  (SEQ
                   (LETT |s2|
                         (SPADCALL (|STR_to_CHAR| " ")
                                   (SPADCALL (|STR_to_CHAR| "_") |s|
                                             (QREFELT $ 74))
                                   (QREFELT $ 74)))
                   (LETT |p1|
                         (SPADCALL (|STR_to_CHAR| ".") |s2| (QREFELT $ 75)))
                   (EXIT
                    (COND ((< |p1| 1) |s|)
                          ((SPADCALL |$fortranPrecision| '|double|
                                     (QREFELT $ 76))
                           |s2|)
                          (#2#
                           (SEQ
                            (LETT |p2|
                                  (SPADCALL (|STR_to_CHAR| "E") |s2|
                                            (QREFELT $ 75)))
                            (EXIT
                             (COND
                              ((SPADCALL |p2| 0 (QREFELT $ 37))
                               (SEQ
                                (SPADCALL |s2| |p2|
                                          (SPADCALL "D" 1 (QREFELT $ 72))
                                          (QREFELT $ 77))
                                (EXIT |s2|)))
                              (#2# (STRCONC |s2| "D0")))))))))))))) 

(SDEFUN |FCTOOL;checkPrecision| ((|s| |String|) ($ |OutputForm|))
        (SPADCALL (|FCTOOL;checkPrecision1| |s| $) (QREFELT $ 65))) 

(SDEFUN |FCTOOL;fortPre1| ((|e| |OutputForm|) ($ . #1=(|OutputForm|)))
        (SPROG
         ((|n_args| #2=(|List| (|OutputForm|))) (|arg2| #3=(|OutputForm|))
          (|arg1| #3#) (|im_op| (|OutputForm|)) (|binaryExpr| #1#)
          (#4=#:G803 NIL) (|e1| NIL) (|op| (|OutputForm|)) (|sy| #5=(|Symbol|))
          (#6=#:G802 NIL) (|sr| #5#) (|exponent| #3#) (|rand| #3#) (|args| #2#)
          (|ss| (|String|)) (|ii| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |e| (QREFELT $ 30))
             (COND
              ((SPADCALL |e| (QREFELT $ 66))
               (COND
                (|$fortInts2Floats|
                 (SEQ (LETT |ii| (SPADCALL |e| (QREFELT $ 67)))
                      (EXIT
                       (COND ((>= |ii| 0) (|FCTOOL;fix2FortranFloat| |ii| $))
                             (#7='T
                              (SPADCALL (SPADCALL '- (QREFELT $ 78))
                                        (LIST
                                         (|FCTOOL;fix2FortranFloat| (- |ii|)
                                          $))
                                        (QREFELT $ 50)))))))
                (#7# |e|)))
              ((SPADCALL |e| (QREFELT $ 79))
               (|FCTOOL;checkPrecision| (SPADCALL |e| (QREFELT $ 63)) $))
              ((SPADCALL |e| (QREFELT $ 45))
               (SEQ (LETT |sy| (SPADCALL |e| (QREFELT $ 46)))
                    (EXIT
                     (COND
                      ((EQUAL |sy| '|%e|)
                       (|FCTOOL;fortPre1|
                        (SPADCALL (SPADCALL '|exp| (QREFELT $ 47))
                                  (LIST (SPADCALL 1 (QREFELT $ 68)))
                                  (QREFELT $ 50))
                        $))
                      ((EQUAL |sy| '|%i|)
                       (SPADCALL (SPADCALL 'CMPLX (QREFELT $ 47))
                                 (LIST
                                  (|FCTOOL;fortPre1|
                                   (SPADCALL 0 (QREFELT $ 68)) $)
                                  (|FCTOOL;fortPre1|
                                   (SPADCALL 1 (QREFELT $ 68)) $))
                                 (QREFELT $ 50)))
                      (#7#
                       (SEQ (LETT |ss| (SPADCALL |sy| (QREFELT $ 57)))
                            (EXIT
                             (COND
                              ((|eql_SI| (SPADCALL |ss| 1 (QREFELT $ 72))
                                         (|STR_to_CHAR| "%"))
                               (SPADCALL
                                (SPADCALL |ss| (SPADCALL 2 (QREFELT $ 81))
                                          (QREFELT $ 82))
                                (QREFELT $ 65)))
                              (#7# |e|)))))))))
              (#7# |e|)))
            (#7#
             (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 31)))
                  (LETT |args| (SPADCALL |e| (QREFELT $ 33)))
                  (EXIT
                   (COND
                    ((SPADCALL |op| (QREFELT $ 45))
                     (SEQ (LETT |sy| (SPADCALL |op| (QREFELT $ 46)))
                          (EXIT
                           (COND
                            ((EQUAL |sy| '^)
                             (SEQ
                              (LETT |rand| (SPADCALL |args| 1 (QREFELT $ 35)))
                              (LETT |exponent|
                                    (SPADCALL |args| 2 (QREFELT $ 35)))
                              (COND
                               ((SPADCALL |rand| (QREFELT $ 45))
                                (SEQ
                                 (LETT |sr| (SPADCALL |rand| (QREFELT $ 46)))
                                 (EXIT
                                  (COND
                                   ((EQUAL |sr| '|%e|)
                                    (PROGN
                                     (LETT #6#
                                           (|FCTOOL;fortPre1|
                                            (SPADCALL
                                             (SPADCALL '|exp| (QREFELT $ 47))
                                             (LIST |exponent|) (QREFELT $ 50))
                                            $))
                                     (GO #8=#:G801)))
                                   ((SPADCALL |exponent| (QREFELT $ 66))
                                    (COND
                                     ((EQL (SPADCALL |exponent| (QREFELT $ 67))
                                           2)
                                      (PROGN
                                       (LETT #6#
                                             (SPADCALL
                                              (SPADCALL '* (QREFELT $ 47))
                                              (LIST |rand| |rand|)
                                              (QREFELT $ 50)))
                                       (GO #8#))))))))))
                              (COND
                               ((SPADCALL |exponent| (QREFELT $ 66))
                                (COND
                                 ((< (ABS (SPADCALL |exponent| (QREFELT $ 67)))
                                     32768)
                                  (EXIT
                                   (SPADCALL (QREFELT $ 70)
                                             (LIST (|FCTOOL;fortPre1| |rand| $)
                                                   |exponent|)
                                             (QREFELT $ 50)))))))
                              (EXIT
                               (SPADCALL (QREFELT $ 70)
                                         (LIST (|FCTOOL;fortPre1| |rand| $)
                                               (|FCTOOL;fortPre1| |exponent|
                                                $))
                                         (QREFELT $ 50)))))
                            ((EQUAL |sy| 'ROOT)
                             (COND
                              ((EQL (LENGTH |args|) 1)
                               (|FCTOOL;fortPreRoot|
                                (SPADCALL (SPADCALL '|sqrt| (QREFELT $ 47))
                                          (LIST (|SPADfirst| |args|))
                                          (QREFELT $ 50))
                                $))
                              (#7#
                               (SPADCALL (QREFELT $ 70)
                                         (LIST
                                          (|FCTOOL;fortPreRoot|
                                           (|SPADfirst| |args|) $)
                                          (SPADCALL
                                           (SPADCALL '/ (QREFELT $ 47))
                                           (LIST (SPADCALL 1 (QREFELT $ 68))
                                                 (|FCTOOL;fortPreRoot|
                                                  (SPADCALL |args| 2
                                                            (QREFELT $ 35))
                                                  $))
                                           (QREFELT $ 50)))
                                         (QREFELT $ 50)))))
                            (#7#
                             (SEQ
                              (COND
                               ((OR (EQUAL |sy| 'OVER) (EQUAL |sy| 'SLASH))
                                (SEQ (LETT |sy| '/)
                                     (EXIT
                                      (LETT |op|
                                            (SPADCALL |sy| (QREFELT $ 47)))))))
                              (EXIT
                               (COND
                                ((SPADCALL |sy| (QREFELT $ 69) (QREFELT $ 60))
                                 (|FCTOOL;exp2FortSpecial| |sy| |args|
                                  (LENGTH |args|) $))
                                (#7#
                                 (SEQ
                                  (COND
                                   ((SPADCALL |sy| (LIST '* '+ '-)
                                              (QREFELT $ 60))
                                    (COND
                                     ((SPADCALL (LENGTH |args|) 2
                                                (QREFELT $ 83))
                                      (EXIT
                                       (SEQ
                                        (LETT |binaryExpr|
                                              (|FCTOOL;fortPre1|
                                               (SPADCALL |op|
                                                         (LIST
                                                          (SPADCALL |args| 1
                                                                    (QREFELT $
                                                                             35))
                                                          (SPADCALL |args| 2
                                                                    (QREFELT $
                                                                             35)))
                                                         (QREFELT $ 50))
                                               $))
                                        (SEQ (LETT |e1| NIL)
                                             (LETT #4# (CDR (CDR |args|))) G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |e1| (CAR #4#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |binaryExpr|
                                                     (SPADCALL |op|
                                                               (LIST
                                                                |binaryExpr|
                                                                (|FCTOOL;fortPre1|
                                                                 |e1| $))
                                                               (QREFELT $
                                                                        50)))))
                                             (LETT #4# (CDR #4#)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT |binaryExpr|)))))))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |args|) 2)
                                     (SEQ
                                      (LETT |im_op|
                                            (SPADCALL 'CMPLX (QREFELT $ 47)))
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 35)))
                                      (LETT |arg2|
                                            (SPADCALL |args| 2 (QREFELT $ 35)))
                                      (EXIT
                                       (COND
                                        ((|FCTOOL;is_imaginary| |arg2| $)
                                         (COND
                                          ((EQUAL |sy| '*)
                                           (SPADCALL |im_op|
                                                     (LIST
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL 0
                                                                 (QREFELT $
                                                                          68))
                                                       $)
                                                      (|FCTOOL;fortPre1| |arg1|
                                                       $))
                                                     (QREFELT $ 50)))
                                          ((EQUAL |sy| '+)
                                           (SPADCALL |im_op|
                                                     (LIST
                                                      (|FCTOOL;fortPre1| |arg1|
                                                       $)
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL 1
                                                                 (QREFELT $
                                                                          68))
                                                       $))
                                                     (QREFELT $ 50)))
                                          (#7#
                                           (|FCTOOL;mkFortFn| |op| |args| 2
                                            $))))
                                        ((NULL (EQUAL |sy| '+))
                                         (|FCTOOL;mkFortFn| |op| |args| 2 $))
                                        ('T
                                         (COND
                                          ((|FCTOOL;same_subtree2| '* |arg2| $)
                                           (SEQ
                                            (LETT |n_args|
                                                  (SPADCALL |arg2|
                                                            (QREFELT $ 33)))
                                            (EXIT
                                             (COND
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 2
                                                          (QREFELT $ 35))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg1| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 1
                                                                     (QREFELT $
                                                                              35))
                                                           $))
                                                         (QREFELT $ 50)))
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 1
                                                          (QREFELT $ 35))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg1| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 2
                                                                     (QREFELT $
                                                                              35))
                                                           $))
                                                         (QREFELT $ 50)))
                                              (#7#
                                               (|FCTOOL;mkFortFn| |op| |args| 2
                                                $))))))
                                          ((|FCTOOL;same_subtree2| '* |arg1| $)
                                           (SEQ
                                            (LETT |n_args|
                                                  (SPADCALL |arg1|
                                                            (QREFELT $ 33)))
                                            (EXIT
                                             (COND
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 2
                                                          (QREFELT $ 35))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg2| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 1
                                                                     (QREFELT $
                                                                              35))
                                                           $))
                                                         (QREFELT $ 50)))
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 1
                                                          (QREFELT $ 35))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg2| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 2
                                                                     (QREFELT $
                                                                              35))
                                                           $))
                                                         (QREFELT $ 50)))
                                              (#7#
                                               (|FCTOOL;mkFortFn| |op| |args| 2
                                                $))))))
                                          (#7#
                                           (|FCTOOL;mkFortFn| |op| |args| 2
                                            $))))))))
                                    (#7#
                                     (|FCTOOL;mkFortFn| |op| |args|
                                      (LENGTH |args|) $))))))))))))))
                    (#7#
                     (|FCTOOL;mkFortFn| |op| |args| (LENGTH |args|) $))))))))
          #8# (EXIT #6#)))) 

(SDEFUN |FCTOOL;fortPre|
        ((|l| |List| (|OutputForm|)) ($ |List| (|OutputForm|)))
        (SPROG
         ((|res| (|List| (|OutputForm|))) (|new| (|OutputForm|))
          (#1=#:G808 NIL) (|e| NIL))
         (SEQ (SETELT $ 53 NIL)
              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |new| (|FCTOOL;fortPre1| |e| $))
                        (EXIT (|FCTOOL;push_expr_stack| |new| $)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (NREVERSE (QREFELT $ 53))) (SETELT $ 53 NIL)
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;get_fort_indent;I;39| (($ |Integer|)) (QREFELT $ 84)) 

(SDEFUN |FCTOOL;indentFortLevel;IV;40| ((|i| |Integer|) ($ |Void|))
        (SEQ
         (SETF |$maximumFortranExpressionLength|
                 (- |$maximumFortranExpressionLength|
                    (SPADCALL 2 |i| (QREFELT $ 87))))
         (EXIT
          (SETELT $ 84 (+ (QREFELT $ 84) (SPADCALL 2 |i| (QREFELT $ 87))))))) 

(SDEFUN |FCTOOL;make_spaces| ((|x| |Integer|) ($ |String|))
        (SPROG ((#1=#:G813 NIL))
               (|make_full_CVEC|
                (PROG1 (LETT #1# |x|)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                (SPADCALL (QREFELT $ 89))))) 

(SDEFUN |FCTOOL;fortran2Lines1|
        ((|f| |List| (|String|)) (|res| |List| (|String|))
         ($ |List| (|String|)))
        (SPROG
         ((|line| #1=(|String|)) (|ll| (|Integer|)) (|ff| (|String|))
          (|spaceLeft| (|Integer|)) (#2=#:G825 NIL) (|sff| (|Integer|))
          (|contPref| (|String|)) (|normPref| #1#))
         (SEQ (LETT |normPref| (|FCTOOL;make_spaces| (QREFELT $ 84) $))
              (LETT |contPref|
                    (STRCONC "     &"
                             (|FCTOOL;make_spaces| (- (QREFELT $ 84) 6) $)))
              (LETT |ll| (QREFELT $ 84))
              (SEQ G190 (COND ((NULL (NULL (NULL |f|))) (GO G191)))
                   (SEQ (LETT |line| |normPref|) (LETT |ff| (|SPADfirst| |f|))
                        (SEQ
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (+ |ll| (LETT |sff| (QCSIZE |ff|)))
                                    |$fortLength| (QREFELT $ 40))
                                   (SEQ (LETT |ll| (+ |ll| |sff|))
                                        (LETT |line| (STRCONC |line| |ff|))
                                        (LETT |f| (CDR |f|))
                                        (EXIT
                                         (COND
                                          ((NULL |f|)
                                           (PROGN
                                            (LETT #2# |$NoValue|)
                                            (GO #3=#:G820)))
                                          ('T
                                           (LETT |ff| (|SPADfirst| |f|)))))))
                                  ('T
                                   (SEQ
                                    (LETT |spaceLeft| (- |$fortLength| |ll|))
                                    (EXIT
                                     (COND
                                      ((< |spaceLeft| 0)
                                       (|error| "too deep indentation"))
                                      ('T
                                       (SEQ
                                        (LETT |line|
                                              (STRCONC |line|
                                                       (SPADCALL |ff|
                                                                 (SPADCALL 1
                                                                           |spaceLeft|
                                                                           (QREFELT
                                                                            $
                                                                            90))
                                                                 (QREFELT $
                                                                          82))))
                                        (LETT |ff|
                                              (SPADCALL |ff|
                                                        (SPADCALL
                                                         (+ |spaceLeft| 1)
                                                         (QREFELT $ 81))
                                                        (QREFELT $ 82)))
                                        (LETT |res| (CONS |line| |res|))
                                        (LETT |ll| (QREFELT $ 84))
                                        (EXIT
                                         (LETT |line| |contPref|)))))))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #3# (EXIT #2#))
                        (EXIT
                         (COND
                          ((SPADCALL |ll| (QREFELT $ 84) (QREFELT $ 37))
                           (LETT |res| (CONS |line| |res|))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;fort_clean_lines;2L;43|
        ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|nl| (|List| (|String|))) (|res| (|List| (|String|)))
          (|el| (|String|)))
         (SEQ (LETT |nl| NIL) (LETT |res| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |l|) NIL)
                                  ('T
                                   (SPADCALL (LETT |el| (|SPADfirst| |l|)) "%l"
                                             (QREFELT $ 91)))))
                           (GO G191)))
                         (SEQ (LETT |nl| (CONS |el| |nl|))
                              (EXIT (LETT |l| (CDR |l|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND ((NULL (NULL |l|)) (LETT |l| (CDR |l|))))
                    (LETT |res|
                          (|FCTOOL;fortran2Lines1| (NREVERSE |nl|) |res| $))
                    (EXIT (LETT |nl| NIL)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;44|
        ((|int_to_floats?| |Boolean|) (|f| |Mapping| (|List| (|String|)))
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FCTOOL;do_with_error_env2;BML;44!0|
                               (VECTOR $ |f|))
                         (QREFELT $ 94)))) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;44!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |f|) (QREFELT $ 92)))))) 

(SDEFUN |FCTOOL;do_with_error_env3;BML;45|
        ((|int_to_floats?| |Boolean|) (|f| |Mapping| (|List| (|String|)))
         ($ |List| (|String|)))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ (LETT |save_fortInts2Floats| |$fortInts2Floats|)
                    (EXIT
                     (|finally|
                      (SEQ (SETF |$fortInts2Floats| |int_to_floats?|)
                           (EXIT (SPADCALL |f|)))
                      (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;46|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (SPADCALL (SPADCALL |f|) (QREFELT $ 92))) 

(SDEFUN |FCTOOL;beenHere|
        ((|e| |OutputForm|)
         (|n| |Record| (|:| |count| (|SingleInteger|)) (|:| |name| (|Symbol|))
          (|:| |location| #1=(|List| (|OutputForm|))))
         (|fortCsList| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|csl1| (|List| (|OutputForm|))) (|loc| #1#) (|var| (|OutputForm|))
          (|nn| (|SingleInteger|)))
         (SEQ (QSETVELT |n| 0 (LETT |nn| (|add_SI| (QVELT |n| 0) 1)))
              (EXIT
               (COND
                ((|eql_SI| |nn| 2)
                 (SEQ (QSETVELT |n| 1 (SPADCALL (QREFELT $ 16)))
                      (LETT |var| (SPADCALL (QVELT |n| 1) (QREFELT $ 78)))
                      (LETT |loc| (QVELT |n| 2))
                      (COND
                       ((NULL (NULL |loc|))
                        (SEQ
                         (LETT |csl1|
                               (CONS
                                (SPADCALL (SPADCALL '= (QREFELT $ 78))
                                          (LIST |var| |e|) (QREFELT $ 97))
                                (CDR |fortCsList|)))
                         (SPADCALL |fortCsList| (COPY-TREE |csl1|)
                                   (QREFELT $ 98))
                         (EXIT (SPADCALL |loc| |var| (QREFELT $ 99))))))
                      (EXIT |var|)))
                ('T (SPADCALL (QVELT |n| 1) (QREFELT $ 78)))))))) 

(SDEFUN |FCTOOL;exp2FortOptimizeCS1|
        ((|e| |OutputForm|) (|fortCsHash| |None|)
         (|fortCsList| |List| (|OutputForm|)) (|e0| |List| (|OutputForm|))
         ($ |OutputForm|))
        (SPROG
         ((|n1|
           (|Record| (|:| |count| (|SingleInteger|)) (|:| |name| (|Symbol|))
                     (|:| |location| (|List| (|OutputForm|)))))
          (|n| (|None|)) (|sy| (|Symbol|)) (|f| (|List| (|OutputForm|)))
          (#1=#:G866 NIL) (|args| (|List| (|OutputForm|)))
          (|op| (|OutputForm|)))
         (SEQ
          (COND ((SPADCALL |e| (QREFELT $ 30)) |e|)
                (#2='T
                 (SEQ
                  (EXIT
                   (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 31)))
                        (LETT |args| (SPADCALL |e| (QREFELT $ 33)))
                        (COND
                         ((SPADCALL |op| (QREFELT $ 30))
                          (COND ((NULL |args|) (EXIT |e|)))))
                        (COND
                         ((SPADCALL |op| '- (QREFELT $ 100))
                          (COND
                           ((EQL (LENGTH |args|) 1)
                            (COND
                             ((SPADCALL (|SPADfirst| |args|) (QREFELT $ 30))
                              (EXIT |e|)))))))
                        (COND
                         ((SPADCALL |op| (QREFELT $ 45))
                          (COND
                           ((NULL
                             (SPADCALL
                              (LETT |sy| (SPADCALL |op| (QREFELT $ 46)))
                              (LIST 'ROW 'AGGLST) (QREFELT $ 60)))
                            (SEQ (LETT |n| (HGET |fortCsHash| |e|))
                                 (EXIT
                                  (COND
                                   ((NOT (NULL |n|))
                                    (PROGN
                                     (LETT #1#
                                           (|FCTOOL;beenHere| |e| |n|
                                            |fortCsList| $))
                                     (GO #3=#:G863))))))))))
                        (LETT |f| |e|)
                        (SEQ G190 (COND ((NULL (NULL (NULL |f|))) (GO G191)))
                             (SEQ
                              (SPADCALL |f|
                                        (|FCTOOL;exp2FortOptimizeCS1|
                                         (|SPADfirst| |f|) |fortCsHash|
                                         |fortCsList| |f| $)
                                        (QREFELT $ 99))
                              (LETT |f| (CDR |f|))
                              (EXIT (COND ((ATOM |f|) (LETT |f| NIL)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((SPADCALL |op| (QREFELT $ 45))
                          (COND
                           ((SPADCALL
                             (LETT |sy| (SPADCALL |op| (QREFELT $ 46)))
                             (LIST 'ROW 'AGGLST) (QREFELT $ 60))
                            (EXIT |e|)))))
                        (LETT |n| (HGET |fortCsHash| |e|))
                        (EXIT
                         (COND
                          ((NULL |n|)
                           (SEQ (LETT |n1| (VECTOR 1 '|dummy| |e0|))
                                (HPUT |fortCsHash| |e| |n1|) (EXIT |e|)))
                          (#2# (|FCTOOL;beenHere| |e| |n| |fortCsList| $))))))
                  #3# (EXIT #1#))))))) 

(SDEFUN |FCTOOL;exp2FortOptimizeCS|
        ((|e| |OutputForm|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|f| (|OutputForm|)) (|fortCsHash| (|None|))
          (|fortCsList| (|List| (|OutputForm|))))
         (SEQ (LETT |fortCsList| (LIST (SPADCALL (QREFELT $ 101))))
              (LETT |fortCsHash| (MAKE_HASHTABLE 'EQ))
              (LETT |f|
                    (|FCTOOL;exp2FortOptimizeCS1| |e| |fortCsHash| |fortCsList|
                     NIL $))
              (EXIT (NREVERSE (CONS |e| (CDR |fortCsList|))))))) 

(SDEFUN |FCTOOL;exp2FortOptimizeArray|
        ((|e| |OutputForm|) (|exprStack| |List| (|OutputForm|))
         (|fort_name| |Symbol|) ($ . #1=(|OutputForm|)))
        (SPROG
         ((|res1| (|OutputForm|)) (|var| (|OutputForm|))
          (|op2| #2=(|OutputForm|)) (|arg11| #3=(|OutputForm|))
          (|args1| #4=(|List| (|OutputForm|))) (|op1| #2#) (|arg1| #3#)
          (|sy| (|Symbol|)) (|rargs| (|List| #1#)) (#5=#:G885 NIL) (|arg| NIL)
          (#6=#:G884 NIL) (|rop| #1#) (|args| #4#) (|op| #2#))
         (SEQ
          (COND ((SPADCALL |e| (QREFELT $ 30)) |e|)
                (#7='T
                 (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 31)))
                      (LETT |args| (SPADCALL |e| (QREFELT $ 33)))
                      (LETT |rop|
                            (|FCTOOL;exp2FortOptimizeArray| |op| (QREFELT $ 53)
                             |fort_name| $))
                      (LETT |rargs|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |arg| NIL) (LETT #5# |args|) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |arg| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (|FCTOOL;exp2FortOptimizeArray|
                                            |arg| (QREFELT $ 53) |fort_name| $)
                                           #6#))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#)))))
                      (EXIT
                       (COND
                        ((SPADCALL |op| (QREFELT $ 45))
                         (SEQ (LETT |sy| (SPADCALL |op| (QREFELT $ 46)))
                              (EXIT
                               (COND
                                ((SPADCALL |sy| (LIST 'BRACE 'BRACKET)
                                           (QREFELT $ 60))
                                 (COND
                                  ((OR
                                    (OR
                                     (SPADCALL (LENGTH |args|) 1
                                               (QREFELT $ 102))
                                     (SPADCALL
                                      (LETT |arg1| (|SPADfirst| |args|))
                                      (QREFELT $ 30)))
                                    (NULL
                                     (SPADCALL
                                      (LETT |op1|
                                            (SPADCALL |arg1| (QREFELT $ 31)))
                                      'AGGLST (QREFELT $ 100))))
                                   (SPADCALL (QREFELT $ 101)))
                                  ('T
                                   (SEQ
                                    (LETT |args1|
                                          (SPADCALL |arg1| (QREFELT $ 33)))
                                    (COND
                                     ((SPADCALL (LENGTH |args1|) 0
                                                (QREFELT $ 37))
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (LETT |arg11| (|SPADfirst| |args1|))
                                          (QREFELT $ 30)))
                                        (COND
                                         ((SPADCALL
                                           (LETT |op2|
                                                 (SPADCALL |arg11|
                                                           (QREFELT $ 31)))
                                           (QREFELT $ 45))
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |op2| (QREFELT $ 46))
                                             (LIST 'BRACE 'BRACKET)
                                             (QREFELT $ 60))
                                            (EXIT
                                             (PROGN
                                              (|FCTOOL;fortError1| |e| $)
                                              (|userError|
                                               "Did not really exit.")))))))))))
                                    (LETT |var|
                                          (SPADCALL |fort_name|
                                                    (QREFELT $ 78)))
                                    (LETT |res1|
                                          (SPADCALL |op| (CONS |var| |rargs|)
                                                    (QREFELT $ 97)))
                                    (SPADCALL (QREFELT $ 53)
                                              (CONS |res1|
                                                    (CDR (QREFELT $ 53)))
                                              (QREFELT $ 98))
                                    (EXIT |var|)))))
                                ((EQUAL |sy| 'MATRIX)
                                 (SEQ
                                  (LETT |var|
                                        (SPADCALL |fort_name| (QREFELT $ 78)))
                                  (LETT |res1|
                                        (SPADCALL |op| (CONS |var| |rargs|)
                                                  (QREFELT $ 97)))
                                  (SPADCALL (QREFELT $ 53)
                                            (CONS |res1| (CDR (QREFELT $ 53)))
                                            (QREFELT $ 98))
                                  (EXIT |var|)))
                                (#7#
                                 (SPADCALL |rop| |rargs| (QREFELT $ 97)))))))
                        (#7# (SPADCALL |rop| |rargs| (QREFELT $ 97))))))))))) 

(SDEFUN |FCTOOL;exp2FortOptimize|
        ((|e| |OutputForm|) (|fort_name| |Symbol|) ($ |List| (|OutputForm|)))
        (SPROG ((|e2| #1=(|OutputForm|)) (#2=#:G893 NIL) (|e1| #1#))
               (SEQ (SETELT $ 53 (LIST (SPADCALL (QREFELT $ 101))))
                    (EXIT
                     (COND ((SPADCALL |e| (QREFELT $ 30)) (LIST |e|))
                           ((EQL |$fortranOptimizationLevel| 0)
                            (SEQ
                             (LETT |e1|
                                   (|FCTOOL;exp2FortOptimizeArray| |e|
                                    (QREFELT $ 53) |fort_name| $))
                             (EXIT
                              (NREVERSE (CONS |e1| (CDR (QREFELT $ 53)))))))
                           ('T
                            (SEQ (LETT |e| (|minimalise| |e|))
                                 (SEQ (LETT |e1| NIL)
                                      (LETT #2#
                                            (|FCTOOL;exp2FortOptimizeCS| |e|
                                             $))
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |e1| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |e2|
                                             (|FCTOOL;exp2FortOptimizeArray|
                                              |e1| (QREFELT $ 53) |fort_name|
                                              $))
                                       (EXIT
                                        (SPADCALL (QREFELT $ 53)
                                                  (CONS |e2|
                                                        (CDR (QREFELT $ 53)))
                                                  (QREFELT $ 98))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (NREVERSE (CDR (QREFELT $ 53))))))))))) 

(SDEFUN |FCTOOL;expression2Fortran1;MOfBL;52|
        ((|nf| |Mapping| (|Symbol|)) (|of| |OutputForm|)
         (|int_to_floats?| |Boolean|) ($ |List| (|String|)))
        (SPROG
         ((|ol| (|List| (|OutputForm|)))
          (|save_tmp_var_index| (|SingleInteger|))
          (|save_fortInts2Floats| (|Boolean|)))
         (SEQ (LETT |save_fortInts2Floats| |$fortInts2Floats|)
              (LETT |save_tmp_var_index| (QREFELT $ 6))
              (EXIT
               (|finally|
                (SEQ (SETF |$fortInts2Floats| NIL) (SETELT $ 6 0)
                     (LETT |ol|
                           (|FCTOOL;exp2FortOptimize|
                            (SPADCALL |of| (QREFELT $ 103)) (SPADCALL |nf|) $))
                     (EXIT
                      (|FCTOOL;fortranCleanUp|
                       (|FCTOOL;exp2Fort1|
                        (|FCTOOL;segment| (|FCTOOL;fortPre| |ol| $) $) $)
                       $)))
                (SEQ (SETF |$fortInts2Floats| |save_fortInts2Floats|)
                     (EXIT (SETELT $ 6 |save_tmp_var_index|)))))))) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;53|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL (LIST #'|FCTOOL;statement2Fortran;OfL;53!0|) |of| NIL
                  (QREFELT $ 105))) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;53!0| (($$ NIL)) 'DUMMY) 

(SDEFUN |FCTOOL;expression2Fortran;OfL;54|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL (ELT $ 16) |of| NIL (QREFELT $ 105))) 

(SDEFUN |FCTOOL;changeExprLength;IV;55| ((|i| |Integer|) ($ |Void|))
        (SPROG ((|nl| (|Integer|)))
               (SEQ (LETT |nl| (+ |$maximumFortranExpressionLength| 1))
                    (EXIT (SETF |$maximumFortranExpressionLength| |nl|))))) 

(SDEFUN |FCTOOL;getStatement;OfBL;56|
        ((|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FCTOOL;getStatement;OfBL;56!0|
                               (VECTOR $ |of|))
                         (QREFELT $ 95)))) 

(SDEFUN |FCTOOL;getStatement;OfBL;56!0| (($$ NIL))
        (PROG (|of| $)
          (LETT |of| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |of| (QREFELT $ 106)))))) 

(SDEFUN |FCTOOL;displayLines;LV;57| ((|ls| |List| (|String|)) ($ |Void|))
        (SPROG ((#1=#:G909 NIL) (|l| NIL))
               (SEQ (LETT |l| NIL) (LETT #1# |ls|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (PRINTEXP |l| |$fortranOutputStream|)
                         (EXIT (TERPRI |$fortranOutputStream|)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |FCTOOL;dispStatement;OfV;58| ((|of| |OutputForm|) ($ |Void|))
        (SPROG ((|l| (|List| (|String|))))
               (SEQ (LETT |l| (SPADCALL |of| NIL (QREFELT $ 109)))
                    (EXIT (SPADCALL |l| (QREFELT $ 110)))))) 

(SDEFUN |FCTOOL;fortFormatHead1|
        ((|name| |Symbol|) (|asp| |List| (|String|)) (|args| |List| (|Symbol|))
         ($ |List| (|String|)))
        (SPROG
         ((|of| (|OutputForm|)) (#1=#:G916 NIL) (|arg| NIL) (#2=#:G915 NIL))
         (SEQ
          (LETT |of|
                (SPADCALL (SPADCALL |name| (QREFELT $ 78))
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |arg| NIL) (LETT #1# |args|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |arg| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |arg| (QREFELT $ 78))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 50)))
          (EXIT
           (SPADCALL |asp| (SPADCALL |of| (QREFELT $ 106)) (QREFELT $ 25)))))) 

(SDEFUN |FCTOOL;fortFormatHead;SULV;60|
        ((|name| |Symbol|)
         (|returnType| |Union| (|:| |fst| (|FortranScalarType|))
          (|:| |void| "void"))
         (|args| |List| (|Symbol|)) ($ |Void|))
        (SPROG
         ((|lines| (|List| (|String|))) (|l| (|Integer|))
          (|asp| (|List| (|String|))) (|s| (|String|)) (#1=#:G917 NIL))
         (SEQ
          (COND
           ((QEQCAR |returnType| 1)
            (SEQ (LETT |asp| (LIST "SUBROUTINE "))
                 (EXIT (SPADCALL (LETT |l| -11) (QREFELT $ 108)))))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL
                    (SPADCALL
                     (PROG2 (LETT #1# |returnType|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|FortranScalarType|)
                                       (|Union|
                                        (|:| |fst| (|FortranScalarType|))
                                        (|:| |void| "void"))
                                       #1#))
                     (QREFELT $ 112))
                    (QREFELT $ 17)))
             (LETT |asp| (LIST |s| " FUNCTION "))
             (EXIT
              (SPADCALL (LETT |l| (- -10 (QCSIZE |s|))) (QREFELT $ 108))))))
          (LETT |lines|
                (SPADCALL
                 (CONS #'|FCTOOL;fortFormatHead;SULV;60!0|
                       (VECTOR $ |args| |asp| |name|))
                 (QREFELT $ 96)))
          (SPADCALL |lines| (QREFELT $ 110))
          (EXIT (SPADCALL (- |l|) (QREFELT $ 108)))))) 

(SDEFUN |FCTOOL;fortFormatHead;SULV;60!0| (($$ NIL))
        (PROG (|name| |asp| |args| $)
          (LETT |name| (QREFELT $$ 3))
          (LETT |asp| (QREFELT $$ 2))
          (LETT |args| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FCTOOL;fortFormatHead1| |name| |asp| |args| $))))) 

(SDEFUN |FCTOOL;addCommas| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G930 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) |l|)
                      ('T
                       (SEQ (LETT |r| (LIST (|SPADfirst| |l|)))
                            (SEQ (LETT |e| NIL) (LETT #1# (CDR |l|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |e| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT (LETT |r| (CONS |e| (CONS "," |r|)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (NREVERSE |r|)))))))) 

(SDEFUN |FCTOOL;nameLen| ((|n| |List| (|String|)) ($ |Integer|))
        (SPROG
         ((#1=#:G932 NIL) (#2=#:G931 #3=(|Integer|)) (#4=#:G933 #3#)
          (#5=#:G935 NIL) (|u| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |u| NIL) (LETT #5# |n|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (+ 1 (QCSIZE |u|)))
                   (COND (#1# (LETT #2# (+ #2# #4#)))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 0)))))) 

(SDEFUN |FCTOOL;fortFormatTypeLines;SLV;63|
        ((|typeName| |String|) (|l| |List| (|String|)) ($ |Void|))
        (SPROG ((|l1| (|List| (|String|))))
               (SEQ
                (LETT |l1|
                      (CONS |typeName| (CONS " " (|FCTOOL;addCommas| |l| $))))
                (EXIT
                 (SPADCALL (SPADCALL |l1| (QREFELT $ 92)) (QREFELT $ 110)))))) 

(SDEFUN |FCTOOL;fortFormatTypes1|
        ((|typeName| |String|) (|names| |List| (|String|)) ($ |Void|))
        (SPROG ((|n| (|List| (|String|))) (|ln| (|Integer|)) (|l| (|Integer|)))
               (SEQ
                (LETT |l|
                      (- (- |$maximumFortranExpressionLength| 1)
                         (QCSIZE |typeName|)))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (|FCTOOL;nameLen| |names| $) |l|
                                  (QREFELT $ 37)))
                       (GO G191)))
                     (SEQ (LETT |n| NIL) (LETT |ln| 0)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (<
                                   (LETT |ln|
                                         (+
                                          (+ |ln|
                                             (QCSIZE (|SPADfirst| |names|)))
                                          1))
                                   |l|))
                                 (GO G191)))
                               (SEQ (LETT |n| (CONS (|SPADfirst| |names|) |n|))
                                    (EXIT (LETT |names| (CDR |names|))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |typeName| |n| (QREFELT $ 115))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |typeName| |names| (QREFELT $ 115)))))) 

(SDEFUN |FCTOOL;par2string2| ((|u| |List| (|OutputForm|)) ($ |String|))
        (SPROG
         ((|l| (|List| (|String|))) (|ll| (|List| (|List| (|String|))))
          (#1=#:G948 NIL) (|v| NIL) (#2=#:G947 NIL))
         (SEQ
          (LETT |ll|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |v| NIL) (LETT #1# (CDR |u|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS "," (SPADCALL |v| (QREFELT $ 106)))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |l|
                (SPADCALL (CDR (SPADCALL |ll| (QREFELT $ 116))) ")"
                          (QREFELT $ 117)))
          (EXIT
           (SPADCALL
            (SPADCALL (LIST (STRINGIMAGE (|SPADfirst| |u|)) "(") |l|
                      (QREFELT $ 25))
            (QREFELT $ 64)))))) 

(SDEFUN |FCTOOL;unravel_par| ((|u| |OutputForm|) ($ |OutputForm|))
        (SEQ
         (COND ((SPADCALL |u| (QREFELT $ 30)) |u|)
               ('T
                (SEQ (LETT |u| (|SPADfirst| (SPADCALL |u| (QREFELT $ 33))))
                     (EXIT (CDR |u|))))))) 

(SDEFUN |FCTOOL;par2string| ((|u| |OutputForm|) ($ |String|))
        (COND ((SPADCALL |u| (QREFELT $ 30)) (STRINGIMAGE |u|))
              ('T (|FCTOOL;par2string2| (|FCTOOL;unravel_par| |u| $) $)))) 

(SDEFUN |FCTOOL;mkParameterList|
        ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G957 NIL) (|u| NIL) (#2=#:G956 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |u| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FCTOOL;par2string| |u| $) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;mkParameterList2|
        ((|l| |List| (|List| (|OutputForm|))) ($ |List| (|String|)))
        (SPROG ((#1=#:G961 NIL) (|u| NIL) (#2=#:G960 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |u| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FCTOOL;par2string2| |u| $) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;mkCharName| ((|v| |Integer|) ($ |String|))
        (STRCONC "CHARACTER*(" (STRCONC (STRINGIMAGE |v|) ")"))) 

(SDEFUN |FCTOOL;insertEntry|
        ((|m| |Integer|) (|n| |OutputForm|)
         (|Tabl| |AssociationList| (|Integer|) (|List| (|OutputForm|)))
         ($ |Void|))
        (SPROG ((|u| (|Union| (|List| (|OutputForm|)) "failed")))
               (SEQ (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 120)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL |Tabl| |m| (LIST |n|) (QREFELT $ 121)))
                      ('T
                       (SPADCALL |Tabl| |m| (CONS |n| (QCDR |u|))
                                 (QREFELT $ 121)))))))) 

(SDEFUN |FCTOOL;fortFormatCharacterTypes|
        ((|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((#1=#:G977 NIL) (|u2| NIL)
          (|genuineArrays| (|List| (|List| (|OutputForm|))))
          (|u1| (|List| (|OutputForm|))) (#2=#:G976 NIL) (|u| NIL)
          (|sortedByLength|
           (|AssociationList| (|Integer|) (|List| (|OutputForm|)))))
         (SEQ (LETT |sortedByLength| (SPADCALL (QREFELT $ 122)))
              (LETT |genuineArrays| NIL)
              (SEQ (LETT |u| NIL) (LETT #2# |names|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |u| (QREFELT $ 30))
                       (|FCTOOL;insertEntry| 0 |u| |sortedByLength| $))
                      ('T
                       (SEQ (LETT |u1| |u|)
                            (EXIT
                             (COND
                              ((EQL (LENGTH |u1|) 2)
                               (|FCTOOL;insertEntry|
                                (SPADCALL |u1| (QREFELT $ 43))
                                (|SPADfirst| |u1|) |sortedByLength| $))
                              ('T
                               (LETT |genuineArrays|
                                     (CONS |u1| |genuineArrays|))))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |u2| NIL)
                   (LETT #1# (SPADCALL |sortedByLength| (QREFELT $ 125))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u2| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (|FCTOOL;fortFormatTypes1|
                      (|FCTOOL;mkCharName| (QCAR |u2|) $)
                      (|FCTOOL;mkParameterList| (QCDR |u2|) $) $)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL (NULL |genuineArrays|))
                 (|FCTOOL;fortFormatTypes1| "CHARACTER"
                  (|FCTOOL;mkParameterList2| |genuineArrays| $) $))))))) 

(SDEFUN |FCTOOL;fort_format_types1|
        ((|typeName| |String|) (|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG ((#1=#:G981 NIL) (|u| NIL) (#2=#:G980 NIL))
               (SEQ
                (COND
                 ((EQUAL |typeName| "CHARACTER")
                  (|FCTOOL;fortFormatCharacterTypes|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |u| NIL) (LETT #1# |names|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|FCTOOL;unravel_par| |u| $) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   $))
                 ('T
                  (|FCTOOL;fortFormatTypes1| |typeName|
                   (|FCTOOL;mkParameterList| |names| $) $)))))) 

(SDEFUN |FCTOOL;fort_format_types;SLV;74|
        ((|typeName| |String|) (|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG ((|save_fortranSegment| (|Boolean|)))
               (SEQ
                (COND ((NULL |names|) (SPADCALL (QREFELT $ 126)))
                      ('T
                       (SEQ (LETT |save_fortranSegment| |$fortranSegment|)
                            (EXIT
                             (|finally|
                              (SEQ (SETF |$fortranSegment| NIL)
                                   (EXIT
                                    (SPADCALL NIL
                                              (CONS
                                               #'|FCTOOL;fort_format_types;SLV;74!0|
                                               (VECTOR |names| $ |typeName|))
                                              (QREFELT $ 94))))
                              (SETF |$fortranSegment|
                                      |save_fortranSegment|))))))))) 

(SDEFUN |FCTOOL;fort_format_types;SLV;74!0| (($$ NIL))
        (PROG (|typeName| $ |names|)
          (LETT |typeName| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |names| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SEQ
             (|FCTOOL;fort_format_types1| (SPADCALL |typeName| (QREFELT $ 17))
              |names| $)
             (EXIT (LIST ""))))))) 

(DECLAIM (NOTINLINE |FortranCodeTools;|)) 

(DEFUN |FortranCodeTools| ()
  (SPROG NIL
         (PROG (#1=#:G991)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCodeTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCodeTools|
                             (LIST (CONS NIL (CONS 1 (|FortranCodeTools;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranCodeTools|)))))))))) 

(DEFUN |FortranCodeTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCodeTools|))
          (LETT $ (GETREFV 128))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FortranCodeTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 0)
          (QSETREFV $ 18 (LIST #1="-" "~"))
          (QSETREFV $ 19 '(700 50))
          (QSETREFV $ 20
                    (LIST "|" "**" "/" ".LT." ".GT." ".EQ." ".LE." ".GE."
                          ".AND." ".OR."))
          (QSETREFV $ 21 (LIST 0 900 800 400 400 400 400 400 800 70 90))
          (QSETREFV $ 22 (LIST #1# "+" "*" "," " " "ROW" ""))
          (QSETREFV $ 23 (LIST 700 700 800 110 0 0 0))
          (QSETREFV $ 26
                    (SPADCALL (QREFELT $ 20) (QREFELT $ 22) (QREFELT $ 25)))
          (QSETREFV $ 48 (SPADCALL '= (QREFELT $ 47)))
          (QSETREFV $ 53 NIL)
          (QSETREFV $ 54 NIL)
          (QSETREFV $ 61
                    (LIST (VECTOR '|abs| 'ABS 'DABS)
                          (VECTOR '|acos| 'ACOS 'DACOS)
                          (VECTOR '|asin| 'ASIN 'DASIN)
                          (VECTOR '|atan| 'ATAN 'DATAN)
                          (VECTOR '|cos| 'COS 'DCOS)
                          (VECTOR '|cosh| 'COSH 'DCOSH)
                          (VECTOR '|cot| 'COTAN 'DCOTAN)
                          (VECTOR '|erf| 'ERF 'DERF) (VECTOR '|exp| 'EXP 'DEXP)
                          (VECTOR '|log| 'LOG 'DLOG)
                          (VECTOR '|log10| 'LOG10 'DLOG10)
                          (VECTOR '|sin| 'SIN 'DSIN)
                          (VECTOR '|sinh| 'SINH 'DSINH)
                          (VECTOR '|sqrt| 'SQRT 'DSQRT)
                          (VECTOR '|tan| 'TAN 'DTAN)
                          (VECTOR '|tanh| 'TANH 'DTANH)))
          (QSETREFV $ 62
                    (LIST (CONS '< '.LT.) (CONS '> '.GT.) (CONS '<= '.LE.)
                          (CONS '>= '.GE.) (CONS 'EQ '.EQ.)
                          (CONS '|and| '.AND.) (CONS '|or| '.OR.)
                          (CONS '~ '.NOT.)))
          (QSETREFV $ 69
                    '(BRACKET BRACE SUB AGGLST SUPERSUB MATRIX SEGMENT
                      ALTSUPERSUB PAREN CONCAT CONCATB QUOTE STRING SIGMA STEP
                      IN SIGMA2 INTSIGN PI PI2))
          (QSETREFV $ 70 (SPADCALL '** (QREFELT $ 47)))
          (QSETREFV $ 84 6)
          $))) 

(MAKEPROP '|FortranCodeTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|tmp_var_index| (|String|) (|Symbol|)
              (0 . |coerce|) (|FortranScalarType|) (5 . |coerce|)
              (|FortranType|) (10 . |coerce|) (|TheSymbolTable|)
              (15 . |declare!|) |FCTOOL;newFortranTempVar;S;1|
              |FCTOOL;checkType;2S;2| '|unaryOps| '|unaryPrecs| '|binaryOps|
              '|binaryPrecs| '|naryOps| '|naryPrecs| (|List| 7) (21 . |append|)
              '|nonUnaryOps| (|Boolean|) (|OutputForm|) (|OutputFormTools|)
              (27 . |atom?|) (32 . |operator|) (|List| 28) (37 . |arguments|)
              (|Integer|) (42 . |elt|) (48 . |position|) (54 . >) (|List| 34)
              (60 . |elt|) (66 . <=) (|NonNegativeInteger|) (72 . ~=)
              (78 . |second|) (83 . |member?|) (89 . |symbol?|) (94 . |symbol|)
              (99 . |outputForm|) '|ass_form| (|List| $) (104 . |elt|)
              (110 . |append|) (116 . *) '|exprStack| '|used_intrinsics|
              (|Void|) |FCTOOL;clear_used_intrinsics;V;24| (122 . |string|)
              |FCTOOL;get_used_intrinsics;L;25| (|List| 8) (127 . |member?|)
              '|fort_intrinsics| '|fort_ops| (133 . |string|) (138 . |concat|)
              (143 . |message|) (148 . |integer?|) (153 . |integer|)
              (158 . |outputForm|) '|specialOps| '|pow_form| (|Character|)
              (163 . |elt|) (169 . |char|) (174 . |remove|) (180 . |position|)
              (186 . ~=) (192 . |setelt!|) (199 . |coerce|) (204 . |string?|)
              (|UniversalSegment| 34) (209 . SEGMENT) (214 . |elt|) (220 . >)
              '|fort_indent| |FCTOOL;get_fort_indent;I;39| (|PositiveInteger|)
              (226 . *) |FCTOOL;indentFortLevel;IV;40| (232 . |space|)
              (236 . SEGMENT) (242 . ~=) |FCTOOL;fort_clean_lines;2L;43|
              (|Mapping| 24) |FCTOOL;do_with_error_env3;BML;45|
              |FCTOOL;do_with_error_env2;BML;44|
              |FCTOOL;do_with_error_env1;ML;46| (248 . |construct|)
              (254 . |setrest!|) (260 . |setfirst!|) (266 . |is_symbol?|)
              (272 . |empty|) (276 . ~=) (282 . |precondition|) (|Mapping| 8)
              |FCTOOL;expression2Fortran1;MOfBL;52|
              |FCTOOL;statement2Fortran;OfL;53|
              |FCTOOL;expression2Fortran;OfL;54|
              |FCTOOL;changeExprLength;IV;55| |FCTOOL;getStatement;OfBL;56|
              |FCTOOL;displayLines;LV;57| |FCTOOL;dispStatement;OfV;58|
              (287 . |coerce|) (|Union| (|:| |fst| 10) (|:| |void| '#1="void"))
              |FCTOOL;fortFormatHead;SULV;60|
              |FCTOOL;fortFormatTypeLines;SLV;63| (292 . |concat|)
              (297 . |concat|) (|Union| 32 '"failed") (|AssociationList| 34 32)
              (303 . |search|) (309 . |setelt!|) (316 . |empty|)
              (|Record| (|:| |key| 34) (|:| |entry| 32)) (|List| 123)
              (320 . |entries|) (325 . |void|)
              |FCTOOL;fort_format_types;SLV;74|)
           '#(|statement2Fortran| 329 |newFortranTempVar| 334 |indentFortLevel|
              338 |get_used_intrinsics| 343 |get_fort_indent| 347
              |getStatement| 351 |fort_format_types| 357 |fort_clean_lines| 363
              |fortFormatTypeLines| 368 |fortFormatHead| 374
              |expression2Fortran1| 381 |expression2Fortran| 388
              |do_with_error_env3| 393 |do_with_error_env2| 399
              |do_with_error_env1| 405 |displayLines| 410 |dispStatement| 415
              |clear_used_intrinsics| 420 |checkType| 424 |changeExprLength|
              429)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|fort_clean_lines|
                                 ((|List| (|String|)) (|List| (|String|))))
                                T)
                              '((|do_with_error_env3|
                                 ((|List| (|String|)) (|Boolean|)
                                  (|Mapping| (|List| (|String|)))))
                                T)
                              '((|do_with_error_env2|
                                 ((|List| (|String|)) (|Boolean|)
                                  (|Mapping| (|List| (|String|)))))
                                T)
                              '((|do_with_error_env1|
                                 ((|List| (|String|))
                                  (|Mapping| (|List| (|String|)))))
                                T)
                              '((|expression2Fortran1|
                                 ((|List| (|String|)) (|Mapping| (|Symbol|))
                                  (|OutputForm|) (|Boolean|)))
                                T)
                              '((|statement2Fortran|
                                 ((|List| (|String|)) (|OutputForm|)))
                                T)
                              '((|expression2Fortran|
                                 ((|List| (|String|)) (|OutputForm|)))
                                T)
                              '((|getStatement|
                                 ((|List| (|String|)) (|OutputForm|)
                                  (|Boolean|)))
                                T)
                              '((|changeExprLength| ((|Void|) (|Integer|))) T)
                              '((|displayLines| ((|Void|) (|List| (|String|))))
                                T)
                              '((|dispStatement| ((|Void|) (|OutputForm|))) T)
                              '((|fortFormatHead|
                                 ((|Void|) (|Symbol|)
                                  (|Union| (|:| |fst| (|FortranScalarType|))
                                           (|:| |void| #1#))
                                  (|List| (|Symbol|))))
                                T)
                              '((|fortFormatTypeLines|
                                 ((|Void|) (|String|) (|List| (|String|))))
                                T)
                              '((|fort_format_types|
                                 ((|Void|) (|String|) (|List| (|OutputForm|))))
                                T)
                              '((|indentFortLevel| ((|Void|) (|Integer|))) T)
                              '((|checkType| ((|String|) (|String|))) T)
                              '((|newFortranTempVar| ((|Symbol|))) T)
                              '((|clear_used_intrinsics| ((|Void|))) T)
                              '((|get_used_intrinsics| ((|List| (|String|))))
                                T)
                              '((|get_fort_indent| ((|Integer|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 127
                                            '(1 8 0 7 9 1 10 0 8 11 1 12 0 10
                                              13 2 14 12 8 12 15 2 24 0 0 0 25
                                              1 29 27 28 30 1 29 28 28 31 1 29
                                              32 28 33 2 32 28 0 34 35 2 24 34
                                              7 0 36 2 34 27 0 0 37 2 38 34 0
                                              34 39 2 34 27 0 0 40 2 41 27 0 0
                                              42 1 32 28 0 43 2 24 27 7 0 44 1
                                              29 27 28 45 1 29 8 28 46 1 28 0 8
                                              47 2 28 0 0 49 50 2 32 0 0 0 51 2
                                              34 0 41 0 52 1 8 7 0 57 2 59 27 8
                                              0 60 1 29 7 28 63 1 7 0 49 64 1
                                              28 0 7 65 1 29 27 28 66 1 29 34
                                              28 67 1 28 0 34 68 2 7 71 0 34 72
                                              1 71 0 7 73 2 7 0 71 0 74 2 7 34
                                              71 0 75 2 8 27 0 0 76 3 7 71 0 34
                                              71 77 1 8 28 0 78 1 29 27 28 79 1
                                              80 0 34 81 2 7 0 0 80 82 2 41 27
                                              0 0 83 2 34 0 86 0 87 0 71 0 89 2
                                              80 0 34 34 90 2 7 27 0 0 91 2 29
                                              28 28 32 97 2 32 0 0 0 98 2 32 28
                                              0 28 99 2 29 27 28 8 100 0 28 0
                                              101 2 34 27 0 0 102 1 29 28 28
                                              103 1 10 7 0 112 1 24 0 49 116 2
                                              24 0 0 7 117 2 119 118 34 0 120 3
                                              119 32 0 34 32 121 0 119 0 122 1
                                              119 124 0 125 0 55 0 126 1 0 24
                                              28 106 0 0 8 16 1 0 55 34 88 0 0
                                              24 58 0 0 34 85 2 0 24 28 27 109
                                              2 0 55 7 32 127 1 0 24 24 92 2 0
                                              55 7 24 115 3 0 55 8 113 59 114 3
                                              0 24 104 28 27 105 1 0 24 28 107
                                              2 0 24 27 93 94 2 0 24 27 93 95 1
                                              0 24 93 96 1 0 55 24 110 1 0 55
                                              28 111 0 0 55 56 1 0 7 7 17 1 0
                                              55 34 108)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCodeTools| 'NILADIC T) 