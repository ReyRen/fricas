
(PUT '|SREGSET;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |SREGSET;rep| ((|s| $) ($ |List| P)) |s|) 

(PUT '|SREGSET;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |SREGSET;per| ((|l| |List| P) ($ $)) |l|) 

(SDEFUN |SREGSET;copy;2$;3| ((|ts| $) ($ $))
        (|SREGSET;per| (SPADCALL (|SREGSET;rep| |ts| $) (QREFELT $ 11)) $)) 

(SDEFUN |SREGSET;empty;$;4| (($ $)) (|SREGSET;per| NIL $)) 

(SDEFUN |SREGSET;empty?;$B;5| ((|ts| $) ($ |Boolean|))
        (NULL (|SREGSET;rep| |ts| $))) 

(SDEFUN |SREGSET;parts;$L;6| ((|ts| $) ($ |List| P)) (|SREGSET;rep| |ts| $)) 

(SDEFUN |SREGSET;members;$L;7| ((|ts| $) ($ |List| P)) (|SREGSET;rep| |ts| $)) 

(SDEFUN |SREGSET;map;M2$;8| ((|f| |Mapping| P P) (|ts| $) ($ $))
        (SPADCALL (SPADCALL |f| (|SREGSET;rep| |ts| $) (QREFELT $ 19))
                  (QREFELT $ 20))) 

(SDEFUN |SREGSET;map!;M2$;9| ((|f| |Mapping| P P) (|ts| $) ($ $))
        (SPADCALL (SPADCALL |f| (|SREGSET;rep| |ts| $) (QREFELT $ 22))
                  (QREFELT $ 20))) 

(SDEFUN |SREGSET;member?;P$B;10| ((|p| P) (|ts| $) ($ |Boolean|))
        (SPADCALL |p| (|SREGSET;rep| |ts| $) (QREFELT $ 24))) 

(PUT '|SREGSET;roughUnitIdeal?;$B;11| '|SPADreplace| '(XLAM (|ts|) NIL)) 

(SDEFUN |SREGSET;roughUnitIdeal?;$B;11| ((|ts| $) ($ |Boolean|)) NIL) 

(SDEFUN |SREGSET;coerce;$Of;12| ((|ts| $) ($ |OutputForm|))
        (SPROG ((#1=#:G445 NIL) (|p| NIL) (#2=#:G444 NIL) (|lp| (|List| P)))
               (SEQ (LETT |lp| (REVERSE (|SREGSET;rep| |ts| $)))
                    (EXIT
                     (SPADCALL
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |p| (QREFELT $ 28)) #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 30)))))) 

(SDEFUN |SREGSET;mvar;$V;13| ((|ts| $) ($ V))
        (COND
         ((SPADCALL |ts| (QREFELT $ 15)) (|error| "mvar$SREGSET: #1 is empty"))
         ('T (SPADCALL (|SPADfirst| (|SREGSET;rep| |ts| $)) (QREFELT $ 32))))) 

(SDEFUN |SREGSET;first;$U;14| ((|ts| $) ($ |Union| P "failed"))
        (COND ((SPADCALL |ts| (QREFELT $ 15)) (CONS 1 "failed"))
              ('T (CONS 0 (|SPADfirst| (|SREGSET;rep| |ts| $)))))) 

(SDEFUN |SREGSET;last;$U;15| ((|ts| $) ($ |Union| P "failed"))
        (COND ((SPADCALL |ts| (QREFELT $ 15)) (CONS 1 "failed"))
              ('T (CONS 0 (SPADCALL (|SREGSET;rep| |ts| $) (QREFELT $ 36)))))) 

(SDEFUN |SREGSET;rest;$U;16| ((|ts| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL |ts| (QREFELT $ 15)) (CONS 1 "failed"))
              ('T (CONS 0 (|SREGSET;per| (CDR (|SREGSET;rep| |ts| $)) $))))) 

(SDEFUN |SREGSET;coerce;$L;17| ((|ts| $) ($ |List| P)) (|SREGSET;rep| |ts| $)) 

(SDEFUN |SREGSET;collectUpper;$V$;18| ((|ts| $) (|v| V) ($ $))
        (SPROG ((|lp| (|List| P)) (|newlp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 15)) |ts|)
                      ('T
                       (SEQ (LETT |lp| (|SREGSET;rep| |ts| $))
                            (LETT |newlp| NIL)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lp|) NIL)
                                          ('T
                                           (SPADCALL
                                            (SPADCALL (|SPADfirst| |lp|)
                                                      (QREFELT $ 32))
                                            |v| (QREFELT $ 41)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |newlp|
                                        (CONS (|SPADfirst| |lp|) |newlp|))
                                  (EXIT (LETT |lp| (CDR |lp|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (|SREGSET;per| (REVERSE |newlp|) $)))))))) 

(SDEFUN |SREGSET;collectUnder;$V$;19| ((|ts| $) (|v| V) ($ $))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 15)) |ts|)
                      ('T
                       (SEQ (LETT |lp| (|SREGSET;rep| |ts| $))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lp|) NIL)
                                          ('T
                                           (SPADCALL
                                            (SPADCALL (|SPADfirst| |lp|)
                                                      (QREFELT $ 32))
                                            |v| (QREFELT $ 43)))))
                                   (GO G191)))
                                 (SEQ (EXIT (LETT |lp| (CDR |lp|)))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT (|SREGSET;per| |lp| $)))))))) 

(SDEFUN |SREGSET;construct;L$;20| ((|lp| |List| P) ($ $))
        (SPROG ((|ts| ($)) (|eif| (|Union| $ "failed")))
               (SEQ (LETT |ts| (|SREGSET;per| NIL $))
                    (EXIT
                     (COND ((NULL |lp|) |ts|)
                           ('T
                            (SEQ
                             (LETT |lp|
                                   (SPADCALL (ELT $ 45) |lp| (QREFELT $ 47)))
                             (SEQ G190
                                  (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                                  (SEQ
                                   (LETT |eif|
                                         (SPADCALL |ts| (|SPADfirst| |lp|)
                                                   (QREFELT $ 48)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |eif| 0)
                                      (SEQ (LETT |ts| (QCDR |eif|))
                                           (EXIT (LETT |lp| (CDR |lp|)))))
                                     ('T
                                      (|error|
                                       "in construct : List P -> %  from SREGSET : bad #1")))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT |ts|)))))))) 

(SDEFUN |SREGSET;extendIfCan;$PU;21| ((|ts| $) (|p| P) ($ |Union| $ "failed"))
        (SPROG ((|lts| (|List| $)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 49)) (CONS 1 "failed"))
                      ((SPADCALL |ts| (QREFELT $ 15))
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 50))
                                        (QREFELT $ 51)))
                        (EXIT (CONS 0 (|SREGSET;per| (LIST |p|) $)))))
                      ((NULL
                        (SPADCALL (SPADCALL |ts| (QREFELT $ 33))
                                  (SPADCALL |p| (QREFELT $ 32))
                                  (QREFELT $ 52)))
                       (CONS 1 "failed"))
                      ('T
                       (COND
                        ((SPADCALL (SPADCALL |p| (QREFELT $ 53)) |ts|
                                   (QREFELT $ 54))
                         (SEQ (LETT |lts| (SPADCALL |p| |ts| (QREFELT $ 55)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |lts| (QREFELT $ 58)) 1
                                           (QREFELT $ 60))
                                 (CONS 1 "failed"))
                                (#1='T
                                 (CONS 0 (SPADCALL |lts| (QREFELT $ 61))))))))
                        (#1# (CONS 1 "failed")))))))) 

(SDEFUN |SREGSET;removeZero;P$P;22| ((|p| P) (|ts| $) ($ P))
        (SPROG
         ((|q| (P)) (#1=#:G516 NIL) (#2=#:G506 NIL) (|ts_v-| ($)) (|v| (V)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |p| (QREFELT $ 49)) (SPADCALL |ts| (QREFELT $ 15)))
             |p|)
            ('T
             (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 32)))
                  (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 44)))
                  (COND
                   ((SPADCALL |v| |ts| (QREFELT $ 62))
                    (SEQ
                     (LETT |q|
                           (SPADCALL |p|
                                     (PROG2
                                         (LETT #2#
                                               (SPADCALL |ts| |v|
                                                         (QREFELT $ 63)))
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 0)
                                                       (QREFELT $ 9)
                                                       (|Union| (QREFELT $ 9)
                                                                "failed")
                                                       #2#))
                                     (QREFELT $ 64)))
                     (EXIT
                      (COND
                       ((SPADCALL |q| (QREFELT $ 65))
                        (PROGN (LETT #1# |q|) (GO #3=#:G515)))
                       ((SPADCALL (SPADCALL |q| |ts_v-| (QREFELT $ 66))
                                  (QREFELT $ 65))
                        (PROGN (LETT #1# (|spadConstant| $ 67)) (GO #3#))))))))
                  (EXIT
                   (COND ((SPADCALL |ts_v-| (QREFELT $ 15)) |p|)
                         ('T
                          (SEQ (LETT |q| (|spadConstant| $ 67))
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (SPADCALL
                                        (SPADCALL |p| |v| (QREFELT $ 68))
                                        (QREFELT $ 70)))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |q|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |p| (QREFELT $ 53))
                                              |ts_v-| (QREFELT $ 66))
                                             (SPADCALL |p| (QREFELT $ 71))
                                             (QREFELT $ 72))
                                            |q| (QREFELT $ 73)))
                                     (EXIT
                                      (LETT |p|
                                            (SPADCALL |p| (QREFELT $ 74)))))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (SPADCALL |q|
                                          (SPADCALL |p| |ts_v-| (QREFELT $ 66))
                                          (QREFELT $ 73)))))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SREGSET;internalAugment;P2$;23| ((|p| P) (|ts| $) ($ $))
        (COND
         ((SPADCALL |p| (QREFELT $ 49))
          (|error| "in internalAugment$SREGSET: ground? #1"))
         ('T
          (SPADCALL (SPADCALL |p| |ts| NIL NIL NIL NIL NIL (QREFELT $ 75))
                    (QREFELT $ 61))))) 

(SDEFUN |SREGSET;internalAugment;L2$;24| ((|lp| |List| P) (|ts| $) ($ $))
        (COND ((NULL |lp|) |ts|)
              ('T
               (SPADCALL (CDR |lp|)
                         (SPADCALL (|SPADfirst| |lp|) |ts| (QREFELT $ 76))
                         (QREFELT $ 77))))) 

(SDEFUN |SREGSET;internalAugment;P$5BL;25|
        ((|p| P) (|ts| $) (|rem?| |Boolean|) (|red?| |Boolean|)
         (|prim?| |Boolean|) (|sqfr?| |Boolean|) (|extend?| |Boolean|)
         ($ |List| $))
        (SPROG
         ((#1=#:G536 NIL) (|us| ($)) (#2=#:G535 NIL) (|lts| (|List| $))
          (|sfp| (P)) (#3=#:G534 NIL) (|pwt| NIL)
          (|lpwt| (|List| (|Record| (|:| |val| P) (|:| |tower| $))))
          (#4=#:G533 NIL) (|f| NIL) (|lsfp| (|List| P)) (|ts_v+| ($))
          (|ts_v-| ($)) (|v| (V)))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 32)))
              (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 44)))
              (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 42)))
              (COND
               (|rem?|
                (LETT |p| (QVELT (SPADCALL |p| |ts_v-| (QREFELT $ 79)) 1))))
              (COND (|red?| (LETT |p| (SPADCALL |p| |ts_v-| (QREFELT $ 66)))))
              (COND (|prim?| (LETT |p| (SPADCALL |p| (QREFELT $ 80)))))
              (COND
               (|sqfr?|
                (SEQ (LETT |lts| NIL)
                     (LETT |lsfp| (SPADCALL |p| (QREFELT $ 82)))
                     (EXIT
                      (SEQ (LETT |f| NIL) (LETT #4# |lsfp|) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((OR (SPADCALL |f| (QREFELT $ 49))
                                   (SPADCALL (SPADCALL |f| (QREFELT $ 32)) |v|
                                             (QREFELT $ 52)))
                               "leave")
                              ('T
                               (SEQ
                                (LETT |lpwt|
                                      (SPADCALL |f| |ts_v-| (QREFELT $ 85)))
                                (EXIT
                                 (SEQ (LETT |pwt| NIL) (LETT #3# |lpwt|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |pwt| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ (LETT |sfp| (QCAR |pwt|))
                                           (LETT |us| (QCDR |pwt|))
                                           (EXIT
                                            (LETT |lts|
                                                  (SPADCALL
                                                   (|SREGSET;per|
                                                    (CONS (QCAR |pwt|)
                                                          (|SREGSET;rep|
                                                           (QCDR |pwt|) $))
                                                    $)
                                                   |lts| (QREFELT $ 86)))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT NIL))))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))))
               (#5='T
                (LETT |lts|
                      (LIST
                       (|SREGSET;per| (CONS |p| (|SREGSET;rep| |ts_v-| $))
                        $)))))
              (EXIT
               (COND
                (|extend?|
                 (SPADCALL (SPADCALL |ts_v+| (QREFELT $ 17)) |lts|
                           (QREFELT $ 87)))
                (#5#
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |us| NIL) (LETT #1# |lts|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |us| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|SREGSET;per|
                                 (SPADCALL (|SREGSET;rep| |ts_v+| $)
                                           (|SREGSET;rep| |us| $)
                                           (QREFELT $ 88))
                                 $)
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |SREGSET;augment;P$L;26| ((|p| P) (|ts| $) ($ |List| $))
        (COND
         ((SPADCALL |p| (QREFELT $ 49))
          (|error| "in augment$SREGSET: ground? #1"))
         ((SPADCALL (SPADCALL |p| (QREFELT $ 32)) |ts| (QREFELT $ 62))
          (|error| "in augment$SREGSET: bad #1"))
         ('T (SPADCALL |p| |ts| 'T 'T 'T 'T 'T (QREFELT $ 75))))) 

(SDEFUN |SREGSET;extend;P$L;27| ((|p| P) (|ts| $) ($ |List| $))
        (SPROG
         ((|lts| (|List| $)) (#1=#:G545 NIL) (|us| NIL) (|split| (|List| $))
          (|v| (V)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 49))
            (|error| "in extend$SREGSET: ground? #1"))
           ('T
            (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 32)))
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL |ts| (QREFELT $ 33))
                              (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 52)))
                   (EXIT (|error| "in extend$SREGSET: bad #1"))))
                 (LETT |split|
                       (SPADCALL (SPADCALL |p| (QREFELT $ 53)) |ts|
                                 (QREFELT $ 89)))
                 (LETT |lts| NIL)
                 (SEQ (LETT |us| NIL) (LETT #1# |split|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |us| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |lts|
                              (SPADCALL (SPADCALL |p| |us| (QREFELT $ 55))
                                        |lts| (QREFELT $ 90)))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT |lts|))))))) 

