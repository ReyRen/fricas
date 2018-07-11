
(SDEFUN |XHASHTBL;localSearch|
        ((|a| |PrimitiveArray| (|None|)) (|k| |Key|)
         (|h| |Mapping| (|SingleInteger|) |Key|) ($ |Integer|))
        (SPROG
         ((|q| (|Integer|)) (|mk| (|None|)) (|p| (|Integer|)) (#1=#:G412 NIL)
          (#2=#:G411 NIL) (|deletedPosition?| (|Boolean|)) (|h2| (|Integer|))
          (|h1| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (ASH (QVSIZE |a|) -1)) (LETT |h1| (SPADCALL |k| |h|))
                (LETT |p| (SPADCALL |h1| |n| (QREFELT $ 15)))
                (LETT |h2| (+ 1 (SPADCALL |h1| (- |n| 2) (QREFELT $ 15))))
                (LETT |mk| (QAREF1 |a| |p|)) (LETT |deletedPosition?| NIL)
                (SEQ
                 (EXIT
                  (SEQ G190
                       (COND ((NULL (NULL (EQ |mk| (QREFELT $ 8)))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQ |mk| (QREFELT $ 9))
                           (SEQ (LETT |deletedPosition?| 'T)
                                (EXIT
                                 (PROGN
                                  (LETT #2# |$NoValue|)
                                  (GO #3=#:G399)))))
                          ((SPADCALL |k| |mk| (QREFELT $ 17))
                           (PROGN (LETT #1# |p|) (GO #4=#:G410)))
                          ('T
                           (SEQ (LETT |p| (+ |p| |h2|))
                                (COND ((>= |p| |n|) (LETT |p| (- |p| |n|))))
                                (EXIT (LETT |mk| (QAREF1 |a| |p|))))))))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #3# (EXIT #2#))
                (LETT |q| |p|)
                (SEQ G190
                     (COND ((NULL (NULL (EQ |mk| (QREFELT $ 8)))) (GO G191)))
                     (SEQ
                      (COND
                       ((NULL (EQ |mk| (QREFELT $ 9)))
                        (COND
                         ((SPADCALL |k| |mk| (QREFELT $ 17))
                          (EXIT
                           (SEQ
                            (SEQ (QSETAREF1 |a| |q| |k|)
                                 (EXIT
                                  (QSETAREF1 |a| (+ |n| |q|)
                                             (QAREF1 |a| (+ |n| |p|)))))
                            (SEQ (QSETAREF1 |a| |p| (QREFELT $ 9))
                                 (EXIT
                                  (QSETAREF1 |a| (+ |n| |p|) (QREFELT $ 8))))
                            (EXIT (PROGN (LETT #1# |q|) (GO #4#)))))))))
                      (EXIT
                       (SEQ (LETT |p| (+ |p| |h2|))
                            (COND ((>= |p| |n|) (LETT |p| (- |p| |n|))))
                            (EXIT (LETT |mk| (QAREF1 |a| |p|))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND (|deletedPosition?| (LETT |q| (- |q| |n|))))
                (EXIT (- |q| |n|))))
          #4# (EXIT #1#)))) 

(SDEFUN |XHASHTBL;newArr|
        ((|n| |NonNegativeInteger|) ($ |PrimitiveArray| (|None|)))
        (MAKEARR1 (SPADCALL 2 |n| (QREFELT $ 20)) (QREFELT $ 8))) 

(SDEFUN |XHASHTBL;rehashAux!| ((|x| $) (|ix| |Integer|) ($ $))
        (SPROG
         ((|p| (|Integer|)) (|k| (|Key|)) (|mk| (|None|)) (#1=#:G430 NIL)
          (|i| NIL) (|c| (|PrimitiveArray| (|None|))) (|n| (|Integer|))
          (|a| (|PrimitiveArray| (|None|)))
          (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|r|
           (|Record| (|:| |numOfEntries| (|Integer|))
                     (|:| |maxNumOfEntries| (|Integer|))
                     (|:| |numOfDeletedEntries| (|Integer|))
                     (|:| |maxNumOfVirtualEntries| (|Integer|))
                     (|:| |idx| (|Integer|))
                     (|:| |arr| (|PrimitiveArray| (|None|)))
                     (|:| |hashFunction| (|Mapping| (|SingleInteger|) |Key|))))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QAREF1 (QREFELT $ 13) |ix|)) (LETT |r| |x|)
              (LETT |h| (QVELT |r| 6)) (LETT |a| (QVELT |r| 5))
              (LETT |n| (ASH (QVSIZE |a|) -1))
              (LETT |c| (|XHASHTBL;newArr| |m| $))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 8)) NIL)
                        ('T
                         (NULL
                          (EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 9)))))
                       (SEQ (LETT |k| |mk|)
                            (LETT |p|
                                  (+ |m|
                                     (|XHASHTBL;localSearch| |c| |k| |h| $)))
                            (EXIT
                             (SEQ (QSETAREF1 |c| |p| |k|)
                                  (EXIT
                                   (QSETAREF1 |c| (+ |m| |p|)
                                              (QAREF1 |a| (+ |n| |i|)))))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |r| 5 |c|) (QSETVELT |r| 4 |ix|)
              (QSETVELT |r| 1 (QUOTIENT2 (* |m| 7) 10)) (QSETVELT |r| 2 0)
              (QSETVELT |r| 3 (QUOTIENT2 (* |m| 9) 10)) (EXIT |x|)))) 

(SDEFUN |XHASHTBL;grow!| ((|x| $) ($ $))
        (|XHASHTBL;rehashAux!| |x| (+ (QVELT |x| 4) 1) $)) 

(SDEFUN |XHASHTBL;rehash!| ((|x| $) ($ $))
        (|XHASHTBL;rehashAux!| |x| (QVELT |x| 4) $)) 

(SDEFUN |XHASHTBL;table;M$;6|
        ((|hashfunction| |Mapping| (|SingleInteger|) |Key|) ($ $))
        (SPROG
         ((|maxVirtualEntries| (|Integer|)) (|maxEntries| (|Integer|))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QAREF1 (QREFELT $ 13) 0))
              (LETT |maxEntries| (QUOTIENT2 (* |n| 7) 10))
              (LETT |maxVirtualEntries| (QUOTIENT2 (* |n| 9) 10))
              (EXIT
               (VECTOR 0 |maxEntries| 0 |maxVirtualEntries| 0
                       (|XHASHTBL;newArr| |n| $) |hashfunction|))))) 

(SDEFUN |XHASHTBL;empty;$;7| (($ $))
        (SPADCALL (|forceLazySlot| (ELT $ 24)) (QREFELT $ 22))) 

(SDEFUN |XHASHTBL;inspect;$R;8|
        ((|x| $) ($ |Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
        (SPROG
         ((#1=#:G464 NIL) (|mk| (|None|)) (#2=#:G465 NIL) (|i| NIL)
          (|n| (|Integer|)) (|a| (|PrimitiveArray| (|None|))))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (QVELT |x| 5)) (LETT |n| (ASH (QVSIZE |a|) -1))
                (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((COND
                          ((EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 8)) NIL)
                          ('T
                           (NULL
                            (EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 9)))))
                         (PROGN
                          (LETT #1# (CONS |mk| (QAREF1 |a| (+ |n| |i|))))
                          (GO #3=#:G463))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "table must be non-empty"))))
          #3# (EXIT #1#)))) 

(SDEFUN |XHASHTBL;#;$Nni;9| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G467 NIL))
               (PROG1 (LETT #1# (QVELT |x| 0))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |XHASHTBL;search;Key$U;10|
        ((|k| |Key|) (|x| $) ($ |Union| |Entry| "failed"))
        (SPROG
         ((|p| (|Integer|)) (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |h| (QVELT |x| 6))
              (LETT |p| (|XHASHTBL;localSearch| |a| |k| |h| $))
              (EXIT
               (COND ((< |p| 0) (CONS 1 "failed"))
                     ('T
                      (CONS 0 (QAREF1 |a| (+ (ASH (QVSIZE |a|) -1) |p|))))))))) 

(SDEFUN |XHASHTBL;elt;$KeyEntry;11| ((|x| $) (|k| |Key|) ($ |Entry|))
        (SPROG
         ((|p| (|Integer|)) (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |h| (QVELT |x| 6))
              (LETT |p| (|XHASHTBL;localSearch| |a| |k| |h| $))
              (EXIT
               (COND ((< |p| 0) (|error| "key not in table"))
                     ('T (QAREF1 |a| (+ (ASH (QVSIZE |a|) -1) |p|)))))))) 

(SDEFUN |XHASHTBL;elt;$Key2Entry;12|
        ((|x| $) (|k| |Key|) (|e| |Entry|) ($ |Entry|))
        (SPROG
         ((|p| (|Integer|)) (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |h| (QVELT |x| 6))
              (LETT |p| (|XHASHTBL;localSearch| |a| |k| |h| $))
              (EXIT
               (COND ((< |p| 0) |e|)
                     ('T (QAREF1 |a| (+ (ASH (QVSIZE |a|) -1) |p|)))))))) 

(SDEFUN |XHASHTBL;setelt!;$Key2Entry;13|
        ((|x| $) (|k| |Key|) (|e| |Entry|) ($ |Entry|))
        (SPROG
         ((|p| (|Integer|))
          (|r|
           (|Record| (|:| |numOfEntries| (|Integer|))
                     (|:| |maxNumOfEntries| (|Integer|))
                     (|:| |numOfDeletedEntries| (|Integer|))
                     (|:| |maxNumOfVirtualEntries| (|Integer|))
                     (|:| |idx| (|Integer|))
                     (|:| |arr| (|PrimitiveArray| (|None|)))
                     (|:| |hashFunction| (|Mapping| (|SingleInteger|) |Key|))))
          (|n| (|Integer|)) (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ
          (COND ((>= (QVELT |x| 0) (QVELT |x| 1)) (|XHASHTBL;grow!| |x| $)))
          (LETT |a| (QVELT |x| 5)) (LETT |h| (QVELT |x| 6))
          (LETT |p| (|XHASHTBL;localSearch| |a| |k| |h| $))
          (LETT |n| (ASH (QVSIZE |a|) -1))
          (EXIT
           (COND ((>= |p| 0) (QSETAREF1 |a| (+ |n| |p|) |e|))
                 (#1='T
                  (SEQ (LETT |r| |x|) (QSETVELT |r| 0 (+ (QVELT |r| 0) 1))
                       (LETT |p| (+ |n| |p|))
                       (EXIT
                        (COND
                         ((< |p| 0)
                          (SEQ (QSETVELT |r| 2 (- (QVELT |r| 2) 1))
                               (EXIT
                                (SEQ (QSETAREF1 |a| (+ |n| |p|) |k|)
                                     (EXIT
                                      (QSETAREF1 |a| (+ |n| (+ |n| |p|))
                                                 |e|))))))
                         (#1#
                          (SEQ
                           (SEQ (QSETAREF1 |a| |p| |k|)
                                (EXIT (QSETAREF1 |a| (+ |n| |p|) |e|)))
                           (COND
                            ((SPADCALL (+ (QVELT |r| 0) (QVELT |r| 2))
                                       (QVELT |r| 3) (QREFELT $ 33))
                             (|XHASHTBL;rehash!| |x| $)))
                           (EXIT |e|)))))))))))) 

(SDEFUN |XHASHTBL;remove!;Key$U;14|
        ((|k| |Key|) (|x| $) ($ |Union| |Entry| "failed"))
        (SPROG
         ((|e| (|Entry|)) (|n| (|Integer|)) (|p| (|Integer|))
          (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |h| (QVELT |x| 6))
              (LETT |p| (|XHASHTBL;localSearch| |a| |k| |h| $))
              (EXIT
               (COND ((< |p| 0) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |n| (ASH (QVSIZE |a|) -1))
                           (LETT |e| (QAREF1 |a| (+ |n| |p|)))
                           (SEQ (QSETAREF1 |a| |p| (QREFELT $ 9))
                                (EXIT
                                 (QSETAREF1 |a| (+ |n| |p|) (QREFELT $ 8))))
                           (QSETVELT |x| 0 (- (QVELT |x| 0) 1))
                           (QSETVELT |x| 2 (+ (QVELT |x| 2) 1))
                           (EXIT (CONS 0 |e|))))))))) 

(SDEFUN |XHASHTBL;copy;2$;15| ((|x| $) ($ $))
        (SPROG
         ((|r|
           (|Record| (|:| |numOfEntries| (|Integer|))
                     (|:| |maxNumOfEntries| (|Integer|))
                     (|:| |numOfDeletedEntries| (|Integer|))
                     (|:| |maxNumOfVirtualEntries| (|Integer|))
                     (|:| |idx| (|Integer|))
                     (|:| |arr| (|PrimitiveArray| (|None|)))
                     (|:| |hashFunction|
                          (|Mapping| (|SingleInteger|) |Key|)))))
         (SEQ (LETT |r| |x|)
              (EXIT
               (VECTOR (QVELT |r| 0) (QVELT |r| 1) (QVELT |r| 2) (QVELT |r| 3)
                       (QVELT |r| 4) (SPADCALL (QVELT |r| 5) (QREFELT $ 37))
                       (QVELT |r| 6)))))) 

(SDEFUN |XHASHTBL;fill!;$Entry$;16| ((|x| $) (|e| |Entry|) ($ $))
        (SPROG
         ((#1=#:G523 NIL) (|i| NIL) (|n| (|NonNegativeInteger|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |n| (ASH (QVSIZE |a|) -1))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((EQ (QAREF1 |a| |i|) (QREFELT $ 8)) NIL)
                             ('T (NULL (EQ (QAREF1 |a| |i|) (QREFELT $ 9)))))
                       (QSETAREF1 |a| (+ |n| |i|) |e|)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |x|)))) 

(SDEFUN |XHASHTBL;map!;M2$;17| ((|f| |Mapping| |Entry| |Entry|) (|x| $) ($ $))
        (SPROG
         ((#1=#:G531 NIL) (|i| NIL) (|n| (|NonNegativeInteger|))
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |n| (ASH (QVSIZE |a|) -1))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((EQ (QAREF1 |a| |i|) (QREFELT $ 8)) NIL)
                             ('T (NULL (EQ (QAREF1 |a| |i|) (QREFELT $ 9)))))
                       (QSETAREF1 |a| (+ |n| |i|)
                                  (SPADCALL (QAREF1 |a| (+ |n| |i|)) |f|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |x|)))) 

(SDEFUN |XHASHTBL;keys;$L;18| ((|x| $) ($ |List| |Key|))
        (SPROG
         ((|l| (|List| |Key|)) (|mk| (|None|)) (#1=#:G538 NIL) (|i| NIL)
          (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |l| NIL)
              (SEQ (LETT |i| 0) (LETT #1# (- (ASH (QVSIZE |a|) -1) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 8)) NIL)
                        ('T
                         (NULL
                          (EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 9)))))
                       (LETT |l| (CONS |mk| |l|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |l|)))) 

(SDEFUN |XHASHTBL;parts;$L;19| ((|x| $) ($ |List| |Entry|))
        (SPROG
         ((|l| (|List| |Entry|)) (#1=#:G545 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)) (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |n| (ASH (QVSIZE |a|) -1))
              (LETT |l| NIL)
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((EQ (QAREF1 |a| |i|) (QREFELT $ 8)) NIL)
                             ('T (NULL (EQ (QAREF1 |a| |i|) (QREFELT $ 9)))))
                       (LETT |l| (CONS (QAREF1 |a| (+ |n| |i|)) |l|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |l|)))) 

(SDEFUN |XHASHTBL;parts;$L;20|
        ((|x| $) ($ |List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
        (SPROG
         ((|l| (|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
          (|mk| (|None|)) (#1=#:G554 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)) (|a| (|PrimitiveArray| (|None|))))
         (SEQ (LETT |a| (QVELT |x| 5)) (LETT |n| (ASH (QVSIZE |a|) -1))
              (LETT |l| NIL)
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 8)) NIL)
                        ('T
                         (NULL
                          (EQ (LETT |mk| (QAREF1 |a| |i|)) (QREFELT $ 9)))))
                       (LETT |l|
                             (CONS (CONS |mk| (QAREF1 |a| (+ |n| |i|)))
                                   |l|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |l|)))) 

(PUT '|XHASHTBL;removeDuplicates;2$;21| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |XHASHTBL;removeDuplicates;2$;21| ((|x| $) ($ $)) |x|) 

(SDEFUN |XHASHTBL;=;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G566 NIL) (#2=#:G567 NIL) (|p| (|Integer|)) (|mk| (|None|))
          (#3=#:G568 NIL) (|i| NIL) (|h| (|Mapping| (|SingleInteger|) |Key|))
          (|yn| #4=(|NonNegativeInteger|))
          (|ya| #5=(|PrimitiveArray| (|None|))) (|xn| #4#) (|xa| #5#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT $ 28))
                       (SPADCALL |y| (QREFELT $ 28)) (QREFELT $ 49))
             NIL)
            (#6='T
             (SEQ (LETT |xa| (QVELT |x| 5)) (LETT |xn| (ASH (QVSIZE |xa|) -1))
                  (LETT |ya| (QVELT |y| 5)) (LETT |yn| (ASH (QVSIZE |ya|) -1))
                  (LETT |h| (QVELT |y| 6))
                  (SEQ (LETT |i| 0) (LETT #3# (- |xn| 1)) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((EQ (LETT |mk| (QAREF1 |xa| |i|)) (QREFELT $ 8))
                             NIL)
                            (#6#
                             (NULL
                              (EQ (LETT |mk| (QAREF1 |xa| |i|))
                                  (QREFELT $ 9)))))
                           (SEQ
                            (LETT |p| (|XHASHTBL;localSearch| |ya| |mk| |h| $))
                            (EXIT
                             (COND
                              ((< |p| 0) (PROGN (LETT #2# NIL) (GO #7=#:G565)))
                              ('T
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (QAREF1 |xa| (+ |xn| |i|))
                                             (QAREF1 |ya| (+ |yn| |p|))
                                             (QREFELT $ 50))
                                   (PROGN
                                    (LETT #1# (PROGN (LETT #2# NIL) (GO #7#)))
                                    (GO #8=#:G560)))))
                                #8# (EXIT #1#))))))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #7# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |XHashTable;|)) 

(DEFUN |XHashTable| (&REST #1=#:G622)
  (SPROG NIL
         (PROG (#2=#:G623)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XHashTable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XHashTable;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|XHashTable|)))))))))) 

(DEFUN |XHashTable;| (|#1| |#2|)
  (SPROG
   ((#1=#:G621 NIL) (#2=#:G620 NIL) (|pv$| NIL) (#3=#:G618 NIL) (#4=#:G619 NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XHashTable| DV$1 DV$2))
    (LETT $ (GETREFV 69))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|BasicType|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|CoercibleTo| (|OutputForm|))))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          (LIST '|Evalable|
                                                (LIST '|Record|
                                                      (LIST '|:| '|key|
                                                            (|devaluate| |#1|))
                                                      (LIST '|:| '|entry|
                                                            (|devaluate|
                                                             |#2|)))))
                                         #3#)
                                        (OR (|HasCategory| |#2| '(|BasicType|))
                                            #4#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|BasicType|))
                                            #3#)
                                        (OR #4# #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #4#
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #3#)
                                        (|HasCategory| |#2|
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|XHashTable| (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 16384))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| $ 32768))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|BasicType|))
         (|augmentPredVector| $ 65536))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 131072))
    (AND
     (OR #1# #4#
         (AND #2#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|BasicType|)))
         #3#)
     (|augmentPredVector| $ 262144))
    (AND (|HasCategory| |#2| '(|OrderedSet|)) #2#
         (|augmentPredVector| $ 524288))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 1048576))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 HASHTABLEVACANT)
    (QSETREFV $ 9 HASHTABLEDELETED)
    (QSETREFV $ 13
              (SPADCALL
               '(7 13 31 61 109 241 463 1021 2029 4093 8089 16363 32719 65521
                 131011 262111 524221 1048573 2097133 4193803 8388451 16777141
                 33554011 67108669 134217439 268435009 536870839 1073741719
                 2147482951 4294965841 8589934291 17179868809 34359737299
                 68719476391 137438953273 274877906629 549755813359
                 1099511626399)
               (QREFELT $ 12)))
    (COND
     ((|testBitVector| |pv$| 6)
      (QSETREFV $ 51 (CONS (|dispatchFunction| |XHASHTBL;=;2$B;22|) $))))
    $))) 

(MAKEPROP '|XHashTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'VACANT
              'DELETED (|List| 19) (|PrimitiveArray| 19) (0 . |construct|)
              '|arrayLengths| (|Integer|) (5 . |positiveRemainder|) (|Boolean|)
              (11 . =) (|PositiveInteger|) (|NonNegativeInteger|) (17 . *)
              (|Mapping| 23 6) |XHASHTBL;table;M$;6| (|SingleInteger|)
              (23 . |hash|) |XHASHTBL;empty;$;7|
              (|Record| (|:| |key| 6) (|:| |entry| 7)) |XHASHTBL;inspect;$R;8|
              |XHASHTBL;#;$Nni;9| (|Union| 7 '"failed")
              |XHASHTBL;search;Key$U;10| |XHASHTBL;elt;$KeyEntry;11|
              |XHASHTBL;elt;$Key2Entry;12| (28 . >)
              |XHASHTBL;setelt!;$Key2Entry;13| |XHASHTBL;remove!;Key$U;14|
              (|PrimitiveArray| (|None|)) (34 . |copy|) |XHASHTBL;copy;2$;15|
              |XHASHTBL;fill!;$Entry$;16| (|Mapping| 7 7)
              |XHASHTBL;map!;M2$;17| (|List| 6) |XHASHTBL;keys;$L;18|
              (|List| 7) |XHASHTBL;parts;$L;19| (|List| 26)
              |XHASHTBL;parts;$L;20| |XHASHTBL;removeDuplicates;2$;21|
              (39 . ~=) (45 . ~=) (51 . =) (|Equation| 26) (|List| 52)
              (|Mapping| 26 26 26) (|List| 56) (|Equation| 7) (|OutputForm|)
              (|HashState|) (|String|) (|InputForm|) (|Mapping| 16 7)
              (|Mapping| 16 7 7) (|Mapping| 16 26) (|Mapping| 16 26 26)
              (|Void|) (|Mapping| 26 26) (|Mapping| 7 7 7)
              (|Union| 26 '"failed"))
           '#(~= 57 |table| 63 |swap!| 77 |size?| 84 |setelt!| 90 |select!| 97
              |select| 103 |search| 109 |sample| 115 |removeDuplicates| 119
              |remove!| 124 |remove| 142 |reduce| 154 |qsetelt!| 175 |qelt| 182
              |parts| 188 |more?| 198 |minIndex| 204 |min| 209 |members| 219
              |member?| 229 |maxIndex| 241 |max| 246 |map!| 268 |map| 280
              |less?| 299 |latex| 305 |keys| 310 |key?| 315 |inspect| 321
              |insert!| 326 |indices| 332 |index?| 337 |hashUpdate!| 343 |hash|
              349 |first| 354 |find| 359 |fill!| 365 |extract!| 371 |every?|
              376 |eval| 388 |eq?| 440 |entry?| 446 |entries| 452 |empty?| 457
              |empty| 462 |elt| 466 |dictionary| 479 |count| 488 |copy| 512
              |convert| 517 |construct| 522 |coerce| 527 |any?| 532 = 544 |#|
              550)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 10 8 12 0 0 0 0 10 1 8
                                  11 13))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |Collection&|
                |IndexedAggregate&| |HomogeneousAggregate&|
                |HomogeneousAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 6 7) (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7) (|EltableAggregate| 6 7)
                 (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 60) (|InnerEvalable| 7 7) (|BasicType|)
                 (|CoercibleTo| 57))
              (|makeByteWordVec2| 68
                                  '(1 11 0 10 12 2 14 0 0 0 15 2 6 16 0 0 17 2
                                    19 0 18 0 20 1 6 23 0 24 2 14 16 0 0 33 1
                                    36 0 0 37 2 19 16 0 0 49 2 7 16 0 0 50 2 0
                                    16 0 0 51 2 19 16 0 0 1 1 0 0 21 22 1 0 0
                                    46 1 0 0 0 1 3 21 65 0 6 6 1 2 0 16 0 19 1
                                    3 0 7 0 6 7 34 2 15 0 63 0 1 2 15 0 63 0 1
                                    2 0 29 6 0 30 0 0 0 1 1 17 0 0 48 2 17 0 26
                                    0 1 2 15 0 63 0 1 2 0 29 6 0 35 2 17 0 26 0
                                    1 2 15 0 63 0 1 4 17 26 54 0 26 26 1 3 15
                                    26 54 0 26 1 2 15 26 54 0 1 3 21 7 0 6 7 1
                                    2 0 7 0 6 1 1 15 44 0 45 1 15 46 0 47 2 0
                                    16 0 19 1 1 4 6 0 1 1 16 26 0 1 1 20 7 0 1
                                    1 15 44 0 1 1 15 46 0 1 2 17 16 26 0 1 2 18
                                    16 7 0 1 1 4 6 0 1 1 16 26 0 1 1 20 7 0 1 2
                                    15 7 62 0 1 2 15 26 64 0 1 2 21 0 40 0 41 2
                                    21 0 66 0 1 3 0 0 67 0 0 1 2 0 0 40 0 1 2 0
                                    0 66 0 1 2 0 16 0 19 1 1 12 59 0 1 1 0 42 0
                                    43 2 0 16 6 0 1 1 0 26 0 27 2 0 0 26 0 1 1
                                    0 42 0 1 2 0 16 6 0 1 2 12 58 58 0 1 1 12
                                    23 0 1 1 4 7 0 1 2 0 68 63 0 1 2 21 0 0 7
                                    39 1 0 26 0 1 2 15 16 61 0 1 2 15 16 63 0 1
                                    3 10 0 0 46 46 1 2 10 0 0 52 1 3 10 0 0 26
                                    26 1 2 10 0 0 53 1 2 8 0 0 55 1 2 8 0 0 56
                                    1 3 8 0 0 44 44 1 3 8 0 0 7 7 1 2 0 16 0 0
                                    1 2 18 16 7 0 1 1 0 44 0 1 1 0 16 0 1 0 0 0
                                    25 3 0 7 0 6 7 32 2 0 7 0 6 31 1 0 0 46 1 0
                                    0 0 1 2 17 19 26 0 1 2 18 19 7 0 1 2 15 19
                                    61 0 1 2 15 19 63 0 1 1 0 0 0 38 1 1 60 0 1
                                    1 0 0 46 1 1 5 57 0 1 2 15 16 61 0 1 2 15
                                    16 63 0 1 2 19 16 0 0 51 1 15 19 0 28)))))
           '|lookupComplete|)) 
