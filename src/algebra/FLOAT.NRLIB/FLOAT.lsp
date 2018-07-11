
(SDEFUN |FLOAT;writeOMFloat| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 13))
             (SPADCALL |dev| "bigfloat1" "bigfloat" (QREFELT $ 15))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 18))
             (SPADCALL |dev| 2 (QREFELT $ 18))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 18))
             (EXIT (SPADCALL |dev| (QREFELT $ 20))))) 

(SDEFUN |FLOAT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 21))))
             (|FLOAT;writeOMFloat| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 22))))))) 

(SDEFUN |FLOAT;shift2| ((|x| |Integer|) (|y| |Integer|) ($ |Integer|))
        (* (SPADCALL |x| (QREFELT $ 25))
           (ASH (* (SPADCALL |x| (QREFELT $ 25)) |x|) |y|))) 

(SDEFUN |FLOAT;asin;2$;4| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                      ((SPADCALL |x| (QREFELT $ 28))
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 29)) (QREFELT $ 30))
                        (QREFELT $ 29)))
                      ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                       (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34)))
                      ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                       (|error|
                        (SPADCALL
                         (LIST "asin: argument > 1 in magnitude" ": "
                               (SPADCALL |x| (QREFELT $ 36)))
                         (QREFELT $ 38))))
                      ('T
                       (SEQ (SPADCALL 5 (QREFELT $ 39))
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL |x|
                                             (SPADCALL
                                              (|FLOAT;sub|
                                               (|spadConstant| $ 31)
                                               (|FLOAT;times| |x| |x| $) $)
                                              (QREFELT $ 40))
                                             (QREFELT $ 41))
                                   (QREFELT $ 42)))
                            (SPADCALL 5 (QREFELT $ 43))
                            (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;acos;2$;5| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 26))
                  (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34)))
                 ((SPADCALL |x| (QREFELT $ 28))
                  (SEQ (SPADCALL 3 (QREFELT $ 39))
                       (LETT |r|
                             (SPADCALL (SPADCALL (QREFELT $ 33))
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 29))
                                                 (QREFELT $ 45))
                                       (QREFELT $ 46)))
                       (SPADCALL 3 (QREFELT $ 43))
                       (EXIT (SPADCALL |r| (QREFELT $ 44)))))
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                  (|spadConstant| $ 27))
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                  (|error|
                   (SPADCALL
                    (LIST "acos: argument > 1 in magnitude" ": "
                          (SPADCALL |x| (QREFELT $ 36)))
                    (QREFELT $ 38))))
                 ('T
                  (SEQ (SPADCALL 5 (QREFELT $ 39))
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (|FLOAT;sub| (|spadConstant| $ 31)
                                 (|FLOAT;times| |x| |x| $) $)
                                (QREFELT $ 40))
                               |x| (QREFELT $ 41))
                              (QREFELT $ 42)))
                       (SPADCALL 5 (QREFELT $ 43))
                       (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;atan;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                  (COND
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 35))
                    (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34)))
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 47))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 33)) 2 (QREFELT $ 34))
                     (QREFELT $ 29)))
                   (#1='T (|spadConstant| $ 27))))
                 (#1#
                  (SEQ
                   (LETT |theta|
                         (SPADCALL
                          (SPADCALL (SPADCALL |y| |x| (QREFELT $ 41))
                                    (QREFELT $ 48))
                          (QREFELT $ 42)))
                   (COND
                    ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 47))
                     (LETT |theta|
                           (SPADCALL (SPADCALL (QREFELT $ 33)) |theta|
                                     (QREFELT $ 46)))))
                   (COND
                    ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 47))
                     (LETT |theta| (SPADCALL |theta| (QREFELT $ 29)))))
                   (EXIT |theta|))))))) 

(SDEFUN |FLOAT;atan;2$;7| ((|x| $) ($ $))
        (SPROG
         ((|t| ($)) (#1=#:G509 NIL) (|i| NIL) (|k| (|Integer|)) (#2=#:G508 NIL)
          (|r| ($)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                 ((SPADCALL |x| (QREFELT $ 28))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 29)) (QREFELT $ 42))
                   (QREFELT $ 29)))
                 (#3='T
                  (SEQ
                   (COND
                    ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                     (SEQ (SPADCALL 4 (QREFELT $ 39))
                          (LETT |r|
                                (COND
                                 ((SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                            (QREFELT $ 26))
                                  (COND
                                   ((SPADCALL |x|
                                              (CONS (SPADCALL (QREFELT $ 51))
                                                    0)
                                              (QREFELT $ 47))
                                    (|FLOAT;atanInverse|
                                     (SPADCALL |x| (QREFELT $ 52)) $))
                                   (#3#
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 31) |x|
                                               (QREFELT $ 41))
                                     (QREFELT $ 42)))))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 31) |x|
                                             (QREFELT $ 41))
                                   (QREFELT $ 42)))))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (SPADCALL (QREFELT $ 33)) 2
                                           (QREFELT $ 34))
                                 |r| (QREFELT $ 46)))
                          (SPADCALL 4 (QREFELT $ 43))
                          (EXIT
                           (PROGN
                            (LETT #2# (SPADCALL |r| (QREFELT $ 44)))
                            (GO #4=#:G507))))))
                   (LETT |k|
                         (QUOTIENT2
                          (SPADCALL (- (SPADCALL (QREFELT $ 51)) 100)
                                    (QREFELT $ 54))
                          5))
                   (LETT |k|
                         (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55)))))
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 56)) (QREFELT $ 39))
                   (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL (|spadConstant| $ 31)
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| $ 31)
                                                      (SPADCALL |x| |x|
                                                                (QREFELT $ 57))
                                                      (QREFELT $ 58))
                                                     (QREFELT $ 40))
                                                    (QREFELT $ 58))
                                          (QREFELT $ 41)))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (LETT |t| (|FLOAT;atanSeries| |x| $))
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 56)) (QREFELT $ 43))
                   (LETT |t| (SPADCALL |t| |k| (QREFELT $ 59)))
                   (EXIT (SPADCALL |t| (QREFELT $ 44)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FLOAT;atanSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|y| ($)) (|d| #2#) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 2))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |y| (|FLOAT;times| |x| |x| $))
          (LETT |t|
                (LETT |m|
                      (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $))))
          (SEQ (LETT |i| 3) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)))
                    (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 57)))))) 

(SDEFUN |FLOAT;atanInverse| ((|n| |Integer|) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #1#) (|k| NIL) (|e| (|Integer|))
          (|n2| (|Integer|)))
         (SEQ (LETT |n2| (- (* |n| |n|)))
              (LETT |e|
                    (+
                     (+
                      (+ (SPADCALL (QREFELT $ 51))
                         (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                      (INTEGER-LENGTH |n|))
                     1))
              (LETT |s| (QUOTIENT2 (ASH 1 |e|) |n|))
              (LETT |t| (QUOTIENT2 |s| |n2|))
              (SEQ (LETT |k| 3) G190
                   (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
                   (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)))
                        (EXIT (LETT |t| (QUOTIENT2 |t| |n2|))))
                   (LETT |k| (|add_SI| |k| 2)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (CONS |s| (- |e|)) (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;sin;2$;10| ((|x| $) ($ $))
        (SPROG
         ((|r| ($)) (#1=#:G539 NIL) (|i| NIL) (#2=#:G534 NIL) (|k| (|Integer|))
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 61)))
              (LETT |x| (SPADCALL |x| (QREFELT $ 48)))
              (LETT |p| (SPADCALL (QREFELT $ 51))) (SPADCALL 4 (QREFELT $ 39))
              (COND
               ((SPADCALL |x| (CONS 6 0) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL
                            (SPADCALL 2 (SPADCALL (QREFELT $ 33))
                                      (QREFELT $ 62))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                        (QREFELT $ 41))
                              2 (QREFELT $ 34))
                             (QREFELT $ 50))
                            (QREFELT $ 57)))
                     (EXIT (SPADCALL |p| (QREFELT $ 63))))))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39)) (LETT |s| (- |s|))
                     (LETT |x|
                           (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                     (QREFELT $ 46)))
                     (EXIT (SPADCALL |p| (QREFELT $ 63))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 33)) |x|
                                     (QREFELT $ 46)))
                     (EXIT (SPADCALL |p| (QREFELT $ 43))))))
              (LETT |k|
                    (QUOTIENT2
                     (SPADCALL (- (SPADCALL (QREFELT $ 51)) 100)
                               (QREFELT $ 54))
                     4))
              (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55)))))
              (COND
               ((SPADCALL |k| 0 (QREFELT $ 64))
                (SEQ (SPADCALL |k| (QREFELT $ 39))
                     (EXIT
                      (LETT |x|
                            (SPADCALL |x|
                                      (EXPT 3
                                            (PROG1 (LETT #2# |k|)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#)))
                                      (QREFELT $ 34)))))))
              (LETT |r| (|FLOAT;sinSeries| |x| $))
              (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL (|FLOAT;itimes| 3 |r| $)
                                     (SPADCALL (SPADCALL |r| 3 (QREFELT $ 65))
                                               2 (QREFELT $ 59))
                                     (QREFELT $ 46)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |p| (QREFELT $ 63))
              (EXIT (SPADCALL |s| |r| (QREFELT $ 66)))))) 

(SDEFUN |FLOAT;sinSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| ($)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 2))
          (LETT |y| (|FLOAT;times| |x| |x| $))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)))
          (LETT |t| (QUOTIENT2 |m| 6))
          (SEQ (LETT |i| 4) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|))
                    (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))))
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 57)))))) 

(SDEFUN |FLOAT;cos;2$;12| ((|x| $) ($ $))
        (SPROG
         ((|r| ($)) (#1=#:G557 NIL) (|i| NIL) (|k| (|Integer|)) (#2=#:G556 NIL)
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| 1) (LETT |x| (SPADCALL |x| (QREFELT $ 48)))
                (LETT |p| (SPADCALL (QREFELT $ 51)))
                (SPADCALL 4 (QREFELT $ 39))
                (COND
                 ((SPADCALL |x| (CONS 6 0) (QREFELT $ 35))
                  (SEQ (SPADCALL |p| (QREFELT $ 39))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL 2 (SPADCALL (QREFELT $ 33))
                                        (QREFELT $ 62))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                          (QREFELT $ 41))
                                2 (QREFELT $ 34))
                               (QREFELT $ 50))
                              (QREFELT $ 57)))
                       (EXIT (SPADCALL |p| (QREFELT $ 43))))))
                (COND
                 ((SPADCALL |x| (CONS 3 0) (QREFELT $ 35))
                  (SEQ (SPADCALL |p| (QREFELT $ 39)) (LETT |s| (- |s|))
                       (LETT |x|
                             (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                       (QREFELT $ 46)))
                       (EXIT (SPADCALL |p| (QREFELT $ 43))))))
                (COND
                 ((SPADCALL |x| (CONS 1 0) (QREFELT $ 35))
                  (SEQ (SPADCALL |p| (QREFELT $ 39))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT $ 33)) 2
                                        (QREFELT $ 34))
                              |x| (QREFELT $ 46)))
                       (SPADCALL |p| (QREFELT $ 63))
                       (LETT |x| (SPADCALL |x| (QREFELT $ 44)))
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (SPADCALL |s| (SPADCALL |x| (QREFELT $ 67))
                                         (QREFELT $ 66)))
                         (GO #3=#:G555))))))
                (LETT |k|
                      (QUOTIENT2
                       (SPADCALL (- (SPADCALL (QREFELT $ 51)) 100)
                                 (QREFELT $ 54))
                       3))
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55)))))
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 64))
                  (SEQ
                   (SPADCALL (+ |k| (EXPT (INTEGER-LENGTH |k|) 2))
                             (QREFELT $ 39))
                   (EXIT (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 59)))))))
                (LETT |r| (|FLOAT;cosSeries| |x| $))
                (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL (SPADCALL |r| |r| (QREFELT $ 57)) 1
                                        (QREFELT $ 59))
                              (|spadConstant| $ 31) (QREFELT $ 46)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL |p| (QREFELT $ 63))
                (EXIT (SPADCALL |s| |r| (QREFELT $ 66)))))
          #3# (EXIT #2#)))) 

(SDEFUN |FLOAT;cosSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| ($)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 1))
          (LETT |y| (|FLOAT;times| |x| |x| $))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)))
          (LETT |t| (QUOTIENT2 |m| 2))
          (SEQ (LETT |i| 3) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|))
                    (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))))
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;tan;2$;14| ((|x| $) ($ $))
        (SPROG
         ((|t| ($)) (|c| ($)) (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 61)))
              (LETT |x| (SPADCALL |x| (QREFELT $ 48)))
              (LETT |p| (SPADCALL (QREFELT $ 51))) (SPADCALL 6 (QREFELT $ 39))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 33))
                                     (SPADCALL
                                      (SPADCALL |x| (SPADCALL (QREFELT $ 33))
                                                (QREFELT $ 41))
                                      (QREFELT $ 50))
                                     (QREFELT $ 57)))
                     (EXIT (SPADCALL |p| (QREFELT $ 43))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 35))
                (SEQ (SPADCALL |p| (QREFELT $ 39))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 33)) |x|
                                     (QREFELT $ 46)))
                     (LETT |s| (- |s|)) (EXIT (SPADCALL |p| (QREFELT $ 43))))))
              (COND
               ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 68)))
                     (EXIT
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 31)
                                        (SPADCALL |c| |c| (QREFELT $ 57))
                                        (QREFELT $ 46))
                              (QREFELT $ 40))
                             |c| (QREFELT $ 41))))))
               ('T
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 67)))
                     (EXIT
                      (LETT |t|
                            (SPADCALL |c|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 31)
                                                 (SPADCALL |c| |c|
                                                           (QREFELT $ 57))
                                                 (QREFELT $ 46))
                                       (QREFELT $ 40))
                                      (QREFELT $ 41)))))))
              (SPADCALL |p| (QREFELT $ 63))
              (EXIT (SPADCALL |s| |t| (QREFELT $ 66)))))) 