(SDEFUN |SREGSET;invertible?;P$B;28| ((|p| P) (|ts| $) ($ |Boolean|))
        (SPADCALL |p| |ts| (QREFELT $ 93))) 

(SDEFUN |SREGSET;invertible?;P$L;29|
        ((|p| P) (|ts| $)
         ($ |List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| $))))
        (SPADCALL |p| |ts| (QREFELT $ 96))) 

(SDEFUN |SREGSET;invertibleSet;P$L;30| ((|p| P) (|ts| $) ($ |List| $))
        (SPADCALL |p| |ts| (QREFELT $ 100))) 

(SDEFUN |SREGSET;lastSubResultant;2P$L;31|
        ((|p1| P) (|p2| P) (|ts| $)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| $))))
        (SPADCALL |p1| |p2| |ts| (QREFELT $ 103))) 

(SDEFUN |SREGSET;squareFreePart;P$L;32|
        ((|p| P) (|ts| $) ($ |List| (|Record| (|:| |val| P) (|:| |tower| $))))
        (SPADCALL |p| |ts| (QREFELT $ 105))) 

(SDEFUN |SREGSET;intersect;P$L;33| ((|p| P) (|ts| $) ($ |List| $))
        (SPADCALL (LIST |p|) (LIST |ts|) NIL NIL (QREFELT $ 107))) 

