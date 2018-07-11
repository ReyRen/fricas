
(SDEFUN |IMATLIN;rowAllZeroes?| ((|x| M) (|i| |Integer|) ($ |Boolean|))
        (SPROG ((#1=#:G401 NIL) (#2=#:G402 NIL) (#3=#:G403 NIL) (|j| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 11)))
                         (LETT #3# (SPADCALL |x| (QREFELT $ 12))) G190
                         (COND ((> |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                       (|spadConstant| $ 14) (QREFELT $ 16))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G400)))
                              (GO #5=#:G398))))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |IMATLIN;colAllZeroes?| ((|x| M) (|j| |Integer|) ($ |Boolean|))
        (SPROG ((#1=#:G408 NIL) (#2=#:G409 NIL) (#3=#:G410 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                         (LETT #3# (SPADCALL |x| (QREFELT $ 18))) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                       (|spadConstant| $ 14) (QREFELT $ 16))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G407)))
                              (GO #5=#:G405))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |IMATLIN;row_operation_base;M4IRV;3|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) ($ |Void|))
        (SPROG ((#1=#:G413 NIL) (|k1| NIL))
               (SEQ (LETT |k1| |j|) (LETT #1# |maxC|) G190
                    (COND ((> |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF2O |x| |k| |k1|
                                  (SPADCALL (QAREF2O |x| |k| |k1| 1 1)
                                            (SPADCALL |pp|
                                                      (QAREF2O |x| |i| |k1| 1
                                                               1)
                                                      (QREFELT $ 19))
                                            (QREFELT $ 20))
                                  1 1)))
                    (LETT |k1| (+ |k1| 1)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |IMATLIN;row_operation_modular;M4IRIV;4|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G417 NIL) (|k1| NIL) (|ms| #2=(|SingleInteger|)) (|js| #2#)
          (|pp1| (|Integer|)))
         (SEQ (LETT |pp1| (- |p| |pp|)) (LETT |js| |j|) (LETT |ms| |maxC|)
              (EXIT
               (SEQ (LETT |k1| |js|) (LETT #1# |ms|) G190
                    (COND ((|greater_SI| |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF2O |x| |k| |k1|
                                  (QSMULADDMOD64_32 |pp1|
                                                    (QAREF2O |x| |i| |k1| 1 1)
                                                    (QAREF2O |x| |k| |k1| 1 1)
                                                    |p|)
                                  1 1)))
                    (LETT |k1| (|inc_SI| |k1|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |IMATLIN;rowEchelon;2M;5| ((|y| M) ($ M))
        (SPROG
         ((|i| #1=(|Integer|)) (|pp| (R)) (#2=#:G455 NIL) (|k| NIL)
          (#3=#:G454 NIL) (|b| (R)) (#4=#:G450 NIL) (|n| (|Integer|))
          (#5=#:G453 NIL) (#6=#:G451 NIL) (#7=#:G452 NIL) (|j| NIL)
          (|maxC| (|Integer|)) (|minC| (|Integer|)) (|maxR| (|Integer|))
          (|minR| #1#) (|x| (M))
          (|row_op|
           (|Mapping| (|Void|) M (|Integer|) (|Integer|) (|Integer|)
                      (|Integer|) R))
          (#8=#:G426 NIL) (|cc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |row_op|
                  (SEQ (LETT |cc| (SPADCALL (QREFELT $ 25)))
                       (COND
                        ((SPADCALL |cc| (|spadConstant| $ 26) (QREFELT $ 27))
                         (COND
                          ((SPADCALL |cc| 1000000000 (QREFELT $ 28))
                           (COND
                            ((|domainEqual| (QREFELT $ 6)
                                            (|PrimeField|
                                             (PROG1 (LETT #8# |cc|)
                                               (|check_subtype2| (> #8# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #8#))))
                             (EXIT
                              (CONS #'|IMATLIN;rowEchelon;2M;5!0|
                                    (VECTOR $ |cc|)))))))))
                       (EXIT (ELT $ 22))))
            (LETT |x| (SPADCALL |y| (QREFELT $ 29)))
            (LETT |minR| (PROGN |x| 1))
            (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
            (LETT |minC| (PROGN |x| 1))
            (LETT |maxC| (SPADCALL |x| (QREFELT $ 12))) (LETT |i| |minR|)
            (LETT |n| (- |minR| 1))
            (SEQ (LETT |j| |minC|) (LETT #7# |maxC|) G190
                 (COND ((> |j| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |i| |maxR| (QREFELT $ 31))
                     (PROGN (LETT #6# |x|) (GO #9=#:G449)))
                    ('T
                     (SEQ (LETT |n| (- |minR| 1))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| |i|) (LETT #5# |maxR|) G190
                                 (COND ((> |k| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                               (|spadConstant| $ 14)
                                               (QREFELT $ 16))
                                     (SEQ (LETT |n| |k|)
                                          (EXIT
                                           (PROGN
                                            (LETT #4# |$NoValue|)
                                            (GO #10=#:G438))))))))
                                 (LETT |k| (+ |k| 1)) (GO G190) G191
                                 (EXIT NIL)))
                           #10# (EXIT #4#))
                          (EXIT
                           (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                                 ('T
                                  (SEQ
                                   (COND
                                    ((SPADCALL |i| |n| (QREFELT $ 32))
                                     (SPADCALL |x| |i| |n| (QREFELT $ 33))))
                                   (LETT |b|
                                         (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                                   (QREFELT $ 34)))
                                   (QSETAREF2O |x| |i| |j|
                                               (|spadConstant| $ 30) 1 1)
                                   (SEQ (LETT |k| (+ |j| 1)) (LETT #3# |maxC|)
                                        G190 (COND ((> |k| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (QSETAREF2O |x| |i| |k|
                                                      (SPADCALL |b|
                                                                (QAREF2O |x|
                                                                         |i|
                                                                         |k| 1
                                                                         1)
                                                                (QREFELT $ 19))
                                                      1 1)))
                                        (LETT |k| (+ |k| 1)) (GO G190) G191
                                        (EXIT NIL))
                                   (SEQ (LETT |k| |minR|) (LETT #2# |maxR|)
                                        G190 (COND ((> |k| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k| |i| (QREFELT $ 32))
                                            (SEQ
                                             (LETT |pp|
                                                   (QAREF2O |x| |k| |j| 1 1))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |pp|
                                                           (|spadConstant| $
                                                                           14)
                                                           (QREFELT $ 35)))
                                                (SEQ
                                                 (SPADCALL |x| |i| (+ |j| 1)
                                                           |k| |maxC| |pp|
                                                           |row_op|)
                                                 (EXIT
                                                  (QSETAREF2O |x| |k| |j|
                                                              (|spadConstant| $
                                                                              14)
                                                              1 1)))))))))))
                                        (LETT |k| (+ |k| 1)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT (LETT |i| (+ |i| 1))))))))))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT |x|)))
          #9# (EXIT #6#)))) 

(SDEFUN |IMATLIN;rowEchelon;2M;5!0|
        ((|x| NIL) (|i| NIL) (|j| NIL) (|k| NIL) (|maxC| NIL) (|pp| NIL)
         ($$ NIL))
        (PROG (|cc| $)
          (LETT |cc| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT $ 23)))))) 

(SDEFUN |IMATLIN;nullSpace;ML;6| ((|y| M) ($ |List| |Col|))
        (SPROG
         ((|l| (|Integer|)) (|j| #1=(|Integer|)) (|basis| (|List| |Col|))
          (#2=#:G479 NIL) (|k| NIL) (#3=#:G480 NIL) (|ll| NIL) (|w| (|Col|))
          (#4=#:G478 NIL) (|i| NIL)
          (|v| (|IndexedOneDimensionalArray| (|Integer|) |minC|))
          (#5=#:G477 NIL) (|row| #6=(|Integer|)) (#7=#:G457 NIL)
          (|rk| #8=(|NonNegativeInteger|)) (#9=#:G456 NIL)
          (|ncol| (|NonNegativeInteger|)) (|nrow| #8#) (|maxC| #1#)
          (|minC| (|Integer|)) (|maxR| #6#) (|minR| (|Integer|)) (|x| (M)))
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 36)))
              (LETT |minR| (PROGN |x| 1))
              (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
              (LETT |minC| (PROGN |x| 1))
              (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)))
              (LETT |nrow| (ANROWS |x|)) (LETT |ncol| (ANCOLS |x|))
              (LETT |basis| NIL) (LETT |rk| |nrow|) (LETT |row| |maxR|)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |rk| 0 (QREFELT $ 27))
                        (|IMATLIN;rowAllZeroes?| |x| |row| $))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |rk|
                          (PROG1 (LETT #9# (- |rk| 1))
                            (|check_subtype2| (>= #9# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #9#)))
                    (EXIT
                     (LETT |row|
                           (PROG1 (LETT #7# (- |row| 1))
                             (|check_subtype2| (>= #7# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #7#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |ncol| |nrow| (QREFELT $ 37))
                (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
              (EXIT
               (COND
                ((EQL |rk| 0)
                 (SEQ
                  (SEQ (LETT |j| |minC|) (LETT #5# |maxC|) G190
                       (COND ((> |j| #5#) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| $ 14)
                                        (QREFELT $ 38)))
                        (SPADCALL |w| |j| (|spadConstant| $ 30) (QREFELT $ 39))
                        (EXIT (LETT |basis| (CONS |w| |basis|))))
                       (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))
                ('T
                 (SEQ
                  (LETT |v|
                        (SPADCALL |ncol| (- |minR| 1)
                                  (|compiledLookupCheck| '|new|
                                                         (LIST '$
                                                               (LIST
                                                                '|NonNegativeInteger|)
                                                               (LIST
                                                                '|Integer|))
                                                         (|IndexedOneDimensionalArray|
                                                          (|Integer|)
                                                          |minC|))))
                  (SEQ (LETT |i| |minR|) (LETT #4# (- (+ |minR| |rk|) 1)) G190
                       (COND ((> |i| #4#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| |minC|) G190
                             (COND
                              ((NULL
                                (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                          (|spadConstant| $ 14)
                                          (QREFELT $ 35)))
                               (GO G191)))
                             (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1)) (GO G190)
                             G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |v| |j| |i|
                                   (|compiledLookupCheck| '|qsetelt!|
                                                          (LIST
                                                           (LIST '|Integer|) '$
                                                           (LIST '|Integer|)
                                                           (LIST '|Integer|))
                                                          (|IndexedOneDimensionalArray|
                                                           (|Integer|)
                                                           |minC|)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |j| |maxC|) (LETT |l| (- (+ |minR| |ncol|) 1))
                  (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| $ 14)
                                        (QREFELT $ 38)))
                        (COND
                         ((EQL
                           (SPADCALL |v| |j|
                                     (|compiledLookupCheck| '|qelt|
                                                            (LIST
                                                             (LIST '|Integer|)
                                                             '$
                                                             (LIST '|Integer|))
                                                            (|IndexedOneDimensionalArray|
                                                             (|Integer|)
                                                             |minC|)))
                           (- |minR| 1))
                          (COND
                           ((|IMATLIN;colAllZeroes?| |x| |j| $)
                            (SEQ
                             (SPADCALL |w| |l| (|spadConstant| $ 30)
                                       (QREFELT $ 39))
                             (EXIT (LETT |basis| (CONS |w| |basis|)))))
                           ('T
                            (SEQ
                             (SEQ (LETT |ll| |minR|) (LETT #3# (- |l| 1))
                                  (LETT |k| |minC|) (LETT #2# (- |j| 1)) G190
                                  (COND
                                   ((OR (> |k| #2#) (> |ll| #3#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |k|
                                                 (|compiledLookupCheck| '|qelt|
                                                                        (LIST
                                                                         (LIST
                                                                          '|Integer|)
                                                                         '$
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|IndexedOneDimensionalArray|
                                                                         (|Integer|)
                                                                         |minC|)))
                                       (- |minR| 1) (QREFELT $ 32))
                                      (SPADCALL |w| |ll|
                                                (SPADCALL
                                                 (QAREF2O |x|
                                                          (SPADCALL |v| |k|
                                                                    (|compiledLookupCheck|
                                                                     '|qelt|
                                                                     (LIST
                                                                      (LIST
                                                                       '|Integer|)
                                                                      '$
                                                                      (LIST
                                                                       '|Integer|))
                                                                     (|IndexedOneDimensionalArray|
                                                                      (|Integer|)
                                                                      |minC|)))
                                                          |j| 1 1)
                                                 (QREFELT $ 40))
                                                (QREFELT $ 39))))))
                                  (LETT |k|
                                        (PROG1 (+ |k| 1)
                                          (LETT |ll| (+ |ll| 1))))
                                  (GO G190) G191 (EXIT NIL))
                             (SPADCALL |w| |l| (|spadConstant| $ 30)
                                       (QREFELT $ 39))
                             (EXIT (LETT |basis| (CONS |w| |basis|))))))))
                        (LETT |j| (- |j| 1)) (EXIT (LETT |l| (- |l| 1))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))))))) 

(SDEFUN |IMATLIN;determinant;MR;7| ((|y| M) ($ R))
        (SPROG
         ((#1=#:G503 NIL) (|l| NIL) (|b| (R)) (#2=#:G502 NIL) (|k| NIL)
          (#3=#:G501 NIL) (|ans| (R)) (#4=#:G497 NIL) (#5=#:G496 NIL)
          (|rown| (|Integer|)) (#6=#:G500 NIL) (#7=#:G498 NIL) (|i| NIL)
          (#8=#:G499 NIL) (|j| NIL) (|maxC| (|Integer|)) (|minC| (|Integer|))
          (|maxR| (|Integer|)) (|minR| (|Integer|)) (|x| (M))
          (|ndim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |ndim| (ANROWS |y|)) (ANCOLS |y|) (QREFELT $ 43))
             (|error| "determinant: matrix must be square"))
            ((EQL |ndim| 0) (|spadConstant| $ 30))
            ((EQL |ndim| 1) (QAREF2O |y| (PROGN |y| 1) (PROGN |y| 1) 1 1))
            ('T
             (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 29)))
                  (LETT |minR| (PROGN |x| 1))
                  (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
                  (LETT |minC| (PROGN |x| 1))
                  (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)))
                  (LETT |ans| (|spadConstant| $ 30))
                  (SEQ (LETT |j| |minC|) (LETT #8# (- |maxC| 1))
                       (LETT |i| |minR|) (LETT #7# (- |maxR| 1)) G190
                       (COND ((OR (> |i| #7#) (> |j| #8#)) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                    (|spadConstant| $ 14) (QREFELT $ 35))
                          (SEQ (LETT |rown| (- |minR| 1))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| (+ |i| 1)) (LETT #6# |maxR|)
                                      G190 (COND ((> |k| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                    (|spadConstant| $ 14)
                                                    (QREFELT $ 16))
                                          (PROGN
                                           (LETT #5#
                                                 (SEQ (LETT |rown| |k|)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #5# |$NoValue|)
                                                        (GO #9=#:G483)))))
                                           (GO #9#))))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL)))
                                #9# (EXIT #5#))
                               (COND
                                ((EQL |rown| (- |minR| 1))
                                 (PROGN
                                  (LETT #4# (|spadConstant| $ 14))
                                  (GO #10=#:G495))))
                               (SPADCALL |x| |i| |rown| (QREFELT $ 33))
                               (EXIT
                                (LETT |ans|
                                      (SPADCALL |ans| (QREFELT $ 40)))))))
                        (LETT |ans|
                              (SPADCALL (QAREF2O |x| |i| |j| 1 1) |ans|
                                        (QREFELT $ 19)))
                        (LETT |b|
                              (SPADCALL
                               (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                         (QREFELT $ 34))
                               (QREFELT $ 40)))
                        (SEQ (LETT |l| (+ |j| 1)) (LETT #3# |maxC|) G190
                             (COND ((> |l| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (QSETAREF2O |x| |i| |l|
                                           (SPADCALL |b|
                                                     (QAREF2O |x| |i| |l| 1 1)
                                                     (QREFELT $ 19))
                                           1 1)))
                             (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SEQ (LETT |k| (+ |i| 1)) (LETT #2# |maxR|) G190
                              (COND ((> |k| #2#) (GO G191)))
                              (SEQ (LETT |b| (QAREF2O |x| |k| |j| 1 1))
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL |b| (|spadConstant| $ 14)
                                                 (QREFELT $ 35)))
                                      (SEQ (LETT |l| (+ |j| 1))
                                           (LETT #1# |maxC|) G190
                                           (COND ((> |l| #1#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |x| |k| |l|
                                                         (SPADCALL
                                                          (QAREF2O |x| |k| |l|
                                                                   1 1)
                                                          (SPADCALL |b|
                                                                    (QAREF2O
                                                                     |x| |i|
                                                                     |l| 1 1)
                                                                    (QREFELT $
                                                                             19))
                                                          (QREFELT $ 44))
                                                         1 1)))
                                           (LETT |l| (+ |l| 1)) (GO G190) G191
                                           (EXIT NIL))))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (QAREF2O |x| |maxR| |maxC| 1 1) |ans|
                             (QREFELT $ 19)))))))
          #10# (EXIT #4#)))) 

(SDEFUN |IMATLIN;row_operation_base;M4IRV;8|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) ($ |Void|))
        (SPROG ((#1=#:G506 NIL) (|k1| NIL))
               (SEQ (LETT |k1| |j|) (LETT #1# |maxC|) G190
                    (COND ((> |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |x| |k| |k1|
                                (SPADCALL
                                 (SPADCALL |x| |k| |k1| (QREFELT $ 13))
                                 (SPADCALL |pp|
                                           (SPADCALL |x| |i| |k1|
                                                     (QREFELT $ 13))
                                           (QREFELT $ 19))
                                 (QREFELT $ 20))
                                (QREFELT $ 46))))
                    (LETT |k1| (+ |k1| 1)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |IMATLIN;row_operation_modular;M4IRIV;9|
        ((|x| M) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|maxC| |Integer|) (|pp| R) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G510 NIL) (|k1| NIL) (|ms| #2=(|SingleInteger|)) (|js| #2#)
          (|pp1| (|Integer|)))
         (SEQ (LETT |pp1| (- |p| |pp|)) (LETT |js| |j|) (LETT |ms| |maxC|)
              (EXIT
               (SEQ (LETT |k1| |js|) (LETT #1# |ms|) G190
                    (COND ((|greater_SI| |k1| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |x| |k| |k1|
                                (QSMULADDMOD64_32 |pp1|
                                                  (SPADCALL |x| |i| |k1|
                                                            (QREFELT $ 13))
                                                  (SPADCALL |x| |k| |k1|
                                                            (QREFELT $ 13))
                                                  |p|)
                                (QREFELT $ 46))))
                    (LETT |k1| (|inc_SI| |k1|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |IMATLIN;rowEchelon;2M;10| ((|y| M) ($ M))
        (SPROG
         ((|i| #1=(|Integer|)) (|pp| (R)) (#2=#:G546 NIL) (|k| NIL)
          (#3=#:G545 NIL) (|b| (R)) (#4=#:G541 NIL) (|n| (|Integer|))
          (#5=#:G544 NIL) (#6=#:G542 NIL) (#7=#:G543 NIL) (|j| NIL)
          (|maxC| (|Integer|)) (|minC| (|Integer|)) (|maxR| (|Integer|))
          (|minR| #1#) (|x| (M))
          (|row_op|
           (|Mapping| (|Void|) M (|Integer|) (|Integer|) (|Integer|)
                      (|Integer|) R))
          (#8=#:G517 NIL) (|cc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |row_op|
                  (SEQ (LETT |cc| (SPADCALL (QREFELT $ 25)))
                       (COND
                        ((SPADCALL |cc| (|spadConstant| $ 26) (QREFELT $ 27))
                         (COND
                          ((SPADCALL |cc| 1000000000 (QREFELT $ 28))
                           (COND
                            ((|domainEqual| (QREFELT $ 6)
                                            (|PrimeField|
                                             (PROG1 (LETT #8# |cc|)
                                               (|check_subtype2| (> #8# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #8#))))
                             (EXIT
                              (CONS #'|IMATLIN;rowEchelon;2M;10!0|
                                    (VECTOR $ |cc|)))))))))
                       (EXIT (ELT $ 22))))
            (LETT |x| (SPADCALL |y| (QREFELT $ 29)))
            (LETT |minR| (SPADCALL |x| (QREFELT $ 17)))
            (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
            (LETT |minC| (SPADCALL |x| (QREFELT $ 11)))
            (LETT |maxC| (SPADCALL |x| (QREFELT $ 12))) (LETT |i| |minR|)
            (LETT |n| (- |minR| 1))
            (SEQ (LETT |j| |minC|) (LETT #7# |maxC|) G190
                 (COND ((> |j| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |i| |maxR| (QREFELT $ 31))
                     (PROGN (LETT #6# |x|) (GO #9=#:G540)))
                    ('T
                     (SEQ (LETT |n| (- |minR| 1))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| |i|) (LETT #5# |maxR|) G190
                                 (COND ((> |k| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                      (|spadConstant| $ 14) (QREFELT $ 16))
                                     (SEQ (LETT |n| |k|)
                                          (EXIT
                                           (PROGN
                                            (LETT #4# |$NoValue|)
                                            (GO #10=#:G529))))))))
                                 (LETT |k| (+ |k| 1)) (GO G190) G191
                                 (EXIT NIL)))
                           #10# (EXIT #4#))
                          (EXIT
                           (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                                 ('T
                                  (SEQ
                                   (COND
                                    ((SPADCALL |i| |n| (QREFELT $ 32))
                                     (SPADCALL |x| |i| |n| (QREFELT $ 33))))
                                   (LETT |b|
                                         (SPADCALL
                                          (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                          (QREFELT $ 34)))
                                   (SPADCALL |x| |i| |j| (|spadConstant| $ 30)
                                             (QREFELT $ 46))
                                   (SEQ (LETT |k| (+ |j| 1)) (LETT #3# |maxC|)
                                        G190 (COND ((> |k| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |x| |i| |k|
                                                    (SPADCALL |b|
                                                              (SPADCALL |x| |i|
                                                                        |k|
                                                                        (QREFELT
                                                                         $ 13))
                                                              (QREFELT $ 19))
                                                    (QREFELT $ 46))))
                                        (LETT |k| (+ |k| 1)) (GO G190) G191
                                        (EXIT NIL))
                                   (SEQ (LETT |k| |minR|) (LETT #2# |maxR|)
                                        G190 (COND ((> |k| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k| |i| (QREFELT $ 32))
                                            (SEQ
                                             (LETT |pp|
                                                   (SPADCALL |x| |k| |j|
                                                             (QREFELT $ 13)))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |pp|
                                                           (|spadConstant| $
                                                                           14)
                                                           (QREFELT $ 35)))
                                                (SEQ
                                                 (SPADCALL |x| |i| (+ |j| 1)
                                                           |k| |maxC| |pp|
                                                           |row_op|)
                                                 (EXIT
                                                  (SPADCALL |x| |k| |j|
                                                            (|spadConstant| $
                                                                            14)
                                                            (QREFELT $
                                                                     46))))))))))))
                                        (LETT |k| (+ |k| 1)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT (LETT |i| (+ |i| 1))))))))))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT |x|)))
          #9# (EXIT #6#)))) 

(SDEFUN |IMATLIN;rowEchelon;2M;10!0|
        ((|x| NIL) (|i| NIL) (|j| NIL) (|k| NIL) (|maxC| NIL) (|pp| NIL)
         ($$ NIL))
        (PROG (|cc| $)
          (LETT |cc| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT $ 23)))))) 

(SDEFUN |IMATLIN;nullSpace;ML;11| ((|y| M) ($ |List| |Col|))
        (SPROG
         ((|l| (|Integer|)) (|j| #1=(|Integer|)) (|basis| (|List| |Col|))
          (#2=#:G570 NIL) (|k| NIL) (#3=#:G571 NIL) (|ll| NIL) (|w| (|Col|))
          (#4=#:G569 NIL) (|i| NIL)
          (|v| (|IndexedOneDimensionalArray| (|Integer|) |minC|))
          (#5=#:G568 NIL) (|row| #6=(|Integer|)) (#7=#:G548 NIL)
          (|rk| #8=(|NonNegativeInteger|)) (#9=#:G547 NIL)
          (|ncol| (|NonNegativeInteger|)) (|nrow| #8#) (|maxC| #1#)
          (|minC| (|Integer|)) (|maxR| #6#) (|minR| (|Integer|)) (|x| (M)))
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 36)))
              (LETT |minR| (SPADCALL |x| (QREFELT $ 17)))
              (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
              (LETT |minC| (SPADCALL |x| (QREFELT $ 11)))
              (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)))
              (LETT |nrow| (SPADCALL |x| (QREFELT $ 47)))
              (LETT |ncol| (SPADCALL |x| (QREFELT $ 48))) (LETT |basis| NIL)
              (LETT |rk| |nrow|) (LETT |row| |maxR|)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |rk| 0 (QREFELT $ 27))
                        (|IMATLIN;rowAllZeroes?| |x| |row| $))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |rk|
                          (PROG1 (LETT #9# (- |rk| 1))
                            (|check_subtype2| (>= #9# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #9#)))
                    (EXIT
                     (LETT |row|
                           (PROG1 (LETT #7# (- |row| 1))
                             (|check_subtype2| (>= #7# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #7#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |ncol| |nrow| (QREFELT $ 37))
                (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
              (EXIT
               (COND
                ((EQL |rk| 0)
                 (SEQ
                  (SEQ (LETT |j| |minC|) (LETT #5# |maxC|) G190
                       (COND ((> |j| #5#) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| $ 14)
                                        (QREFELT $ 38)))
                        (SPADCALL |w| |j| (|spadConstant| $ 30) (QREFELT $ 39))
                        (EXIT (LETT |basis| (CONS |w| |basis|))))
                       (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))
                ('T
                 (SEQ
                  (LETT |v|
                        (SPADCALL |ncol| (- |minR| 1)
                                  (|compiledLookupCheck| '|new|
                                                         (LIST '$
                                                               (LIST
                                                                '|NonNegativeInteger|)
                                                               (LIST
                                                                '|Integer|))
                                                         (|IndexedOneDimensionalArray|
                                                          (|Integer|)
                                                          |minC|))))
                  (SEQ (LETT |i| |minR|) (LETT #4# (- (+ |minR| |rk|) 1)) G190
                       (COND ((> |i| #4#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| |minC|) G190
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                          (|spadConstant| $ 14)
                                          (QREFELT $ 35)))
                               (GO G191)))
                             (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1)) (GO G190)
                             G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |v| |j| |i|
                                   (|compiledLookupCheck| '|qsetelt!|
                                                          (LIST
                                                           (LIST '|Integer|) '$
                                                           (LIST '|Integer|)
                                                           (LIST '|Integer|))
                                                          (|IndexedOneDimensionalArray|
                                                           (|Integer|)
                                                           |minC|)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |j| |maxC|) (LETT |l| (- (+ |minR| |ncol|) 1))
                  (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
                       (SEQ
                        (LETT |w|
                              (SPADCALL |ncol| (|spadConstant| $ 14)
                                        (QREFELT $ 38)))
                        (COND
                         ((EQL
                           (SPADCALL |v| |j|
                                     (|compiledLookupCheck| '|qelt|
                                                            (LIST
                                                             (LIST '|Integer|)
                                                             '$
                                                             (LIST '|Integer|))
                                                            (|IndexedOneDimensionalArray|
                                                             (|Integer|)
                                                             |minC|)))
                           (- |minR| 1))
                          (COND
                           ((|IMATLIN;colAllZeroes?| |x| |j| $)
                            (SEQ
                             (SPADCALL |w| |l| (|spadConstant| $ 30)
                                       (QREFELT $ 39))
                             (EXIT (LETT |basis| (CONS |w| |basis|)))))
                           ('T
                            (SEQ
                             (SEQ (LETT |ll| |minR|) (LETT #3# (- |l| 1))
                                  (LETT |k| |minC|) (LETT #2# (- |j| 1)) G190
                                  (COND
                                   ((OR (> |k| #2#) (> |ll| #3#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |k|
                                                 (|compiledLookupCheck| '|qelt|
                                                                        (LIST
                                                                         (LIST
                                                                          '|Integer|)
                                                                         '$
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|IndexedOneDimensionalArray|
                                                                         (|Integer|)
                                                                         |minC|)))
                                       (- |minR| 1) (QREFELT $ 32))
                                      (SPADCALL |w| |ll|
                                                (SPADCALL
                                                 (SPADCALL |x|
                                                           (SPADCALL |v| |k|
                                                                     (|compiledLookupCheck|
                                                                      '|qelt|
                                                                      (LIST
                                                                       (LIST
                                                                        '|Integer|)
                                                                       '$
                                                                       (LIST
                                                                        '|Integer|))
                                                                      (|IndexedOneDimensionalArray|
                                                                       (|Integer|)
                                                                       |minC|)))
                                                           |j| (QREFELT $ 13))
                                                 (QREFELT $ 40))
                                                (QREFELT $ 39))))))
                                  (LETT |k|
                                        (PROG1 (+ |k| 1)
                                          (LETT |ll| (+ |ll| 1))))
                                  (GO G190) G191 (EXIT NIL))
                             (SPADCALL |w| |l| (|spadConstant| $ 30)
                                       (QREFELT $ 39))
                             (EXIT (LETT |basis| (CONS |w| |basis|))))))))
                        (LETT |j| (- |j| 1)) (EXIT (LETT |l| (- |l| 1))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |basis|)))))))) 

(SDEFUN |IMATLIN;determinant;MR;12| ((|y| M) ($ R))
        (SPROG
         ((#1=#:G594 NIL) (|l| NIL) (|b| (R)) (#2=#:G593 NIL) (|k| NIL)
          (#3=#:G592 NIL) (|ans| (R)) (#4=#:G588 NIL) (#5=#:G587 NIL)
          (|rown| (|Integer|)) (#6=#:G591 NIL) (#7=#:G589 NIL) (|i| NIL)
          (#8=#:G590 NIL) (|j| NIL) (|maxC| (|Integer|)) (|minC| (|Integer|))
          (|maxR| (|Integer|)) (|minR| (|Integer|)) (|x| (M))
          (|ndim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |ndim| (SPADCALL |y| (QREFELT $ 47)))
                       (SPADCALL |y| (QREFELT $ 48)) (QREFELT $ 43))
             (|error| "determinant: matrix must be square"))
            ((EQL |ndim| 0) (|spadConstant| $ 30))
            ((EQL |ndim| 1)
             (SPADCALL |y| (SPADCALL |y| (QREFELT $ 17))
                       (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 13)))
            ('T
             (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 29)))
                  (LETT |minR| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
                  (LETT |minC| (SPADCALL |x| (QREFELT $ 11)))
                  (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)))
                  (LETT |ans| (|spadConstant| $ 30))
                  (SEQ (LETT |j| |minC|) (LETT #8# (- |maxC| 1))
                       (LETT |i| |minR|) (LETT #7# (- |maxR| 1)) G190
                       (COND ((OR (> |i| #7#) (> |j| #8#)) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                    (|spadConstant| $ 14) (QREFELT $ 35))
                          (SEQ (LETT |rown| (- |minR| 1))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| (+ |i| 1)) (LETT #6# |maxR|)
                                      G190 (COND ((> |k| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| |k| |j|
                                                     (QREFELT $ 13))
                                           (|spadConstant| $ 14)
                                           (QREFELT $ 16))
                                          (PROGN
                                           (LETT #5#
                                                 (SEQ (LETT |rown| |k|)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #5# |$NoValue|)
                                                        (GO #9=#:G574)))))
                                           (GO #9#))))))
                                      (LETT |k| (+ |k| 1)) (GO G190) G191
                                      (EXIT NIL)))
                                #9# (EXIT #5#))
                               (COND
                                ((EQL |rown| (- |minR| 1))
                                 (PROGN
                                  (LETT #4# (|spadConstant| $ 14))
                                  (GO #10=#:G586))))
                               (SPADCALL |x| |i| |rown| (QREFELT $ 33))
                               (EXIT
                                (LETT |ans|
                                      (SPADCALL |ans| (QREFELT $ 40)))))))
                        (LETT |ans|
                              (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                        |ans| (QREFELT $ 19)))
                        (LETT |b|
                              (SPADCALL
                               (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                         (QREFELT $ 34))
                               (QREFELT $ 40)))
                        (SEQ (LETT |l| (+ |j| 1)) (LETT #3# |maxC|) G190
                             (COND ((> |l| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |x| |i| |l|
                                         (SPADCALL |b|
                                                   (SPADCALL |x| |i| |l|
                                                             (QREFELT $ 13))
                                                   (QREFELT $ 19))
                                         (QREFELT $ 46))))
                             (LETT |l| (+ |l| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SEQ (LETT |k| (+ |i| 1)) (LETT #2# |maxR|) G190
                              (COND ((> |k| #2#) (GO G191)))
                              (SEQ
                               (LETT |b| (SPADCALL |x| |k| |j| (QREFELT $ 13)))
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL |b| (|spadConstant| $ 14)
                                             (QREFELT $ 35)))
                                  (SEQ (LETT |l| (+ |j| 1)) (LETT #1# |maxC|)
                                       G190 (COND ((> |l| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |x| |k| |l|
                                                   (SPADCALL
                                                    (SPADCALL |x| |k| |l|
                                                              (QREFELT $ 13))
                                                    (SPADCALL |b|
                                                              (SPADCALL |x| |i|
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 13))
                                                              (QREFELT $ 19))
                                                    (QREFELT $ 44))
                                                   (QREFELT $ 46))))
                                       (LETT |l| (+ |l| 1)) (GO G190) G191
                                       (EXIT NIL))))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (SPADCALL |x| |maxR| |maxC| (QREFELT $ 13)) |ans|
                             (QREFELT $ 19)))))))
          #10# (EXIT #4#)))) 

(SDEFUN |IMATLIN;rank;MNni;13| ((|x| M) ($ |NonNegativeInteger|))
        (SPROG
         ((|rk| (|NonNegativeInteger|)) (#1=#:G597 NIL) (|i| (|Integer|))
          (|y| (M)) (|rh| (|NonNegativeInteger|)))
         (SEQ
          (LETT |y|
                (SEQ (LETT |rk| (SPADCALL |x| (QREFELT $ 47)))
                     (LETT |rh| (SPADCALL |x| (QREFELT $ 48)))
                     (EXIT
                      (COND
                       ((SPADCALL |rk| |rh| (QREFELT $ 27))
                        (SEQ (LETT |rk| |rh|)
                             (EXIT (SPADCALL |x| (QREFELT $ 49)))))
                       ('T (SPADCALL |x| (QREFELT $ 29)))))))
          (LETT |y| (SPADCALL |y| (QREFELT $ 36)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 18)))
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |rk| 0 (QREFELT $ 27))
                    (|IMATLIN;rowAllZeroes?| |y| |i| $))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (LETT |i| (- |i| 1))
                    (EXIT
                     (LETT |rk|
                           (PROG1 (LETT #1# (- |rk| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |rk|)))) 

(SDEFUN |IMATLIN;nullity;MNni;14| ((|x| M) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G602 NIL))
               (PROG1
                   (LETT #1#
                         (- (SPADCALL |x| (QREFELT $ 48))
                            (SPADCALL |x| (QREFELT $ 50))))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15| ((|x| M) ($ M))
        (SPROG
         ((|yy| (|Matrix| FSUP)) (#1=#:G606 NIL) (|var| (|Fraction| SUP))
          (|nc| (|NonNegativeInteger|)) (|ty| (|Matrix| FSUP))
          (|y| (|Matrix| FSUP))
          (MATCAT22
           (CATEGORY |package|
            (SIGNATURE |map| (M (|Mapping| R FSUP) #2=(|Matrix| FSUP)))
            (SIGNATURE |map|
             ((|Union| M . #3=("failed"))
              (|Mapping| (|Union| R . #4=("failed")) FSUP) #2#))
            (SIGNATURE |reduce| (R (|Mapping| R FSUP R) #2# R))))
          (MATCAT2
           (CATEGORY |package|
            (SIGNATURE |map| (#5=(|Matrix| FSUP) (|Mapping| FSUP R) M))
            (SIGNATURE |map|
             ((|Union| #5# . #3#) (|Mapping| (|Union| FSUP . #4#) R) M))
            (SIGNATURE |reduce| (FSUP (|Mapping| FSUP R FSUP) M FSUP))))
          (VFSUP
           (|Join| (|VectorCategory| FSUP)
                   (CATEGORY |domain| (SIGNATURE |vector| ($ (|List| FSUP))))))
          (FSUP
           (|Join| (|QuotientFieldCategory| SUP)
                   (CATEGORY |domain|
                    (IF (|has| SUP (|IntegerNumberSystem|))
                        (IF (|has| SUP (|OpenMath|))
                            (ATTRIBUTE (|OpenMath|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| SUP (|Canonical|))
                        (IF (|has| SUP (|GcdDomain|))
                            (IF (|has| SUP (|canonicalUnitNormal|))
                                (ATTRIBUTE (|Canonical|))
                                |noBranch|)
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| SUP (|UniqueFactorizationDomain|))
                        (SIGNATURE |factorFraction|
                         ((|Fraction| (|Factored| SUP)) $))
                        |noBranch|))))
          (SUP
           (|Join| (|UnivariatePolynomialCategory| R)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm|
                     ((|OutputForm|) $ (|OutputForm|)))))))
         (SEQ (LETT SUP (|SparseUnivariatePolynomial| (QREFELT $ 6)))
              (LETT FSUP (|Fraction| SUP)) (LETT VFSUP (|Vector| FSUP))
              (LETT MATCAT2
                    (|MatrixCategoryFunctions2| (QREFELT $ 6) (QREFELT $ 7)
                                                (QREFELT $ 8) (QREFELT $ 9)
                                                FSUP VFSUP VFSUP
                                                (|Matrix| FSUP)))
              (LETT MATCAT22
                    (|MatrixCategoryFunctions2| FSUP VFSUP VFSUP
                                                (|Matrix| FSUP) (QREFELT $ 6)
                                                (QREFELT $ 7) (QREFELT $ 8)
                                                (QREFELT $ 9)))
              (LETT |y|
                    (SPADCALL
                     (CONS #'|IMATLIN;generalizedInverse;2M;15!0|
                           (VECTOR FSUP SUP $))
                     |x|
                     (|compiledLookupCheck| '|map|
                                            (LIST
                                             (LIST '|Matrix|
                                                   (|devaluate| FSUP))
                                             (LIST '|Mapping|
                                                   (|devaluate| FSUP)
                                                   (|devaluate| (ELT $ 6)))
                                             (|devaluate| (ELT $ 9)))
                                            MATCAT2)))
              (LETT |ty|
                    (SPADCALL |y|
                              (|compiledLookupCheck| '|transpose| (LIST '$ '$)
                                                     (|Matrix| FSUP))))
              (LETT |yy|
                    (SPADCALL |ty| |y|
                              (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                     (|Matrix| FSUP))))
              (LETT |nc| (ANCOLS |yy|))
              (LETT |var|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 30) 1
                               (|compiledLookupCheck| '|monomial|
                                                      (LIST '$
                                                            (|devaluate|
                                                             (ELT $ 6))
                                                            (LIST
                                                             '|NonNegativeInteger|))
                                                      SUP))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| SUP))
                                            (|Fraction| SUP))))
              (LETT |yy|
                    (SPADCALL
                     (PROG2
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL |yy|
                                          (SPADCALL (ANCOLS |yy|) |var|
                                                    (|compiledLookupCheck|
                                                     '|scalarMatrix|
                                                     (LIST '$
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (|devaluate| FSUP))
                                                     (|Matrix| FSUP)))
                                          (|compiledLookupCheck| '+
                                                                 (LIST '$ '$
                                                                       '$)
                                                                 (|Matrix|
                                                                  FSUP)))
                                (|compiledLookupCheck| '|inverse|
                                                       (LIST
                                                        (LIST '|Union| '$
                                                              '#6="failed")
                                                        '$)
                                                       (|Matrix| FSUP))))
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|Matrix| FSUP)
                                       (|Union| (|Matrix| FSUP) #6#) #1#))
                     |ty|
                     (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                            (|Matrix| FSUP))))
              (EXIT
               (SPADCALL
                (CONS #'|IMATLIN;generalizedInverse;2M;15!1| (VECTOR SUP $))
                |yy|
                (|compiledLookupCheck| '|map|
                                       (LIST (|devaluate| (ELT $ 9))
                                             (LIST '|Mapping|
                                                   (|devaluate| (ELT $ 6))
                                                   (|devaluate| FSUP))
                                             (LIST '|Matrix|
                                                   (|devaluate| FSUP)))
                                       MATCAT22)))))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ SUP)
          (LETT $ (QREFELT $$ 1))
          (LETT SUP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1| (|spadConstant| $ 14)
                      (|compiledLookupCheck| '|elt|
                                             (LIST (|devaluate| (ELT $ 6))
                                                   (LIST '|Fraction| '$)
                                                   (|devaluate| (ELT $ 6)))
                                             SUP)))))) 

(SDEFUN |IMATLIN;generalizedInverse;2M;15!0| ((|r1| NIL) ($$ NIL))
        (PROG ($ SUP FSUP)
          (LETT $ (QREFELT $$ 2))
          (LETT SUP (QREFELT $$ 1))
          (LETT FSUP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |r1|
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (|devaluate| (ELT $ 6)))
                                              SUP))
             (|compiledLookupCheck| '|coerce| (LIST '$ (|devaluate| SUP))
                                    FSUP)))))) 

(SDEFUN |IMATLIN;inverse;MU;16| ((|x| M) ($ |Union| M "failed"))
        (SPROG
         ((AB (M)) (#1=#:G627 NIL) (|j| NIL) (#2=#:G628 NIL) (|l| NIL)
          (#3=#:G625 NIL) (|i| NIL) (#4=#:G626 NIL) (|k| NIL)
          (|lmax| #5=(|Integer|)) (|lmin| #6=(|Integer|)) (|kmax| #5#)
          (|kmin| #7=(|Integer|)) (|maxC| (|Integer|)) (|minC| #6#)
          (|maxR| (|Integer|)) (|minR| #7#) (|detinv| (R)) (|det| (R))
          (|ans2| (M)) (|ndim| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |ndim| (SPADCALL |x| (QREFELT $ 47)))
                      (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 43))
            (|error| "inverse: matrix must be square"))
           ((EQL |ndim| 0) (CONS 0 |x|))
           ((EQL |ndim| 2)
            (SEQ (LETT |ans2| (SPADCALL |ndim| |ndim| (QREFELT $ 53)))
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |det|
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 54))
                                      (SPADCALL |x| 2 2 (QREFELT $ 54))
                                      (QREFELT $ 19))
                            (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 54))
                                      (SPADCALL |x| 2 1 (QREFELT $ 54))
                                      (QREFELT $ 19))
                            (QREFELT $ 20)))
                     (QREFELT $ 55))
                    (CONS 1 "failed"))
                   (#8='T
                    (SEQ (LETT |detinv| (SPADCALL |det| (QREFELT $ 34)))
                         (SPADCALL |ans2| 1 1
                                   (SPADCALL (SPADCALL |x| 2 2 (QREFELT $ 54))
                                             |detinv| (QREFELT $ 19))
                                   (QREFELT $ 56))
                         (SPADCALL |ans2| 1 2
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 54))
                                              |detinv| (QREFELT $ 19))
                                    (QREFELT $ 40))
                                   (QREFELT $ 56))
                         (SPADCALL |ans2| 2 1
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |x| 2 1 (QREFELT $ 54))
                                              |detinv| (QREFELT $ 19))
                                    (QREFELT $ 40))
                                   (QREFELT $ 56))
                         (SPADCALL |ans2| 2 2
                                   (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 54))
                                             |detinv| (QREFELT $ 19))
                                   (QREFELT $ 56))
                         (EXIT (CONS 0 |ans2|))))))))
           (#8#
            (SEQ (LETT AB (SPADCALL |ndim| (+ |ndim| |ndim|) (QREFELT $ 53)))
                 (LETT |minR| (SPADCALL |x| (QREFELT $ 17)))
                 (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)))
                 (LETT |minC| (SPADCALL |x| (QREFELT $ 11)))
                 (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)))
                 (LETT |kmin| (SPADCALL AB (QREFELT $ 17)))
                 (LETT |kmax| (- (+ |kmin| |ndim|) 1))
                 (LETT |lmin| (SPADCALL AB (QREFELT $ 11)))
                 (LETT |lmax| (- (+ |lmin| |ndim|) 1))
                 (SEQ (LETT |k| |kmin|) (LETT #4# |kmax|) (LETT |i| |minR|)
                      (LETT #3# |maxR|) G190
                      (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                      (SEQ
                       (SEQ (LETT |l| |lmin|) (LETT #2# |lmax|)
                            (LETT |j| |minC|) (LETT #1# |maxC|) G190
                            (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL AB |k| |l|
                                        (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                        (QREFELT $ 46))))
                            (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL AB |k| (- (+ (+ |lmin| |ndim|) |k|) |kmin|)
                                  (|spadConstant| $ 30) (QREFELT $ 46))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                      (GO G190) G191 (EXIT NIL))
                 (LETT AB (SPADCALL AB (QREFELT $ 36)))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL AB |kmax| |lmax| (QREFELT $ 54))
                              (|spadConstant| $ 14) (QREFELT $ 35))
                    (CONS 1 "failed"))
                   (#8#
                    (CONS 0
                          (SPADCALL AB |kmin| |kmax| (+ |lmin| |ndim|)
                                    (+ |lmax| |ndim|) (QREFELT $ 57)))))))))))) 

(DECLAIM (NOTINLINE |InnerMatrixLinearAlgebraFunctions;|)) 

(DEFUN |InnerMatrixLinearAlgebraFunctions| (&REST #1=#:G629)
  (SPROG NIL
         (PROG (#2=#:G630)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMatrixLinearAlgebraFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerMatrixLinearAlgebraFunctions;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerMatrixLinearAlgebraFunctions|)))))))))) 

(DEFUN |InnerMatrixLinearAlgebraFunctions;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$|
          (LIST '|InnerMatrixLinearAlgebraFunctions| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 60))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|shallowlyMutable|))))))
    (|haddProp| |$ConstructorCache| '|InnerMatrixLinearAlgebraFunctions|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|domainEqual| |#4| (|Matrix| |#1|))
      (PROGN
       (QSETREFV $ 22
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;3|) $))
       (QSETREFV $ 23
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_modular;M4IRIV;4|)
                  $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;5|) $))
       (COND
        ((|testBitVector| |pv$| 1)
         (QSETREFV $ 42
                   (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;6|) $))))
       (QSETREFV $ 45
                 (CONS (|dispatchFunction| |IMATLIN;determinant;MR;7|) $))))
     ('T
      (PROGN
       (QSETREFV $ 22
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;8|) $))
       (QSETREFV $ 23
                 (CONS
                  (|dispatchFunction| |IMATLIN;row_operation_modular;M4IRIV;9|)
                  $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;10|) $))
       (COND
        ((|testBitVector| |pv$| 1)
         (QSETREFV $ 42
                   (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;11|) $))))
       (QSETREFV $ 45
                 (CONS (|dispatchFunction| |IMATLIN;determinant;MR;12|) $)))))
    $))) 

(MAKEPROP '|InnerMatrixLinearAlgebraFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |qelt|) (17 . |Zero|) (|Boolean|)
              (21 . ~=) (27 . |minRowIndex|) (32 . |maxRowIndex|) (37 . *)
              (43 . -) (|Void|) (49 . |row_operation_base|)
              (59 . |row_operation_modular|) (|NonNegativeInteger|)
              (70 . |characteristic|) (74 . |Zero|) (78 . >) (84 . <)
              (90 . |copy|) (95 . |One|) (99 . >) (105 . ~=)
              (111 . |swapRows!|) (118 . |inv|) (123 . =) (129 . |rowEchelon|)
              (134 . <=) (140 . |new|) (146 . |qsetelt!|) (153 . -) (|List| 8)
              (158 . |nullSpace|) (163 . ~=) (169 . +) (175 . |determinant|)
              (180 . |qsetelt!|) (188 . |nrows|) (193 . |ncols|)
              (198 . |transpose|) |IMATLIN;rank;MNni;13|
              |IMATLIN;nullity;MNni;14| |IMATLIN;generalizedInverse;2M;15|
              (203 . |zero|) (209 . |elt|) (216 . |zero?|) (221 . |setelt!|)
              (229 . |subMatrix|) (|Union| 9 '#1="failed")
              |IMATLIN;inverse;MU;16|)
           '#(|row_operation_modular| 238 |row_operation_base| 249 |rowEchelon|
              259 |rank| 264 |nullity| 269 |nullSpace| 274 |inverse| 279
              |generalizedInverse| 284 |determinant| 289)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|rowEchelon| (|#4| |#4|)) T)
                                   '((|rank| ((|NonNegativeInteger|) |#4|)) T)
                                   '((|nullity| ((|NonNegativeInteger|) |#4|))
                                     T)
                                   '((|nullSpace| ((|List| |#3|) |#4|))
                                     (|has| 8 (|shallowlyMutable|)))
                                   '((|determinant| (|#1| |#4|)) T)
                                   '((|generalizedInverse| (|#4| |#4|)) T)
                                   '((|inverse| ((|Union| |#4| #1#) |#4|)) T)
                                   '((|row_operation_base|
                                      ((|Void|) |#4| (|Integer|) (|Integer|)
                                       (|Integer|) (|Integer|) |#1|))
                                     T)
                                   '((|row_operation_modular|
                                      ((|Void|) |#4| (|Integer|) (|Integer|)
                                       (|Integer|) (|Integer|) |#1|
                                       (|Integer|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 59
                                            '(1 9 10 0 11 1 9 10 0 12 3 9 6 0
                                              10 10 13 0 6 0 14 2 6 15 0 0 16 1
                                              9 10 0 17 1 9 10 0 18 2 6 0 0 0
                                              19 2 6 0 0 0 20 6 0 21 9 10 10 10
                                              10 6 22 7 0 21 9 10 10 10 10 6 10
                                              23 0 6 24 25 0 24 0 26 2 24 15 0
                                              0 27 2 24 15 0 0 28 1 9 0 0 29 0
                                              6 0 30 2 10 15 0 0 31 2 10 15 0 0
                                              32 3 9 0 0 10 10 33 1 6 0 0 34 2
                                              6 15 0 0 35 1 0 9 9 36 2 24 15 0
                                              0 37 2 8 0 24 6 38 3 8 6 0 10 6
                                              39 1 6 0 0 40 1 0 41 9 42 2 24 15
                                              0 0 43 2 6 0 0 0 44 1 0 6 9 45 4
                                              9 6 0 10 10 6 46 1 9 24 0 47 1 9
                                              24 0 48 1 9 0 0 49 2 9 0 24 24 53
                                              3 9 6 0 10 10 54 1 6 15 0 55 4 9
                                              6 0 10 10 6 56 5 9 0 0 10 10 10
                                              10 57 7 0 21 9 10 10 10 10 6 10
                                              23 6 0 21 9 10 10 10 10 6 22 1 0
                                              9 9 36 1 0 24 9 50 1 0 24 9 51 1
                                              1 41 9 42 1 0 58 9 59 1 0 9 9 52
                                              1 0 6 9 45)))))
           '|lookupComplete|)) 