(SDEFUN |FLOAT;pi;$;15| (($ $))
        (COND
         ((SPADCALL (SPADCALL (QREFELT $ 51)) (QCAR (QREFELT $ 70))
                    (QREFELT $ 72))
          (SPADCALL (QCDR (QREFELT $ 70)) (QREFELT $ 44)))
         ('T
          (QCDR
           (SETELT $ 70
                   (CONS (SPADCALL (QREFELT $ 51)) (|FLOAT;piRamanujan| $))))))) 

(SDEFUN |FLOAT;piRamanujan| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|m| (|Integer|)) (|s| (|Integer|)) (|i| NIL)
          (|j| NIL) (|d| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 11))
          (LETT |t| (QUOTIENT2 (ASH 1 |n|) 882))
          (LETT |d| (* 4 (SPADCALL 882 2 (QREFELT $ 73)))) (LETT |s| 0)
          (SEQ (LETT |j| 1123) (LETT |i| 2) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (SPADCALL |j| |t| (QREFELT $ 75))))
                    (LETT |m|
                          (-
                           (*
                            (* (- |i| 1) (- (SPADCALL 2 |i| (QREFELT $ 76)) 1))
                            (- (SPADCALL 2 |i| (QREFELT $ 76)) 3))))
                    (EXIT
                     (LETT |t|
                           (QUOTIENT2 (* |m| |t|)
                                      (* |d|
                                         (SPADCALL |i| 3 (QREFELT $ 77)))))))
               (LETT |i|
                     (PROG1 (|add_SI| |i| 2) (LETT |j| (|add_SI| |j| 21460))))
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|spadConstant| $ 31) (CONS |s| (- (- |n|) 2))
                     (QREFELT $ 41)))))) 

(SDEFUN |FLOAT;sinh;2$;17| ((|x| $) ($ $))
        (SPROG ((|s| ($)) (|e| ($)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 55))) 0))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 56))
                                     (SPADCALL (QREFELT $ 51)) (QREFELT $ 64))
                           |x|)
                          (#1#
                           (SEQ (SPADCALL (+ 5 |lost|) (QREFELT $ 39))
                                (LETT |e| (SPADCALL |x| (QREFELT $ 78)))
                                (LETT |s|
                                      (SPADCALL
                                       (SPADCALL |e|
                                                 (SPADCALL
                                                  (|spadConstant| $ 31) |e|
                                                  (QREFELT $ 41))
                                                 (QREFELT $ 46))
                                       2 (QREFELT $ 34)))
                                (SPADCALL (+ 5 |lost|) (QREFELT $ 43))
                                (EXIT (SPADCALL |s| (QREFELT $ 44))))))))))))) 

(SDEFUN |FLOAT;cosh;2$;18| ((|x| $) ($ $))
        (SPROG ((|c| ($)) (|e| ($)))
               (SEQ (SPADCALL 5 (QREFELT $ 39))
                    (LETT |e| (SPADCALL |x| (QREFELT $ 78)))
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL |e|
                                     (SPADCALL (|spadConstant| $ 31) |e|
                                               (QREFELT $ 41))
                                     (QREFELT $ 58))
                           2 (QREFELT $ 34)))
                    (SPADCALL 5 (QREFELT $ 43))
                    (EXIT (SPADCALL |c| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;tanh;2$;19| ((|x| $) ($ $))
        (SPROG ((|t| ($)) (|e| ($)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 26)) (|spadConstant| $ 27))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 55))) 0))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 56))
                                     (SPADCALL (QREFELT $ 51)) (QREFELT $ 64))
                           |x|)
                          (#1#
                           (SEQ (SPADCALL (+ 6 |lost|) (QREFELT $ 39))
                                (LETT |e| (SPADCALL |x| (QREFELT $ 78)))
                                (LETT |e| (SPADCALL |e| |e| (QREFELT $ 57)))
                                (LETT |t|
                                      (SPADCALL
                                       (SPADCALL |e| (|spadConstant| $ 31)
                                                 (QREFELT $ 46))
                                       (SPADCALL |e| (|spadConstant| $ 31)
                                                 (QREFELT $ 58))
                                       (QREFELT $ 41)))
                                (SPADCALL (+ 6 |lost|) (QREFELT $ 43))
                                (EXIT (SPADCALL |t| (QREFELT $ 44))))))))))))) 

(SDEFUN |FLOAT;asinh;2$;20| ((|x| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G598 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 55))))
                      (COND
                       ((OR (SPADCALL |x| (QREFELT $ 26))
                            (< (SPADCALL 2 |p| (QREFELT $ 56))
                               (- (SPADCALL (QREFELT $ 51)))))
                        (PROGN (LETT #1# |x|) (GO #2=#:G597))))
                      (SPADCALL (- 5 |p|) (QREFELT $ 39))
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL |x|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 31)
                                                  (SPADCALL |x| |x|
                                                            (QREFELT $ 57))
                                                  (QREFELT $ 58))
                                        (QREFELT $ 40))
                                       (QREFELT $ 58))
                             (QREFELT $ 82)))
                      (SPADCALL (- 5 |p|) (QREFELT $ 43))
                      (EXIT (SPADCALL |r| (QREFELT $ 44)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;acosh;2$;21| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 47))
                  (|error|
                   (SPADCALL
                    (LIST "acosh: invalid argument" ": "
                          (SPADCALL |x| (QREFELT $ 36)))
                    (QREFELT $ 38)))))
                (SPADCALL 5 (QREFELT $ 39))
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |x|
                                 (SPADCALL
                                  (|FLOAT;sub| (|FLOAT;times| |x| |x| $)
                                   (|spadConstant| $ 31) $)
                                  (QREFELT $ 40))
                                 (QREFELT $ 58))
                       (QREFELT $ 82)))
                (SPADCALL 5 (QREFELT $ 43))
                (EXIT (SPADCALL |r| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;atanh;2$;22| ((|x| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G607 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 35))
                        (SPADCALL |x|
                                  (SPADCALL (|spadConstant| $ 31)
                                            (QREFELT $ 29))
                                  (QREFELT $ 47)))
                    (|error|
                     (SPADCALL
                      (LIST "atanh: invalid argument" ": "
                            (SPADCALL |x| (QREFELT $ 36)))
                      (QREFELT $ 38)))))
                  (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 55))))
                  (COND
                   ((OR (SPADCALL |x| (QREFELT $ 26))
                        (< (SPADCALL 2 |p| (QREFELT $ 56))
                           (- (SPADCALL (QREFELT $ 51)))))
                    (PROGN (LETT #1# |x|) (GO #2=#:G606))))
                  (SPADCALL (- 5 |p|) (QREFELT $ 39))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 58))
                           (SPADCALL (|spadConstant| $ 31) |x| (QREFELT $ 46))
                           (QREFELT $ 41))
                          (QREFELT $ 82))
                         2 (QREFELT $ 34)))
                  (SPADCALL (- 5 |p|) (QREFELT $ 43))
                  (EXIT (SPADCALL |r| (QREFELT $ 44)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;log;2$;23| ((|x| $) ($ $))
        (SPROG
         ((|l| ($)) (|m| #1=(|Integer|)) (|ek| ($)) (#2=#:G612 NIL)
          (|k| (|Integer|)) (|n| #1#) (|p| (|PositiveInteger|)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 28))
            (|error|
             (SPADCALL
              (LIST "log: negative argument" ": "
                    (SPADCALL |x| (QREFELT $ 36)))
              (QREFELT $ 38))))
           ((SPADCALL |x| (QREFELT $ 26)) (|error| "log 0 generated"))
           (#3='T
            (SEQ (LETT |p| (SPADCALL (QREFELT $ 51)))
                 (SPADCALL 5 (QREFELT $ 39))
                 (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 55)))
                      (EXIT (COND ((< |n| 0) (LETT |n| (+ |n| 1))))))
                 (LETT |l|
                       (COND ((EQL |n| 0) (|spadConstant| $ 27))
                             (#3#
                              (SEQ
                               (LETT |x| (SPADCALL |x| (- |n|) (QREFELT $ 59)))
                               (EXIT
                                (SPADCALL |n| (SPADCALL (QREFELT $ 86))
                                          (QREFELT $ 66)))))))
                 (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 54)) 3))
                 (COND
                  ((SPADCALL |k| 1 (QREFELT $ 64))
                   (SEQ
                    (LETT |k|
                          (MAX 1
                               (+ |k|
                                  (SPADCALL
                                   (SPADCALL |x| (|spadConstant| $ 31)
                                             (QREFELT $ 46))
                                   (QREFELT $ 55)))))
                    (SPADCALL |k| (QREFELT $ 39))
                    (LETT |ek|
                          (|FLOAT;expInverse|
                           (EXPT 2
                                 (PROG1 (LETT #2# |k|)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#)))
                           $))
                    (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 43))
                    (LETT |m|
                          (SPADCALL (|FLOAT;square| |x| |k| $) (QREFELT $ 55)))
                    (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 39))
                    (LETT |m|
                          (QUOTIENT2 (SPADCALL 6847196937 |m| (QREFELT $ 56))
                                     9878417065))
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL |ek| (- |m|) (QREFELT $ 87))
                                    (QREFELT $ 57)))
                    (EXIT
                     (LETT |l|
                           (SPADCALL |l| (CONS |m| (- |k|))
                                     (QREFELT $ 58)))))))
                 (LETT |l|
                       (SPADCALL |l| (|FLOAT;logSeries| |x| $) (QREFELT $ 58)))
                 (SPADCALL |p| (QREFELT $ 63))
                 (EXIT (SPADCALL |l| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;logSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|z| ($)) (|d| #2#) (|y| ($)) (|p| #3=(|NonNegativeInteger|))
          (|g| #3#))
         (SEQ
          (LETT |p|
                (+ (SPADCALL (QREFELT $ 51))
                   (LETT |g|
                         (+ (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))) 3))))
          (SPADCALL |g| (QREFELT $ 39))
          (LETT |y|
                (SPADCALL (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 46))
                          (SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 58))
                          (QREFELT $ 41)))
          (SPADCALL |g| (QREFELT $ 43)) (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |z| (|FLOAT;times| |y| |y| $))
          (LETT |t|
                (LETT |m| (|FLOAT;shift2| (QCAR |z|) (+ (QCDR |z|) |p|) $)))
          (SEQ (LETT |i| 3) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)))
                    (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |y| (CONS |s| (- 1 |p|)) (QREFELT $ 57)))))) 

(SDEFUN |FLOAT;log2;$;25| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| (|Integer|)) (|k| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 51)))
              (EXIT
               (COND
                ((SPADCALL |n| (QCAR (QREFELT $ 88)) (QREFELT $ 89))
                 (SPADCALL (QCDR (QREFELT $ 88)) (QREFELT $ 44)))
                ('T
                 (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 3))
                      (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 3))
                      (LETT |t| (QUOTIENT2 |s| 9))
                      (SEQ (LETT |k| 3) G190
                           (COND
                            ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
                           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)))
                                (EXIT (LETT |t| (QUOTIENT2 |t| 9))))
                           (LETT |k| (|add_SI| |k| 2)) (GO G190) G191
                           (EXIT NIL))
                      (SETELT $ 88
                              (CONS (SPADCALL (QREFELT $ 51))
                                    (CONS |s| (- |n|))))
                      (EXIT
                       (SPADCALL (QCDR (QREFELT $ 88)) (QREFELT $ 44)))))))))) 

(SDEFUN |FLOAT;log10;$;26| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| (|Integer|)) (|k| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 51)))
              (EXIT
               (COND
                ((SPADCALL |n| (QCAR (QREFELT $ 90)) (QREFELT $ 89))
                 (SPADCALL (QCDR (QREFELT $ 90)) (QREFELT $ 44)))
                ('T
                 (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 5))
                      (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 9))
                      (LETT |t| (QUOTIENT2 |s| 81))
                      (SEQ (LETT |k| 3) G190
                           (COND
                            ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
                           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)))
                                (EXIT (LETT |t| (QUOTIENT2 |t| 81))))
                           (LETT |k| (|add_SI| |k| 2)) (GO G190) G191
                           (EXIT NIL))
                      (SPADCALL 2 (QREFELT $ 39))
                      (SETELT $ 90
                              (CONS (SPADCALL (QREFELT $ 51))
                                    (SPADCALL (CONS |s| (- |n|))
                                              (SPADCALL 3
                                                        (SPADCALL
                                                         (QREFELT $ 86))
                                                        (QREFELT $ 62))
                                              (QREFELT $ 58))))
                      (SPADCALL 2 (QREFELT $ 43))
                      (EXIT
                       (SPADCALL (QCDR (QREFELT $ 90)) (QREFELT $ 44)))))))))) 