(SDEFUN |SREGSET;intersect;L2L;34|
        ((|lp| |List| P) (|lts| |List| $) ($ |List| $))
        (SPADCALL |lp| |lts| NIL NIL (QREFELT $ 107))) 

(SDEFUN |SREGSET;zeroSetSplit;LL;35| ((|lp| |List| P) ($ |List| $))
        (SPADCALL |lp| 'T NIL (QREFELT $ 110))) 

(SDEFUN |SREGSET;zeroSetSplit;LBL;36|
        ((|lp| |List| P) (|clos?| |Boolean|) ($ |List| $))
        (SPADCALL |lp| |clos?| NIL (QREFELT $ 110))) 

(SDEFUN |SREGSET;zeroSetSplit;L2BL;37|
        ((|lp| |List| P) (|clos?| |Boolean|) (|info?| |Boolean|) ($ |List| $))
        (SPADCALL |lp| 'T |clos?| |info?| 'T (QREFELT $ 113))) 

(SDEFUN |SREGSET;zeroSetSplit;L4BL;38|
        ((|lp| |List| P) (|hash?| |Boolean|) (|clos?| |Boolean|)
         (|info?| |Boolean|) (|prep?| |Boolean|) ($ |List| $))
        (SPROG
         ((|lts| (|List| $)) (|dom3| #1=(|String|)) (|dom2| #1#) (|dom1| #1#)
          (|#G94| #2=(|String|)) (|#G93| #2#) (|#G92| #2#)
          (|#G91| (#3="REGSETGCD: Inv Set")) (|#G90| (#4="REGSETGCD: Gcd"))
          (|#G89| (#5="QCMPACK")) (|s3| #1#) (|s2| #1#) (|s1| #1#) (|#G85| #2#)
          (|#G84| #2#) (|#G83| #2#) (|#G82| (#6="i")) (|#G81| (#7="g"))
          (|#G80| (#8="w")) (|e| #2#))
         (SEQ
          (COND
           (|hash?|
            (SEQ (LETT |e| (|make_full_CVEC| 0))
                 (COND
                  (|info?|
                   (PROGN
                    (LETT |#G80| #8#)
                    (LETT |#G81| #7#)
                    (LETT |#G82| #6#)
                    (LETT |s1| |#G80|)
                    (LETT |s2| |#G81|)
                    (LETT |s3| |#G82|)))
                  (#9='T
                   (PROGN
                    (LETT |#G83| |e|)
                    (LETT |#G84| |e|)
                    (LETT |#G85| |e|)
                    (LETT |s1| |#G83|)
                    (LETT |s2| |#G84|)
                    (LETT |s3| |#G85|))))
                 (COND
                  (|info?|
                   (PROGN
                    (LETT |#G89| #5#)
                    (LETT |#G90| #4#)
                    (LETT |#G91| #3#)
                    (LETT |dom1| |#G89|)
                    (LETT |dom2| |#G90|)
                    (LETT |dom3| |#G91|)))
                  (#9#
                   (PROGN
                    (LETT |#G92| |e|)
                    (LETT |#G93| |e|)
                    (LETT |#G94| |e|)
                    (LETT |dom1| |#G92|)
                    (LETT |dom2| |#G93|)
                    (LETT |dom3| |#G94|))))
                 (SPADCALL |s1| "W" |dom1| (QREFELT $ 117))
                 (SPADCALL |s2| "G" |dom2| (QREFELT $ 118))
                 (EXIT (SPADCALL |s3| "I" |dom3| (QREFELT $ 119))))))
          (LETT |lts| (SPADCALL |lp| |clos?| |info?| |prep?| (QREFELT $ 120)))
          (COND
           (|hash?|
            (SEQ (SPADCALL (QREFELT $ 121)) (SPADCALL (QREFELT $ 122))
                 (EXIT (SPADCALL (QREFELT $ 123))))))
          (EXIT |lts|)))) 

(SDEFUN |SREGSET;internalZeroSetSplit;L3BL;39|
        ((|lp| |List| P) (|clos?| |Boolean|) (|info?| |Boolean|)
         (|prep?| |Boolean|) ($ |List| $))
        (SPROG
         ((|lts| #1=(|List| $)) (#2=#:G580 NIL) (|p| NIL) (|ts| ($))
          (|pp| (|Record| (|:| |val| (|List| P)) (|:| |towers| #1#))))
         (SEQ
          (COND
           (|prep?|
            (SEQ (LETT |pp| (SPADCALL |lp| |clos?| |info?| (QREFELT $ 125)))
                 (LETT |lp| (QCAR |pp|)) (EXIT (LETT |lts| (QCDR |pp|)))))
           (#3='T
            (SEQ (LETT |ts| (SPADCALL NIL (QREFELT $ 20)))
                 (EXIT (LETT |lts| (LIST |ts|))))))
          (LETT |lp| (SPADCALL (ELT $ 65) |lp| (QREFELT $ 127)))
          (EXIT
           (COND ((SPADCALL (ELT $ 49) |lp| (QREFELT $ 128)) NIL)
                 ((OR (NULL |lp|) (SPADCALL |lts| (QREFELT $ 129))) |lts|)
                 ('T
                  (SEQ (LETT |lp| (SPADCALL (ELT $ 45) |lp| (QREFELT $ 47)))
                       (EXIT
                        (COND
                         (|clos?|
                          (SPADCALL |lp| |lts| |clos?| |info?|
                                    (QREFELT $ 107)))
                         (#3#
                          (SEQ
                           (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |p| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |lts|
                                        (SPADCALL (LIST |p|) |lts| |clos?|
                                                  |info?| (QREFELT $ 107)))))
                                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |lts|)))))))))))) 

(SDEFUN |SREGSET;largeSystem?| ((|lp| |List| P) ($ |Boolean|))
        (SPROG ((|lts| (|List| $)))
               (SEQ
                (COND ((SPADCALL (LENGTH |lp|) 16 (QREFELT $ 130)) 'T)
                      ((< (LENGTH |lp|) 13) NIL)
                      ('T
                       (SEQ (LETT |lts| NIL)
                            (EXIT
                             (SPADCALL
                              (- (LENGTH |lp|)
                                 (SPADCALL |lp| |lts| (QREFELT $ 131)))
                              3 (QREFELT $ 132))))))))) 

(SDEFUN |SREGSET;smallSystem?| ((|lp| |List| P) ($ |Boolean|))
        (< (LENGTH |lp|) 5)) 

(SDEFUN |SREGSET;mediumSystem?| ((|lp| |List| P) ($ |Boolean|))
        (SPROG ((|lts| (|List| $)))
               (SEQ (LETT |lts| NIL)
                    (EXIT
                     (< (- (SPADCALL |lp| |lts| (QREFELT $ 131)) (LENGTH |lp|))
                        2))))) 

(SDEFUN |SREGSET;lin?| ((|p| P) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |p| (QREFELT $ 53)) (QREFELT $ 49))
          (EQL (SPADCALL |p| (QREFELT $ 133)) 1))
         ('T NIL))) 

(SDEFUN |SREGSET;pre_process;L2BR;44|
        ((|lp| |List| P) (|clos?| |Boolean|) (|info?| |Boolean|)
         ($ |Record| (|:| |val| (|List| P)) (|:| |towers| (|List| $))))
        (SPROG
         ((#1=#:G633 NIL) (|lp2| (|List| P)) (|lts| (|List| $)) (#2=#:G646 NIL)
          (|p| NIL) (|lp3| (|List| P)) (#3=#:G645 NIL) (|lp4| (|List| P))
          (#4=#:G644 NIL) (#5=#:G643 NIL) (#6=#:G642 NIL) (#7=#:G641 NIL)
          (#8=#:G640 NIL) (#9=#:G639 NIL) (#10=#:G638 NIL) (#11=#:G637 NIL)
          (#12=#:G636 NIL) (#13=#:G635 NIL) (|lp1| (|List| P)) (#14=#:G634 NIL)
          (|ts| ($)))
         (SEQ
          (EXIT
           (SEQ (LETT |ts| (SPADCALL NIL (QREFELT $ 20)))
                (LETT |lts| (LIST |ts|))
                (EXIT
                 (COND ((NULL |lp|) (CONS |lp| |lts|))
                       (#15='T
                        (SEQ (LETT |lp1| NIL) (LETT |lp2| NIL)
                             (SEQ (LETT |p| NIL) (LETT #14# |lp|) G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN (LETT |p| (CAR #14#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |p| (QREFELT $ 74))
                                                (QREFELT $ 49))
                                      (LETT |lp1| (CONS |p| |lp1|)))
                                     ('T (LETT |lp2| (CONS |p| |lp2|))))))
                                  (LETT #14# (CDR #14#)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |lts|
                                   (SPADCALL |lp1| (LIST |ts|) |clos?| |info?|
                                             (QREFELT $ 107)))
                             (EXIT
                              (COND
                               ((SPADCALL |lp| (QREFELT $ 134))
                                (COND
                                 ((|SREGSET;largeSystem?| |lp| $)
                                  (PROGN
                                   (LETT #1# (CONS |lp2| |lts|))
                                   (GO #16=#:G632)))
                                 (#15#
                                  (SEQ
                                   (COND
                                    ((SPADCALL (LENGTH |lp|) 7 (QREFELT $ 130))
                                     (SEQ
                                      (LETT |lp2|
                                            (SPADCALL |lp2| (QREFELT $ 135)))
                                      (LETT |lp2|
                                            (SPADCALL (ELT $ 65) |lp2|
                                                      (QREFELT $ 127)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL (ELT $ 49) |lp2|
                                                   (QREFELT $ 128))
                                         (PROGN
                                          (LETT #1# (CONS |lp2| |lts|))
                                          (GO #16#)))
                                        (#15#
                                         (SEQ
                                          (LETT |lp3|
                                                (PROGN
                                                 (LETT #13# NIL)
                                                 (SEQ (LETT |p| NIL)
                                                      (LETT #12# |lp2|) G190
                                                      (COND
                                                       ((OR (ATOM #12#)
                                                            (PROGN
                                                             (LETT |p|
                                                                   (CAR #12#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((|SREGSET;lin?| |p|
                                                           $)
                                                          (LETT #13#
                                                                (CONS |p|
                                                                      #13#))))))
                                                      (LETT #12# (CDR #12#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #13#)))))
                                          (LETT |lp4|
                                                (PROGN
                                                 (LETT #11# NIL)
                                                 (SEQ (LETT |p| NIL)
                                                      (LETT #10# |lp2|) G190
                                                      (COND
                                                       ((OR (ATOM #10#)
                                                            (PROGN
                                                             (LETT |p|
                                                                   (CAR #10#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((NULL
                                                           (|SREGSET;lin?| |p|
                                                            $))
                                                          (LETT #11#
                                                                (CONS |p|
                                                                      #11#))))))
                                                      (LETT #10# (CDR #10#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #11#)))))
                                          (COND
                                           (|clos?|
                                            (LETT |lts|
                                                  (SPADCALL |lp4| |lts| |clos?|
                                                            |info?|
                                                            (QREFELT $ 107))))
                                           (#15#
                                            (SEQ
                                             (LETT |lp4|
                                                   (SPADCALL (ELT $ 45) |lp4|
                                                             (QREFELT $ 47)))
                                             (EXIT
                                              (SEQ (LETT |p| NIL)
                                                   (LETT #9# |lp4|) G190
                                                   (COND
                                                    ((OR (ATOM #9#)
                                                         (PROGN
                                                          (LETT |p| (CAR #9#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |lts|
                                                           (SPADCALL (LIST |p|)
                                                                     |lts|
                                                                     |clos?|
                                                                     |info?|
                                                                     (QREFELT $
                                                                              107)))))
                                                   (LETT #9# (CDR #9#))
                                                   (GO G190) G191
                                                   (EXIT NIL))))))
                                          (EXIT (LETT |lp2| |lp3|))))))))
                                    (#15#
                                     (SEQ
                                      (LETT |lp2|
                                            (SPADCALL |lp2| (QREFELT $ 135)))
                                      (LETT |lp2|
                                            (SPADCALL (ELT $ 65) |lp2|
                                                      (QREFELT $ 127)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL (ELT $ 49) |lp2|
                                                   (QREFELT $ 128))
                                         (PROGN
                                          (LETT #1# (CONS |lp2| |lts|))
                                          (GO #16#))))))))
                                   (COND
                                    (|clos?|
                                     (LETT |lts|
                                           (SPADCALL |lp2| |lts| |clos?|
                                                     |info?| (QREFELT $ 107))))
                                    (#15#
                                     (SEQ
                                      (LETT |lp2|
                                            (SPADCALL (ELT $ 45) |lp2|
                                                      (QREFELT $ 47)))
                                      (EXIT
                                       (SEQ (LETT |p| NIL) (LETT #8# |lp2|)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |p| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |lts|
                                                    (SPADCALL (LIST |p|) |lts|
                                                              |clos?| |info?|
                                                              (QREFELT $
                                                                       107)))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT NIL))))))
                                   (LETT |lp2| NIL)
                                   (EXIT
                                    (PROGN
                                     (LETT #1# (CONS |lp2| |lts|))
                                     (GO #16#)))))))
                               ((|SREGSET;smallSystem?| |lp| $)
                                (CONS |lp2| |lts|))
                               ((|SREGSET;mediumSystem?| |lp| $)
                                (CONS (SPADCALL |lp2| (QREFELT $ 135)) |lts|))
                               (#15#
                                (SEQ
                                 (LETT |lp3|
                                       (PROGN
                                        (LETT #7# NIL)
                                        (SEQ (LETT |p| NIL) (LETT #6# |lp2|)
                                             G190
                                             (COND
                                              ((OR (ATOM #6#)
                                                   (PROGN
                                                    (LETT |p| (CAR #6#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((|SREGSET;lin?| |p| $)
                                                 (LETT #7# (CONS |p| #7#))))))
                                             (LETT #6# (CDR #6#)) (GO G190)
                                             G191 (EXIT (NREVERSE #7#)))))
                                 (LETT |lp4|
                                       (PROGN
                                        (LETT #5# NIL)
                                        (SEQ (LETT |p| NIL) (LETT #4# |lp2|)
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |p| (CAR #4#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((NULL (|SREGSET;lin?| |p| $))
                                                 (LETT #5# (CONS |p| #5#))))))
                                             (LETT #4# (CDR #4#)) (GO G190)
                                             G191 (EXIT (NREVERSE #5#)))))
                                 (COND
                                  (|clos?|
                                   (LETT |lts|
                                         (SPADCALL |lp4| |lts| |clos?| |info?|
                                                   (QREFELT $ 107))))
                                  (#15#
                                   (SEQ
                                    (LETT |lp4|
                                          (SPADCALL (ELT $ 45) |lp4|
                                                    (QREFELT $ 47)))
                                    (EXIT
                                     (SEQ (LETT |p| NIL) (LETT #3# |lp4|) G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |p| (CAR #3#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |lts|
                                                  (SPADCALL (LIST |p|) |lts|
                                                            |clos?| |info?|
                                                            (QREFELT $ 107)))))
                                          (LETT #3# (CDR #3#)) (GO G190) G191
                                          (EXIT NIL))))))
                                 (COND
                                  (|clos?|
                                   (LETT |lts|
                                         (SPADCALL |lp3| |lts| |clos?| |info?|
                                                   (QREFELT $ 107))))
                                  (#15#
                                   (SEQ
                                    (LETT |lp3|
                                          (SPADCALL (ELT $ 45) |lp3|
                                                    (QREFELT $ 47)))
                                    (EXIT
                                     (SEQ (LETT |p| NIL) (LETT #2# |lp3|) G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |p| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |lts|
                                                  (SPADCALL (LIST |p|) |lts|
                                                            |clos?| |info?|
                                                            (QREFELT $ 107)))))
                                          (LETT #2# (CDR #2#)) (GO G190) G191
                                          (EXIT NIL))))))
                                 (LETT |lp2| NIL)
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (CONS |lp2| |lts|))
                                   (GO #16#)))))))))))))
          #16# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |SquareFreeRegularTriangularSet;|)) 

(DEFUN |SquareFreeRegularTriangularSet| (&REST #1=#:G665)
  (SPROG NIL
         (PROG (#2=#:G666)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SquareFreeRegularTriangularSet|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SquareFreeRegularTriangularSet;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SquareFreeRegularTriangularSet|)))))))))) 

(DEFUN |SquareFreeRegularTriangularSet;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G664 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|SquareFreeRegularTriangularSet| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 153))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#4|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#4|)))
                                         (|HasCategory| |#4| '(|SetCategory|)))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#4| '(|BasicType|))
                                        (|HasCategory| |#4| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#3| '(|Finite|))))))
    (|haddProp| |$ConstructorCache| '|SquareFreeRegularTriangularSet|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 128))
    (AND (|HasCategory| |#4| '(|BasicType|)) #1# (|augmentPredVector| $ 256))
    (AND (|HasCategory| |#4| '(|OrderedSet|)) #1# (|augmentPredVector| $ 512))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|SquareFreeRegularTriangularSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 9) (0 . |copy|)
              |SREGSET;copy;2$;3| |SREGSET;empty;$;4| (|Boolean|)
              |SREGSET;empty?;$B;5| |SREGSET;parts;$L;6| |SREGSET;members;$L;7|
              (|Mapping| 9 9) (5 . |map|) |SREGSET;construct;L$;20|
              |SREGSET;map;M2$;8| (11 . |map!|) |SREGSET;map!;M2$;9|
              (17 . |member?|) |SREGSET;member?;P$B;10|
              |SREGSET;roughUnitIdeal?;$B;11| (|OutputForm|) (23 . |coerce|)
              (|List| $) (28 . |brace|) |SREGSET;coerce;$Of;12| (33 . |mvar|)
              |SREGSET;mvar;$V;13| (|Union| 9 '#1="failed")
              |SREGSET;first;$U;14| (38 . |last|) |SREGSET;last;$U;15|
              (|Union| $ '#1#) |SREGSET;rest;$U;16| |SREGSET;coerce;$L;17|
              (43 . >) |SREGSET;collectUpper;$V$;18| (49 . >=)
              |SREGSET;collectUnder;$V$;19| (55 . |infRittWu?|)
              (|Mapping| 14 9 9) (61 . |sort|) |SREGSET;extendIfCan;$PU;21|
              (67 . |ground?|) (72 . |primitivePart|) (77 . |squareFreePart|)
              (82 . <) (88 . |init|) |SREGSET;invertible?;P$B;28|
              |SREGSET;augment;P$L;26| (|NonNegativeInteger|) (|List| $$)
              (93 . |#|) (98 . |One|) (102 . ~=) (108 . |first|)
              (113 . |algebraic?|) (119 . |select|) (125 . |lazyPrem|)
              (131 . |zero?|) |SREGSET;removeZero;P$P;22| (136 . |Zero|)
              (140 . |degree|) (|Integer|) (146 . |positive?|)
              (151 . |mainMonomial|) (156 . *) (162 . +) (168 . |tail|)
              |SREGSET;internalAugment;P$5BL;25|
              |SREGSET;internalAugment;P2$;23| |SREGSET;internalAugment;L2$;24|
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (173 . |remainder|) (179 . |mainPrimitivePart|)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (184 . |squareFreeFactors|)
              (|Record| (|:| |val| 9) (|:| |tower| $)) (|List| 83)
              |SREGSET;squareFreePart;P$L;32| (189 . |cons|) (195 . |extend|)
              (201 . |concat|) |SREGSET;invertibleSet;P$L;30| (207 . |concat|)
              |SREGSET;extend;P$L;27|
              (|SquareFreeRegularTriangularSetGcdPackage| 6 7 8 9 $$)
              (213 . |stoseInvertible?|)
              (|Record| (|:| |val| 14) (|:| |tower| $$)) (|List| 94)
              (219 . |stoseInvertible?_sqfreg|)
              (|Record| (|:| |val| 14) (|:| |tower| $)) (|List| 97)
              |SREGSET;invertible?;P$L;29| (225 . |stoseInvertibleSet_sqfreg|)
              (|Record| (|:| |val| 9) (|:| |tower| $$)) (|List| 101)
              (231 . |stoseLastSubResultant|)
              |SREGSET;lastSubResultant;2P$L;31| (238 . |stoseSquareFreePart|)
              (|SquareFreeRegularSetDecompositionPackage| 6 7 8 9 $$)
              (244 . |decompose|) |SREGSET;intersect;P$L;33|
              |SREGSET;intersect;L2L;34| |SREGSET;zeroSetSplit;L2BL;37|
              |SREGSET;zeroSetSplit;LL;35| |SREGSET;zeroSetSplit;LBL;36|
              |SREGSET;zeroSetSplit;L4BL;38| (|Void|) (|String|)
              (|SquareFreeQuasiComponentPackage| 6 7 8 9 $$)
              (252 . |startTable!|) (259 . |startTableGcd!|)
              (266 . |startTableInvSet!|)
              |SREGSET;internalZeroSetSplit;L3BL;39| (273 . |stopTable!|)
              (277 . |stopTableGcd!|) (281 . |stopTableInvSet!|)
              (|Record| (|:| |val| 10) (|:| |towers| 29))
              |SREGSET;pre_process;L2BR;44| (|Mapping| 14 9) (285 . |remove|)
              (291 . |any?|) (297 . |empty?|) (302 . >)
              (308 . |numberOfVariables|) (314 . >) (320 . |mdeg|)
              (325 . |probablyZeroDim?|) (330 . |crushedSet|) (|Mapping| 9 9 9)
              (|List| 138) (|Equation| 9) (|InputForm|)
              (|Record| (|:| |num| 9) (|:| |den| 6)) (|Union| 9 29)
              (|Union| 14 29) (|List| 8)
              (|Record| (|:| |close| $) (|:| |open| 10)) (|List| 144)
              (|Mapping| 14 9 10) (|Record| (|:| |close| 10) (|:| |open| 10))
              (|Record| (|:| |bas| $) (|:| |top| 10)) (|Union| 148 '#1#)
              (|Record| (|:| |under| $) (|:| |floor| $) (|:| |upper| $))
              (|SingleInteger|) (|HashState|))
           '#(~= 335 |zeroSetSplitIntoTriangularSystems| 341 |zeroSetSplit| 346
              |variables| 373 |trivialIdeal?| 378 |triangular?| 383
              |stronglyReduced?| 388 |stronglyReduce| 399 |squareFreePart| 405
              |sort| 411 |size?| 417 |select| 423 |sample| 435
              |roughUnitIdeal?| 439 |roughSubIdeal?| 444 |roughEqualIdeals?|
              450 |roughBase?| 456 |rewriteSetWithReduction| 461
              |rewriteIdealWithRemainder| 469 |rewriteIdealWithHeadRemainder|
              475 |retractIfCan| 481 |retract| 486 |rest| 491 |removeZero| 496
              |removeDuplicates| 502 |remove| 507 |remainder| 519 |reduced?|
              525 |reduceByQuasiMonic| 532 |reduce| 538 |quasiComponent| 567
              |purelyTranscendental?| 572 |purelyAlgebraicLeadingMonomial?| 578
              |purelyAlgebraic?| 584 |pre_process| 595 |parts| 602
              |normalized?| 607 |mvar| 618 |more?| 623 |min| 629 |members| 634
              |member?| 639 |max| 645 |map!| 656 |map| 662 |mainVariables| 668
              |mainVariable?| 673 |less?| 679 |latex| 685
              |lastSubResultantElseSplit| 690 |lastSubResultant| 697 |last| 704
              |invertibleSet| 709 |invertibleElseSplit?| 715 |invertible?| 721
              |intersect| 733 |internalZeroSetSplit| 757 |internalAugment| 765
              |initials| 788 |initiallyReduced?| 793 |initiallyReduce| 804
              |infRittWu?| 810 |iexactQuo| 816 |headRemainder| 822
              |headReduced?| 828 |headReduce| 839 |hashUpdate!| 845 |hash| 851
              |first| 856 |find| 861 |extendIfCan| 867 |extend| 873 |every?|
              903 |eval| 909 |eq?| 935 |empty?| 941 |empty| 946 |degree| 950
              |count| 955 |copy| 967 |convert| 972 |construct| 977
              |collectUpper| 982 |collectUnder| 988 |collectQuasiMonic| 994
              |collect| 999 |coerce| 1005 |coHeight| 1015 |basicSet| 1020
              |autoReduced?| 1033 |augment| 1039 |any?| 1063
              |algebraicVariables| 1069 |algebraicCoefficients?| 1074
              |algebraic?| 1080 = 1086 |#| 1092)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(NIL |RegularTriangularSetCategory&|
                     |TriangularSetCategory&| |PolynomialSetCategory&|
                     |Collection&| |HomogeneousAggregate&| |SetCategory&|
                     |Aggregate&| |Evalable&| |BasicType&| NIL NIL
                     |RetractableFrom&| NIL NIL NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|SquareFreeRegularTriangularSetCategory| 6 7 8 9)
                      (|RegularTriangularSetCategory| 6 7 8 9)
                      (|TriangularSetCategory| 6 7 8 9)
                      (|PolynomialSetCategory| 6 7 8 9) (|Collection| 9)
                      (|HomogeneousAggregate| 9) (|SetCategory|) (|Aggregate|)
                      (|Evalable| 9) (|BasicType|) (|shallowlyMutable|)
                      (|finiteAggregate|) (|RetractableFrom| (|List| 9))
                      (|CoercibleTo| (|List| 9)) (|Type|) (|CoercibleTo| 27)
                      (|InnerEvalable| 9 9) (|ConvertibleTo| 139))
                   (|makeByteWordVec2| 152
                                       '(1 10 0 0 11 2 10 0 18 0 19 2 10 0 18 0
                                         22 2 10 14 9 0 24 1 9 27 0 28 1 27 0
                                         29 30 1 9 8 0 32 1 10 9 0 36 2 8 14 0
                                         0 41 2 8 14 0 0 43 2 9 14 0 0 45 2 10
                                         0 46 0 47 1 9 14 0 49 1 9 0 0 50 1 9 0
                                         0 51 2 8 14 0 0 52 1 9 0 0 53 1 57 56
                                         0 58 0 6 0 59 2 56 14 0 0 60 1 57 2 0
                                         61 2 0 14 8 0 62 2 0 34 0 8 63 2 9 0 0
                                         0 64 1 9 14 0 65 0 9 0 67 2 9 56 0 8
                                         68 1 69 14 0 70 1 9 0 0 71 2 9 0 0 0
                                         72 2 9 0 0 0 73 1 9 0 0 74 2 0 78 9 0
                                         79 1 9 0 0 80 1 81 10 9 82 2 57 0 2 0
                                         86 2 0 29 10 29 87 2 10 0 0 0 88 2 57
                                         0 0 0 90 2 92 14 9 2 93 2 92 95 9 2 96
                                         2 92 57 9 2 100 3 92 102 9 9 2 103 2
                                         92 102 9 2 105 4 106 57 10 57 14 14
                                         107 3 116 114 115 115 115 117 3 92 114
                                         115 115 115 118 3 92 114 115 115 115
                                         119 0 116 114 121 0 92 114 122 0 92
                                         114 123 2 10 0 126 0 127 2 10 14 126 0
                                         128 1 57 14 0 129 2 56 14 0 0 130 2
                                         106 56 10 57 131 2 69 14 0 0 132 1 9
                                         56 0 133 1 81 14 10 134 1 81 10 10 135
                                         2 0 14 0 0 1 1 0 145 10 1 3 0 29 10 14
                                         14 110 5 0 29 10 14 14 14 14 113 2 0
                                         29 10 14 112 1 0 29 10 111 1 0 143 0 1
                                         1 0 14 0 1 1 5 14 0 1 1 0 14 0 1 2 0
                                         14 9 0 1 2 0 9 9 0 1 2 0 84 9 0 85 2 0
                                         150 0 8 1 2 0 14 0 56 1 2 8 0 126 0 1
                                         2 0 34 0 8 63 0 0 0 1 1 5 14 0 26 2 5
                                         14 0 0 1 2 5 14 0 0 1 1 5 14 0 1 4 0
                                         10 10 0 136 46 1 2 5 10 10 0 1 2 5 10
                                         10 0 1 1 0 38 10 1 1 0 0 10 1 1 0 38 0
                                         39 2 0 9 9 0 66 1 9 0 0 1 2 9 0 9 0 1
                                         2 8 0 126 0 1 2 5 78 9 0 79 3 0 14 9 0
                                         46 1 2 0 9 9 0 1 4 9 9 136 0 9 9 1 2 8
                                         9 136 0 1 3 8 9 136 0 9 1 4 0 9 9 0
                                         136 46 1 1 0 147 0 1 2 0 14 9 0 1 2 0
                                         14 9 0 1 1 0 14 0 1 2 0 14 9 0 1 3 0
                                         124 10 14 14 125 1 8 10 0 16 1 0 14 0
                                         1 2 0 14 9 0 1 1 0 8 0 33 2 0 14 0 56
                                         1 1 10 9 0 1 1 8 10 0 17 2 9 14 9 0 25
                                         1 10 9 0 1 2 8 9 46 0 1 2 7 0 18 0 23
                                         2 0 0 18 0 21 1 0 143 0 1 2 0 14 8 0 1
                                         2 0 14 0 56 1 1 0 115 0 1 3 0 141 9 9
                                         0 1 3 0 84 9 9 0 104 1 0 34 0 37 2 0
                                         29 9 0 89 2 0 142 9 0 1 2 0 98 9 0 99
                                         2 0 14 9 0 54 2 0 29 10 29 109 2 0 29
                                         9 29 1 2 0 29 9 0 108 2 0 29 10 0 1 4
                                         0 29 10 14 14 14 120 7 0 29 9 0 14 14
                                         14 14 14 75 2 0 0 9 0 76 2 0 0 10 0 77
                                         1 0 10 0 1 1 0 14 0 1 2 0 14 9 0 1 2 0
                                         9 9 0 1 2 0 14 0 0 1 2 5 6 6 6 1 2 5
                                         140 9 0 1 1 0 14 0 1 2 0 14 9 0 1 2 0
                                         9 9 0 1 2 0 152 152 0 1 1 0 151 0 1 1
                                         0 34 0 35 2 0 34 126 0 1 2 0 38 0 9 48
                                         2 0 29 10 0 1 2 0 29 10 29 87 2 0 29 9
                                         0 91 2 0 29 9 29 1 2 0 0 0 9 1 2 8 14
                                         126 0 1 2 1 0 0 137 1 3 1 0 0 9 9 1 2
                                         1 0 0 138 1 3 1 0 0 10 10 1 2 0 14 0 0
                                         1 1 0 14 0 15 0 0 0 13 1 0 56 0 1 2 9
                                         56 9 0 1 2 8 56 126 0 1 1 0 0 0 12 1 2
                                         139 0 1 1 0 0 10 20 2 0 0 0 8 42 2 0 0
                                         0 8 44 1 0 0 0 1 2 0 0 0 8 1 1 0 10 0
                                         40 1 0 27 0 31 1 6 56 0 1 3 0 149 10
                                         126 46 1 2 0 149 10 46 1 2 0 14 0 146
                                         1 2 0 29 10 0 1 2 0 29 10 29 1 2 0 29
                                         9 0 55 2 0 29 9 29 1 2 8 14 126 0 1 1
                                         0 143 0 1 2 0 14 9 0 1 2 0 14 8 0 62 2
                                         0 14 0 0 1 1 8 56 0 1)))))
           '|lookupComplete|)) 
