
(SDEFUN |POLUTIL;sturmSequence;ThePolsL;1|
        ((|p| |ThePols|) ($ |List| |ThePols|))
        (SPADCALL |p| (SPADCALL |p| (QREFELT $ 8)) (QREFELT $ 10))) 

(SDEFUN |POLUTIL;sylvesterSequence;2ThePolsL;2|
        ((|p1| |ThePols|) (|p2| |ThePols|) ($ |List| |ThePols|))
        (SPROG
         ((|res| (|List| |ThePols|)) (#1=#:G403 NIL) (|term| NIL)
          (#2=#:G402 NIL) (|#G8| (|ThePols|)) (|#G7| (|ThePols|)))
         (SEQ (LETT |res| (LIST |p1|))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |p2| (|spadConstant| $ 13) (QREFELT $ 15)))
                     (GO G191)))
                   (SEQ (LETT |res| (CONS |p2| |res|))
                        (EXIT
                         (PROGN
                          (LETT |#G7| |p2|)
                          (LETT |#G8|
                                (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 16))
                                          (QREFELT $ 17)))
                          (LETT |p1| |#G7|)
                          (LETT |p2| |#G8|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL (SPADCALL |p1| (QREFELT $ 19)) 0 (QREFELT $ 20))
                (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 21)))
                     (EXIT
                      (LETT |res|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |term| NIL) (LETT #1# |res|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |term| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |term| |p1|
                                                     (QREFELT $ 22))
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#)))))))))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |POLUTIL;boundOfCauchy;ThePolsTheField;3|
        ((|p| |ThePols|) ($ |TheField|))
        (SPROG
         ((#1=#:G406 NIL) (#2=#:G405 (|TheField|)) (#3=#:G407 (|TheField|))
          (#4=#:G412 NIL) (|t| NIL) (|l| (|List| |TheField|)) (#5=#:G411 NIL)
          (|term| NIL) (#6=#:G410 NIL) (|c| (|TheField|)))
         (SEQ
          (LETT |c| (SPADCALL (SPADCALL |p| (QREFELT $ 23)) (QREFELT $ 24)))
          (LETT |l|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |term| NIL)
                      (LETT #5# (CDR (SPADCALL |p| (QREFELT $ 26)))) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |term| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |c| |term| (QREFELT $ 27))
                                    #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (EXIT
           (COND ((NULL |l|) (|spadConstant| $ 28))
                 (#7='T
                  (SPADCALL (|spadConstant| $ 28)
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |t| NIL) (LETT #4# |l|) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |t| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #3# (SPADCALL |t| (QREFELT $ 30)))
                                     (COND
                                      (#1#
                                       (LETT #2#
                                             (SPADCALL #2# #3#
                                                       (QREFELT $ 31))))
                                      ('T
                                       (PROGN
                                        (LETT #2# #3#)
                                        (LETT #1# 'T)))))))
                                  (LETT #4# (CDR #4#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#1# #2#) (#7# (|IdentityError| '|max|))))
                            (QREFELT $ 32)))))))) 

(SDEFUN |POLUTIL;sturmVariationsOf;LNni;4|
        ((|l| |List| |TheField|) ($ |NonNegativeInteger|))
        (SPROG
         ((|ll| (|List| |TheField|)) (|ln| (|TheField|)) (#1=#:G419 NIL)
          (|term| NIL) (|l1| (|TheField|)))
         (SEQ
          (COND
           ((NULL |l|) (|error| "POLUTIL: sturmVariationsOf: empty list !"))
           (#2='T
            (SEQ (LETT |l1| (|SPADfirst| |l|)) (LETT |ll| NIL)
                 (SEQ (LETT |term| NIL) (LETT #1# (CDR |l|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |term| (QREFELT $ 34)))
                          (LETT |ll| (CONS |term| |ll|))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |ll|)
                    (|error| "POLUTIL: sturmVariationsOf: Bad sequence"))
                   (#2#
                    (SEQ (LETT |ln| (|SPADfirst| |ll|))
                         (LETT |ll| (REVERSE (CDR |ll|)))
                         (EXIT
                          (COND
                           ((SPADCALL |l1| (QREFELT $ 34))
                            (+ 1
                               (SPADCALL (CDR |ll|)
                                         (SPADCALL (|SPADfirst| |ll|)
                                                   (QREFELT $ 36))
                                         (SPADCALL |ln| (QREFELT $ 36))
                                         (QREFELT $ 37))))
                           (#2#
                            (SPADCALL |ll| (SPADCALL |l1| (QREFELT $ 36))
                                      (SPADCALL |ln| (QREFELT $ 36))
                                      (QREFELT $ 37))))))))))))))) 

(SDEFUN |POLUTIL;lazyVariations;L2INni;5|
        ((|l| |List| |TheField|) (|sl| |Integer|) (|sh| |Integer|)
         ($ |NonNegativeInteger|))
        (SPROG ((|s| (|Integer|)))
               (SEQ
                (COND
                 ((OR (ZEROP |sl|) (ZEROP |sh|))
                  (|error| "POLUTIL: lazyVariations: zero sign!"))
                 ('T
                  (COND ((NULL |l|) (COND ((EQL |sl| |sh|) 0) (#1='T 1)))
                        ((NULL (CDR |l|))
                         (COND
                          ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 34))
                           (|error| "POLUTIL: lazyVariations: zero sign!"))
                          ((EQL |sl| |sh|)
                           (COND
                            ((EQL |sl|
                                  (SPADCALL (|SPADfirst| |l|) (QREFELT $ 36)))
                             0)
                            (#1# 2)))
                          (#1# 1)))
                        (#1#
                         (SEQ
                          (LETT |s|
                                (SPADCALL (SPADCALL |l| 2 (QREFELT $ 39))
                                          (QREFELT $ 36)))
                          (EXIT
                           (+
                            (SPADCALL (LIST (|SPADfirst| |l|)) |sl| |s|
                                      (QREFELT $ 37))
                            (SPADCALL (CDR (CDR |l|)) |s| |sh|
                                      (QREFELT $ 37)))))))))))) 

(DECLAIM (NOTINLINE |RealPolynomialUtilitiesPackage;|)) 

(DEFUN |RealPolynomialUtilitiesPackage| (&REST #1=#:G428)
  (SPROG NIL
         (PROG (#2=#:G429)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RealPolynomialUtilitiesPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |RealPolynomialUtilitiesPackage;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RealPolynomialUtilitiesPackage|)))))))))) 

(DEFUN |RealPolynomialUtilitiesPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RealPolynomialUtilitiesPackage| DV$1 DV$2))
          (LETT $ (GETREFV 40))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedRing|))))))
          (|haddProp| |$ConstructorCache| '|RealPolynomialUtilitiesPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 33
                       (CONS
                        (|dispatchFunction|
                         |POLUTIL;boundOfCauchy;ThePolsTheField;3|)
                        $))
             (QSETREFV $ 38
                       (CONS
                        (|dispatchFunction| |POLUTIL;sturmVariationsOf;LNni;4|)
                        $))
             (QSETREFV $ 37
                       (CONS
                        (|dispatchFunction| |POLUTIL;lazyVariations;L2INni;5|)
                        $)))))
          $))) 

(MAKEPROP '|RealPolynomialUtilitiesPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (|List| 7)
              |POLUTIL;sylvesterSequence;2ThePolsL;2|
              |POLUTIL;sturmSequence;ThePolsL;1| (5 . |Zero|) (9 . |Zero|)
              (|Boolean|) (13 . ~=) (19 . |rem|) (25 . -)
              (|NonNegativeInteger|) (30 . |degree|) (35 . >)
              (41 . |unitCanonical|) (46 . |quo|) (52 . |leadingCoefficient|)
              (57 . |inv|) (|List| 6) (62 . |coefficients|) (67 . *)
              (73 . |One|) (77 . |One|) (81 . |abs|) (86 . |max|) (92 . +)
              (98 . |boundOfCauchy|) (103 . |zero?|) (|Integer|) (108 . |sign|)
              (113 . |lazyVariations|) (120 . |sturmVariationsOf|)
              (125 . |elt|))
           '#(|sylvesterSequence| 131 |sturmVariationsOf| 137 |sturmSequence|
              142 |lazyVariations| 147 |boundOfCauchy| 154)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|sylvesterSequence| ((|List| |#2|) |#2| |#2|))
                                T)
                              '((|sturmSequence| ((|List| |#2|) |#2|)) T)
                              '((|boundOfCauchy| (|#1| |#2|))
                                (|has| 6 (|OrderedRing|)))
                              '((|sturmVariationsOf|
                                 ((|NonNegativeInteger|) (|List| |#1|)))
                                (|has| 6 (|OrderedRing|)))
                              '((|lazyVariations|
                                 ((|NonNegativeInteger|) (|List| |#1|)
                                  (|Integer|) (|Integer|)))
                                (|has| 6 (|OrderedRing|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 39
                                            '(1 7 0 0 8 0 6 0 12 0 7 0 13 2 7
                                              14 0 0 15 2 7 0 0 0 16 1 7 0 0 17
                                              1 7 18 0 19 2 18 14 0 0 20 1 7 0
                                              0 21 2 7 0 0 0 22 1 7 6 0 23 1 6
                                              0 0 24 1 7 25 0 26 2 6 0 0 0 27 0
                                              6 0 28 0 7 0 29 1 6 0 0 30 2 6 0
                                              0 0 31 2 6 0 0 0 32 1 0 6 7 33 1
                                              6 14 0 34 1 6 35 0 36 3 0 18 25
                                              35 35 37 1 0 18 25 38 2 25 6 0 35
                                              39 2 0 9 7 7 10 1 1 18 25 38 1 0
                                              9 7 11 3 1 18 25 35 35 37 1 1 6 7
                                              33)))))
           '|lookupComplete|)) 