(SDEFUN |FLOAT;log2;2$;27| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (SPADCALL 2 (QREFELT $ 39))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 82))
                                    (SPADCALL (QREFELT $ 86)) (QREFELT $ 41)))
                    (SPADCALL 2 (QREFELT $ 43))
                    (EXIT (SPADCALL |r| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;log10;2$;28| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (SPADCALL 2 (QREFELT $ 39))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 82))
                                    (SPADCALL (QREFELT $ 91)) (QREFELT $ 41)))
                    (SPADCALL 2 (QREFELT $ 43))
                    (EXIT (SPADCALL |r| (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;exp;2$;29| ((|x| $) ($ $))
        (SPROG
         ((|e| ($)) (|k| (|Integer|)) (#1=#:G645 NIL) (|e1| ($))
          (|n| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (SPADCALL (QREFELT $ 51)))
                (SPADCALL 5 (QREFELT $ 39)) (LETT |e1| (|spadConstant| $ 31))
                (COND
                 ((SPADCALL (LETT |n| (SPADCALL |x| (QREFELT $ 52))) 0
                            (QREFELT $ 60))
                  (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 39))
                       (LETT |e1|
                             (SPADCALL (SPADCALL (QREFELT $ 94)) |n|
                                       (QREFELT $ 87)))
                       (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                       (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 50)))))))
                (COND
                 ((SPADCALL |x| (QREFELT $ 26))
                  (SEQ (SPADCALL |p| (QREFELT $ 63))
                       (EXIT
                        (PROGN
                         (LETT #1# (SPADCALL |e1| (QREFELT $ 44)))
                         (GO #2=#:G644))))))
                (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 54)) 3))
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 55)))))
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 64))
                  (SEQ (SPADCALL |k| (QREFELT $ 39))
                       (EXIT
                        (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 59)))))))
                (LETT |e| (|FLOAT;expSeries| |x| $))
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 64))
                  (LETT |e| (|FLOAT;square| |e| |k| $))))
                (SPADCALL |p| (QREFELT $ 63))
                (EXIT (SPADCALL |e| |e1| (QREFELT $ 57)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;expSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|n| #1#)
          (|d| #2#) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 51))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 51))))
                 1))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |t|
                (LETT |n| (|FLOAT;shift2| (QCAR |x|) (+ (QCDR |x|) |p|) $)))
          (SEQ (LETT |i| 2) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 60))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|))
                    (LETT |t| (QUOTIENT2 (* |n| |t|) |i|))
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 44)))))) 

