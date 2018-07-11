
(SDEFUN |DIOSP;dioSolve;ER;1|
        ((|eq| |Equation| (|Polynomial| (|Integer|)))
         ($ |Record| (|:| |varOrder| (|List| (|Symbol|)))
          (|:| |inhom|
               (|Union| (|List| (|Vector| (|NonNegativeInteger|))) "failed"))
          (|:| |hom| (|List| (|Vector| (|NonNegativeInteger|))))))
        (SPROG
         ((|vars| (|List| (|Symbol|))) (#1=#:G413 NIL) (|x| NIL)
          (#2=#:G412 NIL) (|ihs| #3=(|List| (|Vector| (|NonNegativeInteger|))))
          (|hs| #3#) (|sol| (|Vector| (|NonNegativeInteger|)))
          (|graph|
           (|Record|
            (|:| |vn|
                 (|Vector|
                  (|Record| (|:| |vert| (|Vector| (|Integer|)))
                            (|:| |is_free| (|Boolean|)))))
            (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|))))
          (|mon| (|List| (|Polynomial| (|Integer|)))) (|c| (|Integer|))
          (#4=#:G411 NIL) (|n| (|NonNegativeInteger|))
          (|p| (|Polynomial| (|Integer|))))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL |eq| (QREFELT $ 8))
                          (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 10)))
          (LETT |n| (SPADCALL |p| (QREFELT $ 12)))
          (COND
           ((OR (EQL |n| 0) (SPADCALL |n| 1 (QREFELT $ 14)))
            (EXIT (|error| "a linear Diophantine equation is expected"))))
          (LETT |mon| NIL) (LETT |c| 0)
          (SEQ (LETT |x| NIL) (LETT #4# (SPADCALL |p| (QREFELT $ 16))) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 17))
                   (LETT |c| (SPADCALL |x| (QREFELT $ 19))))
                  ('T (LETT |mon| (CONS |x| |mon|))))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (LETT |graph| (|DIOSP;initializeGraph| |mon| |c| $))
          (LETT |sol| (SPADCALL (QVELT |graph| 1) (QREFELT $ 21)))
          (LETT |hs|
                (|DIOSP;findSolutions| |sol| (QVELT |graph| 2) 1 1 |graph| 'T
                 $))
          (LETT |ihs|
                (COND ((EQL |c| 0) (LIST |sol|))
                      (#5='T
                       (|DIOSP;findSolutions| |sol| (+ (QVELT |graph| 2) |c|) 1
                        1 |graph| NIL $))))
          (LETT |vars|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |mon|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (|SPADfirst| (SPADCALL |x| (QREFELT $ 23)))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (VECTOR |vars|
                   (COND ((NULL |ihs|) (CONS 1 "failed")) (#5# (CONS 0 |ihs|)))
                   |hs|))))) 

(SDEFUN |DIOSP;initializeGraph|
        ((|mon| |List| (|Polynomial| (|Integer|))) (|c| |Integer|)
         ($ |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| (|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|))))
        (SPROG
         ((#1=#:G426 NIL) (#2=#:G428 NIL) (|i| NIL) (#3=#:G427 NIL)
          (|n| (|Integer|)) (|m| (|Integer|)) (|k| (|NonNegativeInteger|))
          (|coeffs| (|Vector| (|Integer|))) (#4=#:G425 NIL) (|x| NIL)
          (#5=#:G424 NIL))
         (SEQ
          (LETT |coeffs|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |x| NIL) (LETT #4# |mon|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5#
                               (CONS
                                (|SPADfirst| (SPADCALL |x| (QREFELT $ 28)))
                                #5#))))
                       (LETT #4# (CDR #4#)) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 30)))
          (LETT |k| (QVSIZE |coeffs|))
          (LETT |m| (MIN |c| (SPADCALL (ELT $ 31) |coeffs| (QREFELT $ 33))))
          (LETT |n| (MAX |c| (SPADCALL (ELT $ 34) |coeffs| (QREFELT $ 33))))
          (EXIT
           (VECTOR
            (PROGN
             (LETT #3# (GETREFV (|inc_SI| (- |n| |m|))))
             (SEQ (LETT |i| |m|) (LETT #2# |n|) (LETT #1# 0) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (|DIOSP;createNode| |i| |coeffs| |k| (- 1 |m|)
                             $))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                  (GO G190) G191 (EXIT NIL))
             #3#)
            |k| (- 1 |m|)))))) 

(SDEFUN |DIOSP;createNode|
        ((|ind| |Integer|) (|coeffs| |Vector| (|Integer|))
         (|k| |NonNegativeInteger|) (|zeroNode| |Integer|)
         ($ |Record| (|:| |vert| (|Vector| (|Integer|)))
          (|:| |is_free| (|Boolean|))))
        (SPROG
         ((#1=#:G436 NIL) (#2=#:G435 NIL) (#3=#:G437 NIL) (|i| NIL)
          (|v| (|Vector| (|Integer|))))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 35)))
              (SEQ (LETT |i| 1) (LETT #3# |k|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |ind| 0 (QREFELT $ 36))
                       (SEQ
                        (EXIT
                         (COND
                          ((< (SPADCALL |coeffs| |i| (QREFELT $ 37)) 0)
                           (PROGN
                            (LETT #2#
                                  (SPADCALL |v| |i|
                                            (+ (+ |zeroNode| |ind|)
                                               (SPADCALL |coeffs| |i|
                                                         (QREFELT $ 37)))
                                            (QREFELT $ 38)))
                            (GO #4=#:G430)))))
                        #4# (EXIT #2#)))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |coeffs| |i| (QREFELT $ 37)) 0
                                     (QREFELT $ 36))
                           (PROGN
                            (LETT #1#
                                  (SPADCALL |v| |i|
                                            (+ (+ |zeroNode| |ind|)
                                               (SPADCALL |coeffs| |i|
                                                         (QREFELT $ 37)))
                                            (QREFELT $ 38)))
                            (GO #5=#:G431)))))
                        #5# (EXIT #1#))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |v| 'T))))) 

(SDEFUN |DIOSP;findSolutions|
        ((|sol| |Vector| (|NonNegativeInteger|)) (|ind| |Integer|)
         (|m| |Integer|) (|n| . #1=(|Integer|))
         (|graph| |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| #2=(|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|)))
         (|flag| |Boolean|) ($ |List| (|Vector| (|NonNegativeInteger|))))
        (SPROG
         ((|sols| (|List| (|Vector| (|NonNegativeInteger|))))
          (|s| (|List| (|Vector| (|NonNegativeInteger|))))
          (|x| (|NonNegativeInteger|)) (#3=#:G452 NIL) (|i| NIL) (|k| #1#)
          (|v| #2#)
          (|node|
           (|Record| (|:| |vert| (|Vector| (|Integer|)))
                     (|:| |is_free| (|Boolean|)))))
         (SEQ (LETT |sols| NIL)
              (LETT |node| (SPADCALL (QVELT |graph| 0) |ind| (QREFELT $ 41)))
              (EXIT
               (COND
                ((QCDR |node|)
                 (SEQ (PROGN (RPLACD |node| NIL) (QCDR |node|))
                      (LETT |v| (QCAR |node|))
                      (LETT |k|
                            (COND ((< |ind| (QVELT |graph| 2)) |m|)
                                  (#4='T |n|)))
                      (SEQ (LETT |i| |k|) (LETT #3# (QVELT |graph| 1)) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)))
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 37))
                                             0 (QREFELT $ 36))
                                   (SEQ
                                    (SPADCALL |sol| |i| (+ |x| 1)
                                              (QREFELT $ 43))
                                    (EXIT
                                     (COND
                                      ((EQL (SPADCALL |v| |i| (QREFELT $ 37))
                                            (QVELT |graph| 2))
                                       (COND
                                        ((|DIOSP;verifyMinimality| |sol|
                                          |graph| |flag| $)
                                         (SEQ
                                          (LETT |sols|
                                                (CONS
                                                 (SPADCALL |sol|
                                                           (QREFELT $ 44))
                                                 |sols|))
                                          (EXIT
                                           (SPADCALL |sol| |i| |x|
                                                     (QREFELT $ 43)))))
                                        ('T
                                         (SPADCALL |sol| |i| |x|
                                                   (QREFELT $ 43)))))
                                      ('T
                                       (SEQ
                                        (LETT |s|
                                              (COND
                                               ((< |ind| (QVELT |graph| 2))
                                                (|DIOSP;findSolutions| |sol|
                                                 (SPADCALL |v| |i|
                                                           (QREFELT $ 37))
                                                 |i| |n| |graph| |flag| $))
                                               ('T
                                                (|DIOSP;findSolutions| |sol|
                                                 (SPADCALL |v| |i|
                                                           (QREFELT $ 37))
                                                 |m| |i| |graph| |flag| $))))
                                        (LETT |sols|
                                              (SPADCALL |s| |sols|
                                                        (QREFELT $ 46)))
                                        (EXIT
                                         (SPADCALL |sol| |i| |x|
                                                   (QREFELT $ 43))))))))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (PROGN (RPLACD |node| 'T) (QCDR |node|)) (EXIT |sols|)))
                (#4# |sols|)))))) 

(SDEFUN |DIOSP;verifyMinimality|
        ((|sol| |Vector| (|NonNegativeInteger|))
         (|graph| |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| (|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|)))
         (|flag| |Boolean|) ($ |Boolean|))
        (SPROG
         ((#1=#:G455 NIL) (|x| (|NonNegativeInteger|))
          (|i| (|NonNegativeInteger|)))
         (SEQ
          (COND
           (|flag|
            (SEQ (LETT |i| 1)
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |sol| |i| (QREFELT $ 42)) 0))
                        (GO G191)))
                      (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190) G191
                      (EXIT NIL))
                 (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)))
                 (SPADCALL |sol| |i|
                           (PROG1 (LETT #1# (- |x| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 43))
                 (LETT |flag|
                       (|DIOSP;verifySolution| |sol| (QVELT |graph| 2) 1 1
                        |graph| $))
                 (SPADCALL |sol| |i| |x| (QREFELT $ 43)) (EXIT |flag|)))
           ('T
            (|DIOSP;verifySolution| |sol| (QVELT |graph| 2) 1 1 |graph| $)))))) 

(SDEFUN |DIOSP;verifySolution|
        ((|sol| |Vector| (|NonNegativeInteger|)) (|ind| |Integer|)
         (|m| |Integer|) (|n| . #1=(|Integer|))
         (|graph| |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| #2=(|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|)))
         ($ |Boolean|))
        (SPROG
         ((#3=#:G471 NIL) (|flag| (|Boolean|)) (#4=#:G461 NIL)
          (|x| (|NonNegativeInteger|)) (#5=#:G472 NIL) (|i| NIL) (|k| #1#)
          (|v| #2#)
          (|node|
           (|Record| (|:| |vert| (|Vector| (|Integer|)))
                     (|:| |is_free| (|Boolean|)))))
         (SEQ (LETT |flag| 'T)
              (LETT |node| (SPADCALL (QVELT |graph| 0) |ind| (QREFELT $ 41)))
              (LETT |v| (QCAR |node|))
              (LETT |k| (COND ((< |ind| (QVELT |graph| 2)) |m|) ('T |n|)))
              (SEQ (LETT |i| |k|) (LETT #5# (QVELT |graph| 1)) G190
                   (COND ((OR (> |i| #5#) (NULL |flag|)) (GO G191)))
                   (SEQ (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)))
                        (EXIT
                         (COND
                          ((SPADCALL |x| 0 (QREFELT $ 14))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 37)) 0
                                         (QREFELT $ 36))
                               (PROGN
                                (LETT #3#
                                      (SEQ
                                       (SPADCALL |sol| |i|
                                                 (PROG1 (LETT #4# (- |x| 1))
                                                   (|check_subtype2| (>= #4# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #4#))
                                                 (QREFELT $ 43))
                                       (EXIT
                                        (COND
                                         ((EQL
                                           (SPADCALL |v| |i| (QREFELT $ 37))
                                           (QVELT |graph| 2))
                                          (SEQ (LETT |flag| NIL)
                                               (EXIT
                                                (SPADCALL |sol| |i| |x|
                                                          (QREFELT $ 43)))))
                                         ('T
                                          (SEQ
                                           (LETT |flag|
                                                 (COND
                                                  ((< |ind| (QVELT |graph| 2))
                                                   (|DIOSP;verifySolution|
                                                    |sol|
                                                    (SPADCALL |v| |i|
                                                              (QREFELT $ 37))
                                                    |i| |n| |graph| $))
                                                  ('T
                                                   (|DIOSP;verifySolution|
                                                    |sol|
                                                    (SPADCALL |v| |i|
                                                              (QREFELT $ 37))
                                                    |m| |i| |graph| $))))
                                           (EXIT
                                            (SPADCALL |sol| |i| |x|
                                                      (QREFELT $ 43)))))))))
                                (GO #6=#:G466)))))
                            #6# (EXIT #3#))))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |flag|)))) 

(DECLAIM (NOTINLINE |DiophantineSolutionPackage;|)) 

(DEFUN |DiophantineSolutionPackage| ()
  (SPROG NIL
         (PROG (#1=#:G474)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DiophantineSolutionPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DiophantineSolutionPackage|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DiophantineSolutionPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DiophantineSolutionPackage|)))))))))) 

(DEFUN |DiophantineSolutionPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DiophantineSolutionPackage|))
          (LETT $ (GETREFV 47))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DiophantineSolutionPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DiophantineSolutionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Polynomial| 18) (|Equation| 6)
              (0 . |lhs|) (5 . |rhs|) (10 . -) (|NonNegativeInteger|)
              (16 . |totalDegree|) (|Boolean|) (21 . >) (|List| $)
              (27 . |monomials|) (32 . |ground?|) (|Integer|) (37 . |ground|)
              (|Vector| 11) (42 . |zero|) (|List| (|Symbol|))
              (47 . |variables|) (|Union| 45 '#1="failed")
              (|Record| (|:| |varOrder| 22) (|:| |inhom| 24) (|:| |hom| 45))
              |DIOSP;dioSolve;ER;1| (|List| 18) (52 . |coefficients|)
              (|Vector| 18) (57 . |vector|) (62 . |min|) (|Mapping| 18 18 18)
              (68 . |reduce|) (74 . |max|) (80 . |zero|) (85 . >) (91 . |elt|)
              (97 . |setelt!|) (|Record| (|:| |vert| 29) (|:| |is_free| 13))
              (|Vector| 39) (104 . |elt|) (110 . |elt|) (116 . |setelt!|)
              (123 . |copy|) (|List| 20) (128 . |append|))
           '#(|dioSolve| 134) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|dioSolve|
                                 ((|Record|
                                   (|:| |varOrder| (|List| (|Symbol|)))
                                   (|:| |inhom|
                                        (|Union|
                                         (|List|
                                          (|Vector| (|NonNegativeInteger|)))
                                         #1#))
                                   (|:| |hom|
                                        (|List|
                                         (|Vector| (|NonNegativeInteger|)))))
                                  (|Equation| (|Polynomial| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 46
                                            '(1 7 6 0 8 1 7 6 0 9 2 6 0 0 0 10
                                              1 6 11 0 12 2 11 13 0 0 14 1 6 15
                                              0 16 1 6 13 0 17 1 6 18 0 19 1 20
                                              0 11 21 1 6 22 0 23 1 6 27 0 28 1
                                              29 0 27 30 2 18 0 0 0 31 2 29 18
                                              32 0 33 2 18 0 0 0 34 1 29 0 11
                                              35 2 18 13 0 0 36 2 29 18 0 18 37
                                              3 29 18 0 18 18 38 2 40 39 0 18
                                              41 2 20 11 0 18 42 3 20 11 0 18
                                              11 43 1 20 0 0 44 2 45 0 0 0 46 1
                                              0 25 7 26)))))
           '|lookupComplete|)) 

(MAKEPROP '|DiophantineSolutionPackage| 'NILADIC T) 
