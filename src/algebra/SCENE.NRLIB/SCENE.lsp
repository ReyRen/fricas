
(SDEFUN |SCENE;createSceneRoot;Sb$;1| ((|bb| |SBoundary| PT) ($ $))
        (VECTOR 'ROOT NIL (CONS 3 |bb|))) 

(SDEFUN |SCENE;createSceneRoot;R$;2|
        ((|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 9))) 

(SDEFUN |SCENE;createSceneRoot;4I$;3|
        ((|minx| |Integer|) (|miny| |Integer|) (|maxx| |Integer|)
         (|maxy| |Integer|) ($ $))
        (SPROG ((|bb| (|SBoundary| PT)))
               (SEQ
                (LETT |bb|
                      (SPADCALL (SPADCALL |minx| |miny| (QREFELT $ 14))
                                (SPADCALL |maxx| |maxy| (QREFELT $ 14))
                                (QREFELT $ 10)))
                (EXIT (VECTOR 'ROOT NIL (CONS 3 |bb|)))))) 

(SDEFUN |SCENE;createSceneRoot;$;4| (($ $))
        (VECTOR 'ROOT NIL (CONS 3 (SPADCALL (QREFELT $ 16))))) 

(SDEFUN |SCENE;createSceneGroup;$;5| (($ $))
        (VECTOR 'GROUP NIL (CONS 11 "empty"))) 

(SDEFUN |SCENE;addSceneGroup;2$;6| ((|n| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL (QREFELT $ 18)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLine;L$;7| ((|line| |List| PT) ($ $))
        (VECTOR 'LINE NIL (CONS 0 (LIST |line|)))) 

(SDEFUN |SCENE;addSceneLine;$L$;8| ((|n| $) (|line| |List| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |line| (QREFELT $ 23)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLine;2$Df$;9|
        ((|st| $) (|en| $) (|fontScale| |DoubleFloat|) ($ $))
        (SPADCALL |st| |en| |fontScale| 'T (QREFELT $ 27))) 

(SDEFUN |SCENE;addSceneLine;3$Df$;10|
        ((|n| $) (|st| $) (|en| $) (|fontScale| |DoubleFloat|) ($ $))
        (SPADCALL |n| |st| |en| |fontScale| 'T (QREFELT $ 29))) 

(SDEFUN |SCENE;createSceneLine;2$DfB$;11|
        ((|st| $) (|en| $) (|fontScale| |DoubleFloat|)
         (|shortenLine| |Boolean|) ($ $))
        (SPROG
         ((|enPoint| (PT)) (|stPoint| (PT)) (|enBoundary| #1=(|SBoundary| PT))
          (|stBoundary| #1#))
         (SEQ (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT $ 31)))
              (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT $ 31)))
              (LETT |stPoint| (SPADCALL |stBoundary| (QREFELT $ 32)))
              (LETT |enPoint| (SPADCALL |enBoundary| (QREFELT $ 32)))
              (COND
               (|shortenLine|
                (SEQ
                 (LETT |stPoint|
                       (SPADCALL |enBoundary| |stPoint| (QREFELT $ 33)))
                 (EXIT
                  (LETT |enPoint|
                        (SPADCALL |stBoundary| |enPoint| (QREFELT $ 33)))))))
              (EXIT
               (VECTOR 'LINE NIL (CONS 0 (LIST (LIST |stPoint| |enPoint|)))))))) 

(SDEFUN |SCENE;addSceneLine;3$DfB$;12|
        ((|n| $) (|st| $) (|en| $) (|fontScale| |DoubleFloat|)
         (|shortenLine| |Boolean|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |fontScale| |shortenLine|
                                (QREFELT $ 27)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneLines;L$;13| ((|lines| |List| (|List| PT)) ($ $))
        (VECTOR 'LINE NIL (CONS 0 |lines|))) 

(SDEFUN |SCENE;addSceneLines;$L$;14|
        ((|n| $) (|lines| |List| (|List| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |lines| (QREFELT $ 35)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneShape;R$;15|
        ((|shape| |Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
          (|:| |size| PT) (|:| |fill| (|Boolean|)))
         ($ $))
        (VECTOR 'SHAPE NIL (CONS 8 |shape|))) 

(SDEFUN |SCENE;addSceneShape;$R$;16|
        ((|n| $)
         (|shape| |Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
          (|:| |size| PT) (|:| |fill| (|Boolean|)))
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |shape| (QREFELT $ 38)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneShape;Sb$;17| ((|shape| |SBoundary| PT) ($ $))
        (SPROG
         ((|sh|
           (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| PT)
                     (|:| |size| PT) (|:| |fill| (|Boolean|))))
          (|mn| (PT)) (|mx| (PT)))
         (SEQ (LETT |mx| (SPADCALL |shape| (QREFELT $ 40)))
              (LETT |mn| (SPADCALL |shape| (QREFELT $ 41)))
              (LETT |sh|
                    (VECTOR '|rect| |mn| (SPADCALL |mx| |mn| (QREFELT $ 42))
                            NIL))
              (EXIT (VECTOR 'SHAPE NIL (CONS 8 |sh|)))))) 

(SDEFUN |SCENE;addSceneShape;$Sb$;18| ((|n| $) (|shape| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |shape| (QREFELT $ 43)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneDef;S2$;19| ((|nam| |String|) (|nde| $) ($ $))
        (SPROG ((|nn| (|Record| (|:| |nme| (|String|)) (|:| |node| $))))
               (SEQ (LETT |nn| (CONS |nam| |nde|))
                    (EXIT (VECTOR 'DEF NIL (CONS 9 |nn|)))))) 

(SDEFUN |SCENE;addSceneDef;$S2$;20| ((|n| $) (|nam| |String|) (|nde| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |nam| |nde| (QREFELT $ 46)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneUse;S$;21| ((|nam| |String|) ($ $))
        (SPROG ((|nn| (|Record| (|:| |nme| (|String|)) (|:| |node| $))))
               (SEQ
                (LETT |nn| (CONS |nam| (VECTOR 'GROUP NIL (CONS 11 "empty"))))
                (EXIT (VECTOR 'USE NIL (CONS 9 |nn|)))))) 

(SDEFUN |SCENE;addSceneUse;$S$;22| ((|n| $) (|nam| |String|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |nam| (QREFELT $ 48)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrows;LSDf$;23|
        ((|lines| |List| (|List| PT)) (|mode| |Symbol|) (|size| |DoubleFloat|)
         ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |ln| (|List| (|List| PT))) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|)))))
         (SEQ (LETT |ar| (VECTOR |lines| |mode| |size|))
              (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrows;$LSDf$;24|
        ((|n| $) (|lines| |List| (|List| PT)) (|mode| |Symbol|)
         (|size| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |lines| |mode| |size| (QREFELT $ 51)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrow;2SPTSDf$;25|
        ((|st| |String|) (|en| |String|) (|offset| PT) (|mode| |Symbol|)
         (|size| |DoubleFloat|) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |st| (|String|)) (|:| |en| (|String|))
                     (|:| |offset| PT) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|)))))
         (SEQ (LETT |ar| (VECTOR |st| |en| |offset| |mode| |size|))
              (EXIT (VECTOR 'ARROW NIL (CONS 7 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrow;$2SPTSDf$;26|
        ((|n| $) (|st| |String|) (|en| |String|) (|offset| PT)
         (|mode| |Symbol|) (|size| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |offset| |mode| |size|
                                (QREFELT $ 53)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneArrow;2$PTS2Df$;27|
        ((|st| $) (|en| $) (|offset| PT) (|mode| |Symbol|)
         (|size| |DoubleFloat|) (|fontScale| |DoubleFloat|) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |ln| (|List| (|List| PT))) (|:| |mode| (|Symbol|))
                     (|:| |size| (|DoubleFloat|))))
          (|enPoint| (PT)) (|stPoint| (PT)) (|enBoundary| #1=(|SBoundary| PT))
          (|stBoundary| #1#))
         (SEQ (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT $ 31)))
              (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT $ 31)))
              (LETT |stPoint|
                    (SPADCALL |stBoundary|
                              (SPADCALL |enBoundary| (QREFELT $ 32))
                              (QREFELT $ 33)))
              (LETT |enPoint|
                    (SPADCALL |enBoundary|
                              (SPADCALL |stBoundary| (QREFELT $ 32))
                              (QREFELT $ 33)))
              (LETT |ar|
                    (VECTOR (LIST (LIST |stPoint| |enPoint|)) |mode| |size|))
              (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|)))))) 

(SDEFUN |SCENE;addSceneArrow;3$PTS2Df$;28|
        ((|n| $) (|st| $) (|en| $) (|offset| PT) (|mode| |Symbol|)
         (|size| |DoubleFloat|) (|fontScale| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |st| |en| |offset| |mode| |size| |fontScale|
                                (QREFELT $ 55)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneNamedPoints;Snp$;29|
        ((|np| |SceneNamedPoints| PT) ($ $))
        (VECTOR 'NAMEDPOINTS NIL (CONS 10 |np|))) 

(SDEFUN |SCENE;addSceneNamedPoints;$Snp$;30|
        ((|n| $) (|np| |SceneNamedPoints| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |np| (QREFELT $ 58)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneIFS;LL$;31|
        ((|inx1| |List| (|List| (|NonNegativeInteger|))) (|pts1| |List| PT)
         ($ $))
        (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))) 

(SDEFUN |SCENE;addSceneIFS;$LL$;32|
        ((|n| $) (|inx1| |List| (|List| (|NonNegativeInteger|)))
         (|pts1| |List| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |inx1| |pts1| (QREFELT $ 61)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneIFS;Sifs$;33| ((|in1| |SceneIFS| PT) ($ $))
        (SPROG
         ((|pts1| (|List| PT))
          (|inx1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ (LETT |inx1| (SPADCALL |in1| (QREFELT $ 64)))
              (LETT |pts1| (SPADCALL |in1| (QREFELT $ 65)))
              (EXIT (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|))))))) 

(SDEFUN |SCENE;addSceneIFS;$Sifs$;34| ((|n| $) (|in1| |SceneIFS| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |in1| (QREFELT $ 66)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneBox;Df$;35| ((|size| |DoubleFloat|) ($ $))
        (SPROG
         ((|inx| (|List| (|List| (|NonNegativeInteger|)))) (|pts| (|List| PT)))
         (SEQ
          (LETT |pts|
                (LIST
                 (SPADCALL |size| (|minus_DF| |size|) |size| (QREFELT $ 68))
                 (SPADCALL |size| |size| |size| (QREFELT $ 68))
                 (SPADCALL (|minus_DF| |size|) |size| |size| (QREFELT $ 68))
                 (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|) |size|
                           (QREFELT $ 68))
                 (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|)
                           (|minus_DF| |size|) (QREFELT $ 68))
                 (SPADCALL (|minus_DF| |size|) |size| (|minus_DF| |size|)
                           (QREFELT $ 68))
                 (SPADCALL |size| |size| (|minus_DF| |size|) (QREFELT $ 68))
                 (SPADCALL |size| (|minus_DF| |size|) (|minus_DF| |size|)
                           (QREFELT $ 68))))
          (LETT |inx|
                (LIST (LIST 0 1 2 3) (LIST 4 5 6 7) (LIST 7 6 1 0)
                      (LIST 3 2 5 4) (LIST 1 6 5 2) (LIST 3 4 7 0)))
          (EXIT (SPADCALL |inx| |pts| (QREFELT $ 61)))))) 

(SDEFUN |SCENE;addSceneBox;$Df$;36| ((|n| $) (|size| |DoubleFloat|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |size| (QREFELT $ 69)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;R$;37|
        ((|text| |Record| (|:| |txt| (|String|))
          (|:| |siz| (|NonNegativeInteger|)) (|:| |pos| PT)
          (|:| |np| (|List| (|String|))))
         ($ $))
        (VECTOR 'TEXT NIL (CONS 2 |text|))) 

(SDEFUN |SCENE;addSceneText;$R$;38|
        ((|n| $)
         (|text| |Record| (|:| |txt| (|String|))
          (|:| |siz| (|NonNegativeInteger|)) (|:| |pos| PT)
          (|:| |np| (|List| (|String|))))
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |text| (QREFELT $ 72)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;SNniPT$;39|
        ((|str| |String|) (|sz| |NonNegativeInteger|) (|pz| PT) ($ $))
        (SPROG
         ((|text|
           (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                     (|:| |pos| PT) (|:| |np| (|List| (|String|))))))
         (SEQ (LETT |text| (VECTOR |str| |sz| |pz| NIL))
              (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|)))))) 

(SDEFUN |SCENE;addSceneText;$SNniPT$;40|
        ((|n| $) (|str| |String|) (|sz| |NonNegativeInteger|) (|pz| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 75)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneText;LNniPT$;41|
        ((|str| |List| (|String|)) (|sz| |NonNegativeInteger|) (|pz| PT) ($ $))
        (SPROG
         ((|text|
           (|Record| (|:| |txt| (|String|)) (|:| |siz| (|NonNegativeInteger|))
                     (|:| |pos| PT) (|:| |np| (|List| (|String|))))))
         (SEQ (LETT |text| (VECTOR (|SPADfirst| |str|) |sz| |pz| |str|))
              (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|)))))) 

(SDEFUN |SCENE;addSceneText;$LNniPT$;42|
        ((|n| $) (|str| |List| (|String|)) (|sz| |NonNegativeInteger|)
         (|pz| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 78)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneClip;Sb$;43| ((|bb| |SBoundary| PT) ($ $))
        (VECTOR 'CLIP NIL (CONS 3 |bb|))) 

(SDEFUN |SCENE;addSceneClip;$Sb$;44| ((|n| $) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 80)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneClip;R$;45|
        ((|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 80))) 

(SDEFUN |SCENE;addSceneClip;$R$;46|
        ((|n| $) (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 82)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;DfSb$;47|
        ((|stepSize| |DoubleFloat|) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ln| ($)) (#1=#:G1029 NIL) (|i| NIL) (#2=#:G1028 NIL) (|gp| ($))
          (|stepsy| (|NonNegativeInteger|)) (#3=#:G1023 NIL)
          (|stepsx| (|NonNegativeInteger|)) (#4=#:G1022 NIL)
          (|maxy| #5=(|DoubleFloat|)) (|maxx| #6=(|DoubleFloat|)) (|miny| #5#)
          (|minx| #6#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 85)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 84)))
          (LETT |maxy|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 85)))
          (LETT |stepsx|
                (PROG1
                    (LETT #4#
                          (TRUNCATE
                           (|div_DF| (|sub_DF| |maxx| |minx|) |stepSize|)))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (LETT |stepsy|
                (PROG1
                    (LETT #3#
                          (TRUNCATE
                           (|div_DF| (|sub_DF| |maxy| |miny|) |stepSize|)))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
          (LETT |gp| (SPADCALL (QREFELT $ 18)))
          (SEQ (LETT |i| 1) (LETT #2# |stepsx|) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ln|
                       (SPADCALL |gp|
                                 (LIST
                                  (SPADCALL
                                   (|add_DF| |minx|
                                             (|mul_DF|
                                              (FLOAT |i|
                                                     MOST-POSITIVE-DOUBLE-FLOAT)
                                              |stepSize|))
                                   |miny| (QREFELT $ 86))
                                  (SPADCALL
                                   (|add_DF| |minx|
                                             (|mul_DF|
                                              (FLOAT |i|
                                                     MOST-POSITIVE-DOUBLE-FLOAT)
                                              |stepSize|))
                                   |maxy| (QREFELT $ 86)))
                                 (QREFELT $ 24)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1) (LETT #1# |stepsy|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ln|
                       (SPADCALL |gp|
                                 (LIST
                                  (SPADCALL |minx|
                                            (|add_DF| |miny|
                                                      (|mul_DF|
                                                       (FLOAT |i|
                                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                                       |stepSize|))
                                            (QREFELT $ 86))
                                  (SPADCALL |maxx|
                                            (|add_DF| |miny|
                                                      (|mul_DF|
                                                       (FLOAT |i|
                                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                                       |stepSize|))
                                            (QREFELT $ 86)))
                                 (QREFELT $ 24)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneGrid;$DfSb$;48|
        ((|n| $) (|stepSize| |DoubleFloat|) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 87)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;DfR$;49|
        ((|stepSize| |DoubleFloat|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL |stepSize| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 87))) 

(SDEFUN |SCENE;addSceneGrid;$DfR$;50|
        ((|n| $) (|stepSize| |DoubleFloat|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 89)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;Sb$;51| ((|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|gd3| ($)) (|mt3| ($)) (|gd2| ($)) (|mt2| ($)) (|gd1| ($))
          (|mt1| ($)) (|gp| ($)) (|stepSize| (|DoubleFloat|))
          (|maxx| #1=(|DoubleFloat|)) (|minx| #1#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 84)))
          (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 100))
          (LETT |gp| (SPADCALL (QREFELT $ 18)))
          (LETT |mt1|
                (SPADCALL |gp|
                          (VECTOR 1.0 "blue" "blue"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                            (QREFELT $ 94)))
                          (QREFELT $ 96)))
          (LETT |gd1| (SPADCALL |mt1| |stepSize| |bb| (QREFELT $ 88)))
          (LETT |mt2|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                                  "blue"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                            (QREFELT $ 94)))
                          (QREFELT $ 96)))
          (LETT |gd2|
                (SPADCALL |mt2|
                          (|mul_DF| |stepSize|
                                    (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT))
                          |bb| (QREFELT $ 88)))
          (LETT |mt3|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                                  "red"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                            (QREFELT $ 94)))
                          (QREFELT $ 96)))
          (LETT |gd3|
                (SPADCALL |mt3|
                          (|mul_DF| |stepSize|
                                    (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
                          |bb| (QREFELT $ 88)))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneGrid;$Sb$;52| ((|n| $) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 97)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGrid;R$;53|
        ((|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 97))) 

(SDEFUN |SCENE;addSceneGrid;$R$;54|
        ((|n| $) (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 99)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createScenePattern1|
        ((|step| |NonNegativeInteger|) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ln| ($)) (|pts| (|List| PT)) (#1=#:G1062 NIL) (|j| NIL)
          (#2=#:G1061 NIL) (#3=#:G1060 NIL) (|i| NIL) (|mt2| ($))
          (#4=#:G1059 NIL) (#5=#:G1058 NIL) (#6=#:G1057 NIL) (|mt1| ($))
          (|gp| ($)) (|stepSize| (|DoubleFloat|)) (|maxy| #7=(|DoubleFloat|))
          (|maxx| #8=(|DoubleFloat|)) (|miny| #7#) (|minx| #8#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 85)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 84)))
          (LETT |maxy|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 85)))
          (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1200))
          (LETT |gp| (SPADCALL (QREFELT $ 18)))
          (LETT |mt1|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                                  "blue"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                            (QREFELT $ 94)))
                          (QREFELT $ 96)))
          (SEQ (LETT |i| 1) (LETT #6# |step|) G190
               (COND
                ((IF (MINUSP #6#)
                     (< |i| 1200)
                     (> |i| 1200))
                 (GO G191)))
               (SEQ
                (LETT |pts|
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT |j| 1) (LETT #4# |step|) G190
                            (COND
                             ((IF (|negative?_SI| #4#)
                                  (|less_SI| |j| 1200)
                                  (|greater_SI| |j| 1200))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #5#
                                    (CONS
                                     (SPADCALL
                                      (|add_DF| |minx|
                                                (|mul_DF|
                                                 (FLOAT |i|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (|add_DF| |miny|
                                                (|mul_DF|
                                                 (FLOAT |j|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (QREFELT $ 86))
                                     #5#))))
                            (LETT |j| (|add_SI| |j| #4#)) (GO G190) G191
                            (EXIT (NREVERSE #5#)))))
                (EXIT (LETT |ln| (SPADCALL |mt1| |pts| (QREFELT $ 24)))))
               (LETT |i| (+ |i| #6#)) (GO G190) G191 (EXIT NIL))
          (LETT |mt2|
                (SPADCALL |gp|
                          (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                                  "red"
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                            (QREFELT $ 94)))
                          (QREFELT $ 96)))
          (SEQ (LETT |i| 1) (LETT #3# |step|) G190
               (COND
                ((IF (|negative?_SI| #3#)
                     (|less_SI| |i| 1000)
                     (|greater_SI| |i| 1000))
                 (GO G191)))
               (SEQ
                (LETT |pts|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |j| 1) (LETT #1# |step|) G190
                            (COND
                             ((IF (|negative?_SI| #1#)
                                  (|less_SI| |j| 1200)
                                  (|greater_SI| |j| 1200))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (|add_DF| |minx|
                                                (|mul_DF|
                                                 (FLOAT |j|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (|add_DF| |miny|
                                                (|mul_DF|
                                                 (FLOAT |i|
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |stepSize|))
                                      (QREFELT $ 86))
                                     #2#))))
                            (LETT |j| (|add_SI| |j| #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                (EXIT (LETT |ln| (SPADCALL |mt2| |pts| (QREFELT $ 24)))))
               (LETT |i| (|add_SI| |i| #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;createScenePattern2|
        ((|level| |NonNegativeInteger|) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ifs2| (|SceneIFS| PT)) (|ifs| (|SceneIFS| PT))
          (|face1| (|List| PT)) (|midx| (|DoubleFloat|))
          (|maxy| #1=(|DoubleFloat|)) (|maxx| #2=(|DoubleFloat|)) (|miny| #1#)
          (|minx| #2#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 85)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 84)))
          (LETT |maxy|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 85)))
          (LETT |midx|
                (|mul_DF| (|add_DF| |minx| |maxx|)
                          (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                    (QREFELT $ 94))))
          (LETT |face1|
                (LIST (SPADCALL |midx| |miny| (QREFELT $ 86))
                      (SPADCALL |minx| |maxy| (QREFELT $ 86))
                      (SPADCALL |maxx| |maxy| (QREFELT $ 86))))
          (LETT |ifs| (SPADCALL |face1| (QREFELT $ 101)))
          (LETT |ifs2| (SPADCALL |ifs| |level| (QREFELT $ 102)))
          (EXIT
           (SPADCALL (SPADCALL |ifs2| (QREFELT $ 64))
                     (SPADCALL |ifs2| (QREFELT $ 65)) (QREFELT $ 61)))))) 

(SDEFUN |SCENE;subdivideLine|
        ((|level| |NonNegativeInteger|) (|inLine| |List| PT) ($ |List| PT))
        (SPROG
         ((#1=#:G1069 NIL) (|res| (|List| PT)) (|lastPt| (PT)) (|midpt| (PT))
          (#2=#:G1072 NIL) (|x| NIL))
         (SEQ
          (COND ((EQL |level| 0) |inLine|)
                ('T
                 (SEQ (LETT |res| NIL)
                      (SEQ (LETT |x| 1) (LETT #2# (LENGTH |inLine|)) G190
                           (COND ((|greater_SI| |x| #2#) (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL |x| 1 (QREFELT $ 103))
                              (SEQ
                               (LETT |midpt|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 5 -1 10 (QREFELT $ 93))
                                       (QREFELT $ 94))
                                      (SPADCALL |lastPt|
                                                (SPADCALL |inLine| |x|
                                                          (QREFELT $ 104))
                                                (QREFELT $ 105))
                                      (QREFELT $ 106)))
                               (EXIT
                                (LETT |res|
                                      (SPADCALL |res| |midpt|
                                                (QREFELT $ 107)))))))
                            (LETT |lastPt|
                                  (SPADCALL |inLine| |x| (QREFELT $ 104)))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |inLine| |x|
                                                       (QREFELT $ 104))
                                             (QREFELT $ 107)))))
                           (LETT |x| (|inc_SI| |x|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (|SCENE;subdivideLine|
                        (PROG1 (LETT #1# (- |level| 1))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |res| $)))))))) 

(SDEFUN |SCENE;createScenePattern3|
        ((|level| . #1=(|NonNegativeInteger|)) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|ln| ($)) (|lev2| #1#) (|pts2| (|List| (|List| PT)))
          (#2=#:G1084 NIL) (|l2| NIL) (|pts| (|List| (|List| PT)))
          (#3=#:G1083 NIL) (|j| NIL) (#4=#:G1082 NIL) (#5=#:G1081 NIL)
          (|i| NIL) (#6=#:G1080 NIL)
          (|ycoords| (|List| (|List| #7=(|NonNegativeInteger|))))
          (|xcoords| (|List| (|List| #7#))) (|scale| (|DoubleFloat|))
          (|maxy| #8=(|DoubleFloat|)) (|maxx| #9=(|DoubleFloat|)) (|miny| #8#)
          (|minx| #9#))
         (SEQ
          (LETT |minx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
          (LETT |miny|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 85)))
          (LETT |maxx|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 84)))
          (LETT |maxy|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 85)))
          (LETT |scale| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1000))
          (LETT |xcoords|
                (LIST (LIST 0 0 500 1000 1000 0) (LIST 150 350 350 150 150)
                      (LIST 100 400 400 100 100) (LIST 600 900 900 600 600)
                      (LIST 600 900 900 600 600)))
          (LETT |ycoords|
                (LIST (LIST 0 800 1000 800 0 0) (LIST 0 0 300 300 0)
                      (LIST 500 500 700 700 500) (LIST 500 500 700 700 500)
                      (LIST 100 100 300 300 100)))
          (LETT |pts|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (LENGTH |xcoords|)) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (PROGN
                                (LETT #4# NIL)
                                (SEQ (LETT |j| 1)
                                     (LETT #3#
                                           (SPADCALL
                                            (SPADCALL |xcoords| |i|
                                                      (QREFELT $ 109))
                                            (QREFELT $ 110)))
                                     G190
                                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (SPADCALL
                                               (|add_DF| |minx|
                                                         (|mul_DF|
                                                          (FLOAT
                                                           (SPADCALL
                                                            (SPADCALL |xcoords|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 109))
                                                            |j|
                                                            (QREFELT $ 111))
                                                           MOST-POSITIVE-DOUBLE-FLOAT)
                                                          |scale|))
                                               (|add_DF| |miny|
                                                         (|mul_DF|
                                                          (FLOAT
                                                           (SPADCALL
                                                            (SPADCALL |ycoords|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 109))
                                                            |j|
                                                            (QREFELT $ 111))
                                                           MOST-POSITIVE-DOUBLE-FLOAT)
                                                          |scale|))
                                               (QREFELT $ 86))
                                              #4#))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                               #6#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |pts2| NIL) (LETT |lev2| |level|)
          (SEQ (LETT |l2| NIL) (LETT #2# |pts|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |l2| (CAR #2#)) NIL)) (GO G191)))
               (SEQ
                (LETT |pts2|
                      (SPADCALL |pts2| (|SCENE;subdivideLine| |lev2| |l2| $)
                                (QREFELT $ 112)))
                (EXIT (COND ((EQL |lev2| |level|) (LETT |lev2| 2)))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT (LETT |ln| (SPADCALL |pts2| (QREFELT $ 35))))))) 

(SDEFUN |SCENE;createScenePattern;SNniSb$;59|
        ((|ptype| |Symbol|) (|step| |NonNegativeInteger|) (|bb| |SBoundary| PT)
         ($ $))
        (SPROG ((#1=#:G1087 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |ptype| 'GRID)
                    (PROGN
                     (LETT #1# (|SCENE;createScenePattern1| |step| |bb| $))
                     (GO #2=#:G1086))))
                  (COND
                   ((EQUAL |ptype| 'SIERPINSKI)
                    (PROGN
                     (LETT #1# (|SCENE;createScenePattern2| |step| |bb| $))
                     (GO #2#))))
                  (EXIT (|SCENE;createScenePattern3| |step| |bb| $))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;addScenePattern;$SNniSb$;60|
        ((|n| $) (|ptype| |Symbol|) (|step| |NonNegativeInteger|)
         (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 113)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createScenePattern;SNniR$;61|
        ((|ptype| |Symbol|) (|step| |NonNegativeInteger|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL |ptype| |step|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 113))) 

(SDEFUN |SCENE;addScenePattern;$SNniR$;62|
        ((|n| $) (|ptype| |Symbol|) (|step| |NonNegativeInteger|)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 115)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneRuler;SPTSb$;63|
        ((|ptype| |Symbol|) (|offset| PT) (|bb| |SBoundary| PT) ($ $))
        (SPROG
         ((|str| (|String|))
          (|d|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|pz| (PT)) (#1=#:G1117 NIL) (#2=#:G1118 NIL) (|x| NIL)
          (|stepI| (|Integer|)) (|gp| ($)) (|suffix| (|String|))
          (|zeroes| #3=(|Integer|)) (|maxPrimaryNorm| #4=(|DoubleFloat|))
          (|minPrimaryNorm| #4#) (|divn| (|DoubleFloat|)) (|expStep| #3#)
          (|stepSize| (|DoubleFloat|)) (|maxSecondary| #5=(|DoubleFloat|))
          (|maxPrimary| #6=(|DoubleFloat|)) (|minSecondary| #5#)
          (|minPrimary| #6#))
         (SEQ
          (LETT |minPrimary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
          (LETT |minSecondary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 85)))
          (LETT |maxPrimary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 84)))
          (LETT |maxSecondary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 85)))
          (COND
           ((EQUAL |ptype| 'VERTICAL)
            (SEQ
             (LETT |minPrimary|
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 85)))
             (LETT |minSecondary|
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 84)))
             (LETT |maxPrimary|
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 40)) (QREFELT $ 85)))
             (EXIT
              (LETT |maxSecondary|
                    (SPADCALL (SPADCALL |bb| (QREFELT $ 40))
                              (QREFELT $ 84)))))))
          (LETT |stepSize| (|sub_DF| |maxPrimary| |minPrimary|))
          (LETT |expStep|
                (-
                 (TRUNCATE
                  (SPADCALL (|add_DF| |stepSize| 1.0) (QREFELT $ 117)))
                 1))
          (LETT |divn|
                (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) |expStep|))
          (LETT |minPrimaryNorm| (|div_DF| |minPrimary| |divn|))
          (LETT |maxPrimaryNorm| (|div_DF| |maxPrimary| |divn|))
          (LETT |suffix| "") (LETT |zeroes| |expStep|)
          (COND
           ((SPADCALL |zeroes| 2 (QREFELT $ 118))
            (SEQ (LETT |zeroes| (- |zeroes| 3)) (LETT |suffix| "K")
                 (EXIT
                  (COND
                   ((SPADCALL |zeroes| 2 (QREFELT $ 118))
                    (SEQ (LETT |zeroes| (- |zeroes| 3)) (LETT |suffix| "M")
                         (EXIT
                          (COND
                           ((SPADCALL |zeroes| 2 (QREFELT $ 118))
                            (SEQ (LETT |zeroes| (- |zeroes| 3))
                                 (LETT |suffix| "G")
                                 (EXIT
                                  (COND
                                   ((SPADCALL |zeroes| 2 (QREFELT $ 118))
                                    (SEQ (LETT |zeroes| (- |zeroes| 3))
                                         (EXIT
                                          (LETT |suffix| "T")))))))))))))))))
          (COND
           ((< |zeroes| 0)
            (SEQ (LETT |zeroes| (+ |zeroes| 3)) (LETT |suffix| "m")
                 (EXIT
                  (COND
                   ((< |zeroes| 0)
                    (SEQ (LETT |zeroes| (+ |zeroes| 3)) (LETT |suffix| "u")
                         (EXIT
                          (COND
                           ((< |zeroes| 0)
                            (SEQ (LETT |zeroes| (+ |zeroes| 3))
                                 (LETT |suffix| "n")
                                 (EXIT
                                  (COND
                                   ((< |zeroes| 0)
                                    (SEQ (LETT |zeroes| (+ |zeroes| 3))
                                         (EXIT
                                          (LETT |suffix| "p")))))))))))))))))
          (COND
           ((SPADCALL |zeroes| 0 (QREFELT $ 118))
            (LETT |suffix| (STRCONC "0" |suffix|))))
          (COND
           ((SPADCALL |zeroes| 1 (QREFELT $ 118))
            (LETT |suffix| (STRCONC "0" |suffix|))))
          (LETT |gp| (SPADCALL (QREFELT $ 18)))
          (LETT |stepI| (COND ((EQUAL |ptype| 'HORIZONTAL) 2) ('T 1)))
          (SEQ (LETT |x| (TRUNCATE |minPrimaryNorm|))
               (LETT #2# (TRUNCATE |maxPrimaryNorm|)) (LETT #1# |stepI|) G190
               (COND
                ((IF (MINUSP #1#)
                     (< |x| #2#)
                     (> |x| #2#))
                 (GO G191)))
               (SEQ (LETT |str| (|mathObject2String| |x|))
                    (LETT |pz|
                          (SPADCALL
                           (SPADCALL
                            (|mul_DF| (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                      |divn|)
                            0.0 (QREFELT $ 86))
                           |offset| (QREFELT $ 105)))
                    (COND
                     ((EQUAL |ptype| 'VERTICAL)
                      (LETT |pz|
                            (SPADCALL
                             (SPADCALL 0.0
                                       (|mul_DF|
                                        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                        |divn|)
                                       (QREFELT $ 86))
                             |offset| (QREFELT $ 105)))))
                    (COND
                     ((EQL |expStep| -1)
                      (SEQ
                       (COND
                        ((SPADCALL |x| 0 (QREFELT $ 118))
                         (COND
                          ((< |x| 10) (LETT |str| (STRCONC "0." |str|))))))
                       (COND ((EQL |x| 10) (LETT |str| "1")))
                       (COND
                        ((SPADCALL |x| 10 (QREFELT $ 118))
                         (SEQ (LETT |d| (DIVIDE2 |x| 10))
                              (EXIT
                               (LETT |str|
                                     (SPADCALL
                                      (LIST (STRINGIMAGE (QCAR |d|)) "."
                                            (STRINGIMAGE (QCDR |d|)))
                                      (QREFELT $ 120)))))))
                       (COND
                        ((< |x| 0)
                         (COND
                          ((SPADCALL |x| -10 (QREFELT $ 118))
                           (LETT |str|
                                 (SPADCALL
                                  (LIST "-0." (|mathObject2String| (- |x|)))
                                  (QREFELT $ 120)))))))
                       (COND ((EQL |x| -10) (LETT |str| "-1")))
                       (EXIT
                        (COND
                         ((< |x| -10)
                          (SEQ (LETT |d| (DIVIDE2 (- |x|) 10))
                               (EXIT
                                (LETT |str|
                                      (SPADCALL
                                       (LIST "-" (STRINGIMAGE (QCAR |d|)) "."
                                             (STRINGIMAGE (QCDR |d|)))
                                       (QREFELT $ 120))))))))))
                     ((SPADCALL |x| 0 (QREFELT $ 121))
                      (LETT |str| (STRCONC |str| |suffix|))))
                    (EXIT (SPADCALL |gp| |str| 10 |pz| (QREFELT $ 76))))
               (LETT |x| (+ |x| #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |SCENE;addSceneRuler;$SPTSb$;64|
        ((|n| $) (|ptype| |Symbol|) (|offset| PT) (|bb| |SBoundary| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 122)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneRuler;SPTR$;65|
        ((|ptype| |Symbol|) (|offset| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPADCALL |ptype| |offset|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 122))) 

(SDEFUN |SCENE;addSceneRuler;$SPTR$;66|
        ((|n| $) (|ptype| |Symbol|) (|offset| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 124)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneGraph;Dg2NniB$;67|
        ((|g| |DirectedGraph| (|String|)) (|x| |NonNegativeInteger|)
         (|y| |NonNegativeInteger|) (|dispArrowName| |Boolean|) ($ $))
        (SPROG ((|tr| (|Scene| (|SCartesian| 2))))
               (SEQ
                (LETT |tr|
                      (SPADCALL
                       (SPADCALL (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                 (FLOAT |y| MOST-POSITIVE-DOUBLE-FLOAT) 0.0
                                 (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                           (QREFELT $ 94))
                                 (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                           (QREFELT $ 94))
                                 (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                           (QREFELT $ 94))
                                 (QREFELT $ 127))
                       (QREFELT $ 129)))
                (SPADCALL |tr| |g| |dispArrowName| NIL (QREFELT $ 131))
                (EXIT |tr|)))) 

(SDEFUN |SCENE;addSceneGraph;$Dg2NniB$;68|
        ((|n| $) (|g| |DirectedGraph| (|String|)) (|x| |NonNegativeInteger|)
         (|y| |NonNegativeInteger|) (|dispArrowName| |Boolean|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |g| |x| |y| |dispArrowName| (QREFELT $ 132)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneMaterial;R$;69|
        ((|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         ($ $))
        (VECTOR 'MATERIAL NIL (CONS 1 |mat|))) 

(SDEFUN |SCENE;addSceneMaterial;$R$;70|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |mat| (QREFELT $ 134)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneMaterial;Df2S$;71|
        ((|lineW| |DoubleFloat|) (|lineC| |String|) (|fillC| |String|) ($ $))
        (SPROG
         ((|mat|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ (LETT |mat| (VECTOR |lineW| |lineC| |fillC| 1.0))
              (EXIT (VECTOR 'MATERIAL NIL (CONS 1 |mat|)))))) 

(SDEFUN |SCENE;addSceneMaterial;$Df2S$;72|
        ((|n| $) (|lineW| |DoubleFloat|) (|lineC| |String|) (|fillC| |String|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c| (SPADCALL |lineW| |lineC| |fillC| (QREFELT $ 135)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createSceneTransform;St$;73| ((|tran| |STransform| PT) ($ $))
        (VECTOR 'TRANSFORM NIL (CONS 4 |tran|))) 

(SDEFUN |SCENE;addSceneTransform;$St$;74|
        ((|n| $) (|tran| |STransform| PT) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |tran| (QREFELT $ 138)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createArrows2Din2D;M2SNni$;75|
        ((|ptFun| |Mapping| PT PT) (|uSeg| |Segment| (|DoubleFloat|))
         (|vSeg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|someV| #1=(|DoubleFloat|)) (|arrows| (|List| (|List| PT)))
          (|someU| #1#) (|lp| (|List| PT)) (|outpt| (PT)) (|inPt| (PT))
          (|iu| NIL) (|iv| NIL) (|vstep| #2=(|DoubleFloat|)) (|ustep| #2#))
         (SEQ (LETT |arrows| NIL)
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 141))
                               (SPADCALL |uSeg| (QREFELT $ 142)))
                     |numPts|))
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 141))
                               (SPADCALL |vSeg| (QREFELT $ 142)))
                     |numPts|))
              (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 142)))
              (SEQ (LETT |iv| |numPts|) G190 (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 141)))))
                    (LETT |lp| NIL)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 142)))
                    (SEQ (LETT |iu| |numPts|) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 141)))))
                          (LETT |inPt|
                                (SPADCALL |someU| |someV| (QREFELT $ 86)))
                          (LETT |outpt| (SPADCALL |inPt| |ptFun|))
                          (LETT |lp| (LIST |inPt| |outpt|))
                          (LETT |someU| (|add_DF| |someU| |ustep|))
                          (EXIT (LETT |arrows| (CONS |lp| |arrows|))))
                         (LETT |iu| (+ |iu| -1)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|))))
                   (LETT |iv| (+ |iv| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |arrows| '|variable|
                         (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                   (QREFELT $ 94))
                         (QREFELT $ 51)))))) 

(SDEFUN |SCENE;addArrows2Din2D;$M2SNni$;76|
        ((|n| $) (|ptFun| |Mapping| PT PT) (|uSeg| |Segment| (|DoubleFloat|))
         (|vSeg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |ptFun| |uSeg| |vSeg| |numPts|
                                (QREFELT $ 144)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;addChild!;2$V;77| ((|n| $) (|c| $) ($ |Void|))
        (QSETVELT |n| 1 (SPADCALL (QVELT |n| 1) |c| (QREFELT $ 147)))) 

(PUT '|SCENE;removeChild!;2$V;78| '|SPADreplace|
     '(XLAM (|n| |c|) (|error| "removeChild! not yet implemented"))) 

(SDEFUN |SCENE;removeChild!;2$V;78| ((|n| $) (|c| $) ($ |Void|))
        (|error| "removeChild! not yet implemented")) 

(SDEFUN |SCENE;setTransform!;$StV;79|
        ((|n| $) (|tran| |STransform| PT) ($ |Void|))
        (COND
         ((SPADCALL (QVELT |n| 0) 'TRANSFORM (QREFELT $ 149))
          (|error| "use setTransform! on transform only"))
         ('T (QSETVELT |n| 2 (CONS 4 |tran|))))) 

(SDEFUN |SCENE;pathString|
        ((|pts| |List| (|List| PT)) (|tran| |STransform| PT)
         (|bb| |SBoundary| PT) (|sc| |DoubleFloat|) (|clipEn| |Boolean|)
         (|useInteger| |Boolean|) ($ |String|))
        (SPROG
         ((|lastValid| #1=(|Boolean|)) (|ptStr| (|String|))
          (|thisStr| (|String|)) (|minusy| (|DoubleFloat|))
          (|pntNum| (|NonNegativeInteger|)) (|valid| #1#) (|param2| (PT))
          (#2=#:G1246 NIL) (|param| NIL) (#3=#:G1245 NIL) (|line| NIL))
         (SEQ (LETT |ptStr| "") (LETT |lastValid| 'T)
              (SEQ (LETT |line| NIL) (LETT #3# |pts|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |line| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0)
                        (EXIT
                         (SEQ (LETT |param| NIL) (LETT #2# |line|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |param| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |param2|
                                     (SPADCALL |tran| |param| (QREFELT $ 151)))
                               (LETT |valid|
                                     (COND
                                      (|clipEn|
                                       (SPADCALL |bb| |param| (QREFELT $ 152)))
                                      ('T 'T)))
                               (COND
                                (|valid|
                                 (SEQ (LETT |pntNum| (+ |pntNum| 1))
                                      (COND
                                       ((SPADCALL |ptStr| "" (QREFELT $ 153))
                                        (LETT |ptStr| (STRCONC |ptStr| " "))))
                                      (COND
                                       (|lastValid|
                                        (SEQ
                                         (COND
                                          ((EQL |pntNum| 1)
                                           (LETT |ptStr|
                                                 (STRCONC |ptStr| "M"))))
                                         (EXIT
                                          (COND
                                           ((EQL |pntNum| 2)
                                            (LETT |ptStr|
                                                  (STRCONC |ptStr| "L"))))))))
                                      (COND
                                       ((NULL |lastValid|)
                                        (LETT |ptStr| (STRCONC |ptStr| "M"))))
                                      (LETT |minusy|
                                            (|minus_DF|
                                             (|mul_DF|
                                              (SPADCALL |param2|
                                                        (QREFELT $ 85))
                                              |sc|)))
                                      (COND
                                       (|useInteger|
                                        (LETT |thisStr|
                                              (SPADCALL
                                               (LIST
                                                (STRINGIMAGE
                                                 (TRUNCATE
                                                  (|mul_DF|
                                                   (SPADCALL |param2|
                                                             (QREFELT $ 84))
                                                   |sc|)))
                                                ","
                                                (STRINGIMAGE
                                                 (TRUNCATE |minusy|)))
                                               (QREFELT $ 120))))
                                       ('T
                                        (LETT |thisStr|
                                              (SPADCALL
                                               (LIST
                                                (|mathObject2String|
                                                 (|mul_DF|
                                                  (SPADCALL |param2|
                                                            (QREFELT $ 84))
                                                  |sc|))
                                                ","
                                                (|mathObject2String| |minusy|))
                                               (QREFELT $ 120)))))
                                      (EXIT
                                       (LETT |ptStr|
                                             (STRCONC |ptStr| |thisStr|))))))
                               (EXIT (LETT |lastValid| |valid|)))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;shorternArrow|
        ((|pts| |Record| (|:| |st| PT) (|:| |en| PT)) (|bb| |SBoundary| PT)
         ($ |Record| (|:| |st| PT) (|:| |en| PT)))
        (SPROG
         ((|newend| (PT)) (|newstart| (PT)) (|relpt| (PT)) (#1=#:G1252 NIL)
          (|reductionFactor| (|DoubleFloat|)) (|arrLength| (|DoubleFloat|))
          (|endpt| (PT)) (|startpt| (PT)) (|totalwidth| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |totalwidth|
                  (SPADCALL
                   (SPADCALL (SPADCALL |bb| (QREFELT $ 40))
                             (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 42))
                   (QREFELT $ 84)))
            (LETT |startpt| (QCAR |pts|)) (LETT |endpt| (QCDR |pts|))
            (LETT |arrLength| (SPADCALL |startpt| |endpt| (QREFELT $ 154)))
            (COND
             ((|less_DF| |arrLength|
                         (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 93))
                                   (QREFELT $ 94)))
              (PROGN (LETT #1# |pts|) (GO #2=#:G1251))))
            (LETT |reductionFactor|
                  (|div_DF| |totalwidth|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 40 0 10 (QREFELT $ 93))
                                       (QREFELT $ 94))
                             |arrLength|)))
            (COND
             ((SPADCALL |reductionFactor|
                        (SPADCALL (SPADCALL 4 -1 10 (QREFELT $ 93))
                                  (QREFELT $ 94))
                        (QREFELT $ 157))
              (PROGN (LETT #1# |pts|) (GO #2#))))
            (LETT |relpt| (SPADCALL |endpt| |startpt| (QREFELT $ 42)))
            (LETT |newstart|
                  (SPADCALL |startpt|
                            (SPADCALL |reductionFactor| |relpt|
                                      (QREFELT $ 106))
                            (QREFELT $ 105)))
            (LETT |newend|
                  (SPADCALL |startpt|
                            (SPADCALL
                             (|sub_DF|
                              (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 93))
                                        (QREFELT $ 94))
                              |reductionFactor|)
                             |relpt| (QREFELT $ 106))
                            (QREFELT $ 105)))
            (EXIT (CONS |newstart| |newend|))))
          #2# (EXIT #1#)))) 

(SDEFUN |SCENE;lineArrow|
        ((|pts| |List| (|List| PT)) (|tran| |STransform| PT)
         (|bb| |SBoundary| PT)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|sc| |DoubleFloat|) (|clipEn| |Boolean|) (|mode| |Symbol|)
         (|size| |DoubleFloat|) ($ |List| (|XmlElement|)))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|x| (|XmlElement|))
          (|nodeAtts| (|List| (|XmlAttribute|))) (|linWidth| (|DoubleFloat|))
          (|ptStr| (|String|)) (|thisStr| (|String|))
          (|minusEndy| #1=(|DoubleFloat|)) (|endPoint| (PT))
          (|minusStarty| #1#) (|aline| (|Record| (|:| |st| PT) (|:| |en| PT)))
          (|startPoint| (PT)) (|pntNum| (|NonNegativeInteger|))
          (|valid| (|Boolean|)) (|param2| (PT)) (#2=#:G1269 NIL) (|param| NIL)
          (#3=#:G1268 NIL) (|line| NIL))
         (SEQ (LETT |nodeEles| NIL)
              (SEQ (LETT |line| NIL) (LETT #3# |pts|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |line| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0) (LETT |ptStr| "")
                        (LETT |startPoint| (SPADCALL 0 0 (QREFELT $ 14)))
                        (LETT |endPoint| (SPADCALL 0 0 (QREFELT $ 14)))
                        (SEQ (LETT |param| NIL) (LETT #2# |line|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |param| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |param2|
                                    (SPADCALL |tran| |param| (QREFELT $ 151)))
                              (LETT |valid|
                                    (COND
                                     (|clipEn|
                                      (SPADCALL |bb| |param| (QREFELT $ 152)))
                                     ('T 'T)))
                              (EXIT
                               (COND
                                (|valid|
                                 (SEQ (LETT |pntNum| (+ |pntNum| 1))
                                      (COND
                                       ((SPADCALL |ptStr| "" (QREFELT $ 153))
                                        (LETT |ptStr| (STRCONC |ptStr| " "))))
                                      (COND
                                       ((EQL |pntNum| 1)
                                        (SEQ
                                         (LETT |ptStr| (STRCONC |ptStr| "M"))
                                         (EXIT (LETT |startPoint| |param2|)))))
                                      (COND
                                       ((EQL |pntNum| 2)
                                        (SEQ (LETT |endPoint| |param2|)
                                             (LETT |aline|
                                                   (CONS |startPoint|
                                                         |endPoint|))
                                             (COND
                                              ((EQUAL |mode| '|proportional|)
                                               (LETT |aline|
                                                     (|SCENE;shorternArrow|
                                                      (CONS |startPoint|
                                                            |endPoint|)
                                                      |bb| $))))
                                             (LETT |minusStarty|
                                                   (|minus_DF|
                                                    (|mul_DF|
                                                     (SPADCALL (QCAR |aline|)
                                                               (QREFELT $ 85))
                                                     |sc|)))
                                             (LETT |minusEndy|
                                                   (|minus_DF|
                                                    (|mul_DF|
                                                     (SPADCALL (QCDR |aline|)
                                                               (QREFELT $ 85))
                                                     |sc|)))
                                             (LETT |thisStr|
                                                   (SPADCALL
                                                    (LIST
                                                     (|mathObject2String|
                                                      (|mul_DF|
                                                       (SPADCALL (QCAR |aline|)
                                                                 (QREFELT $
                                                                          84))
                                                       |sc|))
                                                     ","
                                                     (|mathObject2String|
                                                      |minusStarty|)
                                                     "L"
                                                     (|mathObject2String|
                                                      (|mul_DF|
                                                       (SPADCALL (QCDR |aline|)
                                                                 (QREFELT $
                                                                          84))
                                                       |sc|))
                                                     ","
                                                     (|mathObject2String|
                                                      |minusEndy|))
                                                    (QREFELT $ 120)))
                                             (EXIT
                                              (LETT |ptStr|
                                                    (STRCONC |ptStr|
                                                             |thisStr|))))))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |pntNum| 2 (QREFELT $ 158))
                                         (SEQ (LETT |endPoint| |param2|)
                                              (LETT |minusEndy|
                                                    (|minus_DF|
                                                     (|mul_DF|
                                                      (SPADCALL |endPoint|
                                                                (QREFELT $ 85))
                                                      |sc|)))
                                              (LETT |thisStr|
                                                    (SPADCALL
                                                     (LIST "L"
                                                           (|mathObject2String|
                                                            (|mul_DF|
                                                             (SPADCALL
                                                              |endPoint|
                                                              (QREFELT $ 84))
                                                             |sc|))
                                                           ","
                                                           (|mathObject2String|
                                                            |minusEndy|))
                                                     (QREFELT $ 120)))
                                              (EXIT
                                               (LETT |ptStr|
                                                     (STRCONC |ptStr|
                                                              |thisStr|))))))))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |ptStr| "" (QREFELT $ 153))
                           (SEQ
                            (COND
                             ((|less_DF|
                               (SPADCALL |startPoint| |endPoint|
                                         (QREFELT $ 154))
                               (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 93))
                                         (QREFELT $ 94)))
                              (LETT |ptStr|
                                    (SPADCALL
                                     (LIST "M "
                                           (|mathObject2String|
                                            (|mul_DF|
                                             (SPADCALL |startPoint|
                                                       (QREFELT $ 84))
                                             |sc|))
                                           ","
                                           (|mathObject2String|
                                            (|minus_DF|
                                             (|mul_DF|
                                              (SPADCALL |startPoint|
                                                        (QREFELT $ 85))
                                              |sc|)))
                                           "c -50,25 -50,-50 0,-25")
                                     (QREFELT $ 120)))))
                            (LETT |linWidth|
                                  (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                            (COND
                             ((EQUAL |mode| '|proportional|)
                              (LETT |linWidth|
                                    (|mul_DF|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |bb| (QREFELT $ 40))
                                                (SPADCALL |bb| (QREFELT $ 41))
                                                (QREFELT $ 42))
                                      (QREFELT $ 84))
                                     |size|))))
                            (COND
                             ((EQUAL |mode| '|variable|)
                              (LETT |linWidth|
                                    (|mul_DF|
                                     (SPADCALL |startPoint| |endPoint|
                                               (QREFELT $ 154))
                                     |size|))))
                            (LETT |nodeAtts|
                                  (LIST (SPADCALL "d" |ptStr| (QREFELT $ 160))
                                        (SPADCALL "fill" "none"
                                                  (QREFELT $ 160))
                                        (SPADCALL "stroke" (QVELT |mat| 1)
                                                  (QREFELT $ 160))
                                        (SPADCALL "stroke-width"
                                                  (|mathObject2String|
                                                   |linWidth|)
                                                  (QREFELT $ 160))
                                        (SPADCALL "style"
                                                  "marker-end:url(#Arrow)"
                                                  (QREFELT $ 160))))
                            (LETT |x|
                                  (SPADCALL "path" NIL |nodeAtts|
                                            (QREFELT $ 163)))
                            (EXIT
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |x|
                                             (QREFELT $ 165)))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |nodeEles|)))) 

(SDEFUN |SCENE;faceString|
        ((|faces| |Record| (|:| |inx| (|List| (|List| (|NonNegativeInteger|))))
          (|:| |pts| (|List| PT)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) (|sc| |DoubleFloat|)
         (|clipEn| |Boolean|) ($ |String|))
        (SPROG
         ((|ptStr| (|String|)) (|lastValid| #1=(|Boolean|))
          (|thisStr| (|String|)) (|minusy| (|DoubleFloat|))
          (|pntNum| (|NonNegativeInteger|)) (|valid| #1#) (|param2| (PT))
          (|param| (PT)) (#2=#:G1282 NIL) (|i| NIL) (#3=#:G1281 NIL)
          (|ln| NIL))
         (SEQ (LETT |ptStr| "") (LETT |lastValid| 'T)
              (SEQ (LETT |ln| NIL) (LETT #3# (QCAR |faces|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ln| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pntNum| 0)
                        (SEQ (LETT |i| NIL) (LETT #2# |ln|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |param|
                                    (SPADCALL (QCDR |faces|) (+ |i| 1)
                                              (QREFELT $ 104)))
                              (LETT |param2|
                                    (SPADCALL |tran| |param| (QREFELT $ 151)))
                              (LETT |valid|
                                    (COND
                                     (|clipEn|
                                      (SPADCALL |bb| |param| (QREFELT $ 152)))
                                     ('T 'T)))
                              (COND
                               (|valid|
                                (SEQ (LETT |pntNum| (+ |pntNum| 1))
                                     (COND
                                      ((SPADCALL |ptStr| "" (QREFELT $ 153))
                                       (LETT |ptStr| (STRCONC |ptStr| " "))))
                                     (COND
                                      (|lastValid|
                                       (SEQ
                                        (COND
                                         ((EQL |pntNum| 1)
                                          (LETT |ptStr|
                                                (STRCONC |ptStr| "M"))))
                                        (EXIT
                                         (COND
                                          ((EQL |pntNum| 2)
                                           (LETT |ptStr|
                                                 (STRCONC |ptStr| "L"))))))))
                                     (COND
                                      ((NULL |lastValid|)
                                       (LETT |ptStr| (STRCONC |ptStr| "M"))))
                                     (LETT |minusy|
                                           (|minus_DF|
                                            (|mul_DF|
                                             (SPADCALL |param2| (QREFELT $ 85))
                                             |sc|)))
                                     (LETT |thisStr|
                                           (SPADCALL
                                            (LIST
                                             (|mathObject2String|
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT $ 84))
                                               |sc|))
                                             ","
                                             (|mathObject2String| |minusy|))
                                            (QREFELT $ 120)))
                                     (EXIT
                                      (LETT |ptStr|
                                            (STRCONC |ptStr| |thisStr|))))))
                              (EXIT (LETT |lastValid| |valid|)))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |ptStr| (STRCONC |ptStr| "z"))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;toSVG;$RStSbDf2BSnpXe;84|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) (|scale| |DoubleFloat|)
         (|clipEn| |Boolean|) (|useInteger| |Boolean|)
         (|npt| |SceneNamedPoints| PT) ($ |XmlElement|))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|xch| (|XmlElement|))
          (#1=#:G1369 NIL) (|ch| NIL) (|nodeName| (|String|)) (|nde| ($))
          (|name| #2=(|String|))
          (|nn| (|Record| (|:| |nme| #2#) (|:| |node| $))) (#3=#:G1300 NIL)
          (#4=#:G1301 NIL) (|nodeAtts| (|List| (|XmlAttribute|)))
          (|linWidth| (|DoubleFloat|)) (#5=#:G1298 NIL) (|ptStr| #6=(|String|))
          (|endPointM| #7=(|DoubleFloat|)) (|startPointM| #7#)
          (|endPoint| (PT)) (|startPoint| (PT)) (#8=#:G1297 NIL)
          (#9=#:G1367 NIL) (#10=#:G1296 NIL) (|bb2| (|SBoundary| PT))
          (#11=#:G1294 NIL) (|clipEn2| (|Boolean|)) (|tran2| (|STransform| PT))
          (#12=#:G1295 NIL) (#13=#:G1293 NIL) (|textScale| (|DoubleFloat|))
          (|y| #7#) (|x| #14=(|DoubleFloat|)) (|param2| (PT))
          (|nodeAttsTxt| (|List| #15=(|XmlAttribute|))) (#16=#:G1368 NIL)
          (|nam| NIL)
          (|mat2|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|))))
          (#17=#:G1292 NIL) (#18=#:G1299 NIL) (|sh| (|String|))
          (|sw| (|String|)) (|sy| (|String|)) (|sx| (|String|)) (|ry| #14#)
          (|rx| #14#) (|r2| (PT)) (#19=#:G1291 NIL) (|viewBoxStr| #6#)
          (|offsety| #7#) (|offsetx| #7#) (|scale2| (|DoubleFloat|))
          (|maxy| #20=(|DoubleFloat|)) (|maxx| #21=(|DoubleFloat|))
          (|miny| #20#) (|minx| #21#) (|mkr| #22=(|XmlElement|))
          (|mkrAtts| (|List| #15#)) (|pth| #22#) (|pthAtts| (|List| #15#))
          (|np2| (|SceneNamedPoints| PT)))
         (SEQ
          (EXIT
           (SEQ (LETT |bb2| |bb|) (LETT |tran2| |tran|) (LETT |mat2| |mat|)
                (LETT |np2| |npt|) (LETT |clipEn2| |clipEn|)
                (LETT |scale2| |scale|) (LETT |nodeEles| NIL)
                (LETT |nodeAtts| NIL) (LETT |nodeName| "")
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ (LETT |nodeName| "svg")
                       (LETT |pthAtts|
                             (LIST
                              (SPADCALL "d"
                                        "M 0.0,0.0 L 5.0,-5.0 L -12.5,0.0 L 5.0,5.0 L 0.0,0.0 z "
                                        (QREFELT $ 160))
                              (SPADCALL "style"
                                        "fill-rule:evenodd;stroke:#000000;stroke-width:1.0pt;marker-start:none;"
                                        (QREFELT $ 160))
                              (SPADCALL "transform"
                                        "scale(0.4) rotate(180) translate(10,0)"
                                        (QREFELT $ 160))))
                       (LETT |pth|
                             (SPADCALL "path" NIL |pthAtts| (QREFELT $ 163)))
                       (LETT |mkrAtts|
                             (LIST (SPADCALL "orient" "auto" (QREFELT $ 160))
                                   (SPADCALL "refY" "0.0" (QREFELT $ 160))
                                   (SPADCALL "refX" "0.0" (QREFELT $ 160))
                                   (SPADCALL "id" "Arrow" (QREFELT $ 160))
                                   (SPADCALL "style" "overflow:visible"
                                             (QREFELT $ 160))))
                       (LETT |mkr|
                             (SPADCALL "marker" (LIST |pth|) |mkrAtts|
                                       (QREFELT $ 163)))
                       (LETT |nodeEles|
                             (LIST
                              (SPADCALL "defs" (LIST |mkr|) NIL
                                        (QREFELT $ 163))))
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 3))
                         (|error|
                          "toSVG parameter type not valid for root node")))
                       (LETT |bb2|
                             (PROG2 (LETT #11# (QVELT |n| 2))
                                 (QCDR #11#)
                               (|check_union2| (QEQCAR #11# 3)
                                               (|SBoundary| (QREFELT $ 6))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #23="empty"))
                                               #11#)))
                       (COND
                        ((SPADCALL |bb2| (QREFELT $ 166))
                         (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 31)))))
                       (COND
                        ((SPADCALL |bb2| (QREFELT $ 166))
                         (|error| "scene contains no drawable elements")))
                       (LETT |minx|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                       (QREFELT $ 84)))
                       (LETT |miny|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                       (QREFELT $ 85)))
                       (LETT |maxx|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 40))
                                       (QREFELT $ 84)))
                       (LETT |maxy|
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 40))
                                       (QREFELT $ 85)))
                       (LETT |scale2|
                             (|div_DF| (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT)
                                       (|sub_DF| |maxx| |minx|)))
                       (LETT |offsetx| (|minus_DF| |minx|))
                       (LETT |offsety| (|minus_DF| |maxy|))
                       (LETT |tran2|
                             (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                       (QREFELT $ 167)))
                       (COND
                        (|useInteger|
                         (LETT |viewBoxStr|
                               (SPADCALL
                                (LIST "0 0 "
                                      (|mathObject2String|
                                       (TRUNCATE
                                        (|mul_DF| (|sub_DF| |maxx| |minx|)
                                                  |scale2|)))
                                      " "
                                      (|mathObject2String|
                                       (TRUNCATE
                                        (|mul_DF| (|sub_DF| |maxy| |miny|)
                                                  |scale2|))))
                                (QREFELT $ 120))))
                        (#24='T
                         (LETT |viewBoxStr|
                               (SPADCALL
                                (LIST "0.0 0.0 "
                                      (|mathObject2String|
                                       (|mul_DF| (|sub_DF| |maxx| |minx|)
                                                 |scale2|))
                                      " "
                                      (|mathObject2String|
                                       (|mul_DF| (|sub_DF| |maxy| |miny|)
                                                 |scale2|)))
                                (QREFELT $ 120)))))
                       (EXIT
                        (LETT |nodeAtts|
                              (LIST
                               (SPADCALL "xmlns" "http://www.w3.org/2000/svg"
                                         (QREFELT $ 160))
                               (SPADCALL "width" "12cm" (QREFELT $ 160))
                               (SPADCALL "height" "8cm" (QREFELT $ 160))
                               (SPADCALL "viewBox" |viewBoxStr|
                                         (QREFELT $ 160))))))))
                (COND ((EQUAL (QVELT |n| 0) 'GROUP) (LETT |nodeName| "g")))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toSVG parameter type not valid for line node")))
                   (LETT |nodeName| "path")
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "d"
                                    (|SCENE;pathString|
                                     (PROG2 (LETT #19# (QVELT |n| 2))
                                         (QCDR #19#)
                                       (|check_union2| (QEQCAR #19# 0)
                                                       (|List|
                                                        (|List| (QREFELT $ 6)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #23#))
                                                       #19#))
                                     |tran2| |bb2| |scale2| |clipEn2|
                                     |useInteger| $)
                                    (QREFELT $ 160))
                          (SPADCALL "fill" "none" (QREFELT $ 160))
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 160))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 160))
                          (SPADCALL "stroke-linecap" "butt" (QREFELT $ 160))
                          (SPADCALL "stroke-linejoin" "miter"
                                    (QREFELT $ 160))))
                   (EXIT
                    (COND
                     ((|less_DF| (QVELT |mat2| 3)
                                 (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 93))
                                           (QREFELT $ 94)))
                      (LETT |nodeAtts|
                            (SPADCALL |nodeAtts|
                                      (SPADCALL "stroke-opacity"
                                                (|mathObject2String|
                                                 (QVELT |mat2| 3))
                                                (QREFELT $ 160))
                                      (QREFELT $ 168)))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 8))
                     (|error|
                      "toSVG parameter type not valid for shape node")))
                   (LETT |param2|
                         (SPADCALL |tran|
                                   (QVELT
                                    (PROG2 (LETT #18# (QVELT |n| 2))
                                        (QCDR #18#)
                                      (|check_union2| (QEQCAR #18# 8)
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|)))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |material|
                                                            (|Record|
                                                             (|:| |lineWidth|
                                                                  (|DoubleFloat|))
                                                             (|:| |lineCol|
                                                                  (|String|))
                                                             (|:| |fillCol|
                                                                  (|String|))
                                                             (|:| |matOpacity|
                                                                  (|DoubleFloat|))))
                                                       (|:| |text|
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT $ 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT $ 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |arrw|
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |shpe|
                                                            (|Record|
                                                             (|:| |shptype|
                                                                  (|Symbol|))
                                                             (|:| |centre|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| $)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT $ 6)))
                                                       (|:| |empty| #23#))
                                                      #18#))
                                    1)
                                   (QREFELT $ 151)))
                   (LETT |r2|
                         (QVELT
                          (PROG2 (LETT #18# (QVELT |n| 2))
                              (QCDR #18#)
                            (|check_union2| (QEQCAR #18# 8)
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT $ 6))
                                             (|:| |size| (QREFELT $ 6))
                                             (|:| |fill| (|Boolean|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #23#))
                                            #18#))
                          2))
                   (LETT |rx|
                         (|mul_DF| (SPADCALL |r2| (QREFELT $ 84)) |scale2|))
                   (LETT |ry|
                         (|mul_DF| (SPADCALL |r2| (QREFELT $ 85)) |scale2|))
                   (LETT |nodeName| "ellipse") (LETT |sx| "x") (LETT |sy| "y")
                   (LETT |sw| "width") (LETT |sh| "height")
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|rect|)
                     (SEQ (LETT |nodeName| "rect") (LETT |sx| "x")
                          (LETT |sy| "y") (LETT |sw| "width")
                          (EXIT (LETT |sh| "height")))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|ellipse|)
                     (SEQ (LETT |nodeName| "ellipse") (LETT |sx| "cx")
                          (LETT |sy| "cy") (LETT |sw| "rx")
                          (EXIT (LETT |sh| "ry")))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|box|)
                     (SEQ (LETT |nodeName| "rect") (LETT |sx| "x")
                          (LETT |sy| "y") (LETT |sw| "width")
                          (EXIT (LETT |sh| "height")))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #18# (QVELT |n| 2))
                           (QCDR #18#)
                         (|check_union2| (QEQCAR #18# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #18#))
                       0)
                      '|sphere|)
                     (SEQ (LETT |nodeName| "ellipse") (LETT |sx| "cx")
                          (LETT |sy| "cy") (LETT |sw| "rx")
                          (EXIT (LETT |sh| "ry")))))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 160))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 160))
                          (SPADCALL |sx|
                                    (|mathObject2String|
                                     (|mul_DF|
                                      (SPADCALL |param2| (QREFELT $ 84))
                                      |scale2|))
                                    (QREFELT $ 160))
                          (SPADCALL |sy|
                                    (|mathObject2String|
                                     (|minus_DF|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT $ 85))
                                       |scale2|)))
                                    (QREFELT $ 160))
                          (SPADCALL |sw| (|mathObject2String| (|abs_DF| |rx|))
                                    (QREFELT $ 160))
                          (SPADCALL |sh| (|mathObject2String| (|abs_DF| |ry|))
                                    (QREFELT $ 160))))
                   (COND
                    ((QVELT
                      (PROG2 (LETT #18# (QVELT |n| 2))
                          (QCDR #18#)
                        (|check_union2| (QEQCAR #18# 8)
                                        (|Record| (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|)))
                                        (|Union|
                                         (|:| |points|
                                              (|List| (|List| (QREFELT $ 6))))
                                         (|:| |material|
                                              (|Record|
                                               (|:| |lineWidth|
                                                    (|DoubleFloat|))
                                               (|:| |lineCol| (|String|))
                                               (|:| |fillCol| (|String|))
                                               (|:| |matOpacity|
                                                    (|DoubleFloat|))))
                                         (|:| |text|
                                              (|Record| (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                         (|:| |boundbox|
                                              (|SBoundary| (QREFELT $ 6)))
                                         (|:| |trans|
                                              (|STransform| (QREFELT $ 6)))
                                         (|:| |ifs|
                                              (|Record|
                                               (|:| |inx|
                                                    (|List|
                                                     (|List|
                                                      (|NonNegativeInteger|))))
                                               (|:| |pts|
                                                    (|List| (QREFELT $ 6)))))
                                         (|:| |arrws|
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|))))
                                         (|:| |arrw|
                                              (|Record| (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                         (|:| |shpe|
                                              (|Record|
                                               (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|))))
                                         (|:| |nodename|
                                              (|Record| (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                         (|:| |np|
                                              (|SceneNamedPoints|
                                               (QREFELT $ 6)))
                                         (|:| |empty| #23#))
                                        #18#))
                      3)
                     (LETT |nodeAtts|
                           (SPADCALL |nodeAtts|
                                     (SPADCALL "fill"
                                               (|mathObject2String|
                                                (QVELT |mat2| 2))
                                               (QREFELT $ 160))
                                     (QREFELT $ 168))))
                    (#24#
                     (LETT |nodeAtts|
                           (SPADCALL |nodeAtts|
                                     (SPADCALL "fill" "none" (QREFELT $ 160))
                                     (QREFELT $ 168)))))
                   (EXIT
                    (COND
                     ((|less_DF| (QVELT |mat2| 3)
                                 (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 93))
                                           (QREFELT $ 94)))
                      (LETT |nodeAtts|
                            (SPADCALL |nodeAtts|
                                      (SPADCALL "opacity"
                                                (|mathObject2String|
                                                 (QVELT |mat2| 3))
                                                (QREFELT $ 160))
                                      (QREFELT $ 168)))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (SEQ (LETT |nodeName| "g")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 1))
                         (|error|
                          "toSVG parameter type not valid for material node")))
                       (EXIT
                        (LETT |mat2|
                              (PROG2 (LETT #17# (QVELT |n| 2))
                                  (QCDR #17#)
                                (|check_union2| (QEQCAR #17# 1)
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|)))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #23#))
                                                #17#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TEXT)
                  (SEQ (LETT |nodeName| "text")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 2))
                         (|error|
                          "toSVG parameter type not valid for text node")))
                       (COND
                        ((SPADCALL
                          (QVELT
                           (PROG2 (LETT #13# (QVELT |n| 2))
                               (QCDR #13#)
                             (|check_union2| (QEQCAR #13# 2)
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|))))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #23#))
                                             #13#))
                           3)
                          NIL (QREFELT $ 169))
                         (SEQ
                          (SEQ (LETT |nam| NIL)
                               (LETT #16#
                                     (QVELT
                                      (PROG2 (LETT #13# (QVELT |n| 2))
                                          (QCDR #13#)
                                        (|check_union2| (QEQCAR #13# 2)
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |material|
                                                              (|Record|
                                                               (|:| |lineWidth|
                                                                    (|DoubleFloat|))
                                                               (|:| |lineCol|
                                                                    (|String|))
                                                               (|:| |fillCol|
                                                                    (|String|))
                                                               (|:|
                                                                |matOpacity|
                                                                (|DoubleFloat|))))
                                                         (|:| |text|
                                                              (|Record|
                                                               (|:| |txt|
                                                                    (|String|))
                                                               (|:| |siz|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |pos|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT $ 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT $ 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       $ 6))))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |arrw|
                                                              (|Record|
                                                               (|:| |st|
                                                                    (|String|))
                                                               (|:| |en|
                                                                    (|String|))
                                                               (|:| |offset|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |shpe|
                                                              (|Record|
                                                               (|:| |shptype|
                                                                    (|Symbol|))
                                                               (|:| |centre|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| $)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT $ 6)))
                                                         (|:| |empty| #23#))
                                                        #13#))
                                      3))
                               G190
                               (COND
                                ((OR (ATOM #16#)
                                     (PROGN (LETT |nam| (CAR #16#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |param2|
                                      (SPADCALL |tran|
                                                (SPADCALL
                                                 (SPADCALL |np2| |nam|
                                                           (QREFELT $ 170))
                                                 (QVELT
                                                  (PROG2
                                                      (LETT #13# (QVELT |n| 2))
                                                      (QCDR #13#)
                                                    (|check_union2|
                                                     (QEQCAR #13# 2)
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                                     (|Union|
                                                      (|:| |points|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |material|
                                                           (|Record|
                                                            (|:| |lineWidth|
                                                                 (|DoubleFloat|))
                                                            (|:| |lineCol|
                                                                 (|String|))
                                                            (|:| |fillCol|
                                                                 (|String|))
                                                            (|:| |matOpacity|
                                                                 (|DoubleFloat|))))
                                                      (|:| |text|
                                                           (|Record|
                                                            (|:| |txt|
                                                                 (|String|))
                                                            (|:| |siz|
                                                                 (|NonNegativeInteger|))
                                                            (|:| |pos|
                                                                 (QREFELT $ 6))
                                                            (|:| |np|
                                                                 (|List|
                                                                  (|String|)))))
                                                      (|:| |boundbox|
                                                           (|SBoundary|
                                                            (QREFELT $ 6)))
                                                      (|:| |trans|
                                                           (|STransform|
                                                            (QREFELT $ 6)))
                                                      (|:| |ifs|
                                                           (|Record|
                                                            (|:| |inx|
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|))))
                                                            (|:| |pts|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6)))))
                                                      (|:| |arrws|
                                                           (|Record|
                                                            (|:| |ln|
                                                                 (|List|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6))))
                                                            (|:| |mode|
                                                                 (|Symbol|))
                                                            (|:| |size|
                                                                 (|DoubleFloat|))))
                                                      (|:| |arrw|
                                                           (|Record|
                                                            (|:| |st|
                                                                 (|String|))
                                                            (|:| |en|
                                                                 (|String|))
                                                            (|:| |offset|
                                                                 (QREFELT $ 6))
                                                            (|:| |mode|
                                                                 (|Symbol|))
                                                            (|:| |size|
                                                                 (|DoubleFloat|))))
                                                      (|:| |shpe|
                                                           (|Record|
                                                            (|:| |shptype|
                                                                 (|Symbol|))
                                                            (|:| |centre|
                                                                 (QREFELT $ 6))
                                                            (|:| |size|
                                                                 (QREFELT $ 6))
                                                            (|:| |fill|
                                                                 (|Boolean|))))
                                                      (|:| |nodename|
                                                           (|Record|
                                                            (|:| |nme|
                                                                 (|String|))
                                                            (|:| |node| $)))
                                                      (|:| |np|
                                                           (|SceneNamedPoints|
                                                            (QREFELT $ 6)))
                                                      (|:| |empty| #23#))
                                                     #13#))
                                                  2)
                                                 (QREFELT $ 105))
                                                (QREFELT $ 151)))
                                (LETT |nodeAttsTxt|
                                      (LIST
                                       (SPADCALL "font-size"
                                                 (STRINGIMAGE
                                                  (QVELT
                                                   (PROG2
                                                       (LETT #13#
                                                             (QVELT |n| 2))
                                                       (QCDR #13#)
                                                     (|check_union2|
                                                      (QEQCAR #13# 2)
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|))))
                                                      (|Union|
                                                       (|:| |points|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |material|
                                                            (|Record|
                                                             (|:| |lineWidth|
                                                                  (|DoubleFloat|))
                                                             (|:| |lineCol|
                                                                  (|String|))
                                                             (|:| |fillCol|
                                                                  (|String|))
                                                             (|:| |matOpacity|
                                                                  (|DoubleFloat|))))
                                                       (|:| |text|
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|)))))
                                                       (|:| |boundbox|
                                                            (|SBoundary|
                                                             (QREFELT $ 6)))
                                                       (|:| |trans|
                                                            (|STransform|
                                                             (QREFELT $ 6)))
                                                       (|:| |ifs|
                                                            (|Record|
                                                             (|:| |inx|
                                                                  (|List|
                                                                   (|List|
                                                                    (|NonNegativeInteger|))))
                                                             (|:| |pts|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6)))))
                                                       (|:| |arrws|
                                                            (|Record|
                                                             (|:| |ln|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |arrw|
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|))))
                                                       (|:| |shpe|
                                                            (|Record|
                                                             (|:| |shptype|
                                                                  (|Symbol|))
                                                             (|:| |centre|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |size|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |fill|
                                                                  (|Boolean|))))
                                                       (|:| |nodename|
                                                            (|Record|
                                                             (|:| |nme|
                                                                  (|String|))
                                                             (|:| |node| $)))
                                                       (|:| |np|
                                                            (|SceneNamedPoints|
                                                             (QREFELT $ 6)))
                                                       (|:| |empty| #23#))
                                                      #13#))
                                                   1))
                                                 (QREFELT $ 160))
                                       (SPADCALL "transform"
                                                 (SPADCALL
                                                  (LIST "scale("
                                                        (|mathObject2String|
                                                         (|div_DF| |scale2|
                                                                   (FLOAT 2
                                                                          MOST-POSITIVE-DOUBLE-FLOAT)))
                                                        ","
                                                        (|mathObject2String|
                                                         (|div_DF| |scale2|
                                                                   (FLOAT 2
                                                                          MOST-POSITIVE-DOUBLE-FLOAT)))
                                                        ")")
                                                  (QREFELT $ 120))
                                                 (QREFELT $ 160))
                                       (SPADCALL "x"
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL |param2|
                                                             (QREFELT $ 84))
                                                   (FLOAT 2
                                                          MOST-POSITIVE-DOUBLE-FLOAT)))
                                                 (QREFELT $ 160))
                                       (SPADCALL "y"
                                                 (|mathObject2String|
                                                  (|minus_DF|
                                                   (|mul_DF|
                                                    (SPADCALL |param2|
                                                              (QREFELT $ 85))
                                                    (FLOAT 2
                                                           MOST-POSITIVE-DOUBLE-FLOAT))))
                                                 (QREFELT $ 160))
                                       (SPADCALL "style"
                                                 (STRCONC "fill:"
                                                          (QVELT |mat2| 2))
                                                 (QREFELT $ 160))))
                                (LETT |xch|
                                      (SPADCALL |nodeName| |nam| |nodeAttsTxt|
                                                (QREFELT $ 171)))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |xch| (QREFELT $ 172)))
                                   (LETT |nodeEles|
                                         (SPADCALL |nodeEles| |xch|
                                                   (QREFELT $ 165)))))))
                               (LETT #16# (CDR #16#)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #9#
                                  (SPADCALL "g" |nodeEles| |nodeAtts|
                                            (QREFELT $ 163)))
                            (GO #25=#:G1366))))))
                       (LETT |param2|
                             (SPADCALL |tran|
                                       (QVELT
                                        (PROG2 (LETT #13# (QVELT |n| 2))
                                            (QCDR #13#)
                                          (|check_union2| (QEQCAR #13# 2)
                                                          (|Record|
                                                           (|:| |txt|
                                                                (|String|))
                                                           (|:| |siz|
                                                                (|NonNegativeInteger|))
                                                           (|:| |pos|
                                                                (QREFELT $ 6))
                                                           (|:| |np|
                                                                (|List|
                                                                 (|String|))))
                                                          (|Union|
                                                           (|:| |points|
                                                                (|List|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6))))
                                                           (|:| |material|
                                                                (|Record|
                                                                 (|:|
                                                                  |lineWidth|
                                                                  (|DoubleFloat|))
                                                                 (|:| |lineCol|
                                                                      (|String|))
                                                                 (|:| |fillCol|
                                                                      (|String|))
                                                                 (|:|
                                                                  |matOpacity|
                                                                  (|DoubleFloat|))))
                                                           (|:| |text|
                                                                (|Record|
                                                                 (|:| |txt|
                                                                      (|String|))
                                                                 (|:| |siz|
                                                                      (|NonNegativeInteger|))
                                                                 (|:| |pos|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |np|
                                                                      (|List|
                                                                       (|String|)))))
                                                           (|:| |boundbox|
                                                                (|SBoundary|
                                                                 (QREFELT $
                                                                          6)))
                                                           (|:| |trans|
                                                                (|STransform|
                                                                 (QREFELT $
                                                                          6)))
                                                           (|:| |ifs|
                                                                (|Record|
                                                                 (|:| |inx|
                                                                      (|List|
                                                                       (|List|
                                                                        (|NonNegativeInteger|))))
                                                                 (|:| |pts|
                                                                      (|List|
                                                                       (QREFELT
                                                                        $
                                                                        6)))))
                                                           (|:| |arrws|
                                                                (|Record|
                                                                 (|:| |ln|
                                                                      (|List|
                                                                       (|List|
                                                                        (QREFELT
                                                                         $
                                                                         6))))
                                                                 (|:| |mode|
                                                                      (|Symbol|))
                                                                 (|:| |size|
                                                                      (|DoubleFloat|))))
                                                           (|:| |arrw|
                                                                (|Record|
                                                                 (|:| |st|
                                                                      (|String|))
                                                                 (|:| |en|
                                                                      (|String|))
                                                                 (|:| |offset|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |mode|
                                                                      (|Symbol|))
                                                                 (|:| |size|
                                                                      (|DoubleFloat|))))
                                                           (|:| |shpe|
                                                                (|Record|
                                                                 (|:| |shptype|
                                                                      (|Symbol|))
                                                                 (|:| |centre|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |size|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |fill|
                                                                      (|Boolean|))))
                                                           (|:| |nodename|
                                                                (|Record|
                                                                 (|:| |nme|
                                                                      (|String|))
                                                                 (|:| |node|
                                                                      $)))
                                                           (|:| |np|
                                                                (|SceneNamedPoints|
                                                                 (QREFELT $
                                                                          6)))
                                                           (|:| |empty| #23#))
                                                          #13#))
                                        2)
                                       (QREFELT $ 151)))
                       (LETT |textScale|
                             (|div_DF| |scale2|
                                       (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
                       (LETT |x|
                             (|mul_DF| (SPADCALL |param2| (QREFELT $ 84))
                                       (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
                       (LETT |y|
                             (|minus_DF|
                              (|mul_DF| (SPADCALL |param2| (QREFELT $ 85))
                                        (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))))
                       (COND
                        ((SPADCALL |textScale|
                                   (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                   (QREFELT $ 157))
                         (SEQ
                          (LETT |x|
                                (|div_DF| (|mul_DF| |x| |textScale|)
                                          (FLOAT 2
                                                 MOST-POSITIVE-DOUBLE-FLOAT)))
                          (LETT |y|
                                (|div_DF| (|mul_DF| |y| |textScale|)
                                          (FLOAT 2
                                                 MOST-POSITIVE-DOUBLE-FLOAT)))
                          (EXIT
                           (LETT |textScale|
                                 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))))))
                       (LETT |nodeAtts|
                             (LIST
                              (SPADCALL "font-size"
                                        (STRINGIMAGE
                                         (QVELT
                                          (PROG2 (LETT #13# (QVELT |n| 2))
                                              (QCDR #13#)
                                            (|check_union2| (QEQCAR #13# 2)
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|))))
                                                            (|Union|
                                                             (|:| |points|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |material|
                                                                  (|Record|
                                                                   (|:|
                                                                    |lineWidth|
                                                                    (|DoubleFloat|))
                                                                   (|:|
                                                                    |lineCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |fillCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |matOpacity|
                                                                    (|DoubleFloat|))))
                                                             (|:| |text|
                                                                  (|Record|
                                                                   (|:| |txt|
                                                                        (|String|))
                                                                   (|:| |siz|
                                                                        (|NonNegativeInteger|))
                                                                   (|:| |pos|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |np|
                                                                        (|List|
                                                                         (|String|)))))
                                                             (|:| |boundbox|
                                                                  (|SBoundary|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |trans|
                                                                  (|STransform|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |ifs|
                                                                  (|Record|
                                                                   (|:| |inx|
                                                                        (|List|
                                                                         (|List|
                                                                          (|NonNegativeInteger|))))
                                                                   (|:| |pts|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6)))))
                                                             (|:| |arrws|
                                                                  (|Record|
                                                                   (|:| |ln|
                                                                        (|List|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6))))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |arrw|
                                                                  (|Record|
                                                                   (|:| |st|
                                                                        (|String|))
                                                                   (|:| |en|
                                                                        (|String|))
                                                                   (|:|
                                                                    |offset|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |shpe|
                                                                  (|Record|
                                                                   (|:|
                                                                    |shptype|
                                                                    (|Symbol|))
                                                                   (|:|
                                                                    |centre|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |size|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |fill|
                                                                        (|Boolean|))))
                                                             (|:| |nodename|
                                                                  (|Record|
                                                                   (|:| |nme|
                                                                        (|String|))
                                                                   (|:| |node|
                                                                        $)))
                                                             (|:| |np|
                                                                  (|SceneNamedPoints|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |empty|
                                                                  #23#))
                                                            #13#))
                                          1))
                                        (QREFELT $ 160))
                              (SPADCALL "transform"
                                        (SPADCALL
                                         (LIST "scale("
                                               (|mathObject2String|
                                                |textScale|)
                                               ","
                                               (|mathObject2String|
                                                |textScale|)
                                               ")")
                                         (QREFELT $ 120))
                                        (QREFELT $ 160))
                              (SPADCALL "x" (|mathObject2String| |x|)
                                        (QREFELT $ 160))
                              (SPADCALL "y" (|mathObject2String| |y|)
                                        (QREFELT $ 160))
                              (SPADCALL "style"
                                        (STRCONC "fill:" (QVELT |mat2| 2))
                                        (QREFELT $ 160))))
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (SPADCALL |nodeName|
                                         (QVELT
                                          (PROG2 (LETT #13# (QVELT |n| 2))
                                              (QCDR #13#)
                                            (|check_union2| (QEQCAR #13# 2)
                                                            (|Record|
                                                             (|:| |txt|
                                                                  (|String|))
                                                             (|:| |siz|
                                                                  (|NonNegativeInteger|))
                                                             (|:| |pos|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |np|
                                                                  (|List|
                                                                   (|String|))))
                                                            (|Union|
                                                             (|:| |points|
                                                                  (|List|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6))))
                                                             (|:| |material|
                                                                  (|Record|
                                                                   (|:|
                                                                    |lineWidth|
                                                                    (|DoubleFloat|))
                                                                   (|:|
                                                                    |lineCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |fillCol|
                                                                    (|String|))
                                                                   (|:|
                                                                    |matOpacity|
                                                                    (|DoubleFloat|))))
                                                             (|:| |text|
                                                                  (|Record|
                                                                   (|:| |txt|
                                                                        (|String|))
                                                                   (|:| |siz|
                                                                        (|NonNegativeInteger|))
                                                                   (|:| |pos|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |np|
                                                                        (|List|
                                                                         (|String|)))))
                                                             (|:| |boundbox|
                                                                  (|SBoundary|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |trans|
                                                                  (|STransform|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |ifs|
                                                                  (|Record|
                                                                   (|:| |inx|
                                                                        (|List|
                                                                         (|List|
                                                                          (|NonNegativeInteger|))))
                                                                   (|:| |pts|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6)))))
                                                             (|:| |arrws|
                                                                  (|Record|
                                                                   (|:| |ln|
                                                                        (|List|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6))))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |arrw|
                                                                  (|Record|
                                                                   (|:| |st|
                                                                        (|String|))
                                                                   (|:| |en|
                                                                        (|String|))
                                                                   (|:|
                                                                    |offset|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |mode|
                                                                        (|Symbol|))
                                                                   (|:| |size|
                                                                        (|DoubleFloat|))))
                                                             (|:| |shpe|
                                                                  (|Record|
                                                                   (|:|
                                                                    |shptype|
                                                                    (|Symbol|))
                                                                   (|:|
                                                                    |centre|
                                                                    (QREFELT $
                                                                             6))
                                                                   (|:| |size|
                                                                        (QREFELT
                                                                         $ 6))
                                                                   (|:| |fill|
                                                                        (|Boolean|))))
                                                             (|:| |nodename|
                                                                  (|Record|
                                                                   (|:| |nme|
                                                                        (|String|))
                                                                   (|:| |node|
                                                                        $)))
                                                             (|:| |np|
                                                                  (|SceneNamedPoints|
                                                                   (QREFELT $
                                                                            6)))
                                                             (|:| |empty|
                                                                  #23#))
                                                            #13#))
                                          0)
                                         |nodeAtts| (QREFELT $ 171)))
                         (GO #25#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ (LETT |nodeName| "g")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 4))
                         (|error|
                          "toSVG parameter type not valid for trans node")))
                       (EXIT
                        (LETT |tran2|
                              (SPADCALL
                               (PROG2 (LETT #12# (QVELT |n| 2))
                                   (QCDR #12#)
                                 (|check_union2| (QEQCAR #12# 4)
                                                 (|STransform| (QREFELT $ 6))
                                                 (|Union|
                                                  (|:| |points|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |material|
                                                       (|Record|
                                                        (|:| |lineWidth|
                                                             (|DoubleFloat|))
                                                        (|:| |lineCol|
                                                             (|String|))
                                                        (|:| |fillCol|
                                                             (|String|))
                                                        (|:| |matOpacity|
                                                             (|DoubleFloat|))))
                                                  (|:| |text|
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|)))))
                                                  (|:| |boundbox|
                                                       (|SBoundary|
                                                        (QREFELT $ 6)))
                                                  (|:| |trans|
                                                       (|STransform|
                                                        (QREFELT $ 6)))
                                                  (|:| |ifs|
                                                       (|Record|
                                                        (|:| |inx|
                                                             (|List|
                                                              (|List|
                                                               (|NonNegativeInteger|))))
                                                        (|:| |pts|
                                                             (|List|
                                                              (QREFELT $ 6)))))
                                                  (|:| |arrws|
                                                       (|Record|
                                                        (|:| |ln|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                                  (|:| |arrw|
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|))))
                                                  (|:| |shpe|
                                                       (|Record|
                                                        (|:| |shptype|
                                                             (|Symbol|))
                                                        (|:| |centre|
                                                             (QREFELT $ 6))
                                                        (|:| |size|
                                                             (QREFELT $ 6))
                                                        (|:| |fill|
                                                             (|Boolean|))))
                                                  (|:| |nodename|
                                                       (|Record|
                                                        (|:| |nme| (|String|))
                                                        (|:| |node| $)))
                                                  (|:| |np|
                                                       (|SceneNamedPoints|
                                                        (QREFELT $ 6)))
                                                  (|:| |empty| #23#))
                                                 #12#))
                               |tran| (QREFELT $ 173)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ (LETT |nodeName| "g") (LETT |clipEn2| 'T)
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 3))
                         (|error|
                          "toSVG parameter type not valid for clip node")))
                       (EXIT
                        (LETT |bb2|
                              (PROG2 (LETT #11# (QVELT |n| 2))
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 3)
                                                (|SBoundary| (QREFELT $ 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #23#))
                                                #11#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ (LETT |nodeName| "path")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 5))
                         (|error|
                          "toSVG parameter type not valid for ifs node")))
                       (LETT |nodeAtts|
                             (LIST
                              (SPADCALL "d"
                                        (|SCENE;faceString|
                                         (PROG2 (LETT #10# (QVELT |n| 2))
                                             (QCDR #10#)
                                           (|check_union2| (QEQCAR #10# 5)
                                                           (|Record|
                                                            (|:| |inx|
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|))))
                                                            (|:| |pts|
                                                                 (|List|
                                                                  (QREFELT $
                                                                           6))))
                                                           (|Union|
                                                            (|:| |points|
                                                                 (|List|
                                                                  (|List|
                                                                   (QREFELT $
                                                                            6))))
                                                            (|:| |material|
                                                                 (|Record|
                                                                  (|:|
                                                                   |lineWidth|
                                                                   (|DoubleFloat|))
                                                                  (|:|
                                                                   |lineCol|
                                                                   (|String|))
                                                                  (|:|
                                                                   |fillCol|
                                                                   (|String|))
                                                                  (|:|
                                                                   |matOpacity|
                                                                   (|DoubleFloat|))))
                                                            (|:| |text|
                                                                 (|Record|
                                                                  (|:| |txt|
                                                                       (|String|))
                                                                  (|:| |siz|
                                                                       (|NonNegativeInteger|))
                                                                  (|:| |pos|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |np|
                                                                       (|List|
                                                                        (|String|)))))
                                                            (|:| |boundbox|
                                                                 (|SBoundary|
                                                                  (QREFELT $
                                                                           6)))
                                                            (|:| |trans|
                                                                 (|STransform|
                                                                  (QREFELT $
                                                                           6)))
                                                            (|:| |ifs|
                                                                 (|Record|
                                                                  (|:| |inx|
                                                                       (|List|
                                                                        (|List|
                                                                         (|NonNegativeInteger|))))
                                                                  (|:| |pts|
                                                                       (|List|
                                                                        (QREFELT
                                                                         $
                                                                         6)))))
                                                            (|:| |arrws|
                                                                 (|Record|
                                                                  (|:| |ln|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6))))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|))))
                                                            (|:| |arrw|
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|))))
                                                            (|:| |shpe|
                                                                 (|Record|
                                                                  (|:|
                                                                   |shptype|
                                                                   (|Symbol|))
                                                                  (|:| |centre|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |size|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |fill|
                                                                       (|Boolean|))))
                                                            (|:| |nodename|
                                                                 (|Record|
                                                                  (|:| |nme|
                                                                       (|String|))
                                                                  (|:| |node|
                                                                       $)))
                                                            (|:| |np|
                                                                 (|SceneNamedPoints|
                                                                  (QREFELT $
                                                                           6)))
                                                            (|:| |empty| #23#))
                                                           #10#))
                                         |tran2| |bb2| |scale2| |clipEn2| $)
                                        (QREFELT $ 160))
                              (SPADCALL "fill" (QVELT |mat2| 2)
                                        (QREFELT $ 160))
                              (SPADCALL "stroke" (QVELT |mat2| 1)
                                        (QREFELT $ 160))
                              (SPADCALL "stroke-width"
                                        (|mathObject2String| (QVELT |mat2| 0))
                                        (QREFELT $ 160))))
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (SPADCALL |nodeName| NIL |nodeAtts|
                                         (QREFELT $ 163)))
                         (GO #25#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ (LETT |nodeName| "g")
                       (COND
                        ((NULL (QEQCAR (QVELT |n| 2) 6))
                         (|error|
                          "toSVG parameter type not valid for arrws node")))
                       (EXIT
                        (LETT |nodeEles|
                              (|SCENE;lineArrow|
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2))
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |material|
                                                        (|Record|
                                                         (|:| |lineWidth|
                                                              (|DoubleFloat|))
                                                         (|:| |lineCol|
                                                              (|String|))
                                                         (|:| |fillCol|
                                                              (|String|))
                                                         (|:| |matOpacity|
                                                              (|DoubleFloat|))))
                                                   (|:| |text|
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT $ 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT $ 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |arrw|
                                                        (|Record|
                                                         (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT $ 6))
                                                         (|:| |size|
                                                              (QREFELT $ 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT $ 6)))
                                                   (|:| |empty| #23#))
                                                  #8#))
                                0)
                               |tran2| |bb2| |mat2| |scale2| |clipEn2|
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2))
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |material|
                                                        (|Record|
                                                         (|:| |lineWidth|
                                                              (|DoubleFloat|))
                                                         (|:| |lineCol|
                                                              (|String|))
                                                         (|:| |fillCol|
                                                              (|String|))
                                                         (|:| |matOpacity|
                                                              (|DoubleFloat|))))
                                                   (|:| |text|
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT $ 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT $ 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |arrw|
                                                        (|Record|
                                                         (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT $ 6))
                                                         (|:| |size|
                                                              (QREFELT $ 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT $ 6)))
                                                   (|:| |empty| #23#))
                                                  #8#))
                                1)
                               (QVELT
                                (PROG2 (LETT #8# (QVELT |n| 2))
                                    (QCDR #8#)
                                  (|check_union2| (QEQCAR #8# 6)
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  (|Union|
                                                   (|:| |points|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |material|
                                                        (|Record|
                                                         (|:| |lineWidth|
                                                              (|DoubleFloat|))
                                                         (|:| |lineCol|
                                                              (|String|))
                                                         (|:| |fillCol|
                                                              (|String|))
                                                         (|:| |matOpacity|
                                                              (|DoubleFloat|))))
                                                   (|:| |text|
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                                   (|:| |boundbox|
                                                        (|SBoundary|
                                                         (QREFELT $ 6)))
                                                   (|:| |trans|
                                                        (|STransform|
                                                         (QREFELT $ 6)))
                                                   (|:| |ifs|
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $
                                                                        6)))))
                                                   (|:| |arrws|
                                                        (|Record|
                                                         (|:| |ln|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |arrw|
                                                        (|Record|
                                                         (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                                   (|:| |shpe|
                                                        (|Record|
                                                         (|:| |shptype|
                                                              (|Symbol|))
                                                         (|:| |centre|
                                                              (QREFELT $ 6))
                                                         (|:| |size|
                                                              (QREFELT $ 6))
                                                         (|:| |fill|
                                                              (|Boolean|))))
                                                   (|:| |nodename|
                                                        (|Record|
                                                         (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                                   (|:| |np|
                                                        (|SceneNamedPoints|
                                                         (QREFELT $ 6)))
                                                   (|:| |empty| #23#))
                                                  #8#))
                                2)
                               $))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROW)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 7))
                     (|error| "toSVG parameter type not valid for arrw node")))
                   (LETT |startPoint|
                         (SPADCALL |tran|
                                   (SPADCALL
                                    (SPADCALL |np2|
                                              (QVELT
                                               (PROG2 (LETT #5# (QVELT |n| 2))
                                                   (QCDR #5#)
                                                 (|check_union2| (QEQCAR #5# 7)
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|)))
                                                                 (|Union|
                                                                  (|:| |points|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6))))
                                                                  (|:|
                                                                   |material|
                                                                   (|Record|
                                                                    (|:|
                                                                     |lineWidth|
                                                                     (|DoubleFloat|))
                                                                    (|:|
                                                                     |lineCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |fillCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |matOpacity|
                                                                     (|DoubleFloat|))))
                                                                  (|:| |text|
                                                                       (|Record|
                                                                        (|:|
                                                                         |txt|
                                                                         (|String|))
                                                                        (|:|
                                                                         |siz|
                                                                         (|NonNegativeInteger|))
                                                                        (|:|
                                                                         |pos|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |np|
                                                                         (|List|
                                                                          (|String|)))))
                                                                  (|:|
                                                                   |boundbox|
                                                                   (|SBoundary|
                                                                    (QREFELT $
                                                                             6)))
                                                                  (|:| |trans|
                                                                       (|STransform|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |ifs|
                                                                       (|Record|
                                                                        (|:|
                                                                         |inx|
                                                                         (|List|
                                                                          (|List|
                                                                           (|NonNegativeInteger|))))
                                                                        (|:|
                                                                         |pts|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6)))))
                                                                  (|:| |arrws|
                                                                       (|Record|
                                                                        (|:|
                                                                         |ln|
                                                                         (|List|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            6))))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |arrw|
                                                                       (|Record|
                                                                        (|:|
                                                                         |st|
                                                                         (|String|))
                                                                        (|:|
                                                                         |en|
                                                                         (|String|))
                                                                        (|:|
                                                                         |offset|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |shpe|
                                                                       (|Record|
                                                                        (|:|
                                                                         |shptype|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |centre|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |size|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |fill|
                                                                         (|Boolean|))))
                                                                  (|:|
                                                                   |nodename|
                                                                   (|Record|
                                                                    (|:| |nme|
                                                                         (|String|))
                                                                    (|:| |node|
                                                                         $)))
                                                                  (|:| |np|
                                                                       (|SceneNamedPoints|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |empty|
                                                                       #23#))
                                                                 #5#))
                                               0)
                                              (QREFELT $ 170))
                                    (QVELT
                                     (PROG2 (LETT #5# (QVELT |n| 2))
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 7)
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #23#))
                                                       #5#))
                                     2)
                                    (QREFELT $ 105))
                                   (QREFELT $ 151)))
                   (LETT |endPoint|
                         (SPADCALL |tran|
                                   (SPADCALL
                                    (SPADCALL |np2|
                                              (QVELT
                                               (PROG2 (LETT #5# (QVELT |n| 2))
                                                   (QCDR #5#)
                                                 (|check_union2| (QEQCAR #5# 7)
                                                                 (|Record|
                                                                  (|:| |st|
                                                                       (|String|))
                                                                  (|:| |en|
                                                                       (|String|))
                                                                  (|:| |offset|
                                                                       (QREFELT
                                                                        $ 6))
                                                                  (|:| |mode|
                                                                       (|Symbol|))
                                                                  (|:| |size|
                                                                       (|DoubleFloat|)))
                                                                 (|Union|
                                                                  (|:| |points|
                                                                       (|List|
                                                                        (|List|
                                                                         (QREFELT
                                                                          $
                                                                          6))))
                                                                  (|:|
                                                                   |material|
                                                                   (|Record|
                                                                    (|:|
                                                                     |lineWidth|
                                                                     (|DoubleFloat|))
                                                                    (|:|
                                                                     |lineCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |fillCol|
                                                                     (|String|))
                                                                    (|:|
                                                                     |matOpacity|
                                                                     (|DoubleFloat|))))
                                                                  (|:| |text|
                                                                       (|Record|
                                                                        (|:|
                                                                         |txt|
                                                                         (|String|))
                                                                        (|:|
                                                                         |siz|
                                                                         (|NonNegativeInteger|))
                                                                        (|:|
                                                                         |pos|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |np|
                                                                         (|List|
                                                                          (|String|)))))
                                                                  (|:|
                                                                   |boundbox|
                                                                   (|SBoundary|
                                                                    (QREFELT $
                                                                             6)))
                                                                  (|:| |trans|
                                                                       (|STransform|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |ifs|
                                                                       (|Record|
                                                                        (|:|
                                                                         |inx|
                                                                         (|List|
                                                                          (|List|
                                                                           (|NonNegativeInteger|))))
                                                                        (|:|
                                                                         |pts|
                                                                         (|List|
                                                                          (QREFELT
                                                                           $
                                                                           6)))))
                                                                  (|:| |arrws|
                                                                       (|Record|
                                                                        (|:|
                                                                         |ln|
                                                                         (|List|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            6))))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |arrw|
                                                                       (|Record|
                                                                        (|:|
                                                                         |st|
                                                                         (|String|))
                                                                        (|:|
                                                                         |en|
                                                                         (|String|))
                                                                        (|:|
                                                                         |offset|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |mode|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |size|
                                                                         (|DoubleFloat|))))
                                                                  (|:| |shpe|
                                                                       (|Record|
                                                                        (|:|
                                                                         |shptype|
                                                                         (|Symbol|))
                                                                        (|:|
                                                                         |centre|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |size|
                                                                         (QREFELT
                                                                          $ 6))
                                                                        (|:|
                                                                         |fill|
                                                                         (|Boolean|))))
                                                                  (|:|
                                                                   |nodename|
                                                                   (|Record|
                                                                    (|:| |nme|
                                                                         (|String|))
                                                                    (|:| |node|
                                                                         $)))
                                                                  (|:| |np|
                                                                       (|SceneNamedPoints|
                                                                        (QREFELT
                                                                         $ 6)))
                                                                  (|:| |empty|
                                                                       #23#))
                                                                 #5#))
                                               1)
                                              (QREFELT $ 170))
                                    (QVELT
                                     (PROG2 (LETT #5# (QVELT |n| 2))
                                         (QCDR #5#)
                                       (|check_union2| (QEQCAR #5# 7)
                                                       (|Record|
                                                        (|:| |st| (|String|))
                                                        (|:| |en| (|String|))
                                                        (|:| |offset|
                                                             (QREFELT $ 6))
                                                        (|:| |mode| (|Symbol|))
                                                        (|:| |size|
                                                             (|DoubleFloat|)))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #23#))
                                                       #5#))
                                     2)
                                    (QREFELT $ 105))
                                   (QREFELT $ 151)))
                   (LETT |startPointM|
                         (|minus_DF|
                          (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 85))
                                    |scale|)))
                   (LETT |endPointM|
                         (|minus_DF|
                          (|mul_DF| (SPADCALL |endPoint| (QREFELT $ 85))
                                    |scale|)))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       0)
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       1))
                     (LETT |ptStr|
                           (SPADCALL
                            (LIST "M"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |startPoint| (QREFELT $ 84))
                                    |scale|))
                                  "," (|mathObject2String| |startPointM|)
                                  "c -50,25 -50,-50 0,-25")
                            (QREFELT $ 120))))
                    (#24#
                     (LETT |ptStr|
                           (SPADCALL
                            (LIST "M"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |startPoint| (QREFELT $ 84))
                                    |scale|))
                                  "," (|mathObject2String| |startPointM|) "L"
                                  (|mathObject2String|
                                   (|mul_DF|
                                    (SPADCALL |endPoint| (QREFELT $ 84))
                                    |scale|))
                                  "," (|mathObject2String| |endPointM|))
                            (QREFELT $ 120)))))
                   (LETT |linWidth|
                         (QVELT
                          (PROG2 (LETT #5# (QVELT |n| 2))
                              (QCDR #5#)
                            (|check_union2| (QEQCAR #5# 7)
                                            (|Record| (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #23#))
                                            #5#))
                          4))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       3)
                      '|proportional|)
                     (LETT |linWidth|
                           (|mul_DF|
                            (SPADCALL
                             (SPADCALL (SPADCALL |bb2| (QREFELT $ 40))
                                       (SPADCALL |bb2| (QREFELT $ 41))
                                       (QREFELT $ 42))
                             (QREFELT $ 84))
                            (QVELT
                             (PROG2 (LETT #5# (QVELT |n| 2))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 7)
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|)))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #23#))
                                               #5#))
                             4)))))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #5# (QVELT |n| 2))
                           (QCDR #5#)
                         (|check_union2| (QEQCAR #5# 7)
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #23#))
                                         #5#))
                       3)
                      '|variable|)
                     (LETT |linWidth|
                           (|mul_DF|
                            (SPADCALL |startPoint| |endPoint| (QREFELT $ 154))
                            (QVELT
                             (PROG2 (LETT #5# (QVELT |n| 2))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 7)
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|)))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #23#))
                                               #5#))
                             4)))))
                   (LETT |nodeAtts|
                         (LIST (SPADCALL "d" |ptStr| (QREFELT $ 160))
                               (SPADCALL "fill" "none" (QREFELT $ 160))
                               (SPADCALL "stroke" (QVELT |mat| 1)
                                         (QREFELT $ 160))
                               (SPADCALL "stroke-width"
                                         (|mathObject2String| |linWidth|)
                                         (QREFELT $ 160))
                               (SPADCALL "style" "marker-end:url(#Arrow)"
                                         (QREFELT $ 160))))
                   (LETT |nodeEles|
                         (LIST
                          (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 163))))
                   (EXIT (LETT |nodeName| "g")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 10))
                     (|error| "toSVG parameter type not valid for np node")))
                   (SPADCALL |np2| "points"
                             (PROG2 (LETT #4# (QVELT |n| 2))
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 10)
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #23#))
                                               #4#))
                             (QREFELT $ 174))
                   (EXIT (LETT |nodeName| "g")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 9))
                     (|error| "toSVG parameter type not valid for def node")))
                   (LETT |nn|
                         (PROG2 (LETT #3# (QVELT |n| 2))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 9)
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| $))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #23#))
                                           #3#)))
                   (LETT |name| (QCAR |nn|)) (LETT |nde| (QCDR |nn|))
                   (LETT |nodeName| "g")
                   (SPADCALL |np2| |name| |nde| (QREFELT $ 176))
                   (LETT |xch|
                         (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2|
                                   |clipEn2| |useInteger| |np2|
                                   (QREFELT $ 177)))
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |xch| (QREFELT $ 172)))
                      (LETT |nodeEles|
                            (SPADCALL |nodeEles| |xch| (QREFELT $ 165)))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 9))
                     (|error| "toSVG parameter type not valid for use node")))
                   (LETT |nn|
                         (PROG2 (LETT #3# (QVELT |n| 2))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 9)
                                           (|Record| (|:| |nme| (|String|))
                                                     (|:| |node| $))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #23#))
                                           #3#)))
                   (LETT |name| (QCAR |nn|))
                   (LETT |nde| (SPADCALL |np2| |name| (QREFELT $ 178)))
                   (LETT |nodeName| "g")
                   (LETT |xch|
                         (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2|
                                   |clipEn2| |useInteger| |np2|
                                   (QREFELT $ 177)))
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |xch| (QREFELT $ 172)))
                      (LETT |nodeEles|
                            (SPADCALL |nodeEles| |xch| (QREFELT $ 165)))))))))
                (EXIT
                 (COND
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 179)) 1)
                   (SPADCALL |nodeName| |nodeEles| |nodeAtts| (QREFELT $ 163)))
                  (#24#
                   (SEQ
                    (SEQ (LETT |ch| NIL) (LETT #1# (QVELT |n| 1)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |xch|
                                (SPADCALL |ch| |mat2| |tran2| |bb2| |scale2|
                                          |clipEn2| |useInteger| |np2|
                                          (QREFELT $ 177)))
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |xch| (QREFELT $ 172)))
                             (LETT |nodeEles|
                                   (SPADCALL |nodeEles| |xch|
                                             (QREFELT $ 165)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                               (QREFELT $ 163)))))))))
          #25# (EXIT #9#)))) 

(SDEFUN |SCENE;toSVG;$RStRDf2BSnpXe;85|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT))
         (|scale| |DoubleFloat|) (|clipEn| |Boolean|) (|useInteger| |Boolean|)
         (|npt| |SceneNamedPoints| PT) ($ |XmlElement|))
        (SPADCALL |n| |mat| |tran|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10)) |scale|
                  |clipEn| |useInteger| |npt| (QREFELT $ 177))) 

(SDEFUN |SCENE;writeSvg;$SV;86| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 181)))
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      1.0 NIL NIL (SPADCALL NIL NIL (QREFELT $ 182))
                      (QREFELT $ 177))
            |filename| (QREFELT $ 184)))))) 

(SDEFUN |SCENE;writeSvgQuantised;$SV;87|
        ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 181)))
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      1.0 NIL 'T (SPADCALL NIL NIL (QREFELT $ 182))
                      (QREFELT $ 177))
            |filename| (QREFELT $ 184)))))) 

(SDEFUN |SCENE;boundary1|
        ((|n| $) (|tran| . #1=(|STransform| PT)) (|scale| |DoubleFloat|)
         (|useInteger| |Boolean|) (|npt| |SceneNamedPoints| PT)
         (|fontScale| . #2=(|DoubleFloat|)) ($ . #3=(|SBoundary| PT)))
        (SPROG
         ((|res| (|SBoundary| PT)) (|res2| #3#) (#4=#:G1437 NIL) (|ch| NIL)
          (#5=#:G1436 NIL) (|p| NIL) (#6=#:G1435 NIL) (|lp| NIL)
          (|pts2| (|List| (|List| PT))) (#7=#:G1393 NIL) (#8=#:G1434 NIL)
          (#9=#:G1392 NIL) (|tran2| #1#) (#10=#:G1391 NIL) (|pt2| (PT))
          (|pt1| (PT)) (#11=#:G1389 NIL) (|w| #12=(|DoubleFloat|)) (|h| #12#)
          (#13=#:G1431 NIL) (#14=#:G1395 NIL) (#15=#:G1433 NIL)
          (#16=#:G1432 NIL) (|pts| (|List| (|List| PT))) (#17=#:G1387 NIL)
          (|fontScale2| #2#) (|maxx| #18=(|DoubleFloat|)) (|minx| #18#)
          (|bb2| (|SBoundary| PT)) (#19=#:G1390 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (SPADCALL (QREFELT $ 16)))
                (LETT |fontScale2| |fontScale|) (LETT |tran2| |tran|)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ
                   (LETT |bb2|
                         (PROG2 (LETT #19# (QVELT |n| 2))
                             (QCDR #19#)
                           (|check_union2| (QEQCAR #19# 3)
                                           (|SBoundary| (QREFELT $ 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #20="empty"))
                                           #19#)))
                   (COND
                    ((NULL (SPADCALL |bb2| (QREFELT $ 166)))
                     (SEQ
                      (LETT |minx|
                            (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                      (QREFELT $ 84)))
                      (LETT |maxx|
                            (SPADCALL (SPADCALL |bb2| (QREFELT $ 40))
                                      (QREFELT $ 84)))
                      (EXIT
                       (LETT |fontScale2|
                             (|div_DF| (|sub_DF| |maxx| |minx|)
                                       (FLOAT 1000
                                              MOST-POSITIVE-DOUBLE-FLOAT)))))))
                   (EXIT (LETT |res| (SPADCALL (QREFELT $ 16)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'GROUP)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (LETT |pts|
                         (PROG2 (LETT #17# (QVELT |n| 2))
                             (QCDR #17#)
                           (|check_union2| (QEQCAR #17# 0)
                                           (|List| (|List| (QREFELT $ 6)))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #20#))
                                           #17#)))
                   (EXIT
                    (SEQ (LETT |lp| NIL) (LETT #16# |pts|) G190
                         (COND
                          ((OR (ATOM #16#) (PROGN (LETT |lp| (CAR #16#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |p| NIL) (LETT #15# |lp|) G190
                                (COND
                                 ((OR (ATOM #15#)
                                      (PROGN (LETT |p| (CAR #15#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL |tran| |p|
                                                            (QREFELT $ 151))
                                                  (QREFELT $ 187)))))
                                (LETT #15# (CDR #15#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (SEQ
                   (LETT |pt1|
                         (QVELT
                          (PROG2 (LETT #14# (QVELT |n| 2))
                              (QCDR #14#)
                            (|check_union2| (QEQCAR #14# 8)
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT $ 6))
                                             (|:| |size| (QREFELT $ 6))
                                             (|:| |fill| (|Boolean|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #20#))
                                            #14#))
                          1))
                   (LETT |pt2|
                         (QVELT
                          (PROG2 (LETT #14# (QVELT |n| 2))
                              (QCDR #14#)
                            (|check_union2| (QEQCAR #14# 8)
                                            (|Record|
                                             (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT $ 6))
                                             (|:| |size| (QREFELT $ 6))
                                             (|:| |fill| (|Boolean|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #20#))
                                            #14#))
                          2))
                   (COND
                    ((EQUAL
                      (QVELT
                       (PROG2 (LETT #14# (QVELT |n| 2))
                           (QCDR #14#)
                         (|check_union2| (QEQCAR #14# 8)
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|)))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #20#))
                                         #14#))
                       0)
                      '|ellipse|)
                     (PROGN
                      (LETT #13#
                            (SPADCALL (SPADCALL |tran| |pt1| (QREFELT $ 151))
                                      |pt2| (QREFELT $ 188)))
                      (GO #21=#:G1430))))
                   (LETT |res|
                         (SPADCALL |res|
                                   (SPADCALL |tran| |pt1| (QREFELT $ 151))
                                   (QREFELT $ 187)))
                   (EXIT
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL |tran|
                                              (SPADCALL |pt1| |pt2|
                                                        (QREFELT $ 105))
                                              (QREFELT $ 151))
                                    (QREFELT $ 187)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TEXT)
                  (SEQ
                   (LETT |h|
                         (|mul_DF| |fontScale|
                                   (FLOAT
                                    (QVELT
                                     (PROG2 (LETT #11# (QVELT |n| 2))
                                         (QCDR #11#)
                                       (|check_union2| (QEQCAR #11# 2)
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|))))
                                                       (|Union|
                                                        (|:| |points|
                                                             (|List|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|:| |material|
                                                             (|Record|
                                                              (|:| |lineWidth|
                                                                   (|DoubleFloat|))
                                                              (|:| |lineCol|
                                                                   (|String|))
                                                              (|:| |fillCol|
                                                                   (|String|))
                                                              (|:| |matOpacity|
                                                                   (|DoubleFloat|))))
                                                        (|:| |text|
                                                             (|Record|
                                                              (|:| |txt|
                                                                   (|String|))
                                                              (|:| |siz|
                                                                   (|NonNegativeInteger|))
                                                              (|:| |pos|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |np|
                                                                   (|List|
                                                                    (|String|)))))
                                                        (|:| |boundbox|
                                                             (|SBoundary|
                                                              (QREFELT $ 6)))
                                                        (|:| |trans|
                                                             (|STransform|
                                                              (QREFELT $ 6)))
                                                        (|:| |ifs|
                                                             (|Record|
                                                              (|:| |inx|
                                                                   (|List|
                                                                    (|List|
                                                                     (|NonNegativeInteger|))))
                                                              (|:| |pts|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             6)))))
                                                        (|:| |arrws|
                                                             (|Record|
                                                              (|:| |ln|
                                                                   (|List|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6))))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |arrw|
                                                             (|Record|
                                                              (|:| |st|
                                                                   (|String|))
                                                              (|:| |en|
                                                                   (|String|))
                                                              (|:| |offset|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |mode|
                                                                   (|Symbol|))
                                                              (|:| |size|
                                                                   (|DoubleFloat|))))
                                                        (|:| |shpe|
                                                             (|Record|
                                                              (|:| |shptype|
                                                                   (|Symbol|))
                                                              (|:| |centre|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |size|
                                                                   (QREFELT $
                                                                            6))
                                                              (|:| |fill|
                                                                   (|Boolean|))))
                                                        (|:| |nodename|
                                                             (|Record|
                                                              (|:| |nme|
                                                                   (|String|))
                                                              (|:| |node| $)))
                                                        (|:| |np|
                                                             (|SceneNamedPoints|
                                                              (QREFELT $ 6)))
                                                        (|:| |empty| #20#))
                                                       #11#))
                                     1)
                                    MOST-POSITIVE-DOUBLE-FLOAT)))
                   (LETT |w|
                         (|mul_DF|
                          (|mul_DF|
                           (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 93))
                                     (QREFELT $ 94))
                           |h|)
                          (FLOAT
                           (QCSIZE
                            (QVELT
                             (PROG2 (LETT #11# (QVELT |n| 2))
                                 (QCDR #11#)
                               (|check_union2| (QEQCAR #11# 2)
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                               (|Union|
                                                (|:| |points|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |material|
                                                     (|Record|
                                                      (|:| |lineWidth|
                                                           (|DoubleFloat|))
                                                      (|:| |lineCol|
                                                           (|String|))
                                                      (|:| |fillCol|
                                                           (|String|))
                                                      (|:| |matOpacity|
                                                           (|DoubleFloat|))))
                                                (|:| |text|
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|)))))
                                                (|:| |boundbox|
                                                     (|SBoundary|
                                                      (QREFELT $ 6)))
                                                (|:| |trans|
                                                     (|STransform|
                                                      (QREFELT $ 6)))
                                                (|:| |ifs|
                                                     (|Record|
                                                      (|:| |inx|
                                                           (|List|
                                                            (|List|
                                                             (|NonNegativeInteger|))))
                                                      (|:| |pts|
                                                           (|List|
                                                            (QREFELT $ 6)))))
                                                (|:| |arrws|
                                                     (|Record|
                                                      (|:| |ln|
                                                           (|List|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |arrw|
                                                     (|Record|
                                                      (|:| |st| (|String|))
                                                      (|:| |en| (|String|))
                                                      (|:| |offset|
                                                           (QREFELT $ 6))
                                                      (|:| |mode| (|Symbol|))
                                                      (|:| |size|
                                                           (|DoubleFloat|))))
                                                (|:| |shpe|
                                                     (|Record|
                                                      (|:| |shptype|
                                                           (|Symbol|))
                                                      (|:| |centre|
                                                           (QREFELT $ 6))
                                                      (|:| |size|
                                                           (QREFELT $ 6))
                                                      (|:| |fill|
                                                           (|Boolean|))))
                                                (|:| |nodename|
                                                     (|Record|
                                                      (|:| |nme| (|String|))
                                                      (|:| |node| $)))
                                                (|:| |np|
                                                     (|SceneNamedPoints|
                                                      (QREFELT $ 6)))
                                                (|:| |empty| #20#))
                                               #11#))
                             0))
                           MOST-POSITIVE-DOUBLE-FLOAT)))
                   (LETT |pt1|
                         (QVELT
                          (PROG2 (LETT #11# (QVELT |n| 2))
                              (QCDR #11#)
                            (|check_union2| (QEQCAR #11# 2)
                                            (|Record| (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #20#))
                                            #11#))
                          2))
                   (LETT |res|
                         (SPADCALL |res|
                                   (SPADCALL |tran| |pt1| (QREFELT $ 151))
                                   (QREFELT $ 187)))
                   (LETT |pt2|
                         (SPADCALL |pt1| (SPADCALL |w| |h| (QREFELT $ 86))
                                   (QREFELT $ 105)))
                   (EXIT
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL |tran| |pt2| (QREFELT $ 151))
                                    (QREFELT $ 187)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (LETT |tran2|
                        (SPADCALL
                         (PROG2 (LETT #10# (QVELT |n| 2))
                             (QCDR #10#)
                           (|check_union2| (QEQCAR #10# 4)
                                           (|STransform| (QREFELT $ 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #20#))
                                           #10#))
                         |tran| (QREFELT $ 173)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ
                   (LETT |pts2|
                         (QCDR
                          (PROG2 (LETT #9# (QVELT |n| 2))
                              (QCDR #9#)
                            (|check_union2| (QEQCAR #9# 5)
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT $ 6))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #20#))
                                            #9#))))
                   (EXIT
                    (SEQ (LETT |p| NIL) (LETT #8# |pts2|) G190
                         (COND
                          ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL |tran| |p|
                                                     (QREFELT $ 151))
                                           (QREFELT $ 187)))))
                         (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ
                   (LETT |pts2|
                         (QVELT
                          (PROG2 (LETT #7# (QVELT |n| 2))
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 6)
                                            (|Record|
                                             (|:| |ln|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |mode| (|Symbol|))
                                             (|:| |size| (|DoubleFloat|)))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #20#))
                                            #7#))
                          0))
                   (EXIT
                    (SEQ (LETT |lp| NIL) (LETT #6# |pts2|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |lp| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |p| NIL) (LETT #5# |lp|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |p| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL |tran| |p|
                                                            (QREFELT $ 151))
                                                  (QREFELT $ 187)))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROW)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (LETT |res| (SPADCALL (QREFELT $ 16)))))
                (SEQ (LETT |ch| NIL) (LETT #4# (QVELT |n| 1)) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |ch| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res2|
                            (|SCENE;boundary1| |ch| |tran2| |scale|
                             |useInteger| |npt| |fontScale2| $))
                      (EXIT
                       (LETT |res| (SPADCALL |res| |res2| (QREFELT $ 189)))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #21# (EXIT #13#)))) 

(SDEFUN |SCENE;boundary;$DfSb;89|
        ((|n| $) (|fontScale| |DoubleFloat|) ($ |SBoundary| PT))
        (SPROG ((|defaultTransform| (|STransform| PT)))
               (SEQ (LETT |defaultTransform| (SPADCALL (QREFELT $ 181)))
                    (EXIT
                     (|SCENE;boundary1| |n| |defaultTransform| 1.0 NIL
                      (SPADCALL NIL NIL (QREFELT $ 182))
                      (|div_DF| |fontScale|
                                (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT))
                      $))))) 

(SDEFUN |SCENE;pointString|
        ((|pts| |List| PT) (|tran| |STransform| PT) (|bb| |SBoundary| PT)
         ($ |List| (|String|)))
        (SPROG
         ((|ptStr| (|List| (|String|))) (|thisStr| (|String|)) (|param2| (PT))
          (#1=#:G1444 NIL) (|param| NIL) (|lastValid| (|Boolean|)))
         (SEQ (LETT |ptStr| NIL) (LETT |lastValid| 'T)
              (SEQ (LETT |param| NIL) (LETT #1# |pts|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |param2| (SPADCALL |tran| |param| (QREFELT $ 151)))
                    (LETT |thisStr|
                          (SPADCALL
                           (LIST
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT $ 84)))
                            " "
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT $ 85)))
                            " "
                            (|mathObject2String|
                             (SPADCALL |param2| (QREFELT $ 190))))
                           (QREFELT $ 120)))
                    (EXIT
                     (LETT |ptStr|
                           (SPADCALL |ptStr| |thisStr| (QREFELT $ 191)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;pointIndexString|
        ((|pts| |List| (|List| (|NonNegativeInteger|)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) ($ |List| (|String|)))
        (SPROG
         ((|ptStr| (|List| (|String|))) (#1=#:G1451 NIL) (|param| NIL)
          (#2=#:G1450 NIL) (|line| NIL))
         (SEQ (LETT |ptStr| NIL)
              (SEQ (LETT |line| NIL) (LETT #2# |pts|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |param| NIL) (LETT #1# |line|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ptStr|
                                 (SPADCALL |ptStr|
                                           (|mathObject2String| |param|)
                                           (QREFELT $ 191)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |ptStr| (SPADCALL |ptStr| "-1" (QREFELT $ 191)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ptStr|)))) 

(SDEFUN |SCENE;setX3DNodeName| ((|typ| |Symbol|) ($ |String|))
        (SPROG ((|nodeName| (|String|)))
               (SEQ (LETT |nodeName| "")
                    (COND ((EQUAL |typ| 'ROOT) (LETT |nodeName| "X3D")))
                    (COND ((EQUAL |typ| 'GROUP) (LETT |nodeName| "Group")))
                    (COND
                     ((EQUAL |typ| 'LINE) (LETT |nodeName| "IndexedFaceSet")))
                    (COND ((EQUAL |typ| 'SHAPE) (LETT |nodeName| "Sphere")))
                    (COND ((EQUAL |typ| 'MATERIAL) (LETT |nodeName| "Group")))
                    (COND ((EQUAL |typ| 'TEXT) (LETT |nodeName| "Text")))
                    (COND
                     ((EQUAL |typ| 'TRANSFORM) (LETT |nodeName| "Transform")))
                    (COND ((EQUAL |typ| 'CLIP) (LETT |nodeName| "Group")))
                    (COND
                     ((EQUAL |typ| 'IFS) (LETT |nodeName| "IndexedFaceSet")))
                    (COND
                     ((EQUAL |typ| 'ARROWS)
                      (LETT |nodeName| "IndexedFaceSet")))
                    (COND ((EQUAL |typ| 'DEF) (LETT |nodeName| "Group")))
                    (COND ((EQUAL |typ| 'USE) (LETT |nodeName| "Group")))
                    (EXIT |nodeName|)))) 

(SDEFUN |SCENE;toX3D;$RStSbXe;93|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) ($ |XmlElement|))
        (SPROG
         ((|nodeEles| (|List| (|XmlElement|))) (|xch| (|XmlElement|))
          (#1=#:G1513 NIL) (|ch| NIL) (#2=#:G1511 NIL)
          (|ifset| #3=(|XmlElement|)) (|coord| #3#) (#4=#:G1467 NIL)
          (|nodeAtts| (|List| (|XmlAttribute|))) (|ifsR| (|SceneIFS| PT))
          (|meshR| (|List| (|List| PT))) (#5=#:G1468 NIL) (#6=#:G1462 NIL)
          (#7=#:G1464 NIL) (|bb2| (|SBoundary| PT)) (#8=#:G1465 NIL)
          (|tran2| (|STransform| PT)) (#9=#:G1466 NIL)
          (|mat2|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|))))
          (#10=#:G1463 NIL) (|inner| #3#) (#11=#:G1512 NIL)
          (|nodeName| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $))
                (LETT |bb2| |bb|) (LETT |tran2| |tran|) (LETT |mat2| |mat|)
                (LETT |nodeAtts| NIL)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toX3D parameter type not valid for root node")))
                   (LETT |bb2|
                         (PROG2 (LETT #8# (QVELT |n| 2))
                             (QCDR #8#)
                           (|check_union2| (QEQCAR #8# 3)
                                           (|SBoundary| (QREFELT $ 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #12="empty"))
                                           #8#)))
                   (COND
                    ((SPADCALL |bb2| (QREFELT $ 166))
                     (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 31)))))
                   (COND
                    ((SPADCALL |bb2| (QREFELT $ 166))
                     (|error| "scene contains no drawable elements")))
                   (LETT |nodeEles| NIL)
                   (SEQ (LETT |ch| NIL) (LETT #11# (QVELT |n| 1)) G190
                        (COND
                         ((OR (ATOM #11#) (PROGN (LETT |ch| (CAR #11#)) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |xch|
                               (SPADCALL |ch| |mat2| |tran2| |bb2|
                                         (QREFELT $ 192)))
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |xch| (QREFELT $ 172)))
                            (LETT |nodeEles|
                                  (SPADCALL |nodeEles| |xch|
                                            (QREFELT $ 165)))))))
                        (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                   (LETT |inner|
                         (SPADCALL "Scene" |nodeEles| |nodeAtts|
                                   (QREFELT $ 163)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL |nodeName| (LIST |inner|) |nodeAtts|
                                     (QREFELT $ 163)))
                     (GO #13=#:G1510))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'MATERIAL)
                  (LETT |mat2|
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #10#)))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 4))
                     (|error|
                      "toX3D parameter type not valid for trans node")))
                   (EXIT
                    (LETT |tran2|
                          (SPADCALL
                           (PROG2 (LETT #9# (QVELT |n| 2))
                               (QCDR #9#)
                             (|check_union2| (QEQCAR #9# 4)
                                             (|STransform| (QREFELT $ 6))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #12#))
                                             #9#))
                           |tran| (QREFELT $ 173)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toX3D parameter type not valid for clip node")))
                   (EXIT
                    (LETT |bb2|
                          (PROG2 (LETT #8# (QVELT |n| 2))
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 3)
                                            (|SBoundary| (QREFELT $ 6))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #12#))
                                            #8#)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TEXT)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 2))
                     (|error| "toX3D parameter type not valid for text node")))
                   (EXIT
                    (LETT |nodeAtts|
                          (LIST
                           (SPADCALL "string"
                                     (QVELT
                                      (PROG2 (LETT #7# (QVELT |n| 2))
                                          (QCDR #7#)
                                        (|check_union2| (QEQCAR #7# 2)
                                                        (|Record|
                                                         (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |material|
                                                              (|Record|
                                                               (|:| |lineWidth|
                                                                    (|DoubleFloat|))
                                                               (|:| |lineCol|
                                                                    (|String|))
                                                               (|:| |fillCol|
                                                                    (|String|))
                                                               (|:|
                                                                |matOpacity|
                                                                (|DoubleFloat|))))
                                                         (|:| |text|
                                                              (|Record|
                                                               (|:| |txt|
                                                                    (|String|))
                                                               (|:| |siz|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |pos|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT $ 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT $ 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       $ 6))))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |arrw|
                                                              (|Record|
                                                               (|:| |st|
                                                                    (|String|))
                                                               (|:| |en|
                                                                    (|String|))
                                                               (|:| |offset|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |shpe|
                                                              (|Record|
                                                               (|:| |shptype|
                                                                    (|Symbol|))
                                                               (|:| |centre|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| $)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT $ 6)))
                                                         (|:| |empty| #12#))
                                                        #7#))
                                      0)
                                     (QREFELT $ 160))))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toX3D parameter type not valid for line node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (PROG2 (LETT #6# (QVELT |n| 2))
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0)
                                             (|List| (|List| (QREFELT $ 6)))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #12#))
                                             #6#)))
                          (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                    (QREFELT $ 94))
                          8 (QREFELT $ 193)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 194)))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "coordIndex"
                                    (|SCENE;pointIndexString|
                                     (SPADCALL |ifsR| (QREFELT $ 64)) |tran|
                                     |bb| $)
                                    (QREFELT $ 195))))
                   (LETT |coord|
                         (SPADCALL "Coordinate" NIL
                                   (LIST
                                    (SPADCALL "point"
                                              (|SCENE;pointString|
                                               (SPADCALL |ifsR| (QREFELT $ 65))
                                               |tran| |bb| $)
                                              (QREFELT $ 195)))
                                   (QREFELT $ 163)))
                   (LETT |ifset|
                         (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                                   (QREFELT $ 163)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL "Shape" (LIST |ifset|) NIL
                                     (QREFELT $ 163)))
                     (GO #13#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 8))
                    (|error|
                     "toX3D parameter type not valid for text node")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 6))
                     (|error|
                      "toX3D parameter type not valid for arrws node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (QVELT
                            (PROG2 (LETT #5# (QVELT |n| 2))
                                (QCDR #5#)
                              (|check_union2| (QEQCAR #5# 6)
                                              (|Record|
                                               (|:| |ln|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                              (|Union|
                                               (|:| |points|
                                                    (|List|
                                                     (|List| (QREFELT $ 6))))
                                               (|:| |material|
                                                    (|Record|
                                                     (|:| |lineWidth|
                                                          (|DoubleFloat|))
                                                     (|:| |lineCol| (|String|))
                                                     (|:| |fillCol| (|String|))
                                                     (|:| |matOpacity|
                                                          (|DoubleFloat|))))
                                               (|:| |text|
                                                    (|Record|
                                                     (|:| |txt| (|String|))
                                                     (|:| |siz|
                                                          (|NonNegativeInteger|))
                                                     (|:| |pos| (QREFELT $ 6))
                                                     (|:| |np|
                                                          (|List|
                                                           (|String|)))))
                                               (|:| |boundbox|
                                                    (|SBoundary|
                                                     (QREFELT $ 6)))
                                               (|:| |trans|
                                                    (|STransform|
                                                     (QREFELT $ 6)))
                                               (|:| |ifs|
                                                    (|Record|
                                                     (|:| |inx|
                                                          (|List|
                                                           (|List|
                                                            (|NonNegativeInteger|))))
                                                     (|:| |pts|
                                                          (|List|
                                                           (QREFELT $ 6)))))
                                               (|:| |arrws|
                                                    (|Record|
                                                     (|:| |ln|
                                                          (|List|
                                                           (|List|
                                                            (QREFELT $ 6))))
                                                     (|:| |mode| (|Symbol|))
                                                     (|:| |size|
                                                          (|DoubleFloat|))))
                                               (|:| |arrw|
                                                    (|Record|
                                                     (|:| |st| (|String|))
                                                     (|:| |en| (|String|))
                                                     (|:| |offset|
                                                          (QREFELT $ 6))
                                                     (|:| |mode| (|Symbol|))
                                                     (|:| |size|
                                                          (|DoubleFloat|))))
                                               (|:| |shpe|
                                                    (|Record|
                                                     (|:| |shptype| (|Symbol|))
                                                     (|:| |centre|
                                                          (QREFELT $ 6))
                                                     (|:| |size| (QREFELT $ 6))
                                                     (|:| |fill| (|Boolean|))))
                                               (|:| |nodename|
                                                    (|Record|
                                                     (|:| |nme| (|String|))
                                                     (|:| |node| $)))
                                               (|:| |np|
                                                    (|SceneNamedPoints|
                                                     (QREFELT $ 6)))
                                               (|:| |empty| #12#))
                                              #5#))
                            0))
                          (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                    (QREFELT $ 94))
                          8 (QREFELT $ 193)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 194)))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "coordIndex"
                                    (|SCENE;pointIndexString|
                                     (SPADCALL |ifsR| (QREFELT $ 64)) |tran|
                                     |bb| $)
                                    (QREFELT $ 195))))
                   (LETT |coord|
                         (SPADCALL "Coordinate" NIL
                                   (LIST
                                    (SPADCALL "point"
                                              (|SCENE;pointString|
                                               (SPADCALL |ifsR| (QREFELT $ 65))
                                               |tran| |bb| $)
                                              (QREFELT $ 195)))
                                   (QREFELT $ 163)))
                   (LETT |ifset|
                         (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                                   (QREFELT $ 163)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL "Shape" (LIST |ifset|) NIL
                                     (QREFELT $ 163)))
                     (GO #13#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 5))
                     (|error| "toX3D parameter type not valid for ifs node")))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "coordIndex"
                                    (|SCENE;pointIndexString|
                                     (QCAR
                                      (PROG2 (LETT #4# (QVELT |n| 2))
                                          (QCDR #4#)
                                        (|check_union2| (QEQCAR #4# 5)
                                                        (|Record|
                                                         (|:| |inx|
                                                              (|List|
                                                               (|List|
                                                                (|NonNegativeInteger|))))
                                                         (|:| |pts|
                                                              (|List|
                                                               (QREFELT $ 6))))
                                                        (|Union|
                                                         (|:| |points|
                                                              (|List|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         (|:| |material|
                                                              (|Record|
                                                               (|:| |lineWidth|
                                                                    (|DoubleFloat|))
                                                               (|:| |lineCol|
                                                                    (|String|))
                                                               (|:| |fillCol|
                                                                    (|String|))
                                                               (|:|
                                                                |matOpacity|
                                                                (|DoubleFloat|))))
                                                         (|:| |text|
                                                              (|Record|
                                                               (|:| |txt|
                                                                    (|String|))
                                                               (|:| |siz|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |pos|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |np|
                                                                    (|List|
                                                                     (|String|)))))
                                                         (|:| |boundbox|
                                                              (|SBoundary|
                                                               (QREFELT $ 6)))
                                                         (|:| |trans|
                                                              (|STransform|
                                                               (QREFELT $ 6)))
                                                         (|:| |ifs|
                                                              (|Record|
                                                               (|:| |inx|
                                                                    (|List|
                                                                     (|List|
                                                                      (|NonNegativeInteger|))))
                                                               (|:| |pts|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              6)))))
                                                         (|:| |arrws|
                                                              (|Record|
                                                               (|:| |ln|
                                                                    (|List|
                                                                     (|List|
                                                                      (QREFELT
                                                                       $ 6))))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |arrw|
                                                              (|Record|
                                                               (|:| |st|
                                                                    (|String|))
                                                               (|:| |en|
                                                                    (|String|))
                                                               (|:| |offset|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |mode|
                                                                    (|Symbol|))
                                                               (|:| |size|
                                                                    (|DoubleFloat|))))
                                                         (|:| |shpe|
                                                              (|Record|
                                                               (|:| |shptype|
                                                                    (|Symbol|))
                                                               (|:| |centre|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |size|
                                                                    (QREFELT $
                                                                             6))
                                                               (|:| |fill|
                                                                    (|Boolean|))))
                                                         (|:| |nodename|
                                                              (|Record|
                                                               (|:| |nme|
                                                                    (|String|))
                                                               (|:| |node| $)))
                                                         (|:| |np|
                                                              (|SceneNamedPoints|
                                                               (QREFELT $ 6)))
                                                         (|:| |empty| #12#))
                                                        #4#)))
                                     |tran| |bb| $)
                                    (QREFELT $ 195))))
                   (LETT |coord|
                         (SPADCALL "Coordinate" NIL
                                   (LIST
                                    (SPADCALL "point"
                                              (|SCENE;pointString|
                                               (QCDR
                                                (PROG2 (LETT #4# (QVELT |n| 2))
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 5)
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|Union|
                                                    (|:| |points|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |material|
                                                         (|Record|
                                                          (|:| |lineWidth|
                                                               (|DoubleFloat|))
                                                          (|:| |lineCol|
                                                               (|String|))
                                                          (|:| |fillCol|
                                                               (|String|))
                                                          (|:| |matOpacity|
                                                               (|DoubleFloat|))))
                                                    (|:| |text|
                                                         (|Record|
                                                          (|:| |txt|
                                                               (|String|))
                                                          (|:| |siz|
                                                               (|NonNegativeInteger|))
                                                          (|:| |pos|
                                                               (QREFELT $ 6))
                                                          (|:| |np|
                                                               (|List|
                                                                (|String|)))))
                                                    (|:| |boundbox|
                                                         (|SBoundary|
                                                          (QREFELT $ 6)))
                                                    (|:| |trans|
                                                         (|STransform|
                                                          (QREFELT $ 6)))
                                                    (|:| |ifs|
                                                         (|Record|
                                                          (|:| |inx|
                                                               (|List|
                                                                (|List|
                                                                 (|NonNegativeInteger|))))
                                                          (|:| |pts|
                                                               (|List|
                                                                (QREFELT $
                                                                         6)))))
                                                    (|:| |arrws|
                                                         (|Record|
                                                          (|:| |ln|
                                                               (|List|
                                                                (|List|
                                                                 (QREFELT $
                                                                          6))))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                                    (|:| |arrw|
                                                         (|Record|
                                                          (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                                    (|:| |shpe|
                                                         (|Record|
                                                          (|:| |shptype|
                                                               (|Symbol|))
                                                          (|:| |centre|
                                                               (QREFELT $ 6))
                                                          (|:| |size|
                                                               (QREFELT $ 6))
                                                          (|:| |fill|
                                                               (|Boolean|))))
                                                    (|:| |nodename|
                                                         (|Record|
                                                          (|:| |nme|
                                                               (|String|))
                                                          (|:| |node| $)))
                                                    (|:| |np|
                                                         (|SceneNamedPoints|
                                                          (QREFELT $ 6)))
                                                    (|:| |empty| #12#))
                                                   #4#)))
                                               |tran2| |bb2| $)
                                              (QREFELT $ 195)))
                                   (QREFELT $ 163)))
                   (LETT |ifset|
                         (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                                   (QREFELT $ 163)))
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (SPADCALL "Shape" (LIST |ifset|) NIL
                                     (QREFELT $ 163)))
                     (GO #13#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 9))
                    (|error| "toSVG parameter type not valid for def node")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 9))
                    (|error| "toSVG parameter type not valid for use node")))))
                (EXIT
                 (COND
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 179)) 1)
                   (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 163)))
                  ('T
                   (SEQ (LETT |nodeEles| NIL)
                        (SEQ (LETT |ch| NIL) (LETT #1# (QVELT |n| 1)) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ch| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |xch|
                                    (SPADCALL |ch| |mat2| |tran2| |bb2|
                                              (QREFELT $ 192)))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |xch| (QREFELT $ 172)))
                                 (LETT |nodeEles|
                                       (SPADCALL |nodeEles| |xch|
                                                 (QREFELT $ 165)))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                                   (QREFELT $ 163)))))))))
          #13# (EXIT #2#)))) 

(SDEFUN |SCENE;toX3D;$RStRXe;94|
        ((|n| $)
         (|mat| |Record| (|:| |lineWidth| (|DoubleFloat|))
          (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
          (|:| |matOpacity| (|DoubleFloat|)))
         (|tran| |STransform| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ |XmlElement|))
        (SPADCALL |n| |mat| |tran|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 192))) 

(SDEFUN |SCENE;writeX3d;$SV;95| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 181)))
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      (QREFELT $ 192))
            |filename| (QREFELT $ 184)))))) 

(SDEFUN |SCENE;toObj;$RRRStSbV;96|
        ((|n| $) (|ptLst| |Reference| (|List| PT))
         (|indexLst| |Reference| (|List| (|List| (|NonNegativeInteger|))))
         (|indexNxt| |Reference| (|NonNegativeInteger|))
         (|tran| |STransform| PT) (|bb| |SBoundary| PT) ($ |Void|))
        (SPROG
         ((#1=#:G1594 NIL) (|ch| NIL) (#2=#:G1580 NIL)
          (|i2| (|List| (|List| (|NonNegativeInteger|)))) (#3=#:G1593 NIL)
          (|j| NIL) (#4=#:G1592 NIL) (#5=#:G1591 NIL) (|k| NIL)
          (#6=#:G1590 NIL) (|p1| (|List| PT)) (#7=#:G1533 NIL)
          (|i1| (|List| (|List| (|NonNegativeInteger|)))) (#8=#:G1589 NIL)
          (#9=#:G1588 NIL) (#10=#:G1587 NIL) (#11=#:G1586 NIL)
          (|ifsR| (|SceneIFS| PT)) (|meshR| (|List| (|List| PT)))
          (#12=#:G1528 NIL) (#13=#:G1585 NIL) (#14=#:G1584 NIL)
          (#15=#:G1583 NIL) (#16=#:G1582 NIL) (|bb2| (|SBoundary| PT))
          (#17=#:G1531 NIL) (|tran2| (|STransform| PT)) (#18=#:G1532 NIL)
          (#19=#:G1581 NIL) (|mx| (PT)) (|mn| (PT))
          (|offsety| #20=(|DoubleFloat|)) (|offsetRequired| (|Boolean|))
          (|offsetx| #20#) (|miny| (|DoubleFloat|)) (|minx| (|DoubleFloat|))
          (|nodeName| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $))
                (LETT |bb2| |bb|) (LETT |tran2| |tran|)
                (COND
                 ((EQUAL (QVELT |n| 0) 'ROOT)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toObj parameter type not valid for root node")))
                   (LETT |bb2|
                         (PROG2 (LETT #17# (QVELT |n| 2))
                             (QCDR #17#)
                           (|check_union2| (QEQCAR #17# 3)
                                           (|SBoundary| (QREFELT $ 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #21="empty"))
                                           #17#)))
                   (COND
                    ((SPADCALL |bb2| (QREFELT $ 166))
                     (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 31)))))
                   (COND
                    ((SPADCALL |bb2| (QREFELT $ 166))
                     (|error| "scene contains no drawable elements")))
                   (LETT |minx|
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                   (QREFELT $ 84)))
                   (LETT |miny|
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                   (QREFELT $ 85)))
                   (LETT |offsetx| 0.0) (LETT |offsety| 0.0)
                   (LETT |offsetRequired| NIL)
                   (COND
                    ((|less_DF| |minx| 0.0)
                     (SEQ (LETT |offsetRequired| 'T)
                          (EXIT (LETT |offsetx| (|minus_DF| |minx|))))))
                   (COND
                    ((|less_DF| |miny| 0.0)
                     (SEQ (LETT |offsetRequired| 'T)
                          (EXIT (LETT |offsety| (|minus_DF| |miny|))))))
                   (COND
                    (|offsetRequired|
                     (SEQ
                      (LETT |mn|
                            (SPADCALL
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                        (QREFELT $ 84))
                              |offsetx|)
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT $ 41))
                                        (QREFELT $ 85))
                              |offsety|)
                             (QREFELT $ 86)))
                      (LETT |mx|
                            (SPADCALL
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT $ 40))
                                        (QREFELT $ 84))
                              |offsetx|)
                             (|add_DF|
                              (SPADCALL (SPADCALL |bb2| (QREFELT $ 40))
                                        (QREFELT $ 85))
                              |offsety|)
                             (QREFELT $ 86)))
                      (LETT |bb2| (SPADCALL |mn| |mx| (QREFELT $ 10)))
                      (EXIT
                       (LETT |tran2|
                             (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                       (QREFELT $ 167)))))))
                   (SEQ (LETT |ch| NIL) (LETT #19# (QVELT |n| 1)) G190
                        (COND
                         ((OR (ATOM #19#) (PROGN (LETT |ch| (CAR #19#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2|
                                    |bb2| (QREFELT $ 201))))
                        (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22=#:G1579))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 4))
                     (|error|
                      "toObj parameter type not valid for trans node")))
                   (EXIT
                    (LETT |tran2|
                          (SPADCALL
                           (PROG2 (LETT #18# (QVELT |n| 2))
                               (QCDR #18#)
                             (|check_union2| (QEQCAR #18# 4)
                                             (|STransform| (QREFELT $ 6))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #21#))
                                             #18#))
                           |tran| (QREFELT $ 173)))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'CLIP)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toObj parameter type not valid for clip node")))
                   (LETT |bb2|
                         (PROG2 (LETT #17# (QVELT |n| 2))
                             (QCDR #17#)
                           (|check_union2| (QEQCAR #17# 3)
                                           (|SBoundary| (QREFELT $ 6))
                                           (|Union|
                                            (|:| |points|
                                                 (|List|
                                                  (|List| (QREFELT $ 6))))
                                            (|:| |material|
                                                 (|Record|
                                                  (|:| |lineWidth|
                                                       (|DoubleFloat|))
                                                  (|:| |lineCol| (|String|))
                                                  (|:| |fillCol| (|String|))
                                                  (|:| |matOpacity|
                                                       (|DoubleFloat|))))
                                            (|:| |text|
                                                 (|Record|
                                                  (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|)))))
                                            (|:| |boundbox|
                                                 (|SBoundary| (QREFELT $ 6)))
                                            (|:| |trans|
                                                 (|STransform| (QREFELT $ 6)))
                                            (|:| |ifs|
                                                 (|Record|
                                                  (|:| |inx|
                                                       (|List|
                                                        (|List|
                                                         (|NonNegativeInteger|))))
                                                  (|:| |pts|
                                                       (|List|
                                                        (QREFELT $ 6)))))
                                            (|:| |arrws|
                                                 (|Record|
                                                  (|:| |ln|
                                                       (|List|
                                                        (|List|
                                                         (QREFELT $ 6))))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |arrw|
                                                 (|Record|
                                                  (|:| |st| (|String|))
                                                  (|:| |en| (|String|))
                                                  (|:| |offset| (QREFELT $ 6))
                                                  (|:| |mode| (|Symbol|))
                                                  (|:| |size|
                                                       (|DoubleFloat|))))
                                            (|:| |shpe|
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|))))
                                            (|:| |nodename|
                                                 (|Record|
                                                  (|:| |nme| (|String|))
                                                  (|:| |node| $)))
                                            (|:| |np|
                                                 (|SceneNamedPoints|
                                                  (QREFELT $ 6)))
                                            (|:| |empty| #21#))
                                           #17#)))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'LINE)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error| "toObj parameter type not valid for line node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (PROG2 (LETT #12# (QVELT |n| 2))
                               (QCDR #12#)
                             (|check_union2| (QEQCAR #12# 0)
                                             (|List| (|List| (QREFELT $ 6)))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #21#))
                                             #12#)))
                          (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                    (QREFELT $ 94))
                          8 (QREFELT $ 193)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 194)))
                   (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 64)))
                   (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 65)))
                   (LETT |i2|
                         (PROGN
                          (LETT #16# NIL)
                          (SEQ (LETT |k| NIL) (LETT #15# |i1|) G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |k| (CAR #15#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #16#
                                       (CONS
                                        (PROGN
                                         (LETT #14# NIL)
                                         (SEQ (LETT |j| NIL) (LETT #13# |k|)
                                              G190
                                              (COND
                                               ((OR (ATOM #13#)
                                                    (PROGN
                                                     (LETT |j| (CAR #13#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #14#
                                                      (CONS
                                                       (+ |j|
                                                          (SPADCALL |indexNxt|
                                                                    (QREFELT $
                                                                             202)))
                                                       #14#))))
                                              (LETT #13# (CDR #13#)) (GO G190)
                                              G191 (EXIT (NREVERSE #14#))))
                                        #16#))))
                               (LETT #15# (CDR #15#)) (GO G190) G191
                               (EXIT (NREVERSE #16#)))))
                   (SPADCALL |ptLst|
                             (SPADCALL (SPADCALL |ptLst| (QREFELT $ 203)) |p1|
                                       (QREFELT $ 204))
                             (QREFELT $ 205))
                   (SPADCALL |indexLst|
                             (SPADCALL (SPADCALL |indexLst| (QREFELT $ 206))
                                       |i2| (QREFELT $ 207))
                             (QREFELT $ 208))
                   (SPADCALL |indexNxt|
                             (+ (SPADCALL |indexNxt| (QREFELT $ 202))
                                (LENGTH |p1|))
                             (QREFELT $ 209))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'SHAPE)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 8))
                    (|error|
                     "toObj parameter type not valid for shape node")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'ARROWS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 0))
                     (|error|
                      "toObj parameter type not valid for arrows node")))
                   (LETT |meshR|
                         (SPADCALL
                          (|SPADfirst|
                           (PROG2 (LETT #12# (QVELT |n| 2))
                               (QCDR #12#)
                             (|check_union2| (QEQCAR #12# 0)
                                             (|List| (|List| (QREFELT $ 6)))
                                             (|Union|
                                              (|:| |points|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |material|
                                                   (|Record|
                                                    (|:| |lineWidth|
                                                         (|DoubleFloat|))
                                                    (|:| |lineCol| (|String|))
                                                    (|:| |fillCol| (|String|))
                                                    (|:| |matOpacity|
                                                         (|DoubleFloat|))))
                                              (|:| |text|
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|)))))
                                              (|:| |boundbox|
                                                   (|SBoundary| (QREFELT $ 6)))
                                              (|:| |trans|
                                                   (|STransform|
                                                    (QREFELT $ 6)))
                                              (|:| |ifs|
                                                   (|Record|
                                                    (|:| |inx|
                                                         (|List|
                                                          (|List|
                                                           (|NonNegativeInteger|))))
                                                    (|:| |pts|
                                                         (|List|
                                                          (QREFELT $ 6)))))
                                              (|:| |arrws|
                                                   (|Record|
                                                    (|:| |ln|
                                                         (|List|
                                                          (|List|
                                                           (QREFELT $ 6))))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |arrw|
                                                   (|Record|
                                                    (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|))))
                                              (|:| |shpe|
                                                   (|Record|
                                                    (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|))))
                                              (|:| |nodename|
                                                   (|Record|
                                                    (|:| |nme| (|String|))
                                                    (|:| |node| $)))
                                              (|:| |np|
                                                   (|SceneNamedPoints|
                                                    (QREFELT $ 6)))
                                              (|:| |empty| #21#))
                                             #12#)))
                          (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 93))
                                    (QREFELT $ 94))
                          8 (QREFELT $ 193)))
                   (LETT |ifsR| (SPADCALL |meshR| NIL (QREFELT $ 194)))
                   (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 64)))
                   (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 65)))
                   (LETT |i2|
                         (PROGN
                          (LETT #11# NIL)
                          (SEQ (LETT |k| NIL) (LETT #10# |i1|) G190
                               (COND
                                ((OR (ATOM #10#)
                                     (PROGN (LETT |k| (CAR #10#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (PROGN
                                         (LETT #9# NIL)
                                         (SEQ (LETT |j| NIL) (LETT #8# |k|)
                                              G190
                                              (COND
                                               ((OR (ATOM #8#)
                                                    (PROGN
                                                     (LETT |j| (CAR #8#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #9#
                                                      (CONS
                                                       (+ |j|
                                                          (SPADCALL |indexNxt|
                                                                    (QREFELT $
                                                                             202)))
                                                       #9#))))
                                              (LETT #8# (CDR #8#)) (GO G190)
                                              G191 (EXIT (NREVERSE #9#))))
                                        #11#))))
                               (LETT #10# (CDR #10#)) (GO G190) G191
                               (EXIT (NREVERSE #11#)))))
                   (SPADCALL |ptLst|
                             (SPADCALL (SPADCALL |ptLst| (QREFELT $ 203)) |p1|
                                       (QREFELT $ 204))
                             (QREFELT $ 205))
                   (SPADCALL |indexLst|
                             (SPADCALL (SPADCALL |indexLst| (QREFELT $ 206))
                                       |i2| (QREFELT $ 207))
                             (QREFELT $ 208))
                   (SPADCALL |indexNxt|
                             (+ (SPADCALL |indexNxt| (QREFELT $ 202))
                                (LENGTH |p1|))
                             (QREFELT $ 209))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'IFS)
                  (SEQ
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 5))
                     (|error| "toObj parameter type not valid for ifs node")))
                   (LETT |i1|
                         (QCAR
                          (PROG2 (LETT #7# (QVELT |n| 2))
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 5)
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT $ 6))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #21#))
                                            #7#))))
                   (LETT |p1|
                         (QCDR
                          (PROG2 (LETT #7# (QVELT |n| 2))
                              (QCDR #7#)
                            (|check_union2| (QEQCAR #7# 5)
                                            (|Record|
                                             (|:| |inx|
                                                  (|List|
                                                   (|List|
                                                    (|NonNegativeInteger|))))
                                             (|:| |pts|
                                                  (|List| (QREFELT $ 6))))
                                            (|Union|
                                             (|:| |points|
                                                  (|List|
                                                   (|List| (QREFELT $ 6))))
                                             (|:| |material|
                                                  (|Record|
                                                   (|:| |lineWidth|
                                                        (|DoubleFloat|))
                                                   (|:| |lineCol| (|String|))
                                                   (|:| |fillCol| (|String|))
                                                   (|:| |matOpacity|
                                                        (|DoubleFloat|))))
                                             (|:| |text|
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                             (|:| |boundbox|
                                                  (|SBoundary| (QREFELT $ 6)))
                                             (|:| |trans|
                                                  (|STransform| (QREFELT $ 6)))
                                             (|:| |ifs|
                                                  (|Record|
                                                   (|:| |inx|
                                                        (|List|
                                                         (|List|
                                                          (|NonNegativeInteger|))))
                                                   (|:| |pts|
                                                        (|List|
                                                         (QREFELT $ 6)))))
                                             (|:| |arrws|
                                                  (|Record|
                                                   (|:| |ln|
                                                        (|List|
                                                         (|List|
                                                          (QREFELT $ 6))))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |arrw|
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                             (|:| |shpe|
                                                  (|Record|
                                                   (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| (QREFELT $ 6))
                                                   (|:| |size| (QREFELT $ 6))
                                                   (|:| |fill| (|Boolean|))))
                                             (|:| |nodename|
                                                  (|Record|
                                                   (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                             (|:| |np|
                                                  (|SceneNamedPoints|
                                                   (QREFELT $ 6)))
                                             (|:| |empty| #21#))
                                            #7#))))
                   (LETT |i2|
                         (PROGN
                          (LETT #6# NIL)
                          (SEQ (LETT |k| NIL) (LETT #5# |i1|) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |k| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |j| NIL) (LETT #3# |k|)
                                              G190
                                              (COND
                                               ((OR (ATOM #3#)
                                                    (PROGN
                                                     (LETT |j| (CAR #3#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (+ |j|
                                                          (SPADCALL |indexNxt|
                                                                    (QREFELT $
                                                                             202)))
                                                       #4#))))
                                              (LETT #3# (CDR #3#)) (GO G190)
                                              G191 (EXIT (NREVERSE #4#))))
                                        #6#))))
                               (LETT #5# (CDR #5#)) (GO G190) G191
                               (EXIT (NREVERSE #6#)))))
                   (SPADCALL |ptLst|
                             (SPADCALL (SPADCALL |ptLst| (QREFELT $ 203)) |p1|
                                       (QREFELT $ 204))
                             (QREFELT $ 205))
                   (SPADCALL |indexLst|
                             (SPADCALL (SPADCALL |indexLst| (QREFELT $ 206))
                                       |i2| (QREFELT $ 207))
                             (QREFELT $ 208))
                   (SPADCALL |indexNxt|
                             (+ (SPADCALL |indexNxt| (QREFELT $ 202))
                                (LENGTH |p1|))
                             (QREFELT $ 209))
                   (EXIT (PROGN (LETT #2# (|Void|)) (GO #22#))))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'DEF)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 9))
                    (|error| "toSVG parameter type not valid for def node")))))
                (COND
                 ((EQUAL (QVELT |n| 0) 'USE)
                  (COND
                   ((NULL (QEQCAR (QVELT |n| 2) 9))
                    (|error| "toSVG parameter type not valid for use node")))))
                (EXIT
                 (COND
                  ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 179)) 1) (|Void|))
                  ('T
                   (SEQ
                    (SEQ (LETT |ch| NIL) (LETT #1# (QVELT |n| 1)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2|
                                     |bb2| (QREFELT $ 201))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (|Void|))))))))
          #22# (EXIT #2#)))) 

(SDEFUN |SCENE;toObj;$RRRStRV;97|
        ((|n| $) (|ptLst| |Reference| (|List| PT))
         (|indexLst| |Reference| (|List| (|List| (|NonNegativeInteger|))))
         (|indexNxt| |Reference| (|NonNegativeInteger|))
         (|tran| |STransform| PT)
         (|bb| |Record| (|:| |mins| PT) (|:| |maxs| PT)) ($ |Void|))
        (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |tran|
                  (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
                  (QREFELT $ 201))) 

(SDEFUN |SCENE;writeObj;$SV;98| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|s| (|String|)) (#1=#:G1605 NIL) (|i| NIL) (#2=#:G1604 NIL)
          (|row| NIL) (#3=#:G1603 NIL) (|v| NIL) (|f1| (|TextFile|))
          (|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|indexNxt| (|Reference| (|NonNegativeInteger|)))
          (|indexLst| (|Reference| (|List| (|List| (|NonNegativeInteger|)))))
          (|ptLst| (|Reference| (|List| PT))))
         (SEQ (LETT |ptLst| (SPADCALL NIL (QREFELT $ 211)))
              (LETT |indexLst| (SPADCALL NIL (QREFELT $ 212)))
              (LETT |indexNxt| (SPADCALL 0 (QREFELT $ 213)))
              (LETT |defaultTransform| (SPADCALL (QREFELT $ 181)))
              (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)))
              (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |defaultTransform|
                        |defaultBounds| (QREFELT $ 201))
              (LETT |f1|
                    (SPADCALL (SPADCALL |filename| (QREFELT $ 215)) "output"
                              (QREFELT $ 217)))
              (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 218))
              (SEQ (LETT |v| NIL) (LETT #3# (SPADCALL |ptLst| (QREFELT $ 203)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |f1|
                               (SPADCALL
                                (LIST "v "
                                      (|mathObject2String|
                                       (SPADCALL |v| (QREFELT $ 84)))
                                      " "
                                      (|mathObject2String|
                                       (SPADCALL |v| (QREFELT $ 85)))
                                      " "
                                      (|mathObject2String|
                                       (SPADCALL |v| (QREFELT $ 190))))
                                (QREFELT $ 120))
                               (QREFELT $ 218))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |s| "")
              (SEQ (LETT |row| NIL)
                   (LETT #2# (SPADCALL |indexLst| (QREFELT $ 206))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |row| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| "f")
                        (SEQ (LETT |i| NIL) (LETT #1# |row|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (SPADCALL
                                      (LIST |s| " " (STRINGIMAGE (+ |i| 1)))
                                      (QREFELT $ 120)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (SPADCALL |f1| |s| (QREFELT $ 218))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |f1| (QREFELT $ 219)) (EXIT (|Void|))))) 

(SDEFUN |SCENE;writeVRML;$SV;99| ((|n| $) (|filename| |String|) ($ |Void|))
        (SPROG
         ((|defaultBounds| (|SBoundary| PT))
          (|defaultTransform| (|STransform| PT))
          (|defaultMaterial|
           (|Record| (|:| |lineWidth| (|DoubleFloat|))
                     (|:| |lineCol| (|String|)) (|:| |fillCol| (|String|))
                     (|:| |matOpacity| (|DoubleFloat|)))))
         (SEQ
          (LETT |defaultMaterial|
                (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black"
                        1.0))
          (LETT |defaultTransform| (SPADCALL (QREFELT $ 181)))
          (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)))
          (EXIT
           (SPADCALL
            (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                      (QREFELT $ 192))
            |filename| (QREFELT $ 221)))))) 

(SDEFUN |SCENE;Fnan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 223))) 

(SDEFUN |SCENE;applyfxTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|f| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|)))
                    (EXIT
                     (COND ((QEQCAR |s| 1) 0.0)
                           (#1='T
                            (SEQ (LETT |r| (QCDR |s|))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                              (QREFELT $ 157))
                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                   ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                    MOST-NEGATIVE-DOUBLE-FLOAT)
                                   (#1# |r|)))))))))) 

(SDEFUN |SCENE;applyfxyTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|u| |DoubleFloat|) (|v| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ (LETT |s| (|trapNumericErrors| (SPADCALL |u| |v| |ff|)))
                    (EXIT
                     (COND ((QEQCAR |s| 1) 0.0)
                           (#1='T
                            (SEQ (LETT |r| (QCDR |s|))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                              (QREFELT $ 157))
                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                   ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                    MOST-NEGATIVE-DOUBLE-FLOAT)
                                   (#1# |r|)))))))))) 

(SDEFUN |SCENE;normalize|
        ((|seg| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (SPROG ((|b| #1=(|DoubleFloat|)) (|a| #1#))
               (SEQ (LETT |a| (SPADCALL |seg| (QREFELT $ 141)))
                    (LETT |b| (SPADCALL |seg| (QREFELT $ 142)))
                    (EXIT
                     (COND
                      ((|eql_DF| |a| |b|)
                       (|error| "The range specified is too small"))
                      ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 224)))
                      ('T (SPADCALL |b| |a| (QREFELT $ 224)))))))) 

(SDEFUN |SCENE;checkRange|
        ((|r| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (COND
         ((SPADCALL (SPADCALL |r| (QREFELT $ 141))
                    (SPADCALL |r| (QREFELT $ 142)) (QREFELT $ 157))
          (|error| "ranges cannot be negative"))
         ('T |r|))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni$;105|
        ((|f| |Mapping| PT (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|branches| (|List| (|List| PT))) (|newl| (|List| PT))
          (#1=#:G1637 NIL) (|p| NIL) (|p0| (|List| PT))
          (|t| (|List| (|DoubleFloat|))) (|l| (|DoubleFloat|)) (#2=#:G1636 NIL)
          (|i| NIL) (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|)))
         (SEQ (|SCENE;checkRange| |tRange| $)
              (LETT |l| (SPADCALL |tRange| (QREFELT $ 141)))
              (LETT |h| (SPADCALL |tRange| (QREFELT $ 142)))
              (LETT |t| (SPADCALL |l| (QREFELT $ 226)))
              (LETT |p0| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 227)))
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- |numPts| 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT)))
              (SEQ (LETT |i| 2) (LETT #2# (- |numPts| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|)) (LETT |t| (CONS |l| |t|))
                        (EXIT (LETT |p0| (CONS (SPADCALL |l| |f|) |p0|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)))
              (LETT |p0| (NREVERSE (CONS (SPADCALL |h| |f|) |p0|)))
              (LETT |branches| NIL) (LETT |newl| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |p0|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |p| (QREFELT $ 228))
                       (COND
                        ((NULL (NULL |newl|))
                         (SEQ
                          (LETT |branches|
                                (CONS (LETT |newl| (NREVERSE |newl|))
                                      |branches|))
                          (EXIT (LETT |newl| NIL))))))
                      ('T (LETT |newl| (CONS |p| |newl|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (NULL |newl|))
                (LETT |branches|
                      (CONS (LETT |newl| (NREVERSE |newl|)) |branches|))))
              (EXIT (SPADCALL |branches| (QREFELT $ 35)))))) 

(SDEFUN |SCENE;addPlot1Din2D;$MSNni$;106|
        ((|n| $) (|f| |Mapping| PT (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |f| |tRange| |numPts| (QREFELT $ 230)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni$;107|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|ff| (|List| (|Mapping| PT (|DoubleFloat|)))))
               (SEQ
                (LETT |ff|
                      (LIST
                       (CONS #'|SCENE;createPlot1Din2D;MSNni$;107!0|
                             (VECTOR $ |f|))))
                (EXIT
                 (SPADCALL (SPADCALL |ff| (QREFELT $ 233))
                           (|SCENE;normalize| |seg| $) |numPts|
                           (QREFELT $ 230)))))) 

(SDEFUN |SCENE;createPlot1Din2D;MSNni$;107!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x| (|SCENE;applyfxTrap| |f| |x| $) (QREFELT $ 86)))))) 

(SDEFUN |SCENE;addPlot1Din2D;$MSNni$;108|
        ((|n| $) (|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |f| |seg| |numPts| (QREFELT $ 235)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;109|
        ((|ppc| |ParametricPlaneCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|))))
          (|g| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|f| #1#))
         (SEQ (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 238)))
              (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 238)))
              (LETT |fcn|
                    (LIST
                     (CONS #'|SCENE;createPlot1Din2Dparametric;PpcSNni$;109!0|
                           (VECTOR |g| $ |f|))))
              (EXIT
               (SPADCALL (SPADCALL |fcn| (QREFELT $ 233))
                         (|SCENE;normalize| |seg| $) |numPts|
                         (QREFELT $ 230)))))) 

(SDEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;109!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g|)
          (LETT |f| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |g| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxTrap| |f| |x| $)
                      (|SCENE;applyfxTrap| |g| |x| $) (QREFELT $ 86)))))) 

(SDEFUN |SCENE;addPlot1Din2Dparametric;$PpcSNni$;110|
        ((|n| $)
         (|ppc| |ParametricPlaneCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |ppc| |seg| |numPts| (QREFELT $ 239)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;111|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((|fcn| (|Mapping| PT (|DoubleFloat|)))
          (|h| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|g| #1#)
          (|f| #1#))
         (SEQ (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 242)))
              (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 242)))
              (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 242)))
              (LETT |fcn|
                    (CONS #'|SCENE;createPlot1Din3Dparametric;PscSNni$;111!0|
                          (VECTOR |h| |g| $ |f|)))
              (EXIT (SPADCALL |fcn| |seg| |numPts| (QREFELT $ 243)))))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;111!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h|)
          (LETT |f| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |g| (QREFELT $$ 1))
          (LETT |h| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxTrap| |f| |x| $)
                      (|SCENE;applyfxTrap| |g| |x| $)
                      (|SCENE;applyfxTrap| |h| |x| $) (QREFELT $ 68)))))) 

(SDEFUN |SCENE;addPlot1Din3Dparametric;$PscSNni$;112|
        ((|n| $)
         (|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 244)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot1Din3Dparametric;MSNni$;113|
        ((|psc| |Mapping| PT (|DoubleFloat|)) (|seg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|p| (|List| PT)) (|t| (|List| (|DoubleFloat|)))
          (|l| (|DoubleFloat|)) (#1=#:G1676 NIL) (|i| NIL)
          (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|tRange| (|Segment| (|DoubleFloat|)))
          (|f| (|Mapping| PT (|DoubleFloat|))))
         (SEQ (LETT |f| |psc|) (LETT |tRange| (|SCENE;normalize| |seg| $))
              (|SCENE;checkRange| |tRange| $)
              (LETT |l| (SPADCALL |tRange| (QREFELT $ 141)))
              (LETT |h| (SPADCALL |tRange| (QREFELT $ 142)))
              (LETT |t| (SPADCALL |l| (QREFELT $ 226)))
              (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 227)))
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- |numPts| 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT)))
              (SEQ (LETT |i| 2) (LETT #1# (- |numPts| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|)) (LETT |t| (CONS |l| |t|))
                        (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)))
              (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)))
              (EXIT (SPADCALL |p| (QREFELT $ 23)))))) 

(SDEFUN |SCENE;addPlot1Din3Dparametric;$MSNni$;114|
        ((|n| $) (|psc| |Mapping| PT (|DoubleFloat|))
         (|seg| |Segment| (|DoubleFloat|)) (|numPts| |NonNegativeInteger|)
         ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 243)))
                    (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni$;115|
        ((|ptFun| |Mapping| PT (|DoubleFloat|) (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|someV| #1=(|DoubleFloat|)) (|llp| (|List| (|List| PT)))
          (|someU| #1#) (|lp| (|List| PT)) (|pt| (PT)) (|iu| NIL) (|iv| NIL)
          (|vstep| #2=(|DoubleFloat|)) (|ustep| #2#))
         (SEQ (LETT |llp| NIL)
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 141))
                               (SPADCALL |uSeg| (QREFELT $ 142)))
                     |numPts|))
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 141))
                               (SPADCALL |vSeg| (QREFELT $ 142)))
                     |numPts|))
              (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 142)))
              (SEQ (LETT |iv| |numPts|) G190 (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 141)))))
                    (LETT |lp| NIL)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 142)))
                    (SEQ (LETT |iu| |numPts|) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 141)))))
                          (LETT |pt| (SPADCALL |someU| |someV| |ptFun|))
                          (LETT |lp| (CONS |pt| |lp|))
                          (EXIT (LETT |someU| (|add_DF| |someU| |ustep|))))
                         (LETT |iu| (+ |iu| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |llp| (CONS |lp| |llp|))
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|))))
                   (LETT |iv| (+ |iv| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |llp| NIL (QREFELT $ 194))
                         (QREFELT $ 66)))))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni$;116|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|DoubleFloat|)) (|ySeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot2Din3D;M2SNni$;116!0|
                       (VECTOR $ |f|))))
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 250))
                     (|SCENE;normalize| |xSeg| $) (|SCENE;normalize| |ySeg| $)
                     |numPts| (QREFELT $ 248)))))) 

(SDEFUN |SCENE;createPlot2Din3D;M2SNni$;116!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|SCENE;applyfxyTrap| |f| |x| |y| $) |x| |y|
                      (QREFELT $ 68)))))) 

(SDEFUN |SCENE;addPlot2Din3D;$M2SNni$;117|
        ((|n| $)
         (|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|DoubleFloat|)) (|ySeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |f| |xSeg| |ySeg| |numPts| (QREFELT $ 252)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;118|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|))))
          (|h|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|g|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|f|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ
          (LETT |f|
                (LIST (SPADCALL |s| (|spadConstant| $ 255) (QREFELT $ 257))))
          (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 257))))
          (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 257))))
          (LETT |fcn|
                (LIST
                 (CONS #'|SCENE;createPlot2Din3Dparametric;Ps2SNni$;118!0|
                       (VECTOR |h| |g| $ |f|))))
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 250))
                     (|SCENE;normalize| |uSeg| $) (|SCENE;normalize| |vSeg| $)
                     |numPts| (QREFELT $ 248)))))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;118!0|
        ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h|)
          (LETT |f| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |g| (QREFELT $$ 1))
          (LETT |h| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (|SCENE;applyfxyTrap| (SPADCALL |f| (QREFELT $ 259)) |x| |y| $)
             (|SCENE;applyfxyTrap| (SPADCALL |g| (QREFELT $ 259)) |x| |y| $)
             (|SCENE;applyfxyTrap| (SPADCALL |h| (QREFELT $ 259)) |x| |y| $)
             (QREFELT $ 68)))))) 

(SDEFUN |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;119|
        ((|n| $)
         (|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 260)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;createPlot2Din3Dparametric;M2SNni$;120|
        ((|s| |Mapping| PT (|DoubleFloat|) (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|fcn| (|List| (|Mapping| PT (|DoubleFloat|) (|DoubleFloat|)))))
         (SEQ (LETT |fcn| (LIST |s|))
              (EXIT
               (SPADCALL (SPADCALL |fcn| (QREFELT $ 250))
                         (|SCENE;normalize| |uSeg| $)
                         (|SCENE;normalize| |vSeg| $) |numPts|
                         (QREFELT $ 248)))))) 

(SDEFUN |SCENE;addPlot2Din3Dparametric;$M2SNni$;121|
        ((|n| $) (|s| |Mapping| PT (|DoubleFloat|) (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|numPts| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)))
               (SEQ
                (LETT |c|
                      (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 262)))
                (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|)))) 

(SDEFUN |SCENE;outputLPoints| ((|ps| |List| PT) ($ |OutputForm|))
        (SPROG ((#1=#:G1742 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1# (SPADCALL |ps| (QREFELT $ 265)))
                     (GO #2=#:G1741))))
                  (EXIT
                   (SPADCALL
                    (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT $ 266))
                          (SPADCALL (SPADCALL |ps| (QREFELT $ 267))
                                    (QREFELT $ 266))
                          (SPADCALL "...." (QREFELT $ 268)))
                    (QREFELT $ 269)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLLPoints| ((|ps| |List| (|List| PT)) ($ |OutputForm|))
        (SPROG ((#1=#:G1747 NIL) (#2=#:G1749 NIL) (|x| NIL) (#3=#:G1748 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |x| NIL) (LETT #2# |ps|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (|SCENE;outputLPoints| |x| $)
                                                #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            (QREFELT $ 269)))
                     (GO #4=#:G1746))))
                  (EXIT
                   (SPADCALL
                    (LIST (|SCENE;outputLPoints| (|SPADfirst| |ps|) $)
                          (|SCENE;outputLPoints|
                           (SPADCALL |ps| (QREFELT $ 270)) $)
                          (SPADCALL "...." (QREFELT $ 268)))
                    (QREFELT $ 269)))))
                #4# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLIndexes|
        ((|ps| |List| (|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG ((#1=#:G1753 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (SPADCALL |ps| (QREFELT $ 110)) 4)
                    (PROGN
                     (LETT #1# (SPADCALL |ps| (QREFELT $ 271)))
                     (GO #2=#:G1752))))
                  (EXIT
                   (SPADCALL
                    (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT $ 272))
                          (SPADCALL (SPADCALL |ps| (QREFELT $ 273))
                                    (QREFELT $ 272))
                          (SPADCALL "...." (QREFELT $ 268)))
                    (QREFELT $ 269)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCENE;outputLLIndexes|
        ((|ps| |List| (|List| (|NonNegativeInteger|))) ($ |OutputForm|))
        (SPROG ((#1=#:G1758 NIL) (#2=#:G1760 NIL) (|x| NIL) (#3=#:G1759 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((< (LENGTH |ps|) 4)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |x| NIL) (LETT #2# |ps|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS (|SCENE;outputLIndexes| |x| $)
                                                #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            (QREFELT $ 269)))
                     (GO #4=#:G1757))))
                  (EXIT
                   (SPADCALL
                    (LIST (|SCENE;outputLIndexes| (|SPADfirst| |ps|) $)
                          (|SCENE;outputLIndexes|
                           (SPADCALL |ps| (QREFELT $ 274)) $)
                          (SPADCALL "...." (QREFELT $ 268)))
                    (QREFELT $ 269)))))
                #4# (EXIT #1#)))) 

(SDEFUN |SCENE;coerce;$Of;126| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|s| (|OutputForm|)) (|nam| (|SceneNamedPoints| PT)) (#1=#:G1779 NIL)
          (|nn| (|String|)) (#2=#:G1778 NIL) (|sz| (|DoubleFloat|))
          (#3=#:G1776 NIL) (|md| (|Symbol|)) (|ofs| (PT)) (|ena| (|String|))
          (|str| (|String|)) (#4=#:G1775 NIL) (|m| (|Symbol|))
          (|pts| (|List| (|List| PT))) (|pt| (|List| PT)) (#5=#:G1774 NIL)
          (|ix| (|List| (|List| (|NonNegativeInteger|)))) (#6=#:G1772 NIL)
          (|tr| (|STransform| PT)) (#7=#:G1773 NIL) (|npt| (|List| (|String|)))
          (#8=#:G1771 NIL) (|p| (PT)) (|sz1| (|NonNegativeInteger|))
          (|t| (|String|)) (|mo| (|DoubleFloat|)) (#9=#:G1770 NIL)
          (|fc| (|String|)) (|lc| (|String|)) (|lw| (|DoubleFloat|))
          (|pt2| (PT)) (#10=#:G1777 NIL) (|pt1| (PT)) (|tp| (|Symbol|))
          (#11=#:G1769 NIL))
         (SEQ (LETT |s| (SPADCALL "scene " (QREFELT $ 268)))
              (COND
               ((EQUAL (QVELT |n| 0) 'ROOT)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL "root " (QREFELT $ 268))
                             (SPADCALL
                              (PROG2 (LETT #6# (QVELT |n| 2))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 3)
                                                (|SBoundary| (QREFELT $ 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #12="empty"))
                                                #6#))
                              (QREFELT $ 275)))
                       (QREFELT $ 276)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'GROUP)
                (LETT |s|
                      (SPADCALL |s| (SPADCALL "group" (QREFELT $ 268))
                                (QREFELT $ 277)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'LINE)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL "line " (QREFELT $ 268))
                             (|SCENE;outputLLPoints|
                              (PROG2 (LETT #11# (QVELT |n| 2))
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 0)
                                                (|List| (|List| (QREFELT $ 6)))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #12#))
                                                #11#))
                              $))
                       (QREFELT $ 276)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'SHAPE)
                (SEQ
                 (LETT |tp|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #10#))
                        0))
                 (LETT |pt1|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #10#))
                        1))
                 (LETT |pt2|
                       (QVELT
                        (PROG2 (LETT #10# (QVELT |n| 2))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 8)
                                          (|Record| (|:| |shptype| (|Symbol|))
                                                    (|:| |centre|
                                                         (QREFELT $ 6))
                                                    (|:| |size| (QREFELT $ 6))
                                                    (|:| |fill| (|Boolean|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #10#))
                        2))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "shape" (QREFELT $ 268))
                               (SPADCALL " type=" (QREFELT $ 268))
                               (SPADCALL |tp| (QREFELT $ 278))
                               (SPADCALL " pt1=" (QREFELT $ 268))
                               (SPADCALL |pt1| (QREFELT $ 266))
                               (SPADCALL " pt2=" (QREFELT $ 268))
                               (SPADCALL |pt2| (QREFELT $ 266)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'MATERIAL)
                (SEQ
                 (LETT |lw|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        0))
                 (LETT |lc|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        1))
                 (LETT |fc|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        2))
                 (LETT |mo|
                       (QVELT
                        (PROG2 (LETT #9# (QVELT |n| 2))
                            (QCDR #9#)
                          (|check_union2| (QEQCAR #9# 1)
                                          (|Record|
                                           (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #9#))
                        3))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "material" (QREFELT $ 268))
                               (SPADCALL " lw=" (QREFELT $ 268))
                               (SPADCALL |lw| (QREFELT $ 279))
                               (SPADCALL " lc=" (QREFELT $ 268))
                               (SPADCALL |lc| (QREFELT $ 280))
                               (SPADCALL " fc=" (QREFELT $ 268))
                               (SPADCALL |fc| (QREFELT $ 280))
                               (SPADCALL " mo=" (QREFELT $ 268))
                               (SPADCALL |mo| (QREFELT $ 279)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'TEXT)
                (SEQ
                 (LETT |t|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        0))
                 (LETT |sz1|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        1))
                 (LETT |p|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        2))
                 (LETT |npt|
                       (QVELT
                        (PROG2 (LETT #8# (QVELT |n| 2))
                            (QCDR #8#)
                          (|check_union2| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #8#))
                        3))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "text=" (QREFELT $ 268))
                               (SPADCALL |t| (QREFELT $ 280))
                               (SPADCALL " sz=" (QREFELT $ 268))
                               (SPADCALL |sz1| (QREFELT $ 272))
                               (SPADCALL " p=" (QREFELT $ 268))
                               (SPADCALL |p| (QREFELT $ 266))
                               (SPADCALL " npt=" (QREFELT $ 268))
                               (SPADCALL |npt| (QREFELT $ 281)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'TRANSFORM)
                (SEQ
                 (LETT |tr|
                       (PROG2 (LETT #7# (QVELT |n| 2))
                           (QCDR #7#)
                         (|check_union2| (QEQCAR #7# 4)
                                         (|STransform| (QREFELT $ 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #12#))
                                         #7#)))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "transform" (QREFELT $ 268))
                               (SPADCALL " tr=" (QREFELT $ 268))
                               (SPADCALL |tr| (QREFELT $ 282)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'CLIP)
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL "clip " (QREFELT $ 268))
                             (SPADCALL
                              (PROG2 (LETT #6# (QVELT |n| 2))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 3)
                                                (|SBoundary| (QREFELT $ 6))
                                                (|Union|
                                                 (|:| |points|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |material|
                                                      (|Record|
                                                       (|:| |lineWidth|
                                                            (|DoubleFloat|))
                                                       (|:| |lineCol|
                                                            (|String|))
                                                       (|:| |fillCol|
                                                            (|String|))
                                                       (|:| |matOpacity|
                                                            (|DoubleFloat|))))
                                                 (|:| |text|
                                                      (|Record|
                                                       (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos|
                                                            (QREFELT $ 6))
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                                 (|:| |boundbox|
                                                      (|SBoundary|
                                                       (QREFELT $ 6)))
                                                 (|:| |trans|
                                                      (|STransform|
                                                       (QREFELT $ 6)))
                                                 (|:| |ifs|
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6)))))
                                                 (|:| |arrws|
                                                      (|Record|
                                                       (|:| |ln|
                                                            (|List|
                                                             (|List|
                                                              (QREFELT $ 6))))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |arrw|
                                                      (|Record|
                                                       (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset|
                                                            (QREFELT $ 6))
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                                 (|:| |shpe|
                                                      (|Record|
                                                       (|:| |shptype|
                                                            (|Symbol|))
                                                       (|:| |centre|
                                                            (QREFELT $ 6))
                                                       (|:| |size|
                                                            (QREFELT $ 6))
                                                       (|:| |fill|
                                                            (|Boolean|))))
                                                 (|:| |nodename|
                                                      (|Record|
                                                       (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                                 (|:| |np|
                                                      (|SceneNamedPoints|
                                                       (QREFELT $ 6)))
                                                 (|:| |empty| #12#))
                                                #6#))
                              (QREFELT $ 275)))
                       (QREFELT $ 276)))))
              (COND
               ((EQUAL (QVELT |n| 0) 'IFS)
                (SEQ
                 (LETT |ix|
                       (QCAR
                        (PROG2 (LETT #5# (QVELT |n| 2))
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 5)
                                          (|Record|
                                           (|:| |inx|
                                                (|List|
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                           (|:| |pts| (|List| (QREFELT $ 6))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #5#))))
                 (LETT |pt|
                       (QCDR
                        (PROG2 (LETT #5# (QVELT |n| 2))
                            (QCDR #5#)
                          (|check_union2| (QEQCAR #5# 5)
                                          (|Record|
                                           (|:| |inx|
                                                (|List|
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                           (|:| |pts| (|List| (QREFELT $ 6))))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #5#))))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "ifs" (QREFELT $ 268))
                               (SPADCALL " ix=" (QREFELT $ 268))
                               (|SCENE;outputLLIndexes| |ix| $)
                               (SPADCALL " pt=" (QREFELT $ 268))
                               (|SCENE;outputLPoints| |pt| $))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'ARROWS)
                (SEQ
                 (LETT |pts|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #4#))
                        0))
                 (LETT |m|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #4#))
                        1))
                 (LETT |sz|
                       (QVELT
                        (PROG2 (LETT #4# (QVELT |n| 2))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 6)
                                          (|Record|
                                           (|:| |ln|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |mode| (|Symbol|))
                                           (|:| |size| (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #4#))
                        2))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "arrows" (QREFELT $ 268))
                               (SPADCALL " pts=" (QREFELT $ 268))
                               (|SCENE;outputLLPoints| |pts| $)
                               (SPADCALL " m=" (QREFELT $ 268))
                               (SPADCALL |m| (QREFELT $ 278))
                               (SPADCALL " sz=" (QREFELT $ 268))
                               (SPADCALL |sz| (QREFELT $ 279)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'ARROW)
                (SEQ
                 (LETT |str|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        0))
                 (LETT |ena|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        1))
                 (LETT |ofs|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        2))
                 (LETT |md|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        3))
                 (LETT |sz|
                       (QVELT
                        (PROG2 (LETT #3# (QVELT |n| 2))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #3#))
                        4))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "arrows" (QREFELT $ 268))
                               (SPADCALL " str=" (QREFELT $ 268))
                               (SPADCALL |str| (QREFELT $ 280))
                               (SPADCALL " ena=" (QREFELT $ 268))
                               (SPADCALL |ena| (QREFELT $ 280))
                               (SPADCALL " ofs=" (QREFELT $ 268))
                               (SPADCALL |ofs| (QREFELT $ 266))
                               (SPADCALL " md=" (QREFELT $ 268))
                               (SPADCALL |md| (QREFELT $ 278))
                               (SPADCALL " sz=" (QREFELT $ 268))
                               (SPADCALL |sz| (QREFELT $ 279)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'DEF)
                (SEQ
                 (LETT |nn|
                       (QCAR
                        (PROG2 (LETT #2# (QVELT |n| 2))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 9)
                                          (|Record| (|:| |nme| (|String|))
                                                    (|:| |node| $))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #2#))))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "def" (QREFELT $ 268))
                               (SPADCALL " nn=" (QREFELT $ 268))
                               (SPADCALL |nn| (QREFELT $ 280)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'USE)
                (SEQ
                 (LETT |nn|
                       (QCAR
                        (PROG2 (LETT #2# (QVELT |n| 2))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 9)
                                          (|Record| (|:| |nme| (|String|))
                                                    (|:| |node| $))
                                          (|Union|
                                           (|:| |points|
                                                (|List|
                                                 (|List| (QREFELT $ 6))))
                                           (|:| |material|
                                                (|Record|
                                                 (|:| |lineWidth|
                                                      (|DoubleFloat|))
                                                 (|:| |lineCol| (|String|))
                                                 (|:| |fillCol| (|String|))
                                                 (|:| |matOpacity|
                                                      (|DoubleFloat|))))
                                           (|:| |text|
                                                (|Record|
                                                 (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|)))))
                                           (|:| |boundbox|
                                                (|SBoundary| (QREFELT $ 6)))
                                           (|:| |trans|
                                                (|STransform| (QREFELT $ 6)))
                                           (|:| |ifs|
                                                (|Record|
                                                 (|:| |inx|
                                                      (|List|
                                                       (|List|
                                                        (|NonNegativeInteger|))))
                                                 (|:| |pts|
                                                      (|List| (QREFELT $ 6)))))
                                           (|:| |arrws|
                                                (|Record|
                                                 (|:| |ln|
                                                      (|List|
                                                       (|List| (QREFELT $ 6))))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|))))
                                           (|:| |arrw|
                                                (|Record| (|:| |st| (|String|))
                                                          (|:| |en| (|String|))
                                                          (|:| |offset|
                                                               (QREFELT $ 6))
                                                          (|:| |mode|
                                                               (|Symbol|))
                                                          (|:| |size|
                                                               (|DoubleFloat|))))
                                           (|:| |shpe|
                                                (|Record|
                                                 (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|))))
                                           (|:| |nodename|
                                                (|Record|
                                                 (|:| |nme| (|String|))
                                                 (|:| |node| $)))
                                           (|:| |np|
                                                (|SceneNamedPoints|
                                                 (QREFELT $ 6)))
                                           (|:| |empty| #12#))
                                          #2#))))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "use" (QREFELT $ 268))
                               (SPADCALL " nn=" (QREFELT $ 268))
                               (SPADCALL |nn| (QREFELT $ 280)))
                         (QREFELT $ 276)))))))
              (COND
               ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
                (SEQ
                 (LETT |nam|
                       (PROG2 (LETT #1# (QVELT |n| 2))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 10)
                                         (|SceneNamedPoints| (QREFELT $ 6))
                                         (|Union|
                                          (|:| |points|
                                               (|List| (|List| (QREFELT $ 6))))
                                          (|:| |material|
                                               (|Record|
                                                (|:| |lineWidth|
                                                     (|DoubleFloat|))
                                                (|:| |lineCol| (|String|))
                                                (|:| |fillCol| (|String|))
                                                (|:| |matOpacity|
                                                     (|DoubleFloat|))))
                                          (|:| |text|
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|)))))
                                          (|:| |boundbox|
                                               (|SBoundary| (QREFELT $ 6)))
                                          (|:| |trans|
                                               (|STransform| (QREFELT $ 6)))
                                          (|:| |ifs|
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6)))))
                                          (|:| |arrws|
                                               (|Record|
                                                (|:| |ln|
                                                     (|List|
                                                      (|List| (QREFELT $ 6))))
                                                (|:| |mode| (|Symbol|))
                                                (|:| |size| (|DoubleFloat|))))
                                          (|:| |arrw|
                                               (|Record| (|:| |st| (|String|))
                                                         (|:| |en| (|String|))
                                                         (|:| |offset|
                                                              (QREFELT $ 6))
                                                         (|:| |mode|
                                                              (|Symbol|))
                                                         (|:| |size|
                                                              (|DoubleFloat|))))
                                          (|:| |shpe|
                                               (|Record|
                                                (|:| |shptype| (|Symbol|))
                                                (|:| |centre| (QREFELT $ 6))
                                                (|:| |size| (QREFELT $ 6))
                                                (|:| |fill| (|Boolean|))))
                                          (|:| |nodename|
                                               (|Record| (|:| |nme| (|String|))
                                                         (|:| |node| $)))
                                          (|:| |np|
                                               (|SceneNamedPoints|
                                                (QREFELT $ 6)))
                                          (|:| |empty| #12#))
                                         #1#)))
                 (EXIT
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL "namedpoints" (QREFELT $ 268))
                               (SPADCALL " n=" (QREFELT $ 268))
                               (SPADCALL |nam| (QREFELT $ 283)))
                         (QREFELT $ 276)))))))
              (LETT |s|
                    (SPADCALL
                     (LIST |s| (SPADCALL " #ch=" (QREFELT $ 268))
                           (SPADCALL (SPADCALL (QVELT |n| 1) (QREFELT $ 179))
                                     (QREFELT $ 272)))
                     (QREFELT $ 276)))
              (EXIT |s|)))) 

(DECLAIM (NOTINLINE |Scene;|)) 

(DEFUN |Scene| (#1=#:G1807)
  (SPROG NIL
         (PROG (#2=#:G1808)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Scene|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Scene;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Scene|)))))))))) 

(DEFUN |Scene;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Scene| DV$1))
          (LETT $ (GETREFV 285))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Scene| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |type| (|Symbol|))
                              (|:| |children| (|List| $))
                              (|:| |parameters|
                                   (|Union|
                                    (|:| |points| (|List| (|List| |#1|)))
                                    (|:| |material|
                                         (|Record|
                                          (|:| |lineWidth| (|DoubleFloat|))
                                          (|:| |lineCol| (|String|))
                                          (|:| |fillCol| (|String|))
                                          (|:| |matOpacity| (|DoubleFloat|))))
                                    (|:| |text|
                                         (|Record| (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| |#1|)
                                                   (|:| |np|
                                                        (|List| (|String|)))))
                                    (|:| |boundbox| (|SBoundary| |#1|))
                                    (|:| |trans| (|STransform| |#1|))
                                    (|:| |ifs|
                                         (|Record|
                                          (|:| |inx|
                                               (|List|
                                                (|List|
                                                 (|NonNegativeInteger|))))
                                          (|:| |pts| (|List| |#1|))))
                                    (|:| |arrws|
                                         (|Record|
                                          (|:| |ln| (|List| (|List| |#1|)))
                                          (|:| |mode| (|Symbol|))
                                          (|:| |size| (|DoubleFloat|))))
                                    (|:| |arrw|
                                         (|Record| (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| |#1|)
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|))))
                                    (|:| |shpe|
                                         (|Record| (|:| |shptype| (|Symbol|))
                                                   (|:| |centre| |#1|)
                                                   (|:| |size| |#1|)
                                                   (|:| |fill| (|Boolean|))))
                                    (|:| |nodename|
                                         (|Record| (|:| |nme| (|String|))
                                                   (|:| |node| $)))
                                    (|:| |np| (|SceneNamedPoints| |#1|))
                                    (|:| |empty| "empty")))))
          $))) 

(MAKEPROP '|Scene| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|SBoundary| 6)
              |SCENE;createSceneRoot;Sb$;1| (0 . |boxBoundary|)
              (|Record| (|:| |mins| 6) (|:| |maxs| 6))
              |SCENE;createSceneRoot;R$;2| (|Integer|) (6 . |sipnt|)
              |SCENE;createSceneRoot;4I$;3| (12 . |nullBoundary|)
              |SCENE;createSceneRoot;$;4| |SCENE;createSceneGroup;$;5| (|Void|)
              |SCENE;addChild!;2$V;77| |SCENE;addSceneGroup;2$;6| (|List| 6)
              |SCENE;createSceneLine;L$;7| |SCENE;addSceneLine;$L$;8|
              (|DoubleFloat|) (|Boolean|) |SCENE;createSceneLine;2$DfB$;11|
              |SCENE;createSceneLine;2$Df$;9| |SCENE;addSceneLine;3$DfB$;12|
              |SCENE;addSceneLine;3$Df$;10| |SCENE;boundary;$DfSb;89|
              (16 . |getCentre|) (21 . |lineIntersect|) (|List| 22)
              |SCENE;createSceneLines;L$;13| |SCENE;addSceneLines;$L$;14|
              (|Record| (|:| |shptype| 50) (|:| |centre| 6) (|:| |size| 6)
                        (|:| |fill| 26))
              |SCENE;createSceneShape;R$;15| |SCENE;addSceneShape;$R$;16|
              (27 . |getMax|) (32 . |getMin|) (37 . -)
              |SCENE;createSceneShape;Sb$;17| |SCENE;addSceneShape;$Sb$;18|
              (|String|) |SCENE;createSceneDef;S2$;19|
              |SCENE;addSceneDef;$S2$;20| |SCENE;createSceneUse;S$;21|
              |SCENE;addSceneUse;$S$;22| (|Symbol|)
              |SCENE;createSceneArrows;LSDf$;23|
              |SCENE;addSceneArrows;$LSDf$;24|
              |SCENE;createSceneArrow;2SPTSDf$;25|
              |SCENE;addSceneArrow;$2SPTSDf$;26|
              |SCENE;createSceneArrow;2$PTS2Df$;27|
              |SCENE;addSceneArrow;3$PTS2Df$;28| (|SceneNamedPoints| 6)
              |SCENE;createSceneNamedPoints;Snp$;29|
              |SCENE;addSceneNamedPoints;$Snp$;30| (|List| 108)
              |SCENE;createSceneIFS;LL$;31| |SCENE;addSceneIFS;$LL$;32|
              (|SceneIFS| 6) (43 . |indexes|) (48 . |pointList|)
              |SCENE;createSceneIFS;Sifs$;33| |SCENE;addSceneIFS;$Sifs$;34|
              (53 . |spnt|) |SCENE;createSceneBox;Df$;35|
              |SCENE;addSceneBox;$Df$;36|
              (|Record| (|:| |txt| 45) (|:| |siz| 74) (|:| |pos| 6)
                        (|:| |np| 77))
              |SCENE;createSceneText;R$;37| |SCENE;addSceneText;$R$;38|
              (|NonNegativeInteger|) |SCENE;createSceneText;SNniPT$;39|
              |SCENE;addSceneText;$SNniPT$;40| (|List| 45)
              |SCENE;createSceneText;LNniPT$;41|
              |SCENE;addSceneText;$LNniPT$;42| |SCENE;createSceneClip;Sb$;43|
              |SCENE;addSceneClip;$Sb$;44| |SCENE;createSceneClip;R$;45|
              |SCENE;addSceneClip;$R$;46| (60 . |screenCoordX|)
              (65 . |screenCoordY|) (70 . |spnt|)
              |SCENE;createSceneGrid;DfSb$;47| |SCENE;addSceneGrid;$DfSb$;48|
              |SCENE;createSceneGrid;DfR$;49| |SCENE;addSceneGrid;$DfR$;50|
              (|PositiveInteger|) (|Float|) (76 . |float|) (83 . |coerce|)
              (|Record| (|:| |lineWidth| 25) (|:| |lineCol| 45)
                        (|:| |fillCol| 45) (|:| |matOpacity| 25))
              |SCENE;addSceneMaterial;$R$;70| |SCENE;createSceneGrid;Sb$;51|
              |SCENE;addSceneGrid;$Sb$;52| |SCENE;createSceneGrid;R$;53|
              |SCENE;addSceneGrid;$R$;54| (88 . |singleFace|)
              (93 . |sierpinskiDivide|) (99 . ~=) (105 . |elt|) (111 . +)
              (117 . *) (123 . |concat|) (|List| 74) (129 . |elt|) (135 . |#|)
              (140 . |elt|) (146 . |concat|)
              |SCENE;createScenePattern;SNniSb$;59|
              |SCENE;addScenePattern;$SNniSb$;60|
              |SCENE;createScenePattern;SNniR$;61|
              |SCENE;addScenePattern;$SNniR$;62| (152 . |log10|) (157 . >)
              (|List| $) (163 . |concat|) (168 . ~=)
              |SCENE;createSceneRuler;SPTSb$;63|
              |SCENE;addSceneRuler;$SPTSb$;64|
              |SCENE;createSceneRuler;SPTR$;65| |SCENE;addSceneRuler;$SPTR$;66|
              (|STransform| (|SCartesian| '2)) (174 . |stranslate|)
              (|Scene| (|SCartesian| '2)) (184 . |createSceneTransform|)
              (|DirectedGraph| 45) (189 . |subdiagramSvg|)
              |SCENE;createSceneGraph;Dg2NniB$;67|
              |SCENE;addSceneGraph;$Dg2NniB$;68|
              |SCENE;createSceneMaterial;R$;69|
              |SCENE;createSceneMaterial;Df2S$;71|
              |SCENE;addSceneMaterial;$Df2S$;72| (|STransform| 6)
              |SCENE;createSceneTransform;St$;73|
              |SCENE;addSceneTransform;$St$;74| (|Segment| 25) (197 . |low|)
              (202 . |high|) (|Mapping| 6 6)
              |SCENE;createArrows2Din2D;M2SNni$;75|
              |SCENE;addArrows2Din2D;$M2SNni$;76| (|List| $$) (207 . |concat|)
              |SCENE;removeChild!;2$V;78| (213 . ~=)
              |SCENE;setTransform!;$StV;79| (219 . |xform|)
              (225 . |containsPoint?|) (231 . ~=) (237 . |distance|)
              (243 . |One|) (247 . |Zero|) (251 . >) (257 . >) (|XmlAttribute|)
              (263 . |xmlAttribute|) (|List| 159) (|XmlElement|)
              (269 . |xmlElement|) (|List| 162) (276 . |concat|)
              (282 . |isNull?|) (287 . |stranslate|) (297 . |concat|)
              (303 . ~=) (309 . |findPoint|) (315 . |xmlElement|)
              (322 . |empty?|) (327 . |compound|) (333 . |addPoints!|)
              (|Scene| 6) (340 . |addNode!|) |SCENE;toSVG;$RStSbDf2BSnpXe;84|
              (347 . |findNode|) (353 . |#|) |SCENE;toSVG;$RStRDf2BSnpXe;85|
              (358 . |identity|) (362 . |namedBranch|) (|ExportXml|)
              (368 . |writeXml|) |SCENE;writeSvg;$SV;86|
              |SCENE;writeSvgQuantised;$SV;87| (374 . |extendToPoint|)
              (380 . |ellipseBoundary|) (386 . |sunion|) (392 . |screenCoordZ|)
              (397 . |concat|) |SCENE;toX3D;$RStSbXe;93| (403 . |curveLoops|)
              (410 . |smesh|) (416 . |xmlAttribute|) |SCENE;toX3D;$RStRXe;94|
              |SCENE;writeX3d;$SV;95| (|Reference| 22) (|Reference| 60)
              (|Reference| 74) |SCENE;toObj;$RRRStSbV;96| (422 . |elt|)
              (427 . |elt|) (432 . |concat|) (438 . |setelt!|) (444 . |elt|)
              (449 . |concat|) (455 . |setelt!|) (461 . |setelt!|)
              |SCENE;toObj;$RRRStRV;97| (467 . |ref|) (472 . |ref|)
              (477 . |ref|) (|FileName|) (482 . |coerce|) (|TextFile|)
              (487 . |open|) (493 . |writeLine!|) (499 . |close!|)
              |SCENE;writeObj;$SV;98| (504 . |writeVRML|)
              |SCENE;writeVRML;$SV;99| (510 . ~=) (516 . |segment|) (|List| 25)
              (522 . |list|) (527 . |list|) (532 . |Pnan?|) (|Mapping| 6 25)
              |SCENE;createPlot1Din2D;MSNni$;105|
              |SCENE;addPlot1Din2D;$MSNni$;106| (|List| 229) (537 . |first|)
              (|Mapping| 25 25) |SCENE;createPlot1Din2D;MSNni$;107|
              |SCENE;addPlot1Din2D;$MSNni$;108| (|ParametricPlaneCurve| 234)
              (542 . |coordinate|)
              |SCENE;createPlot1Din2Dparametric;PpcSNni$;109|
              |SCENE;addPlot1Din2Dparametric;$PpcSNni$;110|
              (|ParametricSpaceCurve| 234) (548 . |coordinate|)
              |SCENE;createPlot1Din3Dparametric;MSNni$;113|
              |SCENE;createPlot1Din3Dparametric;PscSNni$;111|
              |SCENE;addPlot1Din3Dparametric;$PscSNni$;112|
              |SCENE;addPlot1Din3Dparametric;$MSNni$;114| (|Mapping| 6 25 25)
              |SCENE;createPlot2Din3D;M2SNni$;115| (|List| 247) (554 . |first|)
              (|Mapping| 25 25 25) |SCENE;createPlot2Din3D;M2SNni$;116|
              |SCENE;addPlot2Din3D;$M2SNni$;117| (559 . |One|) (563 . |One|)
              (|ParametricSurface| 251) (567 . |coordinate|) (|List| 251)
              (573 . |first|) |SCENE;createPlot2Din3Dparametric;Ps2SNni$;118|
              |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;119|
              |SCENE;createPlot2Din3Dparametric;M2SNni$;120|
              |SCENE;addPlot2Din3Dparametric;$M2SNni$;121| (|OutputForm|)
              (578 . |coerce|) (583 . |coerce|) (588 . |second|)
              (593 . |message|) (598 . |bracket|) (603 . |second|)
              (608 . |coerce|) (613 . |coerce|) (618 . |second|)
              (623 . |second|) (628 . |coerce|) (633 . |hconcat|)
              (638 . |hconcat|) (644 . |coerce|) (649 . |coerce|)
              (654 . |coerce|) (659 . |coerce|) (664 . |coerce|)
              (669 . |coerce|) |SCENE;coerce;$Of;126|)
           '#(|writeX3d| 674 |writeVRML| 680 |writeSvgQuantised| 686 |writeSvg|
              692 |writeObj| 698 |toX3D| 704 |toSVG| 720 |toObj| 744
              |setTransform!| 764 |removeChild!| 770 |createSceneUse| 776
              |createSceneTransform| 781 |createSceneText| 786
              |createSceneShape| 805 |createSceneRuler| 815 |createSceneRoot|
              829 |createScenePattern| 851 |createSceneNamedPoints| 865
              |createSceneMaterial| 870 |createSceneLines| 882
              |createSceneLine| 887 |createSceneIFS| 907 |createSceneGroup| 918
              |createSceneGrid| 922 |createSceneGraph| 944 |createSceneDef| 952
              |createSceneClip| 958 |createSceneBox| 968 |createSceneArrows|
              973 |createSceneArrow| 980 |createPlot2Din3Dparametric| 999
              |createPlot2Din3D| 1015 |createPlot1Din3Dparametric| 1031
              |createPlot1Din2Dparametric| 1045 |createPlot1Din2D| 1052
              |createArrows2Din2D| 1066 |coerce| 1074 |boundary| 1079
              |addSceneUse| 1085 |addSceneTransform| 1091 |addSceneText| 1097
              |addSceneShape| 1119 |addSceneRuler| 1131 |addScenePattern| 1147
              |addSceneNamedPoints| 1163 |addSceneMaterial| 1169
              |addSceneLines| 1183 |addSceneLine| 1189 |addSceneIFS| 1212
              |addSceneGroup| 1225 |addSceneGrid| 1230 |addSceneGraph| 1256
              |addSceneDef| 1265 |addSceneClip| 1272 |addSceneBox| 1284
              |addSceneArrows| 1290 |addSceneArrow| 1298
              |addPlot2Din3Dparametric| 1319 |addPlot2Din3D| 1337
              |addPlot1Din3Dparametric| 1346 |addPlot1Din2Dparametric| 1362
              |addPlot1Din2D| 1370 |addChild!| 1386 |addArrows2Din2D| 1392)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|createSceneRoot| ($$)) T)
                                   '((|createSceneRoot|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneRoot|
                                      ($$
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|createSceneRoot|
                                      ($$ (|Integer|) (|Integer|) (|Integer|)
                                       (|Integer|)))
                                     T)
                                   '((|createSceneGroup| ($$)) T)
                                   '((|addSceneGroup| ($$ $$)) T)
                                   '((|createSceneLine| ($$ (|List| |#1|))) T)
                                   '((|addSceneLine| ($$ $$ (|List| |#1|))) T)
                                   '((|createSceneLine|
                                      ($$ $$ $$ (|DoubleFloat|)))
                                     T)
                                   '((|addSceneLine|
                                      ($$ $$ $$ $$ (|DoubleFloat|)))
                                     T)
                                   '((|createSceneLine|
                                      ($$ $$ $$ (|DoubleFloat|) (|Boolean|)))
                                     T)
                                   '((|addSceneLine|
                                      ($$ $$ $$ $$ (|DoubleFloat|)
                                       (|Boolean|)))
                                     T)
                                   '((|createSceneLines|
                                      ($$ (|List| (|List| |#1|))))
                                     T)
                                   '((|addSceneLines|
                                      ($$ $$ (|List| (|List| |#1|))))
                                     T)
                                   '((|createSceneShape|
                                      ($$
                                       (|Record| (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| |#1|)
                                                 (|:| |size| |#1|)
                                                 (|:| |fill| (|Boolean|)))))
                                     T)
                                   '((|addSceneShape|
                                      ($$ $$
                                       (|Record| (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| |#1|)
                                                 (|:| |size| |#1|)
                                                 (|:| |fill| (|Boolean|)))))
                                     T)
                                   '((|createSceneShape|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneShape|
                                      ($$ $$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneDef| ($$ (|String|) $$)) T)
                                   '((|addSceneDef| ($$ $$ (|String|) $$)) T)
                                   '((|createSceneUse| ($$ (|String|))) T)
                                   '((|addSceneUse| ($$ $$ (|String|))) T)
                                   '((|createSceneArrows|
                                      ($$ (|List| (|List| |#1|)) (|Symbol|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|addSceneArrows|
                                      ($$ $$ (|List| (|List| |#1|)) (|Symbol|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|createSceneArrow|
                                      ($$ (|String|) (|String|) |#1| (|Symbol|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|addSceneArrow|
                                      ($$ $$ (|String|) (|String|) |#1|
                                       (|Symbol|) (|DoubleFloat|)))
                                     T)
                                   '((|createSceneArrow|
                                      ($$ $$ $$ |#1| (|Symbol|) (|DoubleFloat|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|addSceneArrow|
                                      ($$ $$ $$ $$ |#1| (|Symbol|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|createSceneNamedPoints|
                                      ($$ (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|addSceneNamedPoints|
                                      ($$ $$ (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|createSceneIFS|
                                      ($$
                                       (|List| (|List| (|NonNegativeInteger|)))
                                       (|List| |#1|)))
                                     T)
                                   '((|addSceneIFS|
                                      ($$ $$
                                       (|List| (|List| (|NonNegativeInteger|)))
                                       (|List| |#1|)))
                                     T)
                                   '((|createSceneIFS| ($$ (|SceneIFS| |#1|)))
                                     T)
                                   '((|addSceneIFS| ($$ $$ (|SceneIFS| |#1|)))
                                     T)
                                   '((|createSceneBox| ($$ (|DoubleFloat|))) T)
                                   '((|addSceneBox| ($$ $$ (|DoubleFloat|))) T)
                                   '((|createSceneText|
                                      ($$
                                       (|Record| (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| |#1|)
                                                 (|:| |np|
                                                      (|List| (|String|))))))
                                     T)
                                   '((|addSceneText|
                                      ($$ $$
                                       (|Record| (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| |#1|)
                                                 (|:| |np|
                                                      (|List| (|String|))))))
                                     T)
                                   '((|createSceneText|
                                      ($$ (|String|) (|NonNegativeInteger|)
                                       |#1|))
                                     T)
                                   '((|addSceneText|
                                      ($$ $$ (|String|) (|NonNegativeInteger|)
                                       |#1|))
                                     T)
                                   '((|createSceneText|
                                      ($$ (|List| (|String|))
                                       (|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|addSceneText|
                                      ($$ $$ (|List| (|String|))
                                       (|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|createSceneClip|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneClip|
                                      ($$ $$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneClip|
                                      ($$
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|addSceneClip|
                                      ($$ $$
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|createSceneGrid|
                                      ($$ (|DoubleFloat|) (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneGrid|
                                      ($$ $$ (|DoubleFloat|)
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneGrid|
                                      ($$ (|DoubleFloat|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|addSceneGrid|
                                      ($$ $$ (|DoubleFloat|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|createSceneGrid|
                                      ($$ (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneGrid|
                                      ($$ $$ (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneGrid|
                                      ($$
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|addSceneGrid|
                                      ($$ $$
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|createScenePattern|
                                      ($$ (|Symbol|) (|NonNegativeInteger|)
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|addScenePattern|
                                      ($$ $$ (|Symbol|) (|NonNegativeInteger|)
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|createScenePattern|
                                      ($$ (|Symbol|) (|NonNegativeInteger|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|addScenePattern|
                                      ($$ $$ (|Symbol|) (|NonNegativeInteger|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|createSceneRuler|
                                      ($$ (|Symbol|) |#1| (|SBoundary| |#1|)))
                                     T)
                                   '((|addSceneRuler|
                                      ($$ $$ (|Symbol|) |#1|
                                       (|SBoundary| |#1|)))
                                     T)
                                   '((|createSceneRuler|
                                      ($$ (|Symbol|) |#1|
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|addSceneRuler|
                                      ($$ $$ (|Symbol|) |#1|
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|createSceneGraph|
                                      ($$ (|DirectedGraph| (|String|))
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|) (|Boolean|)))
                                     T)
                                   '((|addSceneGraph|
                                      ($$ $$ (|DirectedGraph| (|String|))
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|) (|Boolean|)))
                                     T)
                                   '((|createSceneMaterial|
                                      ($$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))))
                                     T)
                                   '((|addSceneMaterial|
                                      ($$ $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))))
                                     T)
                                   '((|createSceneMaterial|
                                      ($$ (|DoubleFloat|) (|String|)
                                       (|String|)))
                                     T)
                                   '((|addSceneMaterial|
                                      ($$ $$ (|DoubleFloat|) (|String|)
                                       (|String|)))
                                     T)
                                   '((|createSceneTransform|
                                      ($$ (|STransform| |#1|)))
                                     T)
                                   '((|addSceneTransform|
                                      ($$ $$ (|STransform| |#1|)))
                                     T)
                                   '((|createPlot1Din2D|
                                      ($$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din2D|
                                      ($$ $$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din2D|
                                      ($$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din2D|
                                      ($$ $$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din2Dparametric|
                                      ($$
                                       (|ParametricPlaneCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din2Dparametric|
                                      ($$ $$
                                       (|ParametricPlaneCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din3Dparametric|
                                      ($$
                                       (|ParametricSpaceCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din3Dparametric|
                                      ($$ $$
                                       (|ParametricSpaceCurve|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot1Din3Dparametric|
                                      ($$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot1Din3Dparametric|
                                      ($$ $$ (|Mapping| |#1| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3D|
                                      ($$
                                       (|Mapping| |#1| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3D|
                                      ($$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot2Din3D|
                                      ($$ $$
                                       (|Mapping| (|DoubleFloat|)
                                                  (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3Dparametric|
                                      ($$
                                       (|Mapping| |#1| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot2Din3Dparametric|
                                      ($$ $$
                                       (|Mapping| |#1| (|DoubleFloat|)
                                                  (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createPlot2Din3Dparametric|
                                      ($$
                                       (|ParametricSurface|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addPlot2Din3Dparametric|
                                      ($$ $$
                                       (|ParametricSurface|
                                        (|Mapping| (|DoubleFloat|)
                                                   (|DoubleFloat|)
                                                   (|DoubleFloat|)))
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createArrows2Din2D|
                                      ($$ (|Mapping| |#1| |#1|)
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addArrows2Din2D|
                                      ($$ $$ (|Mapping| |#1| |#1|)
                                       (|Segment| (|DoubleFloat|))
                                       (|Segment| (|DoubleFloat|))
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|boundary|
                                      ((|SBoundary| |#1|) $$ (|DoubleFloat|)))
                                     T)
                                   '((|addChild!| ((|Void|) $$ $$)) T)
                                   '((|removeChild!| ((|Void|) $$ $$)) T)
                                   '((|setTransform!|
                                      ((|Void|) $$ (|STransform| |#1|)))
                                     T)
                                   '((|toSVG|
                                      ((|XmlElement|) $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))
                                       (|STransform| |#1|) (|SBoundary| |#1|)
                                       (|DoubleFloat|) (|Boolean|) (|Boolean|)
                                       (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|toSVG|
                                      ((|XmlElement|) $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))
                                       (|STransform| |#1|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))
                                       (|DoubleFloat|) (|Boolean|) (|Boolean|)
                                       (|SceneNamedPoints| |#1|)))
                                     T)
                                   '((|toX3D|
                                      ((|XmlElement|) $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))
                                       (|STransform| |#1|) (|SBoundary| |#1|)))
                                     T)
                                   '((|toX3D|
                                      ((|XmlElement|) $$
                                       (|Record|
                                        (|:| |lineWidth| (|DoubleFloat|))
                                        (|:| |lineCol| (|String|))
                                        (|:| |fillCol| (|String|))
                                        (|:| |matOpacity| (|DoubleFloat|)))
                                       (|STransform| |#1|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|toObj|
                                      ((|Void|) $$ (|Reference| (|List| |#1|))
                                       (|Reference|
                                        (|List|
                                         (|List| (|NonNegativeInteger|))))
                                       (|Reference| (|NonNegativeInteger|))
                                       (|STransform| |#1|) (|SBoundary| |#1|)))
                                     T)
                                   '((|toObj|
                                      ((|Void|) $$ (|Reference| (|List| |#1|))
                                       (|Reference|
                                        (|List|
                                         (|List| (|NonNegativeInteger|))))
                                       (|Reference| (|NonNegativeInteger|))
                                       (|STransform| |#1|)
                                       (|Record| (|:| |mins| |#1|)
                                                 (|:| |maxs| |#1|))))
                                     T)
                                   '((|writeSvg| ((|Void|) $$ (|String|))) T)
                                   '((|writeSvgQuantised|
                                      ((|Void|) $$ (|String|)))
                                     T)
                                   '((|writeX3d| ((|Void|) $$ (|String|))) T)
                                   '((|writeVRML| ((|Void|) $$ (|String|))) T)
                                   '((|writeObj| ((|Void|) $$ (|String|))) T)
                                   '((|coerce| ((|OutputForm|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 284
                                            '(2 8 0 6 6 10 2 6 0 13 13 14 0 8 0
                                              16 1 8 6 0 32 2 8 6 0 6 33 1 8 6
                                              0 40 1 8 6 0 41 2 6 0 0 0 42 1 63
                                              60 0 64 1 63 22 0 65 3 6 0 25 25
                                              25 68 1 6 25 0 84 1 6 25 0 85 2 6
                                              0 25 25 86 3 92 0 13 13 91 93 1
                                              92 25 0 94 1 63 0 22 101 2 63 0 0
                                              74 102 2 74 26 0 0 103 2 22 6 0
                                              13 104 2 6 0 0 0 105 2 6 0 25 0
                                              106 2 22 0 0 6 107 2 60 108 0 13
                                              109 1 108 74 0 110 2 108 74 0 13
                                              111 2 34 0 0 22 112 1 25 0 0 117
                                              2 13 26 0 0 118 1 45 0 119 120 2
                                              13 26 0 0 121 6 126 0 25 25 25 25
                                              25 25 127 1 128 0 126 129 4 130
                                              19 128 0 26 26 131 1 140 25 0 141
                                              1 140 25 0 142 2 146 0 0 2 147 2
                                              50 26 0 0 149 2 137 6 0 6 151 2 8
                                              26 0 6 152 2 45 26 0 0 153 2 6 25
                                              0 0 154 0 92 0 155 0 92 0 156 2
                                              25 26 0 0 157 2 74 26 0 0 158 2
                                              159 0 45 45 160 3 162 0 45 119
                                              161 163 2 164 0 0 162 165 1 8 26
                                              0 166 6 137 0 25 25 25 25 25 25
                                              167 2 161 0 0 159 168 2 77 26 0 0
                                              169 2 57 6 0 45 170 3 162 0 45 45
                                              161 171 1 162 26 0 172 2 137 0 0
                                              0 173 3 57 0 0 45 0 174 3 57 0 0
                                              45 175 176 2 57 175 0 45 178 1
                                              146 74 0 179 0 137 0 181 2 57 0
                                              119 77 182 2 183 19 162 45 184 2
                                              8 0 0 6 187 2 8 0 6 6 188 2 8 0 0
                                              0 189 1 6 25 0 190 2 77 0 0 45
                                              191 3 63 34 22 25 13 193 2 63 0
                                              34 26 194 2 159 0 45 77 195 1 200
                                              74 0 202 1 198 22 0 203 2 22 0 0
                                              0 204 2 198 22 0 22 205 1 199 60
                                              0 206 2 60 0 0 0 207 2 199 60 0
                                              60 208 2 200 74 0 74 209 1 198 0
                                              22 211 1 199 0 60 212 1 200 0 74
                                              213 1 214 0 45 215 2 216 0 214 45
                                              217 2 216 45 0 45 218 1 216 0 0
                                              219 2 183 19 162 45 221 2 25 26 0
                                              0 223 2 140 0 25 25 224 1 225 0
                                              25 226 1 22 0 6 227 1 6 26 0 228
                                              1 232 229 0 233 2 237 234 0 74
                                              238 2 241 234 0 74 242 1 249 247
                                              0 250 0 25 0 254 0 74 0 255 2 256
                                              251 0 74 257 1 258 251 0 259 1 22
                                              264 0 265 1 6 264 0 266 1 22 6 0
                                              267 1 264 0 45 268 1 264 0 119
                                              269 1 34 22 0 270 1 108 264 0 271
                                              1 74 264 0 272 1 108 74 0 273 1
                                              60 108 0 274 1 8 264 0 275 1 264
                                              0 119 276 2 264 0 0 0 277 1 50
                                              264 0 278 1 25 264 0 279 1 45 264
                                              0 280 1 77 264 0 281 1 137 264 0
                                              282 1 57 264 0 283 2 0 19 0 45
                                              197 2 0 19 0 45 222 2 0 19 0 45
                                              186 2 0 19 0 45 185 2 0 19 0 45
                                              220 4 0 162 0 95 137 8 192 4 0
                                              162 0 95 137 11 196 8 0 162 0 95
                                              137 8 25 26 26 57 177 8 0 162 0
                                              95 137 11 25 26 26 57 180 6 0 19
                                              0 198 199 200 137 8 201 6 0 19 0
                                              198 199 200 137 11 210 2 0 19 0
                                              137 150 2 0 19 0 0 148 1 0 0 45
                                              48 1 0 0 137 138 1 0 0 71 72 3 0
                                              0 45 74 6 75 3 0 0 77 74 6 78 1 0
                                              0 37 38 1 0 0 8 43 3 0 0 50 6 8
                                              122 3 0 0 50 6 11 124 0 0 0 17 1
                                              0 0 11 12 1 0 0 8 9 4 0 0 13 13
                                              13 13 15 3 0 0 50 74 8 113 3 0 0
                                              50 74 11 115 1 0 0 57 58 1 0 0 95
                                              134 3 0 0 25 45 45 135 1 0 0 34
                                              35 1 0 0 22 23 3 0 0 0 0 25 28 4
                                              0 0 0 0 25 26 27 2 0 0 60 22 61 1
                                              0 0 63 66 0 0 0 18 2 0 0 25 8 87
                                              2 0 0 25 11 89 1 0 0 8 97 1 0 0
                                              11 99 4 0 0 130 74 74 26 132 2 0
                                              0 45 0 46 1 0 0 8 80 1 0 0 11 82
                                              1 0 0 25 69 3 0 0 34 50 25 51 5 0
                                              0 45 45 6 50 25 53 6 0 0 0 0 6 50
                                              25 25 55 4 0 0 247 140 140 74 262
                                              4 0 0 256 140 140 74 260 4 0 0
                                              247 140 140 74 248 4 0 0 251 140
                                              140 74 252 3 0 0 241 140 74 244 3
                                              0 0 229 140 74 243 3 0 0 237 140
                                              74 239 3 0 0 229 140 74 230 3 0 0
                                              234 140 74 235 4 0 0 143 140 140
                                              74 144 1 0 264 0 284 2 0 8 0 25
                                              31 2 0 0 0 45 49 2 0 0 0 137 139
                                              2 0 0 0 71 73 4 0 0 0 45 74 6 76
                                              4 0 0 0 77 74 6 79 2 0 0 0 37 39
                                              2 0 0 0 8 44 4 0 0 0 50 6 8 123 4
                                              0 0 0 50 6 11 125 4 0 0 0 50 74 8
                                              114 4 0 0 0 50 74 11 116 2 0 0 0
                                              57 59 2 0 0 0 95 96 4 0 0 0 25 45
                                              45 136 2 0 0 0 34 36 2 0 0 0 22
                                              24 4 0 0 0 0 0 25 30 5 0 0 0 0 0
                                              25 26 29 3 0 0 0 60 22 62 2 0 0 0
                                              63 67 1 0 0 0 21 3 0 0 0 25 8 88
                                              3 0 0 0 25 11 90 2 0 0 0 8 98 2 0
                                              0 0 11 100 5 0 0 0 130 74 74 26
                                              133 3 0 0 0 45 0 47 2 0 0 0 8 81
                                              2 0 0 0 11 83 2 0 0 0 25 70 4 0 0
                                              0 34 50 25 52 6 0 0 0 45 45 6 50
                                              25 54 7 0 0 0 0 0 6 50 25 25 56 5
                                              0 0 0 247 140 140 74 263 5 0 0 0
                                              256 140 140 74 261 5 0 0 0 251
                                              140 140 74 253 4 0 0 0 241 140 74
                                              245 4 0 0 0 229 140 74 246 4 0 0
                                              0 237 140 74 240 4 0 0 0 229 140
                                              74 231 4 0 0 0 234 140 74 236 2 0
                                              19 0 0 20 5 0 0 0 143 140 140 74
                                              145)))))
           '|lookupComplete|)) 