(SDEFUN |FLOAT;mat0|
        ((|n0| . #1=(|Integer|)) (|bl| |Integer|) (|ki| |Integer|)
         ($ |Record| (|:| |highn| (|Integer|))
          (|:| |matr| (|Matrix| (|Integer|)))))
        (SPROG
         ((|i| #1#) (|m22| #2=(|Integer|)) (|m21| #3=(|Integer|))
          (|m12| (|Integer|)) (|m11| (|Integer|)) (|#G60| #4=(|Integer|))
          (|#G59| #4#) (|#G58| #2#) (|#G57| #3#))
         (SEQ (LETT |m11| 1) (LETT |m12| 0) (LETT |m21| 0) (LETT |m22| 1)
              (LETT |i| |n0|)
              (SEQ G190
                   (COND ((NULL (< (INTEGER-LENGTH |m11|) |bl|)) (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G57| |m21|)
                     (LETT |#G58| |m22|)
                     (LETT |#G59| (+ |m11| (* |i| |m21|)))
                     (LETT |#G60| (+ |m12| (* |i| |m22|)))
                     (LETT |m11| |#G57|)
                     (LETT |m12| |#G58|)
                     (LETT |m21| |#G59|)
                     (LETT |m22| |#G60|))
                    (EXIT (LETT |i| (+ |i| |ki|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS |i|
                     (SPADCALL (LIST (LIST |m11| |m12|) (LIST |m21| |m22|))
                               (QREFELT $ 97))))))) 

(SDEFUN |FLOAT;mat1|
        ((|n0| |Integer|) (|bl| |Integer|) (|ki| |Integer|)
         ($
          . #1=(|Record| (|:| |highn| (|Integer|))
                         (|:| |matr| (|Matrix| (|Integer|))))))
        (SPROG
         ((|r2| #1#) (|bl1| (|Integer|)) (|m1| (|Matrix| (|Integer|)))
          (|r1| #1#))
         (SEQ
          (COND
           ((SPADCALL |bl| 300 (QREFELT $ 98)) (|FLOAT;mat0| |n0| |bl| |ki| $))
           ('T
            (SEQ (LETT |bl1| (QUOTIENT2 |bl| 2))
                 (LETT |r1| (|FLOAT;mat1| |n0| |bl1| |ki| $))
                 (LETT |m1| (QCDR |r1|))
                 (LETT |bl1|
                       (- |bl|
                          (INTEGER-LENGTH (SPADCALL |m1| 1 1 (QREFELT $ 99)))))
                 (LETT |r2| (|FLOAT;mat1| (QCAR |r1|) |bl1| |ki| $))
                 (EXIT
                  (CONS (QCAR |r2|)
                        (SPADCALL (QCDR |r2|) |m1| (QREFELT $ 100)))))))))) 

(SDEFUN |FLOAT;expInverse| ((|k| |Integer|) ($ $))
        (SPROG
         ((|q1| (|Integer|)) (|p1| (|Integer|)) (|mm0| (|Matrix| (|Integer|)))
          (|l| (|NonNegativeInteger|)) (|ki| #1=(|Integer|)) (|k0| #1#)
          (|q0| (|Integer|)) (|p0| (|Integer|)))
         (SEQ (LETT |p1| (+ (SPADCALL 2 |k| (QREFELT $ 56)) 1)) (LETT |p0| 1)
              (LETT |q1| (- (SPADCALL 2 |k| (QREFELT $ 56)) 1)) (LETT |q0| 1)
              (LETT |k0| (SPADCALL 6 |k| (QREFELT $ 56)))
              (LETT |ki| (SPADCALL 4 |k| (QREFELT $ 56)))
              (LETT |l| (QUOTIENT2 (+ (SPADCALL (QREFELT $ 51)) 1) 2))
              (LETT |mm0|
                    (SPADCALL (LIST (LIST |p0| |q0|) (LIST |p1| |q1|))
                              (QREFELT $ 97)))
              (LETT |mm0|
                    (SPADCALL (QCDR (|FLOAT;mat1| |k0| |l| |ki| $)) |mm0|
                              (QREFELT $ 100)))
              (LETT |p1| (SPADCALL |mm0| 2 1 (QREFELT $ 99)))
              (LETT |q1| (SPADCALL |mm0| 2 2 (QREFELT $ 99)))
              (EXIT (|FLOAT;dvide| (CONS |p1| 0) (CONS |q1| 0) $))))) 

(SDEFUN |FLOAT;exp1;$;34| (($ $))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL (QREFELT $ 51)) (QCAR (QREFELT $ 101))
                     (QREFELT $ 102))
           (SETELT $ 101
                   (CONS (SPADCALL (QREFELT $ 51)) (|FLOAT;expInverse| 1 $)))))
         (EXIT (SPADCALL (QCDR (QREFELT $ 101)) (QREFELT $ 44))))) 

(SDEFUN |FLOAT;sqrt;2$;35| ((|x| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|p| (|Integer|)) (|l| (|Integer|))
          (|e| (|Integer|)) (|m| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 28))
            (|error|
             (SPADCALL
              (LIST "sqrt: negative argument" ": "
                    (SPADCALL |x| (QREFELT $ 36)))
              (QREFELT $ 38))))
           ('T
            (SEQ (LETT |m| (QCAR |x|)) (LETT |e| (QCDR |x|))
                 (LETT |l| (INTEGER-LENGTH |m|))
                 (LETT |p| (+ (- (* 2 (SPADCALL (QREFELT $ 51))) |l|) 2))
                 (COND ((ODDP (- |e| |l|)) (LETT |p| (- |p| 1))))
                 (LETT |i| (|FLOAT;shift2| (QCAR |x|) |p| $))
                 (LETT |i| (SPADCALL |i| (QREFELT $ 54)))
                 (EXIT
                  (SPADCALL (CONS |i| (QUOTIENT2 (- |e| |p|) 2))
                            (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;bits;Pi;36| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 9) (QREFELT $ 103))) 

(SDEFUN |FLOAT;bits;2Pi;37| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT $ 51)))
                    (SPADCALL (QREFELT $ 9) |n| (QREFELT $ 104)) (EXIT |t|)))) 

(SDEFUN |FLOAT;precision;Pi;38| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 51))) 

(SDEFUN |FLOAT;precision;2Pi;39| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPADCALL |n| (QREFELT $ 63))) 

(SDEFUN |FLOAT;increasePrecision;IPi;40|
        ((|n| |Integer|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G678 NIL) (|b| (|PositiveInteger|)))
               (SEQ (LETT |b| (SPADCALL (QREFELT $ 51)))
                    (SPADCALL
                     (PROG1 (LETT #1# (+ |b| |n|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 63))
                    (EXIT |b|)))) 

(SDEFUN |FLOAT;decreasePrecision;IPi;41|
        ((|n| |Integer|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G682 NIL) (|b| (|PositiveInteger|)))
               (SEQ (LETT |b| (SPADCALL (QREFELT $ 51)))
                    (SPADCALL
                     (PROG1 (LETT #1# (- |b| |n|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 63))
                    (EXIT |b|)))) 

(SDEFUN |FLOAT;ceillog10base2| ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G686 NIL))
               (PROG1 (LETT #1# (QUOTIENT2 (+ (* 13301 |n|) 4003) 4004))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |FLOAT;digits;Pi;43| (($ |PositiveInteger|))
        (SPROG ((#1=#:G689 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (QUOTIENT2
                               (SPADCALL 4004 (- (SPADCALL (QREFELT $ 51)) 1)
                                         (QREFELT $ 56))
                               13301)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FLOAT;digits;2Pi;44| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT $ 106)))
                    (SPADCALL (+ 1 (|FLOAT;ceillog10base2| |n| $))
                              (QREFELT $ 63))
                    (EXIT |t|)))) 

(SDEFUN |FLOAT;order;$I;45| ((|a| $) ($ |Integer|))
        (- (+ (INTEGER-LENGTH (QCAR |a|)) (QCDR |a|)) 1)) 

(SDEFUN |FLOAT;relerror;3$;46| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |a| |b| (QREFELT $ 46)) |b| (QREFELT $ 41))
         (QREFELT $ 48))) 

(PUT '|FLOAT;Zero;$;47| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(SDEFUN |FLOAT;Zero;$;47| (($ $)) (CONS 0 0)) 

(PUT '|FLOAT;One;$;48| '|SPADreplace| '(XLAM NIL (CONS 1 0))) 

(SDEFUN |FLOAT;One;$;48| (($ $)) (CONS 1 0)) 

(PUT '|FLOAT;base;Pi;49| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |FLOAT;base;Pi;49| (($ |PositiveInteger|)) 2) 

(PUT '|FLOAT;mantissa;$I;50| '|SPADreplace| 'QCAR) 

(SDEFUN |FLOAT;mantissa;$I;50| ((|x| $) ($ |Integer|)) (QCAR |x|)) 

(PUT '|FLOAT;exponent;$I;51| '|SPADreplace| 'QCDR) 

(SDEFUN |FLOAT;exponent;$I;51| ((|x| $) ($ |Integer|)) (QCDR |x|)) 

(SDEFUN |FLOAT;one?;$B;52| ((|a| $) ($ |Boolean|))
        (SPADCALL |a| (|spadConstant| $ 31) (QREFELT $ 32))) 

(SDEFUN |FLOAT;zero?;$B;53| ((|a| $) ($ |Boolean|)) (ZEROP (QCAR |a|))) 

(SDEFUN |FLOAT;negative?;$B;54| ((|a| $) ($ |Boolean|)) (MINUSP (QCAR |a|))) 

(SDEFUN |FLOAT;positive?;$B;55| ((|a| $) ($ |Boolean|))
        (SPADCALL (QCAR |a|) (QREFELT $ 111))) 

(SDEFUN |FLOAT;chop| ((|x| $) (|p| |PositiveInteger|) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ (LETT |e| (- (INTEGER-LENGTH (QCAR |x|)) |p|))
                    (COND
                     ((SPADCALL |e| 0 (QREFELT $ 64))
                      (LETT |x|
                            (CONS (|FLOAT;shift2| (QCAR |x|) (- |e|) $)
                                  (+ (QCDR |x|) |e|)))))
                    (EXIT |x|)))) 

(SDEFUN |FLOAT;float;2I$;57| ((|m| . #1=(|Integer|)) (|e| . #1#) ($ $))
        (SPADCALL (CONS |m| |e|) (QREFELT $ 44))) 

(SDEFUN |FLOAT;float;2IPi$;58|
        ((|m| . #1=(|Integer|)) (|e| . #1#) (|b| |PositiveInteger|) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND ((EQL |m| 0) (|spadConstant| $ 27))
                      ('T
                       (SEQ (SPADCALL 4 (QREFELT $ 39))
                            (LETT |r|
                                  (SPADCALL |m|
                                            (SPADCALL (CONS |b| 0) |e|
                                                      (QREFELT $ 87))
                                            (QREFELT $ 66)))
                            (SPADCALL 4 (QREFELT $ 43))
                            (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;normalize;2$;59| ((|x| $) ($ $))
        (SPROG ((|y| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)))
               (SEQ (LETT |m| (QCAR |x|))
                    (EXIT
                     (COND ((EQL |m| 0) (|spadConstant| $ 27))
                           (#1='T
                            (SEQ
                             (LETT |e|
                                   (- (INTEGER-LENGTH |m|)
                                      (SPADCALL (QREFELT $ 51))))
                             (COND
                              ((SPADCALL |e| 0 (QREFELT $ 64))
                               (SEQ (LETT |y| (|FLOAT;shift2| |m| (- 1 |e|) $))
                                    (COND
                                     ((ODDP |y|)
                                      (SEQ
                                       (LETT |y|
                                             (QUOTIENT2
                                              (COND
                                               ((SPADCALL |y| 0 (QREFELT $ 64))
                                                (+ |y| 1))
                                               (#1# (- |y| 1)))
                                              2))
                                       (EXIT
                                        (COND
                                         ((SPADCALL (INTEGER-LENGTH |y|)
                                                    (SPADCALL (QREFELT $ 51))
                                                    (QREFELT $ 115))
                                          (SEQ (LETT |y| (QUOTIENT2 |y| 2))
                                               (EXIT
                                                (LETT |e| (+ |e| 1)))))))))
                                     (#1# (LETT |y| (QUOTIENT2 |y| 2))))
                                    (EXIT
                                     (LETT |x|
                                           (CONS |y| (+ (QCDR |x|) |e|)))))))
                             (EXIT |x|)))))))) 

(SDEFUN |FLOAT;shift;$I$;60| ((|x| $) (|n| |Integer|) ($ $))
        (CONS (QCAR |x|) (+ (QCDR |x|) |n|))) 

(SDEFUN |FLOAT;=;2$B;61| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((EQL (QCDR |x|) (QCDR |y|)) (EQL (QCAR |x|) (QCAR |y|)))
              ((EQL (SPADCALL |x| (QREFELT $ 55))
                    (SPADCALL |y| (QREFELT $ 55)))
               (COND
                ((EQL (SPADCALL |x| (QREFELT $ 61))
                      (SPADCALL |y| (QREFELT $ 61)))
                 (SPADCALL (SPADCALL |x| |y| (QREFELT $ 46)) (QREFELT $ 26)))
                (#1='T NIL)))
              (#1# NIL))) 

(SDEFUN |FLOAT;<;2$B;62| ((|x| $) (|y| $) ($ |Boolean|))
        (SEQ
         (COND ((EQL (QCAR |y|) 0) (< (QCAR |x|) 0))
               ((EQL (QCAR |x|) 0) (SPADCALL (QCAR |y|) 0 (QREFELT $ 64)))
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |x| (QREFELT $ 28))
                   (COND ((SPADCALL |y| (QREFELT $ 112)) (EXIT 'T)))))
                 (COND
                  ((SPADCALL |y| (QREFELT $ 28))
                   (COND ((SPADCALL |x| (QREFELT $ 112)) (EXIT NIL)))))
                 (EXIT
                  (COND
                   ((< (SPADCALL |x| (QREFELT $ 55))
                       (SPADCALL |y| (QREFELT $ 55)))
                    (SPADCALL |x| (QREFELT $ 112)))
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 55))
                              (SPADCALL |y| (QREFELT $ 55)) (QREFELT $ 64))
                    (SPADCALL |x| (QREFELT $ 28)))
                   (#1#
                    (SPADCALL (SPADCALL |x| |y| (QREFELT $ 46))
                              (QREFELT $ 28)))))))))) 

(SDEFUN |FLOAT;abs;2$;63| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 28)) (SPADCALL |x| (QREFELT $ 29)))
              ('T (SPADCALL |x| (QREFELT $ 44))))) 

(SDEFUN |FLOAT;ceiling;2$;64| ((|x| $) ($ $))
        (SPROG ((#1=#:G741 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT $ 28))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 29))
                                      (QREFELT $ 116))
                            (QREFELT $ 29)))
                     (GO #2=#:G740))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 26))
                     |x|)
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 117))
                               (|spadConstant| $ 31) (QREFELT $ 58)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;wholePart;$I;65| ((|x| $) ($ |Integer|))
        (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $)) 

(SDEFUN |FLOAT;floor;2$;66| ((|x| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 28))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 29)) (QREFELT $ 118))
                    (QREFELT $ 29)))
         ('T (SPADCALL |x| (QREFELT $ 117))))) 

(SDEFUN |FLOAT;round;2$;67| ((|x| $) ($ $))
        (SPROG ((|half| ($)))
               (SEQ (LETT |half| (CONS (SPADCALL |x| (QREFELT $ 61)) -1))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |half| (QREFELT $ 58))
                               (QREFELT $ 117)))))) 

(SDEFUN |FLOAT;sign;$I;68| ((|x| $) ($ |Integer|))
        (COND ((< (QCAR |x|) 0) -1) ('T 1))) 

(SDEFUN |FLOAT;truncate;2$;69| ((|x| $) ($ $))
        (SPROG ((#1=#:G754 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((>= (QCDR |x|) 0) (PROGN (LETT #1# |x|) (GO #2=#:G753))))
                  (EXIT
                   (SPADCALL (CONS (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $) 0)
                             (QREFELT $ 44)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;recip;$U;70| ((|x| $) ($ |Union| $ "failed"))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL (|spadConstant| $ 31) |x| (QREFELT $ 41)))))) 

(SDEFUN |FLOAT;differentiate;2$;71| ((|x| $) ($ $)) (|spadConstant| $ 27)) 

(SDEFUN |FLOAT;-;2$;72| ((|x| $) ($ $))
        (SPADCALL (|FLOAT;negate| |x| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;negate| ((|x| $) ($ $)) (CONS (- (QCAR |x|)) (QCDR |x|))) 

(SDEFUN |FLOAT;+;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;plus| |x| |y| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;-;3$;75| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;sub| ((|x| $) (|y| $) ($ $))
        (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $)) 

(SDEFUN |FLOAT;plus| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|mw| (|Integer|)) (|ey| #1=(|Integer|)) (|ex| #1#)
          (|my| #2=(|Integer|)) (|mx| #2#) (|#G119| #1#) (|#G118| #1#)
          (|#G117| #2#) (|#G116| #2#) (|de| (|Integer|)))
         (SEQ (LETT |mx| (QCAR |x|)) (LETT |my| (QCAR |y|))
              (EXIT
               (COND ((EQL |mx| 0) |y|) ((EQL |my| 0) |x|)
                     (#3='T
                      (SEQ (LETT |ex| (QCDR |x|)) (LETT |ey| (QCDR |y|))
                           (EXIT
                            (COND ((EQL |ex| |ey|) (CONS (+ |mx| |my|) |ex|))
                                  (#3#
                                   (SEQ
                                    (LETT |de|
                                          (-
                                           (- (+ |ex| (INTEGER-LENGTH |mx|))
                                              |ey|)
                                           (INTEGER-LENGTH |my|)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |de|
                                                 (+ (SPADCALL (QREFELT $ 51))
                                                    1)
                                                 (QREFELT $ 64))
                                       |x|)
                                      ((< |de|
                                          (- (+ (SPADCALL (QREFELT $ 51)) 1)))
                                       |y|)
                                      (#3#
                                       (SEQ
                                        (COND
                                         ((< |ex| |ey|)
                                          (PROGN
                                           (LETT |#G116| |my|)
                                           (LETT |#G117| |mx|)
                                           (LETT |#G118| |ey|)
                                           (LETT |#G119| |ex|)
                                           (LETT |mx| |#G116|)
                                           (LETT |my| |#G117|)
                                           (LETT |ex| |#G118|)
                                           (LETT |ey| |#G119|))))
                                        (LETT |mw|
                                              (+ |my|
                                                 (|FLOAT;shift2| |mx|
                                                  (- |ex| |ey|) $)))
                                        (EXIT (CONS |mw| |ey|))))))))))))))))) 

(SDEFUN |FLOAT;*;3$;78| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;times| |x| |y| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;*;I2$;79| ((|x| |Integer|) (|y| $) ($ $))
        (COND
         ((SPADCALL (INTEGER-LENGTH |x|) (SPADCALL (QREFELT $ 51))
                    (QREFELT $ 115))
          (SPADCALL (SPADCALL (CONS |x| 0) (QREFELT $ 44)) |y| (QREFELT $ 57)))
         ('T (SPADCALL (CONS (* |x| (QCAR |y|)) (QCDR |y|)) (QREFELT $ 44))))) 

(SDEFUN |FLOAT;/;3$;80| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;dvide| |x| |y| $) (QREFELT $ 44))) 

(SDEFUN |FLOAT;/;$I$;81| ((|x| $) (|y| |Integer|) ($ $))
        (COND
         ((SPADCALL (INTEGER-LENGTH |y|) (SPADCALL (QREFELT $ 51))
                    (QREFELT $ 115))
          (SPADCALL |x| (SPADCALL (CONS |y| 0) (QREFELT $ 44)) (QREFELT $ 41)))
         ('T (SPADCALL |x| (CONS |y| 0) (QREFELT $ 41))))) 

(SDEFUN |FLOAT;inv;2$;82| ((|x| $) ($ $))
        (SPADCALL (|spadConstant| $ 31) |x| (QREFELT $ 41))) 

(SDEFUN |FLOAT;times| ((|x| $) (|y| $) ($ $))
        (CONS (* (QCAR |x|) (QCAR |y|)) (+ (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |FLOAT;itimes| ((|n| |Integer|) (|y| $) ($ $))
        (CONS (* |n| (QCAR |y|)) (QCDR |y|))) 

(SDEFUN |FLOAT;dvide| ((|x| $) (|y| $) ($ $))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (INTEGER-LENGTH (QCAR |y|))
                           (INTEGER-LENGTH (QCAR |x|)))
                        (SPADCALL (QREFELT $ 51)))
                       1))
                (LETT |mw|
                      (QUOTIENT2 (|FLOAT;shift2| (QCAR |x|) |ew| $)
                                 (QCAR |y|)))
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|))
                (EXIT (CONS |mw| |ew|))))) 

(SDEFUN |FLOAT;square| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (|l| (|Integer|))
          (#1=#:G793 NIL) (|k| NIL))
         (SEQ (LETT |ma| (QCAR |x|)) (LETT |ex| (QCDR |x|))
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |ma| (* |ma| |ma|)) (LETT |ex| (+ |ex| |ex|))
                        (LETT |l|
                              (- (SPADCALL (QREFELT $ 51))
                                 (INTEGER-LENGTH |ma|)))
                        (LETT |ma| (|FLOAT;shift2| |ma| |l| $))
                        (EXIT (LETT |ex| (- |ex| |l|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;power| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|z| ($)) (#1=#:G800 NIL) (|y| ($)))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| (|spadConstant| $ 31)) (LETT |z| |x|)
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (COND
                              ((ODDP |n|)
                               (LETT |y|
                                     (|FLOAT;chop| (|FLOAT;times| |y| |z| $)
                                      (SPADCALL (QREFELT $ 51)) $))))
                             (SEQ (LETT |n| (QUOTIENT2 |n| 2))
                                  (EXIT
                                   (COND
                                    ((EQL |n| 0)
                                     (PROGN (LETT #1# |y|) (GO #2=#:G799))))))
                             (EXIT
                              (LETT |z|
                                    (|FLOAT;chop| (|FLOAT;times| |z| |z| $)
                                     (SPADCALL (QREFELT $ 51)) $))))
                            NIL (GO G190) G191 (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;3$;88| ((|x| $) (|y| $) ($ $))
        (SPROG ((|r| ($)) (|p| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                  (COND
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 32))
                    (|error| "0^0 is undefined"))
                   ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 47))
                    (|error| "division by 0"))
                   (#1='T (|spadConstant| $ 27))))
                 ((SPADCALL |y| (|spadConstant| $ 27) (QREFELT $ 32))
                  (|spadConstant| $ 31))
                 ((SPADCALL |y| (|spadConstant| $ 31) (QREFELT $ 32)) |x|)
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                  (|spadConstant| $ 31))
                 (#1#
                  (SEQ (LETT |p| (+ (ABS (SPADCALL |y| (QREFELT $ 55))) 5))
                       (SPADCALL |p| (QREFELT $ 39))
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL |y| (SPADCALL |x| (QREFELT $ 82))
                                        (QREFELT $ 57))
                              (QREFELT $ 78)))
                       (SPADCALL |p| (QREFELT $ 43))
                       (EXIT (SPADCALL |r| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;^;$F$;89| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|y| ($)) (#1=#:G811 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 126) (QREFELT $ 127))
                     (|spadConstant| $ 31))
                    ((SPADCALL |r| (|spadConstant| $ 126) (QREFELT $ 128))
                     (|error| "division by 0"))
                    (#2='T (|spadConstant| $ 27))))
                  ((SPADCALL |r| (|spadConstant| $ 126) (QREFELT $ 127))
                   (|spadConstant| $ 31))
                  ((SPADCALL |r| (|spadConstant| $ 129) (QREFELT $ 127)) |x|)
                  ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                   (|spadConstant| $ 31))
                  (#2#
                   (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 130)))
                        (LETT |d| (SPADCALL |r| (QREFELT $ 131)))
                        (EXIT
                         (COND
                          ((SPADCALL |x| (QREFELT $ 28))
                           (COND
                            ((ODDP |d|)
                             (COND
                              ((ODDP |n|)
                               (PROGN
                                (LETT #1#
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 29))
                                                 |r| (QREFELT $ 132))
                                       (QREFELT $ 29)))
                                (GO #3=#:G810)))
                              (#2#
                               (PROGN
                                (LETT #1#
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 29))
                                                |r| (QREFELT $ 132)))
                                (GO #3#)))))
                            (#2# (|error| "negative root"))))
                          (#2#
                           (SEQ
                            (COND
                             ((EQL |d| 2)
                              (COND
                               ((EQL |n| 1)
                                (PROGN
                                 (LETT #1# (SPADCALL |x| (QREFELT $ 40)))
                                 (GO #3#)))
                               (#2#
                                (SEQ
                                 (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 39))
                                 (LETT |y| (SPADCALL |x| (QREFELT $ 40)))
                                 (LETT |y| (SPADCALL |y| |n| (QREFELT $ 87)))
                                 (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (SPADCALL |y| (QREFELT $ 44)))
                                   (GO #3#))))))))
                            (LETT |y|
                                  (SPADCALL (CONS |n| 0) (CONS |d| 0)
                                            (QREFELT $ 41)))
                            (EXIT (SPADCALL |x| |y| (QREFELT $ 124)))))))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;$I$;90| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|y| ($)) (|p| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
                  (COND ((EQL |n| 0) (|spadConstant| $ 31))
                        ((< |n| 0) (|error| "division by 0"))
                        (#1='T (|spadConstant| $ 27))))
                 ((EQL |n| 0) (|spadConstant| $ 31)) ((EQL |n| 1) |x|)
                 ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
                  (|spadConstant| $ 31))
                 (#1#
                  (SEQ (LETT |p| (SPADCALL (QREFELT $ 51)))
                       (SPADCALL (+ (+ |p| (INTEGER-LENGTH |n|)) 2)
                                 (QREFELT $ 63))
                       (LETT |y| (|FLOAT;power| |x| (ABS |n|) $))
                       (COND
                        ((< |n| 0)
                         (LETT |y|
                               (|FLOAT;dvide| (|spadConstant| $ 31) |y| $))))
                       (SPADCALL |p| (QREFELT $ 63))
                       (EXIT (SPADCALL |y| (QREFELT $ 44))))))))) 

(SDEFUN |FLOAT;convert10| ((|x| $) (|d| |Integer|) ($ $))
        (SPROG
         ((|h| ($)) (|r| #1=(|Integer|)) (#2=#:G817 NIL)
          (|b| (|PositiveInteger|)) (|q| #3=(|Integer|))
          (|#G149| (|Record| (|:| |quotient| #3#) (|:| |remainder| #1#)))
          (|e| (|Integer|)) (|m| (|Integer|)))
         (SEQ (LETT |m| (QCAR |x|)) (LETT |e| (QCDR |x|))
              (LETT |b| (SPADCALL (QREFELT $ 51)))
              (PROGN
               (LETT |#G149| (DIVIDE2 (ABS |e|) |b|))
               (LETT |q| (QCAR |#G149|))
               (LETT |r| (QCDR |#G149|))
               |#G149|)
              (LETT |b| (EXPT 2 |b|))
              (LETT |r|
                    (EXPT 2
                          (PROG1 (LETT #2# |r|)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))))
              (LETT |h| (|FLOAT;power10| (CONS |b| 0) |q| (+ |d| 5) $))
              (LETT |h|
                    (|FLOAT;chop10| (CONS (* |r| (QCAR |h|)) (QCDR |h|))
                     (+ |d| 5) $))
              (EXIT
               (COND
                ((< |e| 0)
                 (LETT |h| (|FLOAT;quotient10| (CONS |m| 0) |h| |d| $)))
                ('T (|FLOAT;times10| (CONS |m| 0) |h| |d| $))))))) 

(SDEFUN |FLOAT;ceilLength10| ((|n| |Integer|) ($ |Integer|))
        (+ (QUOTIENT2 (* 146 (INTEGER-LENGTH |n|)) 485) 1)) 

(SDEFUN |FLOAT;floorLength10| ((|n| |Integer|) ($ |Integer|))
        (QUOTIENT2 (* 643 (INTEGER-LENGTH |n|)) 2136)) 

(SDEFUN |FLOAT;length10| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|lower| #1=(|Integer|)) (#2=#:G825 NIL) (|upper| #1#)
          (|ln| (|Integer|)))
         (SEQ (LETT |ln| (INTEGER-LENGTH (LETT |n| (ABS |n|))))
              (LETT |upper|
                    (QUOTIENT2 (SPADCALL 76573 |ln| (QREFELT $ 56)) 254370))
              (LETT |lower|
                    (QUOTIENT2 (SPADCALL 21306 (- |ln| 1) (QREFELT $ 56))
                               70777))
              (EXIT
               (COND ((EQL |upper| |lower|) (+ |upper| 1))
                     ('T
                      (SEQ
                       (LETT |n|
                             (QUOTIENT2 |n|
                                        (EXPT 10
                                              (PROG1 (LETT #2# |lower|)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#)))))
                       (SEQ G190 (COND ((NULL (>= |n| 10)) (GO G191)))
                            (SEQ (LETT |n| (QUOTIENT2 |n| 10))
                                 (EXIT (LETT |lower| (+ |lower| 1))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (+ |lower| 1))))))))) 

(SDEFUN |FLOAT;chop10| ((|x| $) (|p| |Integer|) ($ $))
        (SPROG ((#1=#:G832 NIL) (|e| (|Integer|)))
               (SEQ (LETT |e| (- (|FLOAT;floorLength10| (QCAR |x|) $) |p|))
                    (COND
                     ((SPADCALL |e| 0 (QREFELT $ 64))
                      (LETT |x|
                            (CONS
                             (QUOTIENT2 (QCAR |x|)
                                        (EXPT 10
                                              (PROG1 (LETT #1# |e|)
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))))
                             (+ (QCDR |x|) |e|)))))
                    (EXIT |x|)))) 

(SDEFUN |FLOAT;normalize10| ((|x| $) (|p| |Integer|) ($ $))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (#1=#:G840 NIL)
          (|r| #2=(|Integer|))
          (|#G159|
           (|Record| (|:| |quotient| (|Integer|)) (|:| |remainder| #2#)))
          (#3=#:G836 NIL) (|e| (|Integer|)))
         (SEQ (LETT |ma| (QCAR |x|)) (LETT |ex| (QCDR |x|))
              (LETT |e| (- (|FLOAT;length10| |ma| $) |p|))
              (COND
               ((SPADCALL |e| 0 (QREFELT $ 64))
                (SEQ
                 (LETT |ma|
                       (QUOTIENT2 |ma|
                                  (EXPT 10
                                        (PROG1 (LETT #3# (- |e| 1))
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|)
                                                            #3#)))))
                 (LETT |ex| (+ |ex| |e|))
                 (PROGN
                  (LETT |#G159| (DIVIDE2 |ma| 10))
                  (LETT |ma| (QCAR |#G159|))
                  (LETT |r| (QCDR |#G159|))
                  |#G159|)
                 (EXIT
                  (COND
                   ((SPADCALL |r| 4 (QREFELT $ 64))
                    (SEQ (LETT |ma| (+ |ma| 1))
                         (EXIT
                          (COND
                           ((EQL |ma|
                                 (EXPT 10
                                       (PROG1 (LETT #1# |p|)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))))
                            (SEQ (LETT |ma| 1)
                                 (EXIT (LETT |ex| (+ |ex| |p|))))))))))))))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;times10| ((|x| $) (|y| $) (|p| |Integer|) ($ $))
        (|FLOAT;normalize10| (|FLOAT;times| |x| |y| $) |p| $)) 

(SDEFUN |FLOAT;quotient10| ((|x| $) (|y| $) (|p| |Integer|) ($ $))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)) (#1=#:G873 NIL))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (|FLOAT;floorLength10| (QCAR |y|) $)
                           (|FLOAT;ceilLength10| (QCAR |x|) $))
                        |p|)
                       2))
                (COND ((< |ew| 0) (LETT |ew| 0)))
                (LETT |mw|
                      (QUOTIENT2
                       (* (QCAR |x|)
                          (EXPT 10
                                (PROG1 (LETT #1# |ew|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))))
                       (QCAR |y|)))
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|))
                (EXIT (|FLOAT;normalize10| (CONS |mw| |ew|) |p| $))))) 

(SDEFUN |FLOAT;power10| ((|x| $) (|n| . #1=(|Integer|)) (|d| |Integer|) ($ $))
        (SPROG
         ((|z| ($)) (#2=#:G882 NIL) (|e| #1#) (|y| ($)) (|p| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 32))
             (|spadConstant| $ 27))
            ((EQL |n| 0) (|spadConstant| $ 31)) ((EQL |n| 1) |x|)
            ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 32))
             (|spadConstant| $ 31))
            ('T
             (SEQ (LETT |p| (+ (+ |d| (INTEGER-LENGTH |n|)) 1)) (LETT |e| |n|)
                  (LETT |y| (|spadConstant| $ 31)) (LETT |z| |x|)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (COND
                          ((ODDP |e|)
                           (LETT |y|
                                 (|FLOAT;chop10| (|FLOAT;times| |y| |z| $) |p|
                                  $))))
                         (SEQ (LETT |e| (QUOTIENT2 |e| 2))
                              (EXIT
                               (COND
                                ((EQL |e| 0)
                                 (PROGN (LETT #2# |y|) (GO #3=#:G881))))))
                         (EXIT
                          (LETT |z|
                                (|FLOAT;chop10| (|FLOAT;times| |z| |z| $) |p|
                                 $))))
                        NIL (GO G190) G191 (EXIT NIL)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |FLOAT;padFromLeft| ((|s| |String|) ($ |String|))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G890 NIL) (|i| NIL) (|t| (|String|))
          (#2=#:G884 NIL) (|n| (|Integer|)))
         (SEQ
          (COND ((ZEROP (SPADCALL (QREFELT $ 135) (QREFELT $ 142))) |s|)
                ('T
                 (SEQ (LETT |n| (- (QCSIZE |s|) 1))
                      (LETT |t|
                            (|make_full_CVEC|
                             (PROG1
                                 (LETT #2#
                                       (+ (+ |n| 1)
                                          (QUOTIENT2 |n|
                                                     (SPADCALL (QREFELT $ 135)
                                                               (QREFELT $
                                                                        142)))))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (SPADCALL (QREFELT $ 144))))
                      (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 145)))
                           (LETT |i| 0) (LETT #1# |n|) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (SPADCALL |t| |j|
                                      (SPADCALL |s|
                                                (+ |i|
                                                   (SPADCALL |s|
                                                             (QREFELT $ 145)))
                                                (QREFELT $ 146))
                                      (QREFELT $ 147))
                            (EXIT
                             (COND
                              ((EQL
                                (REM (+ |i| 1)
                                     (SPADCALL (QREFELT $ 135)
                                               (QREFELT $ 142)))
                                0)
                               (LETT |j| (+ |j| 1))))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |FLOAT;padFromRight| ((|s| |String|) ($ |String|))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| NIL) (|t| (|String|)) (#2=#:G892 NIL)
          (|n| #1#))
         (SEQ
          (COND ((EQL (SPADCALL (QREFELT $ 135) (QREFELT $ 142)) 0) |s|)
                ('T
                 (SEQ (LETT |n| (- (QCSIZE |s|) 1))
                      (LETT |t|
                            (|make_full_CVEC|
                             (PROG1
                                 (LETT #2#
                                       (+ (+ |n| 1)
                                          (QUOTIENT2 |n|
                                                     (SPADCALL (QREFELT $ 135)
                                                               (QREFELT $
                                                                        142)))))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (SPADCALL (QREFELT $ 144))))
                      (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 148)))
                           (LETT |i| |n|) G190 (COND ((< |i| 0) (GO G191)))
                           (SEQ
                            (SPADCALL |t| |j|
                                      (SPADCALL |s|
                                                (+ |i|
                                                   (SPADCALL |s|
                                                             (QREFELT $ 145)))
                                                (QREFELT $ 146))
                                      (QREFELT $ 147))
                            (EXIT
                             (COND
                              ((EQL
                                (REM (+ (- |n| |i|) 1)
                                     (SPADCALL (QREFELT $ 135)
                                               (QREFELT $ 142)))
                                0)
                               (LETT |j| (- |j| 1))))))
                           (LETT |i| (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |FLOAT;fixed| ((|f| $) ($ |String|))
        (SPROG
         ((|t| (|String|)) (#1=#:G917 NIL) (|n| (|NonNegativeInteger|))
          (|s| (|String|)) (#2=#:G913 NIL) (#3=#:G911 NIL) (|p| #4=(|Integer|))
          (|o| #5=(|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($))
          (|l| (|Integer|)) (|dd| #4#) (|bl| #5#) (#6=#:G903 NIL)
          (#7=#:G900 NIL) (|d| #4#))
         (SEQ
          (LETT |d|
                (COND
                 ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1)
                  (SPADCALL (QREFELT $ 106)))
                 (#8='T (SPADCALL (QREFELT $ 141) (QREFELT $ 149)))))
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 26))
             (COND ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1) "0.0")
                   (#8#
                    (STRCONC "0"
                             (STRCONC "."
                                      (|FLOAT;padFromLeft|
                                       (|make_full_CVEC|
                                        (PROG1 (LETT #7# |d|)
                                          (|check_subtype2| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #7#))
                                        (|STR_to_CHAR| #9="0"))
                                       $))))))
            ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
             (STRCONC
              (|FLOAT;padFromRight| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
               $)
              (STRCONC "."
                       (|FLOAT;padFromLeft|
                        (|make_full_CVEC|
                         (PROG1 (LETT #6# |d|)
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#))
                         (|STR_to_CHAR| #9#))
                        $))))
            ((SPADCALL |f| (QREFELT $ 28))
             (STRCONC "-" (|FLOAT;fixed| (SPADCALL |f| (QREFELT $ 48)) $)))
            (#8#
             (SEQ (LETT |bl| (+ (INTEGER-LENGTH (QCAR |f|)) (QCDR |f|)))
                  (LETT |dd|
                        (COND
                         ((OR
                           (EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1)
                           (NULL (SPADCALL |bl| 0 (QREFELT $ 64))))
                          |d|)
                         ('T
                          (+
                           (+
                            (QUOTIENT2 (SPADCALL 146 |bl| (QREFELT $ 56)) 485)
                            1)
                           |d|))))
                  (LETT |g|
                        (|FLOAT;convert10| (SPADCALL |f| (QREFELT $ 48)) |dd|
                         $))
                  (LETT |m| (QCAR |g|)) (LETT |e| (QCDR |g|))
                  (COND
                   ((SPADCALL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1
                              (QREFELT $ 60))
                    (SEQ (LETT |l| (|FLOAT;length10| |m| $))
                         (EXIT
                          (COND
                           ((SPADCALL (- |e|)
                                      (SPADCALL (QREFELT $ 141)
                                                (QREFELT $ 149))
                                      (QREFELT $ 64))
                            (COND
                             ((< (- |e|)
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 106))
                                           (QREFELT $ 56)))
                              (SEQ
                               (LETT |g|
                                     (|FLOAT;normalize10| |g|
                                      (+ (+ |l| |e|)
                                         (SPADCALL (QREFELT $ 141)
                                                   (QREFELT $ 149)))
                                      $))
                               (LETT |m| (QCAR |g|))
                               (EXIT (LETT |e| (QCDR |g|))))))))))))
                  (LETT |s| (STRINGIMAGE |m|)) (LETT |n| (QCSIZE |s|))
                  (LETT |o| (+ |e| |n|))
                  (LETT |p|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1)
                          |n|)
                         (#8# (SPADCALL (QREFELT $ 141) (QREFELT $ 149)))))
                  (COND
                   ((>= |e| 0)
                    (SEQ
                     (LETT |s|
                           (STRCONC |s|
                                    (|make_full_CVEC|
                                     (PROG1 (LETT #3# |e|)
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                     (|STR_to_CHAR| #9#))))
                     (EXIT (LETT |t| ""))))
                   ((SPADCALL |o| 0 (QREFELT $ 98))
                    (SEQ
                     (LETT |t|
                           (STRCONC
                            (|make_full_CVEC|
                             (PROG1 (LETT #2# (- |o|))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (|STR_to_CHAR| #9#))
                            |s|))
                     (EXIT (LETT |s| "0"))))
                   (#8#
                    (SEQ
                     (LETT |t|
                           (SPADCALL |s|
                                     (SPADCALL
                                      (+ |o| (SPADCALL |s| (QREFELT $ 145)))
                                      (- (+ |n| (SPADCALL |s| (QREFELT $ 145)))
                                         1)
                                      (QREFELT $ 151))
                                     (QREFELT $ 152)))
                     (EXIT
                      (LETT |s|
                            (SPADCALL |s|
                                      (SPADCALL (SPADCALL |s| (QREFELT $ 145))
                                                (-
                                                 (+ |o|
                                                    (SPADCALL |s|
                                                              (QREFELT $ 145)))
                                                 1)
                                                (QREFELT $ 151))
                                      (QREFELT $ 152)))))))
                  (LETT |n| (QCSIZE |t|))
                  (COND
                   ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1)
                    (SEQ
                     (LETT |t|
                           (SPADCALL |t| (|STR_to_CHAR| #9#) (QREFELT $ 153)))
                     (EXIT (COND ((EQUAL |t| "") (LETT |t| "0"))))))
                   ((SPADCALL |n| |p| (QREFELT $ 64))
                    (LETT |t|
                          (SPADCALL |t|
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 145))
                                              (-
                                               (+ |p|
                                                  (SPADCALL |t|
                                                            (QREFELT $ 145)))
                                               1)
                                              (QREFELT $ 151))
                                    (QREFELT $ 152))))
                   (#8#
                    (LETT |t|
                          (STRCONC |t|
                                   (|make_full_CVEC|
                                    (PROG1 (LETT #1# (- |p| |n|))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (|STR_to_CHAR| #9#))))))
                  (EXIT
                   (STRCONC (|FLOAT;padFromRight| |s| $)
                            (STRCONC "." (|FLOAT;padFromLeft| |t| $))))))))))) 

(SDEFUN |FLOAT;floating| ((|f| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|o| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($)) (|d| (|Integer|))
          (|t| (|String|)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 26)) "0.0")
                ((SPADCALL |f| (QREFELT $ 28))
                 (STRCONC "-"
                          (|FLOAT;floating| (SPADCALL |f| (QREFELT $ 48)) $)))
                (#1='T
                 (SEQ
                  (LETT |t|
                        (COND
                         ((ZEROP (SPADCALL (QREFELT $ 135) (QREFELT $ 142)))
                          "E")
                         (#1# " E ")))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                     (SEQ
                      (LETT |s| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17))))
                      (EXIT
                       (SPADCALL
                        (LIST "0." (|FLOAT;padFromLeft| |s| $) |t|
                              (STRINGIMAGE (QCSIZE |s|)))
                        (QREFELT $ 38)))))
                    (#1#
                     (SEQ
                      (LETT |d|
                            (COND
                             ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149))
                                   -1)
                              (SPADCALL (QREFELT $ 106)))
                             (#1# (SPADCALL (QREFELT $ 141) (QREFELT $ 149)))))
                      (LETT |g| (|FLOAT;convert10| |f| |d| $))
                      (LETT |m| (QCAR |g|)) (LETT |e| (QCDR |g|))
                      (LETT |s| (STRINGIMAGE |m|)) (LETT |n| (QCSIZE |s|))
                      (LETT |o| (+ |e| |n|))
                      (LETT |s| (|FLOAT;padFromLeft| |s| $))
                      (EXIT
                       (SPADCALL (LIST "0." |s| |t| (STRINGIMAGE |o|))
                                 (QREFELT $ 38))))))))))))) 

(SDEFUN |FLOAT;general| ((|f| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|t| (|String|)) (#1=#:G949 NIL) (#2=#:G942 NIL)
          (#3=#:G940 NIL) (|o| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($)) (#4=#:G960 NIL)
          (|d| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 26)) "0.0")
                ((SPADCALL |f| (QREFELT $ 28))
                 (STRCONC "-"
                          (|FLOAT;general| (SPADCALL |f| (QREFELT $ 48)) $)))
                (#5='T
                 (SEQ
                  (LETT |d|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1)
                          (SPADCALL (QREFELT $ 106)))
                         (#5# (SPADCALL (QREFELT $ 141) (QREFELT $ 149)))))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |d| (+ |d| 1))
                            (LETT |s|
                                  (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17))))
                            (COND
                             ((SPADCALL
                               (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1
                               (QREFELT $ 60))
                              (SEQ (LETT |e| (QCSIZE |s|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |e| |d| (QREFELT $ 64))
                                      (PROGN
                                       (LETT #4#
                                             (SEQ
                                              (LETT |t|
                                                    (COND
                                                     ((ZEROP
                                                       (SPADCALL
                                                        (QREFELT $ 135)
                                                        (QREFELT $ 142)))
                                                      "E")
                                                     (#5# " E ")))
                                              (EXIT
                                               (SPADCALL
                                                (LIST "0."
                                                      (|FLOAT;padFromLeft| |s|
                                                       $)
                                                      |t| (STRINGIMAGE |e|))
                                                (QREFELT $ 38)))))
                                       (GO #6=#:G939))))))))
                            (EXIT
                             (|FLOAT;padFromRight| (STRCONC |s| ".0") $))))
                      #6# (EXIT #4#)))
                    (#5#
                     (SEQ (LETT |g| (|FLOAT;convert10| |f| |d| $))
                          (LETT |m| (QCAR |g|)) (LETT |e| (QCDR |g|))
                          (LETT |s| (STRINGIMAGE |m|)) (LETT |n| (QCSIZE |s|))
                          (LETT |o| (+ |n| |e|))
                          (EXIT
                           (COND
                            ((SPADCALL |o| 0 (QREFELT $ 64))
                             (COND
                              ((SPADCALL |o| (MAX |n| |d|) (QREFELT $ 98))
                               (SEQ
                                (COND
                                 ((SPADCALL |o| |n| (QREFELT $ 64))
                                  (LETT |s|
                                        (STRCONC |s|
                                                 (|make_full_CVEC|
                                                  (PROG1 (LETT #3# (- |o| |n|))
                                                    (|check_subtype2|
                                                     (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                                  (|STR_to_CHAR| #7="0"))))))
                                (LETT |t|
                                      (SPADCALL
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (+ |o|
                                                     (SPADCALL |s|
                                                               (QREFELT $
                                                                        145)))
                                                  (-
                                                   (+ |n|
                                                      (SPADCALL |s|
                                                                (QREFELT $
                                                                         145)))
                                                   1)
                                                  (QREFELT $ 151))
                                                 (QREFELT $ 152))
                                       (|STR_to_CHAR| #7#) (QREFELT $ 153)))
                                (COND ((EQUAL |t| "") (LETT |t| "0"))
                                      (#5#
                                       (LETT |t| (|FLOAT;padFromLeft| |t| $))))
                                (LETT |s|
                                      (|FLOAT;padFromRight|
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (SPADCALL |s|
                                                            (QREFELT $ 145))
                                                  (-
                                                   (+ |o|
                                                      (SPADCALL |s|
                                                                (QREFELT $
                                                                         145)))
                                                   1)
                                                  (QREFELT $ 151))
                                                 (QREFELT $ 152))
                                       $))
                                (EXIT (STRCONC |s| (STRCONC "." |t|)))))
                              ((SPADCALL |o| 0 (QREFELT $ 98))
                               (COND
                                ((>= |o| -5)
                                 (STRCONC #8="0."
                                          (|FLOAT;padFromLeft|
                                           (STRCONC
                                            (|make_full_CVEC|
                                             (PROG1 (LETT #2# (- |o|))
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (|STR_to_CHAR| #7#))
                                            (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                      (QREFELT $ 153)))
                                           $)))
                                (#5#
                                 (SEQ
                                  (LETT |t|
                                        (|FLOAT;padFromLeft|
                                         (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                   (QREFELT $ 153))
                                         $))
                                  (LETT |s|
                                        (COND
                                         ((ZEROP
                                           (SPADCALL (QREFELT $ 135)
                                                     (QREFELT $ 142)))
                                          #9="E")
                                         (#5# #10=" E ")))
                                  (EXIT
                                   (SPADCALL
                                    (LIST #11="0." |t| |s|
                                          (STRINGIMAGE (+ |e| |n|)))
                                    (QREFELT $ 38)))))))
                              (#5#
                               (SEQ
                                (LETT |t|
                                      (|FLOAT;padFromLeft|
                                       (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                 (QREFELT $ 153))
                                       $))
                                (LETT |s|
                                      (COND
                                       ((ZEROP
                                         (SPADCALL (QREFELT $ 135)
                                                   (QREFELT $ 142)))
                                        #9#)
                                       (#5# #10#)))
                                (EXIT
                                 (SPADCALL
                                  (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                  (QREFELT $ 38)))))))
                            ((SPADCALL |o| 0 (QREFELT $ 98))
                             (COND
                              ((>= |o| -5)
                               (STRCONC #8#
                                        (|FLOAT;padFromLeft|
                                         (STRCONC
                                          (|make_full_CVEC|
                                           (PROG1 (LETT #1# (- |o|))
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (|STR_to_CHAR| #7#))
                                          (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                    (QREFELT $ 153)))
                                         $)))
                              (#5#
                               (SEQ
                                (LETT |t|
                                      (|FLOAT;padFromLeft|
                                       (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                 (QREFELT $ 153))
                                       $))
                                (LETT |s|
                                      (COND
                                       ((ZEROP
                                         (SPADCALL (QREFELT $ 135)
                                                   (QREFELT $ 142)))
                                        #9#)
                                       (#5# #10#)))
                                (EXIT
                                 (SPADCALL
                                  (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                  (QREFELT $ 38)))))))
                            (#5#
                             (SEQ
                              (LETT |t|
                                    (|FLOAT;padFromLeft|
                                     (SPADCALL |s| (|STR_to_CHAR| #7#)
                                               (QREFELT $ 153))
                                     $))
                              (LETT |s|
                                    (COND
                                     ((ZEROP
                                       (SPADCALL (QREFELT $ 135)
                                                 (QREFELT $ 142)))
                                      #9#)
                                     (#5# #10#)))
                              (EXIT
                               (SPADCALL
                                (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                (QREFELT $ 38))))))))))))))))) 

(SDEFUN |FLOAT;outputSpacing;NniV;105| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SPADCALL (QREFELT $ 135) |n| (QREFELT $ 154))) 

(SDEFUN |FLOAT;outputFixed;V;106| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "fixed" (QREFELT $ 156))
             (EXIT (SPADCALL (QREFELT $ 141) -1 (QREFELT $ 157))))) 

(SDEFUN |FLOAT;outputFixed;NniV;107| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "fixed" (QREFELT $ 156))
             (EXIT (SPADCALL (QREFELT $ 141) |n| (QREFELT $ 157))))) 

(SDEFUN |FLOAT;outputGeneral;V;108| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "general" (QREFELT $ 156))
             (EXIT (SPADCALL (QREFELT $ 141) -1 (QREFELT $ 157))))) 

(SDEFUN |FLOAT;outputGeneral;NniV;109| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "general" (QREFELT $ 156))
             (EXIT (SPADCALL (QREFELT $ 141) |n| (QREFELT $ 157))))) 

(SDEFUN |FLOAT;outputFloating;V;110| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "floating" (QREFELT $ 156))
             (EXIT (SPADCALL (QREFELT $ 141) -1 (QREFELT $ 157))))) 

(SDEFUN |FLOAT;outputFloating;NniV;111| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 138) "floating" (QREFELT $ 156))
             (EXIT (SPADCALL (QREFELT $ 141) |n| (QREFELT $ 157))))) 

(SDEFUN |FLOAT;convert;$S;112| ((|f| $) ($ |String|))
        (SPROG
         ((#1=#:G980 NIL) (|s| (|String|)) (|b| (|Integer|)) (#2=#:G975 NIL))
         (SEQ
          (LETT |b|
                (SEQ
                 (COND
                  ((EQL (SPADCALL (QREFELT $ 141) (QREFELT $ 149)) -1)
                   (COND
                    ((NULL (SPADCALL |f| (QREFELT $ 26)))
                     (EXIT
                      (SPADCALL
                       (PROG1
                           (LETT #2#
                                 (INTEGER-LENGTH
                                  (ABS (SPADCALL |f| (QREFELT $ 17)))))
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#))
                       (QREFELT $ 63)))))))
                 (EXIT 0)))
          (LETT |s|
                (COND
                 ((EQUAL (SPADCALL (QREFELT $ 138) (QREFELT $ 164)) "fixed")
                  (|FLOAT;fixed| |f| $))
                 ((EQUAL (SPADCALL (QREFELT $ 138) (QREFELT $ 164)) "floating")
                  (|FLOAT;floating| |f| $))
                 ((EQUAL (SPADCALL (QREFELT $ 138) (QREFELT $ 164)) "general")
                  (|FLOAT;general| |f| $))
                 (#3='T (|make_full_CVEC| 0))))
          (COND
           ((SPADCALL |b| 0 (QREFELT $ 64))
            (SPADCALL
             (PROG1 (LETT #1# |b|)
               (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                 #1#))
             (QREFELT $ 63))))
          (EXIT
           (COND ((EQUAL |s| (|make_full_CVEC| 0)) (|error| "bad output mode"))
                 (#3# |s|)))))) 

(SDEFUN |FLOAT;coerce;$Of;113| ((|f| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 27) (QREFELT $ 166))
          (SPADCALL (SPADCALL |f| (QREFELT $ 165)) (QREFELT $ 168)))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 29)) (QREFELT $ 169))
                    (QREFELT $ 170))))) 

(SDEFUN |FLOAT;convert;$If;114| ((|f| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|float| (QREFELT $ 173))
               (SPADCALL (SPADCALL |f| (QREFELT $ 17)) (QREFELT $ 175))
               (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 175))
               (SPADCALL (SPADCALL (QREFELT $ 109)) (QREFELT $ 174)))
         (QREFELT $ 176))) 

(PUT '|FLOAT;convert;2$;115| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FLOAT;convert;2$;115| ((|x| $) ($ |Float|)) |x|) 

(SDEFUN |FLOAT;convert;$Df;116| ((|x| $) ($ |DoubleFloat|))
        (|makeSF| (QCAR |x|) (QCDR |x|))) 

(SDEFUN |FLOAT;coerce;$Df;117| ((|x| $) ($ |DoubleFloat|))
        (SPADCALL |x| (QREFELT $ 181))) 

(SDEFUN |FLOAT;convert;Df$;118| ((|sf| |DoubleFloat|) ($ $))
        (SPADCALL (SPADCALL |sf| (QREFELT $ 183))
                  (SPADCALL |sf| (QREFELT $ 184)) (FLOAT-RADIX 0.0)
                  (QREFELT $ 114))) 

(SDEFUN |FLOAT;retract;$F;119| ((|f| $) ($ |Fraction| (|Integer|)))
        (SPROG ((#1=#:G991 NIL))
               (SPADCALL |f|
                         (PROG1 (LETT #1# (- (SPADCALL (QREFELT $ 51)) 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         2 (QREFELT $ 186)))) 

(SDEFUN |FLOAT;retractIfCan;$U;120|
        ((|f| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((#1=#:G997 NIL))
               (CONS 0
                     (SPADCALL |f|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT $ 51)) 1))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               2 (QREFELT $ 186))))) 

(SDEFUN |FLOAT;retract;$I;121| ((|f| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 52)))
                    (EXIT
                     (COND
                      ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 190))
                                 (QREFELT $ 32))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |FLOAT;retractIfCan;$U;122| ((|f| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 52)))
                    (EXIT
                     (COND
                      ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 190))
                                 (QREFELT $ 32))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |FLOAT;rationalApproximation;$NniF;123|
        ((|f| $) (|d| |NonNegativeInteger|) ($ |Fraction| (|Integer|)))
        (SPADCALL |f| |d| 10 (QREFELT $ 186))) 

(SDEFUN |FLOAT;rationalApproximation;$2NniF;124|
        ((|f| $) (|d| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Fraction| (|Integer|)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G222| #3=(|Integer|))
          (|#G221| #1#) (|q1| #4=(|Integer|)) (|q0| #4#)
          (|#G220| #5=(|Integer|)) (|#G219| #4#) (|p1| #4#) (|p0| #4#)
          (|#G218| #5#) (|#G217| #4#) (#6=#:G1028 NIL) (|q2| #5#) (|p2| #5#)
          (|r| #3#) (|q| #7=(|Integer|))
          (|#G216| (|Record| (|:| |quotient| #7#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| (|PositiveInteger|))
          (#8=#:G1020 NIL) (#9=#:G1018 NIL) (|ex| (|Integer|)) (|nu| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |nu| (QCAR |f|)) (LETT |ex| (QCDR |f|))
                (COND
                 ((>= |ex| 0)
                  (PROGN
                   (LETT #6#
                         (SPADCALL
                          (* |nu|
                             (EXPT 2
                                   (PROG1 (LETT #9# |ex|)
                                     (|check_subtype2| (>= #9# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #9#))))
                          1 (QREFELT $ 195)))
                   (GO #10=#:G1027))))
                (LETT |de|
                      (EXPT 2
                            (PROG1 (LETT #8# (- |ex|))
                              (|check_subtype2| (>= #8# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #8#))))
                (COND ((< |b| 2) (|error| "base must be > 1")))
                (LETT |tol| (EXPT |b| |d|)) (LETT |s| |nu|) (LETT |t| |de|)
                (LETT |p0| 0) (LETT |p1| 1) (LETT |q0| 1) (LETT |q1| 0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G216| (DIVIDE2 |s| |t|))
                        (LETT |q| (QCAR |#G216|))
                        (LETT |r| (QCDR |#G216|))
                        |#G216|)
                       (LETT |p2| (+ (* |q| |p1|) |p0|))
                       (LETT |q2| (+ (* |q| |q1|) |q0|))
                       (COND
                        ((OR (EQL |r| 0)
                             (<
                              (SPADCALL |tol|
                                        (ABS
                                         (- (* |nu| |q2|)
                                            (SPADCALL |de| |p2|
                                                      (QREFELT $ 56))))
                                        (QREFELT $ 75))
                              (SPADCALL |de| (ABS |p2|) (QREFELT $ 56))))
                         (PROGN
                          (LETT #6# (SPADCALL |p2| |q2| (QREFELT $ 195)))
                          (GO #10#))))
                       (PROGN
                        (LETT |#G217| |p1|)
                        (LETT |#G218| |p2|)
                        (LETT |p0| |#G217|)
                        (LETT |p1| |#G218|))
                       (PROGN
                        (LETT |#G219| |q1|)
                        (LETT |#G220| |q2|)
                        (LETT |q0| |#G219|)
                        (LETT |q1| |#G220|))
                       (EXIT
                        (PROGN
                         (LETT |#G221| |t|)
                         (LETT |#G222| |r|)
                         (LETT |s| |#G221|)
                         (LETT |t| |#G222|))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #10# (EXIT #6#)))) 

(SDEFUN |FLOAT;hashUpdate!;Hs$Hs;125|
        ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SPROG
         ((|e| (|Integer|)) (|m| (|Integer|)) (#1=#:G1031 NIL)
          (|tmp| (|Union| (|Integer|) #2="failed")))
         (SEQ (LETT |m| (QCAR |x|)) (LETT |e| (QCDR |x|))
              (SEQ G190
                   (COND
                    ((NULL
                      (QEQCAR (LETT |tmp| (SPADCALL |m| 2 (QREFELT $ 196))) 0))
                     (GO G191)))
                   (SEQ
                    (LETT |m|
                          (PROG2 (LETT #1# |tmp|)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                            (|Union| (|Integer|) #2#) #1#)))
                    (EXIT (LETT |e| (+ |e| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |s| (SPADCALL |s| |m| (QREFELT $ 198)))
              (EXIT (SPADCALL |s| |e| (QREFELT $ 198)))))) 

(DECLAIM (NOTINLINE |Float;|)) 

(DEFUN |Float| ()
  (SPROG NIL
         (PROG (#1=#:G1050)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Float|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Float|
                             (LIST (CONS NIL (CONS 1 (|Float;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Float|)))))))))) 

(DEFUN |Float;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Float|))
          (LETT $ (GETREFV 213))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Float| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|arbitraryPrecision|))
               (|augmentPredVector| $ 1))
          (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
               (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
               (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 68 (QREFELT $ 8)))
          (QSETREFV $ 10
                    (|Record| (|:| |mantissa| (|Integer|))
                              (|:| |exponent| (|Integer|))))
          (QSETREFV $ 70 (CONS 1 (CONS 1 2)))
          (QSETREFV $ 88 (CONS 1 (|spadConstant| $ 31)))
          (QSETREFV $ 90 (CONS 1 (CONS 1 1)))
          (QSETREFV $ 101 (CONS 1 (CONS 1 1)))
          (QSETREFV $ 135 (SPADCALL 10 (QREFELT $ 134)))
          (QSETREFV $ 138 (SPADCALL "general" (QREFELT $ 137)))
          (QSETREFV $ 141 (SPADCALL -1 (QREFELT $ 140)))
          $))) 

(MAKEPROP '|Float| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|) (|Reference| 6)
              (0 . |ref|) 'BITS '|Rep| (|Void|) (|OpenMathDevice|)
              (5 . |OMputApp|) (|String|) (10 . |OMputSymbol|) (|Integer|)
              |FLOAT;mantissa;$I;50| (17 . |OMputInteger|)
              |FLOAT;exponent;$I;51| (23 . |OMputEndApp|) (28 . |OMputObject|)
              (33 . |OMputEndObject|) (|Boolean|) |FLOAT;OMwrite;Omd$BV;2|
              (38 . |sign|) |FLOAT;zero?;$B;53|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FLOAT;Zero;$;47|) $))
              |FLOAT;negative?;$B;54| |FLOAT;-;2$;72| |FLOAT;asin;2$;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FLOAT;One;$;48|) $))
              |FLOAT;=;2$B;61| |FLOAT;pi;$;15| |FLOAT;/;$I$;81| (43 . >)
              (49 . |toString|) (|List| $) (54 . |concat|)
              |FLOAT;increasePrecision;IPi;40| |FLOAT;sqrt;2$;35|
              |FLOAT;/;3$;80| |FLOAT;atan;2$;7|
              |FLOAT;decreasePrecision;IPi;41| |FLOAT;normalize;2$;59|
              |FLOAT;acos;2$;5| |FLOAT;-;3$;75| |FLOAT;<;2$B;62|
              |FLOAT;abs;2$;63| |FLOAT;atan;3$;6| (59 . |fractionPart|)
              |FLOAT;bits;Pi;36| |FLOAT;wholePart;$I;65| (|IntegerRoots| 16)
              (64 . |approxSqrt|) |FLOAT;order;$I;45| (69 . *) |FLOAT;*;3$;78|
              |FLOAT;+;3$;74| |FLOAT;shift;$I$;60| (75 . ~=) |FLOAT;sign;$I;68|
              (81 . *) |FLOAT;bits;2Pi;37| (87 . >) (93 . ^) |FLOAT;*;I2$;79|
              |FLOAT;sin;2$;10| |FLOAT;cos;2$;12| |FLOAT;tan;2$;14| 'P
              |FLOAT;precision;Pi;38| (99 . <=) (105 . ^)
              (|NonNegativeInteger|) (111 . *) (117 . *) (123 . ^)
              |FLOAT;exp;2$;29| |FLOAT;sinh;2$;17| |FLOAT;cosh;2$;18|
              |FLOAT;tanh;2$;19| |FLOAT;log;2$;23| |FLOAT;asinh;2$;20|
              |FLOAT;acosh;2$;21| |FLOAT;atanh;2$;22| |FLOAT;log2;$;25|
              |FLOAT;^;$I$;90| 'L2 (129 . <=) 'L10 |FLOAT;log10;$;26|
              |FLOAT;log2;2$;27| |FLOAT;log10;2$;28| |FLOAT;exp1;$;34|
              (|List| (|List| 16)) (|Matrix| 16) (135 . |matrix|) (140 . <=)
              (146 . |elt|) (153 . *) 'E (159 . >) (165 . |elt|)
              (170 . |setelt!|) |FLOAT;precision;2Pi;39| |FLOAT;digits;Pi;43|
              |FLOAT;digits;2Pi;44| |FLOAT;relerror;3$;46| |FLOAT;base;Pi;49|
              |FLOAT;one?;$B;52| (176 . |positive?|) |FLOAT;positive?;$B;55|
              |FLOAT;float;2I$;57| |FLOAT;float;2IPi$;58| (181 . >)
              |FLOAT;floor;2$;66| |FLOAT;truncate;2$;69| |FLOAT;ceiling;2$;64|
              |FLOAT;round;2$;67| (|Union| $ '"failed") |FLOAT;recip;$U;70|
              |FLOAT;differentiate;2$;71| |FLOAT;inv;2$;82| |FLOAT;^;3$;88|
              (|Fraction| 16) (187 . |Zero|) (191 . =) (197 . <) (203 . |One|)
              (207 . |numer|) (212 . |denom|) |FLOAT;^;$F$;89| (|Reference| 74)
              (217 . |ref|) 'SPACING (|Reference| 14) (222 . |ref|) 'OUTMODE
              (|Reference| 16) (227 . |ref|) 'OUTPREC (232 . |elt|)
              (|Character|) (237 . |escape|) (241 . |minIndex|) (246 . |elt|)
              (252 . |setelt!|) (259 . |maxIndex|) (264 . |elt|)
              (|UniversalSegment| 16) (269 . SEGMENT) (275 . |elt|)
              (281 . |rightTrim|) (287 . |setelt!|)
              |FLOAT;outputSpacing;NniV;105| (293 . |setelt!|)
              (299 . |setelt!|) |FLOAT;outputFixed;V;106|
              |FLOAT;outputFixed;NniV;107| |FLOAT;outputGeneral;V;108|
              |FLOAT;outputGeneral;NniV;109| |FLOAT;outputFloating;V;110|
              |FLOAT;outputFloating;NniV;111| (305 . |elt|)
              |FLOAT;convert;$S;112| (310 . >=) (|OutputForm|)
              (316 . |message|) |FLOAT;coerce;$Of;113| (321 . -) (|Symbol|)
              (|InputForm|) (326 . |convert|) (331 . |convert|)
              (336 . |convert|) (341 . |convert|) |FLOAT;convert;$If;114|
              (|Float|) |FLOAT;convert;2$;115| (|DoubleFloat|)
              |FLOAT;convert;$Df;116| |FLOAT;coerce;$Df;117| (346 . |mantissa|)
              (351 . |exponent|) |FLOAT;convert;Df$;118|
              |FLOAT;rationalApproximation;$2NniF;124| |FLOAT;retract;$F;119|
              (|Union| 125 '"failed") |FLOAT;retractIfCan;$U;120|
              (356 . |coerce|) |FLOAT;retract;$I;121| (|Union| 16 '"failed")
              |FLOAT;retractIfCan;$U;122|
              |FLOAT;rationalApproximation;$NniF;123| (361 . /) (367 . |exquo|)
              (|HashState|) (373 . |hashUpdate!|) |FLOAT;hashUpdate!;Hs$Hs;125|
              (|PatternMatchResult| 178 $) (|Pattern| 178) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 203 '#1="failed") (|Union| 37 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 37) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 379 |zero?| 385 |wholePart| 390 |unitNormal| 395
              |unitCanonical| 400 |unit?| 405 |truncate| 410 |toString| 415
              |tanh| 426 |tan| 431 |subtractIfCan| 436 |squareFreePart| 442
              |squareFree| 447 |sqrt| 452 |smaller?| 457 |sizeLess?| 463 |sinh|
              469 |sin| 474 |sign| 479 |shift| 484 |sech| 490 |sec| 495
              |sample| 500 |round| 504 |rightRecip| 509 |rightPower| 514
              |retractIfCan| 526 |retract| 536 |rem| 546 |relerror| 552 |recip|
              558 |rationalApproximation| 563 |quo| 576 |principalIdeal| 582
              |prime?| 587 |precision| 592 |positive?| 601 |pi| 606
              |patternMatch| 610 |outputSpacing| 617 |outputGeneral| 622
              |outputFloating| 631 |outputFixed| 640 |order| 649 |opposite?|
              654 |one?| 660 |nthRoot| 665 |normalize| 671 |norm| 676
              |negative?| 681 |multiEuclidean| 686 |min| 692 |max| 702
              |mantissa| 712 |log2| 717 |log10| 726 |log| 735 |leftRecip| 740
              |leftPower| 745 |lcmCoef| 757 |lcm| 763 |latex| 774 |inv| 779
              |increasePrecision| 784 |hashUpdate!| 789 |hash| 795
              |gcdPolynomial| 800 |gcd| 806 |fractionPart| 817 |floor| 822
              |float| 827 |factor| 840 |extendedEuclidean| 845 |exquo| 858
              |expressIdealMember| 864 |exponent| 870 |exp1| 875 |exp| 879
              |euclideanSize| 884 |divide| 889 |digits| 895 |differentiate| 904
              |decreasePrecision| 915 |csch| 920 |csc| 925 |coth| 930 |cot| 935
              |cosh| 940 |cos| 945 |convert| 950 |commutator| 980 |coerce| 986
              |characteristic| 1011 |ceiling| 1015 |bits| 1020 |base| 1029
              |atanh| 1033 |atan| 1038 |associator| 1049 |associates?| 1056
              |asinh| 1062 |asin| 1067 |asech| 1072 |asec| 1077
              |antiCommutator| 1082 |annihilate?| 1088 |acsch| 1094 |acsc| 1099
              |acoth| 1104 |acot| 1109 |acosh| 1114 |acos| 1119 |abs| 1124 ^
              1129 |Zero| 1159 |One| 1163 |OMwrite| 1167 D 1191 >= 1202 > 1208
              = 1214 <= 1220 < 1226 / 1232 - 1244 + 1255 * 1261)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |OrderedRing&| |DivisionRing&| NIL NIL
                |DifferentialRing&| NIL |Algebra&| |EntireRing&| |Algebra&| NIL
                |Rng&| NIL |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL |Magma&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| NIL NIL |SetCategory&| NIL
                NIL |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |OpenMath&| NIL NIL
                NIL |RadicalCategory&| |RetractableTo&| |RetractableTo&| NIL
                NIL |PartialOrder&| NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialRing|) (|CharacteristicZero|)
                 (|Algebra| 125) (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|)
                 (|SemiRing|) (|Module| 125) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| 125 125)
                 (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 125)
                 (|LeftModule| 125) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|PatternMatchable| 178) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|TranscendentalFunctionCategory|)
                 (|RealConstant|) (|CommutativeStar|) (|SetCategory|)
                 (|arbitraryExponent|) (|arbitraryPrecision|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|ConvertibleTo| 172)
                 (|CoercibleTo| 180) (|OpenMath|) (|ConvertibleTo| 14)
                 (|Approximate|) (|ConvertibleTo| 201) (|RadicalCategory|)
                 (|RetractableTo| 125) (|RetractableTo| 16)
                 (|ConvertibleTo| 178) (|ConvertibleTo| 180) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 167))
              (|makeByteWordVec2| 212
                                  '(1 7 0 6 8 1 12 11 0 13 3 12 11 0 14 14 15 2
                                    12 11 0 16 18 1 12 11 0 20 1 12 11 0 21 1
                                    12 11 0 22 1 16 16 0 25 2 0 23 0 0 35 1 0
                                    14 0 36 1 14 0 37 38 1 0 0 0 50 1 53 16 16
                                    54 2 16 0 6 0 56 2 16 23 0 0 60 2 0 0 6 0
                                    62 2 16 23 0 0 64 2 0 0 0 6 65 2 6 23 0 0
                                    72 2 6 0 0 6 73 2 16 0 74 0 75 2 74 0 6 0
                                    76 2 74 0 0 6 77 2 74 23 0 0 89 1 96 0 95
                                    97 2 16 23 0 0 98 3 96 16 0 16 16 99 2 96 0
                                    0 0 100 2 6 23 0 0 102 1 7 6 0 103 2 7 6 0
                                    6 104 1 16 23 0 111 2 74 23 0 0 115 0 125 0
                                    126 2 125 23 0 0 127 2 125 23 0 0 128 0 125
                                    0 129 1 125 16 0 130 1 125 16 0 131 1 133 0
                                    74 134 1 136 0 14 137 1 139 0 16 140 1 133
                                    74 0 142 0 143 0 144 1 14 16 0 145 2 14 143
                                    0 16 146 3 14 143 0 16 143 147 1 14 16 0
                                    148 1 139 16 0 149 2 150 0 16 16 151 2 14 0
                                    0 150 152 2 14 0 0 143 153 2 133 74 0 74
                                    154 2 136 14 0 14 156 2 139 16 0 16 157 1
                                    136 14 0 164 2 0 23 0 0 166 1 167 0 14 168
                                    1 167 0 0 170 1 172 0 171 173 1 6 172 0 174
                                    1 16 172 0 175 1 172 0 37 176 1 180 16 0
                                    183 1 180 16 0 184 1 0 0 16 190 2 125 0 16
                                    16 195 2 16 120 0 0 196 2 16 197 197 0 198
                                    2 0 23 0 0 1 1 0 23 0 26 1 0 16 0 52 1 0
                                    211 0 1 1 0 0 0 1 1 0 23 0 1 1 0 0 0 117 2
                                    0 14 0 74 1 1 0 14 0 36 1 0 0 0 81 1 0 0 0
                                    69 2 0 120 0 0 1 1 0 0 0 1 1 0 202 0 1 1 0
                                    0 0 40 2 0 23 0 0 1 2 0 23 0 0 1 1 0 0 0 79
                                    1 0 0 0 67 1 0 16 0 61 2 0 0 0 16 59 1 0 0
                                    0 1 1 0 0 0 1 0 0 0 1 1 0 0 0 119 1 0 120 0
                                    1 2 0 0 0 74 1 2 0 0 0 6 1 1 0 188 0 189 1
                                    0 192 0 193 1 0 125 0 187 1 0 16 0 191 2 0
                                    0 0 0 1 2 0 0 0 0 108 1 0 120 0 121 3 0 125
                                    0 74 74 186 2 0 125 0 74 194 2 0 0 0 0 1 1
                                    0 208 37 1 1 0 23 0 1 1 1 6 6 105 0 0 6 71
                                    1 0 23 0 112 0 0 0 33 3 0 200 0 201 200 1 1
                                    0 11 74 155 1 0 11 74 161 0 0 11 160 0 0 11
                                    162 1 0 11 74 163 0 0 11 158 1 0 11 74 159
                                    1 0 16 0 55 2 0 23 0 0 1 1 0 23 0 110 2 0 0
                                    0 16 1 1 0 0 0 44 1 0 0 0 1 1 0 23 0 28 2 0
                                    205 37 0 1 0 2 0 1 2 0 0 0 0 1 0 2 0 1 2 0
                                    0 0 0 1 1 0 16 0 17 1 0 0 0 92 0 0 0 86 1 0
                                    0 0 93 0 0 0 91 1 0 0 0 82 1 0 120 0 1 2 0
                                    0 0 74 1 2 0 0 0 6 1 2 0 210 0 0 1 2 0 0 0
                                    0 1 1 0 0 37 1 1 0 14 0 1 1 0 0 0 123 1 1 6
                                    16 39 2 0 197 197 0 199 1 0 212 0 1 2 0 209
                                    209 209 1 2 0 0 0 0 1 1 0 0 37 1 1 0 0 0 50
                                    1 0 0 0 116 3 0 0 16 16 6 114 2 0 0 16 16
                                    113 1 0 202 0 1 3 0 204 0 0 0 1 2 0 206 0 0
                                    1 2 0 120 0 0 1 2 0 205 37 0 1 1 0 16 0 19
                                    0 0 0 94 1 0 0 0 78 1 0 74 0 1 2 0 207 0 0
                                    1 1 1 6 6 107 0 0 6 106 1 0 0 0 122 2 0 0 0
                                    74 1 1 1 6 16 43 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 80 1 0 0 0 68 1 0 0
                                    180 185 1 0 172 0 177 1 0 14 0 165 1 0 201
                                    0 1 1 0 180 0 181 1 0 178 0 179 2 0 0 0 0 1
                                    1 0 180 0 182 1 0 0 125 1 1 0 0 16 190 1 0
                                    0 0 1 1 0 167 0 169 0 0 74 1 1 0 0 0 118 1
                                    1 6 6 63 0 0 6 51 0 0 6 109 1 0 0 0 85 2 0
                                    0 0 0 49 1 0 0 0 42 3 0 0 0 0 0 1 2 0 23 0
                                    0 1 1 0 0 0 83 1 0 0 0 30 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 23 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 84 1 0 0 0
                                    45 1 0 0 0 48 2 0 0 0 0 124 2 0 0 0 125 132
                                    2 0 0 0 16 87 2 0 0 0 74 1 2 0 0 0 6 65 0 0
                                    0 27 0 0 0 31 2 0 11 12 0 1 3 0 11 12 0 23
                                    24 2 0 14 0 23 1 1 0 14 0 1 1 0 0 0 1 2 0 0
                                    0 74 1 2 0 23 0 0 166 2 0 23 0 0 35 2 0 23
                                    0 0 32 2 0 23 0 0 1 2 0 23 0 0 47 2 0 0 0
                                    16 34 2 0 0 0 0 41 2 0 0 0 0 46 1 0 0 0 29
                                    2 0 0 0 0 58 2 0 0 125 0 1 2 0 0 0 125 1 2
                                    0 0 74 0 1 2 0 0 16 0 66 2 0 0 0 0 57 2 0 0
                                    6 0 62)))))
           '|lookupComplete|)) 

(MAKEPROP '|Float| 'NILADIC T) 