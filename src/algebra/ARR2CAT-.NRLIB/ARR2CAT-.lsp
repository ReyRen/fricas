
(SDEFUN |ARR2CAT-;any?;MSB;1|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G494 NIL) (#2=#:G495 NIL) (#3=#:G497 NIL) (|j| NIL)
          (#4=#:G496 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                 (LETT #4# (SPADCALL |m| (QREFELT $ 12))) G190
                 (COND ((> |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                        (LETT #3# (SPADCALL |m| (QREFELT $ 14))) G190
                        (COND ((> |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                      |f|)
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# 'T) (GO #5=#:G493)))
                             (GO #6=#:G489))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #1#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;every?;MSB;2|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G503 NIL) (#2=#:G504 NIL) (#3=#:G506 NIL) (|j| NIL)
          (#4=#:G505 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                 (LETT #4# (SPADCALL |m| (QREFELT $ 12))) G190
                 (COND ((> |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                        (LETT #3# (SPADCALL |m| (QREFELT $ 14))) G190
                        (COND ((> |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                       |f|))
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# NIL) (GO #5=#:G502)))
                             (GO #6=#:G499))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #1#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;size?;SNniB;3|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))
             |n|)) 

(SDEFUN |ARR2CAT-;less?;SNniB;4|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|)) 

(SDEFUN |ARR2CAT-;more?;SNniB;5|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL
         (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|
         (QREFELT $ 25))) 

(SDEFUN |ARR2CAT-;smaller?;2SB;6| ((|m1| S) (|m2| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G519 NIL) (|el2| (R)) (|el1| (R)) (#2=#:G521 NIL) (|j| NIL)
          (#3=#:G520 NIL) (|i| NIL) (|maxColIndex| (|Integer|))
          (|mci2| #4=(|Integer|)) (|mci1| #4#) (|minColIndex| #4#)
          (|maxRowIndex| (|Integer|)) (|mri2| #5=(|Integer|)) (|mri1| #5#)
          (|minRowIndex| #5#))
         (SEQ
          (EXIT
           (SEQ (LETT |mri1| (SPADCALL |m1| (QREFELT $ 11)))
                (LETT |mri2| (SPADCALL |m2| (QREFELT $ 11)))
                (EXIT
                 (COND ((< |mri1| |mri2|) 'T) ((< |mri2| |mri1|) NIL)
                       (#6='T
                        (SEQ (LETT |minRowIndex| |mri1|)
                             (LETT |mri1| (SPADCALL |m1| (QREFELT $ 12)))
                             (LETT |mri2| (SPADCALL |m2| (QREFELT $ 12)))
                             (EXIT
                              (COND ((< |mri1| |mri2|) 'T)
                                    ((< |mri2| |mri1|) NIL)
                                    (#6#
                                     (SEQ (LETT |maxRowIndex| |mri1|)
                                          (LETT |mci1|
                                                (SPADCALL |m1| (QREFELT $ 13)))
                                          (LETT |mci2|
                                                (SPADCALL |m2| (QREFELT $ 13)))
                                          (EXIT
                                           (COND ((< |mci1| |mci2|) 'T)
                                                 ((< |mci2| |mci1|) NIL)
                                                 (#6#
                                                  (SEQ
                                                   (LETT |minColIndex| |mci1|)
                                                   (LETT |mci1|
                                                         (SPADCALL |m1|
                                                                   (QREFELT $
                                                                            14)))
                                                   (LETT |mci2|
                                                         (SPADCALL |m2|
                                                                   (QREFELT $
                                                                            14)))
                                                   (EXIT
                                                    (COND
                                                     ((< |mci1| |mci2|) 'T)
                                                     ((< |mci2| |mci1|) NIL)
                                                     (#6#
                                                      (SEQ
                                                       (LETT |maxColIndex|
                                                             |mci1|)
                                                       (SEQ
                                                        (LETT |i|
                                                              |minRowIndex|)
                                                        (LETT #3#
                                                              |maxRowIndex|)
                                                        G190
                                                        (COND
                                                         ((> |i| #3#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (SEQ
                                                           (LETT |j|
                                                                 |minColIndex|)
                                                           (LETT #2#
                                                                 |maxColIndex|)
                                                           G190
                                                           (COND
                                                            ((> |j| #2#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |el1|
                                                                  (SPADCALL
                                                                   |m1| |i| |j|
                                                                   (QREFELT $
                                                                            27)))
                                                            (LETT |el2|
                                                                  (SPADCALL
                                                                   |m2| |i| |j|
                                                                   (QREFELT $
                                                                            27)))
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |el1|
                                                                         |el2|
                                                                         (QREFELT
                                                                          $
                                                                          28))
                                                               (PROGN
                                                                (LETT #1# 'T)
                                                                (GO
                                                                 #7=#:G518)))
                                                              ((NULL
                                                                (SPADCALL |el1|
                                                                          |el2|
                                                                          (QREFELT
                                                                           $
                                                                           29)))
                                                               (PROGN
                                                                (LETT #1# NIL)
                                                                (GO #7#))))))
                                                           (LETT |j| (+ |j| 1))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                        (LETT |i| (+ |i| 1))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (EXIT
                                                        NIL)))))))))))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |ARR2CAT-;#;SNni;7| ((|m| S) ($ |NonNegativeInteger|))
        (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))) 

(SDEFUN |ARR2CAT-;elt;S2I2R;8|
        ((|m| S) (|i| |Integer|) (|j| |Integer|) (|r| R) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 32)))
          |r|)
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 32)))
          |r|)
         ('T (SPADCALL |m| |i| |j| (QREFELT $ 15))))) 

(SDEFUN |ARR2CAT-;count;MSNni;9|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|num| (|NonNegativeInteger|)) (#1=#:G535 NIL) (|j| NIL)
          (#2=#:G534 NIL) (|i| NIL))
         (SEQ (LETT |num| 0)
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                   (LETT #2# (SPADCALL |m| (QREFELT $ 12))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |f|)
                              (LETT |num| (+ |num| 1))))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |num|)))) 

(SDEFUN |ARR2CAT-;parts;SL;10| ((|m| S) ($ |List| R))
        (SPROG
         ((|entryList| (|List| R)) (#1=#:G541 NIL) (|j| NIL) (#2=#:G540 NIL)
          (|i| NIL))
         (SEQ (LETT |entryList| NIL)
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 12)))
                   (LETT #2# (SPADCALL |m| (QREFELT $ 11))) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 14)))
                          (LETT #1# (SPADCALL |m| (QREFELT $ 13))) G190
                          (COND ((< |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |entryList|
                                  (CONS (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |entryList|))))
                          (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |entryList|)))) 

(SDEFUN |ARR2CAT-;listOfLists;SL;11| ((|x| S) ($ |List| (|List| R)))
        (SPROG
         ((|ll| (|List| (|List| R))) (|l| (|List| R)) (#1=#:G548 NIL) (|j| NIL)
          (#2=#:G547 NIL) (|i| NIL))
         (SEQ (LETT |ll| NIL)
              (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 12)))
                   (LETT #2# (SPADCALL |x| (QREFELT $ 11))) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ (LETT |l| NIL)
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 14)))
                             (LETT #1# (SPADCALL |x| (QREFELT $ 13))) G190
                             (COND ((< |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |l|
                                     (CONS
                                      (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                      |l|))))
                             (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |ll| (CONS |l| |ll|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |ll|)))) 

(SDEFUN |ARR2CAT-;subMatrix;S4IS;12|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) (|j1| |Integer|)
         (|j2| |Integer|) ($ S))
        (SPROG
         ((#1=#:G561 NIL) (|j| NIL) (#2=#:G562 NIL) (|l| NIL) (#3=#:G559 NIL)
          (|i| NIL) (#4=#:G560 NIL) (|k| NIL) (|y| (S))
          (|cols| #5=(|NonNegativeInteger|)) (|rows| #5#))
         (SEQ
          (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
                ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
                ('T
                 (SEQ (LETT |rows| (+ (- |i2| |i1|) 1))
                      (LETT |cols| (+ (- |j2| |j1|) 1))
                      (LETT |y| (SPADCALL |rows| |cols| (QREFELT $ 39)))
                      (COND ((OR (EQL |rows| 0) (EQL |cols| 0)) (EXIT |y|)))
                      (COND
                       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                            (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                      (QREFELT $ 32)))
                        (EXIT (|error| "subMatrix: index out of range"))))
                      (COND
                       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 32)))
                        (EXIT (|error| "subMatrix: index out of range"))))
                      (SEQ (LETT |k| |i1|) (LETT #4# |i2|)
                           (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                           (LETT #3# (SPADCALL |y| (QREFELT $ 12))) G190
                           (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |l| |j1|) (LETT #2# |j2|)
                                  (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                                  (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                                  (COND
                                   ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |y| |i| |j|
                                              (SPADCALL |x| |k| |l|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 40))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SILS;13|
        ((|x| S) (|row| |Integer|) (|colList| |List| (|Integer|)) ($ S))
        (SPROG
         ((#1=#:G573 NIL) (|ej| NIL) (#2=#:G574 NIL) (|j| NIL) (|y| (S))
          (#3=#:G571 NIL) (#4=#:G572 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |row| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 32)))
            (|error| "elt: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL) (LETT #4# |colList|) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 32)))
                        (PROGN
                         (LETT #3# (|error| "elt: index out of range"))
                         (GO #5=#:G567))))))
                    (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #3#))
             (LETT |y| (SPADCALL 1 (LENGTH |colList|) (QREFELT $ 39)))
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                  (LETT #2# (SPADCALL |y| (QREFELT $ 14))) (LETT |ej| NIL)
                  (LETT #1# |colList|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| 1 |j|
                              (SPADCALL |x| |row| |ej| (QREFELT $ 15))
                              (QREFELT $ 40))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;14|
        ((|x| S) (|rowList| |List| (|Integer|)) (|col| |Integer|) ($ S))
        (SPROG
         ((#1=#:G585 NIL) (|ei| NIL) (#2=#:G586 NIL) (|i| NIL) (|y| (S))
          (#3=#:G583 NIL) (#4=#:G584 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #4# |rowList|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #3# (|error| "elt: index out of range"))
                      (GO #5=#:G577))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |col| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 32)))
            (EXIT (|error| "elt: index out of range"))))
          (LETT |y| (SPADCALL (LENGTH |rowList|) 1 (QREFELT $ 39)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
               (LETT #2# (SPADCALL |y| (QREFELT $ 12))) (LETT |ei| NIL)
               (LETT #1# |rowList|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL) (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |i| 1 (SPADCALL |x| |ei| |col| (QREFELT $ 15))
                           (QREFELT $ 40))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;15|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G603 NIL) (|ej| NIL) (#2=#:G604 NIL) (|j| NIL) (#3=#:G601 NIL)
          (|ei| NIL) (#4=#:G602 NIL) (|i| NIL) (|y| (S)) (#5=#:G597 NIL)
          (#6=#:G600 NIL) (#7=#:G598 NIL) (#8=#:G599 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #8# |rowList|) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #7# (|error| "elt: index out of range"))
                      (GO #9=#:G589))))))
                 (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL) (LETT #6# |colList|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                         (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #5# (|error| "elt: index out of range"))
                      (GO #10=#:G592))))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #5#))
          (LETT |y|
                (SPADCALL (LENGTH |rowList|) (LENGTH |colList|)
                          (QREFELT $ 39)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
               (LETT #4# (SPADCALL |y| (QREFELT $ 12))) (LETT |ei| NIL)
               (LETT #3# |rowList|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#)) NIL) (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                      (LETT #2# (SPADCALL |y| (QREFELT $ 14))) (LETT |ej| NIL)
                      (LETT #1# |colList|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |ei| |ej| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_seg|
        ((|s| |Segment| (|Integer|)) (|lb| |Integer|) (|ub| |Integer|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|cc| (|NonNegativeInteger|)) (|ii| (|Integer|)) (|i2| (|Integer|))
          (|i1| (|Integer|)))
         (SEQ (LETT |ii| (SPADCALL |s| (QREFELT $ 47)))
              (LETT |i1| (SPADCALL |s| (QREFELT $ 48)))
              (LETT |i2| (SPADCALL |s| (QREFELT $ 49)))
              (COND
               ((SPADCALL |ii| 0 (QREFELT $ 32))
                (COND
                 ((< (+ |i2| 1) |i1|)
                  (EXIT (|error| #1="check_seg: bad indices")))
                 ((< |ii| 0)
                  (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #1#)))))))
               ((< |ii| 0) (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #1#))))))
              (COND
               ((SPADCALL |i1| |i2| (QREFELT $ 32))
                (COND ((SPADCALL |ii| 0 (QREFELT $ 32)) (EXIT 0))
                      ((SPADCALL |i2| |i1| (QREFELT $ 32))
                       (COND ((< |ii| 0) (EXIT 0))))))
               ((SPADCALL |i2| |i1| (QREFELT $ 32))
                (COND ((< |ii| 0) (EXIT 0)))))
              (EXIT
               (COND
                ((< 0 |ii|)
                 (COND
                  ((< (+ |i2| 1) |i1|)
                   (|error| "check_seg: index out of range"))
                  (#2='T
                   (SEQ (LETT |cc| (+ (- |i2| |i1|) |ii|))
                        (EXIT
                         (COND ((< |cc| |ii|) |cc|)
                               ((OR (< |i1| |lb|) (< |ub| |i2|))
                                (|error| "check_seg: index out of range"))
                               (#3='T
                                (COND ((EQL |ii| 1) |cc|)
                                      (#2# (QUOTIENT2 |cc| |ii|))))))))))
                ((< |ii| 0)
                 (SEQ (LETT |ii| (- |ii|))
                      (COND
                       ((OR (OR (< (+ |i1| 1) |i2|) (< |i2| |lb|))
                            (< |ub| |i1|))
                        (EXIT (|error| "check_seg: index out of range"))))
                      (LETT |cc| (+ (- |i1| |i2|) |ii|))
                      (EXIT
                       (COND ((< |cc| |ii|) |cc|)
                             ((OR (< |i2| |lb|) (< |ub| |i1|))
                              (|error| "check_seg: index out of range"))
                             (#3#
                              (COND ((EQL |ii| 1) |cc|)
                                    (#2# (QUOTIENT2 |cc| |ii|))))))))
                (#2# (|error| "chec_seg: zero increment"))))))) 

(SDEFUN |ARR2CAT-;elt;SLSS;17|
        ((|x| S) (|rowList| |List| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G622 NIL) (|j| NIL) (#2=#:G623 NIL) (#3=#:G624 NIL) (|l| NIL)
          (#4=#:G620 NIL) (|i| NIL) (#5=#:G621 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)))
              (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)))
              (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)))
              (LETT |nr| (LENGTH |rowList|))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| NIL) (LETT #5# |rowList|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |k| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SSLS;18|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G632 NIL) (|j| NIL) (#2=#:G633 NIL) (|l| NIL) (#3=#:G629 NIL)
          (|i| NIL) (#4=#:G630 NIL) (#5=#:G631 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
              (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
              (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc| (LENGTH |colList|))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND
                    ((OR (> |i| #3#)
                         (IF (MINUSP #4#)
                             (< |k| #5#)
                             (> |k| #5#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| NIL) (LETT #2# |colList|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND
                           ((OR (> |j| #1#) (ATOM #2#)
                                (PROGN (LETT |l| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2SS;19|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G641 NIL) (|j| NIL) (#2=#:G642 NIL) (#3=#:G643 NIL) (|l| NIL)
          (#4=#:G638 NIL) (|i| NIL) (#5=#:G639 NIL) (#6=#:G640 NIL) (|k| NIL)
          (|y| (S)) (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#)
          (|ic| #8=(|Integer|)) (|ir| #8#) (|uc| #9=(|Integer|))
          (|lc| #10=(|Integer|)) (|ur| #9#) (|lr| #10#))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
              (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
              (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)))
              (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)))
              (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)))
              (COND
               ((EQL |ir| 1)
                (COND
                 ((EQL |ic| 1)
                  (EXIT (SPADCALL |x| |lr| |ur| |lc| |uc| (QREFELT $ 52)))))))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #6# |ur|) (LETT #5# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND
                    ((OR (> |i| #4#)
                         (IF (MINUSP #5#)
                             (< |k| #6#)
                             (> |k| #6#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_segs|
        ((|ls| |List| (|Segment| (|Integer|))) (|lb| |Integer|)
         (|ub| |Integer|) ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G647 NIL) (|s| NIL))
               (SEQ (LETT |res| 0)
                    (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (+ |res|
                                    (|ARR2CAT-;check_seg| |s| |lb| |ub| $)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ARR2CAT-;elt;SILS;21|
        ((|x| S) (|row| |Integer|) (|lsc| |List| (|Segment| (|Integer|)))
         ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G655 NIL) (#2=#:G656 NIL) (|l| NIL)
          (#3=#:G654 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $))
          (LETT |y| (SPADCALL 1 |nc| (QREFELT $ 39)))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                       (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sc| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 48)))
                                   (LETT #2# (SPADCALL |sc| (QREFELT $ 49)))
                                   (LETT #1# (SPADCALL |sc| (QREFELT $ 47)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |l| #2#)
                                         (> |l| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |y| 1 |j|
                                              (SPADCALL |x| |row| |l|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 40))
                                    (EXIT (LETT |j| (+ |j| 1))))
                                   (LETT |l| (+ |l| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;22|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|))) (|col| |Integer|)
         ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G664 NIL) (#2=#:G665 NIL) (|k| NIL)
          (#3=#:G663 NIL) (|sr| NIL) (|y| (S)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $))
          (LETT |y| (SPADCALL |nr| 1 (QREFELT $ 39)))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                       (SEQ (LETT |sr| NIL) (LETT #3# |lsr|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sr| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 48)))
                                   (LETT #2# (SPADCALL |sr| (QREFELT $ 49)))
                                   (LETT #1# (SPADCALL |sr| (QREFELT $ 47)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |k| #2#)
                                         (> |k| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |y| |i| 1
                                              (SPADCALL |x| |k| |col|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 40))
                                    (EXIT (LETT |i| (+ |i| 1))))
                                   (LETT |k| (+ |k| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SSLS;23|
        ((|x| S) (|sr| |Segment| (|Integer|))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G675 NIL) (|i| NIL) (#2=#:G676 NIL)
          (#3=#:G677 NIL) (|k| NIL) (#4=#:G673 NIL) (#5=#:G674 NIL) (|l| NIL)
          (#6=#:G672 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
              (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
              (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc|
                    (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
              (SEQ (LETT |sc| NIL) (LETT #6# |lsc|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 48)))
                          (LETT #5# (SPADCALL |sc| (QREFELT $ 49)))
                          (LETT #4# (SPADCALL |sc| (QREFELT $ 47))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |l| #5#)
                                (> |l| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |k| |lr|) (LETT #3# |ur|) (LETT #2# |ir|)
                                (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                                (LETT #1# (SPADCALL |y| (QREFELT $ 12))) G190
                                (COND
                                 ((OR (> |i| #1#)
                                      (IF (MINUSP #2#)
                                          (< |k| #3#)
                                          (> |k| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |y| |i| |j|
                                            (SPADCALL |x| |k| |l|
                                                      (QREFELT $ 15))
                                            (QREFELT $ 40))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT |k| (+ |k| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |j| (+ |j| 1))))
                          (LETT |l| (+ |l| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SLSS;24|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|sc| |Segment| (|Integer|)) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G687 NIL) (|j| NIL) (#2=#:G688 NIL)
          (#3=#:G689 NIL) (|l| NIL) (#4=#:G685 NIL) (#5=#:G686 NIL) (|k| NIL)
          (#6=#:G684 NIL) (|sr| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)))
              (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)))
              (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
              (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 48)))
                          (LETT #5# (SPADCALL |sr| (QREFELT $ 49)))
                          (LETT #4# (SPADCALL |sr| (QREFELT $ 47))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                                (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                                (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                                (COND
                                 ((OR (> |j| #1#)
                                      (IF (MINUSP #2#)
                                          (< |l| #3#)
                                          (> |l| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |y| |i| |j|
                                            (SPADCALL |x| |k| |l|
                                                      (QREFELT $ 15))
                                            (QREFELT $ 40))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;25|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G703 NIL) (#2=#:G704 NIL)
          (|l| NIL) (#3=#:G702 NIL) (|sc| NIL) (#4=#:G700 NIL) (#5=#:G701 NIL)
          (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|))
          (#6=#:G699 NIL) (|sr| NIL) (|y| (S)) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $))
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
          (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
                    (EXIT
                     (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                               (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |sc| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l|
                                             (SPADCALL |sc| (QREFELT $ 48)))
                                       (LETT #2#
                                             (SPADCALL |sc| (QREFELT $ 49)))
                                       (LETT #1#
                                             (SPADCALL |sc| (QREFELT $ 47)))
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |y| |i| |j|
                                                  (SPADCALL |x| |k| |l|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 40))
                                        (EXIT (LETT |j| (+ |j| 1))))
                                       (LETT |l| (+ |l| #1#)) (GO G190) G191
                                       (EXIT NIL))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;rowSlice;SS;26| ((|x| S) ($ |Segment| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12))
                  (QREFELT $ 60))) 

(SDEFUN |ARR2CAT-;colSlice;SS;27| ((|x| S) ($ |Segment| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |x| (QREFELT $ 14))
                  (QREFELT $ 60))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;28|
        ((|x| S) (|row| |Integer|) (|colList| |List| (|Integer|)) (|y| S)
         ($ S))
        (SPROG
         ((#1=#:G719 NIL) (|ej| NIL) (#2=#:G720 NIL) (|j| NIL)
          (|rowiy| (|Integer|)) (#3=#:G717 NIL) (#4=#:G718 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |row| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 32)))
            (|error| "setelt!: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL) (LETT #4# |colList|) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 32)))
                        (PROGN
                         (LETT #3# (|error| "setelt!: index out of range"))
                         (GO #5=#:G711))))))
                    (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #3#))
             (COND
              ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) 1 (QREFELT $ 63))
                   (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                             (QREFELT $ 63)))
               (EXIT (|error| "setelt!: matrix has bad dimensions"))))
             (LETT |rowiy| (SPADCALL |y| (QREFELT $ 11)))
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                  (LETT #2# (SPADCALL |y| (QREFELT $ 14))) (LETT |ej| NIL)
                  (LETT #1# |colList|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |row| |ej|
                              (SPADCALL |y| |rowiy| |j| (QREFELT $ 15))
                              (QREFELT $ 40))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;29|
        ((|x| S) (|rowList| |List| (|Integer|)) (|col| |Integer|) (|y| S)
         ($ S))
        (SPROG
         ((#1=#:G733 NIL) (|ei| NIL) (#2=#:G734 NIL) (|i| NIL)
          (|coliy| (|Integer|)) (#3=#:G731 NIL) (#4=#:G732 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #4# |rowList|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #3# (|error| "setelt!: index out of range"))
                      (GO #5=#:G723))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |col| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 32)))
            (EXIT (|error| "setelt!: index out of range"))))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 63))
             (SPADCALL (SPADCALL |y| (QREFELT $ 22)) 1 (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (LETT |coliy| (SPADCALL |y| (QREFELT $ 13)))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
               (LETT #2# (SPADCALL |y| (QREFELT $ 12))) (LETT |ei| NIL)
               (LETT #1# |rowList|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#)) NIL) (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |ei| |col|
                           (SPADCALL |y| |i| |coliy| (QREFELT $ 15))
                           (QREFELT $ 40))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;30|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G753 NIL) (|ej| NIL) (#2=#:G754 NIL) (|j| NIL) (#3=#:G751 NIL)
          (|ei| NIL) (#4=#:G752 NIL) (|i| NIL) (#5=#:G747 NIL) (#6=#:G750 NIL)
          (#7=#:G748 NIL) (#8=#:G749 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL) (LETT #8# |rowList|) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #7# (|error| "setelt!: index out of range"))
                      (GO #9=#:G737))))))
                 (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL) (LETT #6# |colList|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                         (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #5# (|error| "setelt!: index out of range"))
                      (GO #10=#:G740))))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #5#))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 63))
             (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                       (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
               (LETT #4# (SPADCALL |y| (QREFELT $ 12))) (LETT |ei| NIL)
               (LETT #3# |rowList|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#)) NIL) (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                      (LETT #2# (SPADCALL |y| (QREFELT $ 14))) (LETT |ej| NIL)
                      (LETT #1# |colList|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#)) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |ei| |ej|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2S2S;31|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G764 NIL) (|j| NIL) (#2=#:G765 NIL) (#3=#:G766 NIL) (|l| NIL)
          (#4=#:G761 NIL) (|i| NIL) (#5=#:G762 NIL) (#6=#:G763 NIL) (|k| NIL)
          (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#) (|ic| #8=(|Integer|))
          (|ir| #8#) (|uc| #9=(|Integer|)) (|lc| #10=(|Integer|)) (|ur| #9#)
          (|lr| #10#))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
              (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
              (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)))
              (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)))
              (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
              (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                 (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #6# |ur|) (LETT #5# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND
                    ((OR (> |i| #4#)
                         (IF (MINUSP #5#)
                             (< |k| #6#)
                             (> |k| #6#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;32|
        ((|x| S) (|rowList| |List| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G775 NIL) (|j| NIL) (#2=#:G776 NIL) (#3=#:G777 NIL) (|l| NIL)
          (#4=#:G773 NIL) (|i| NIL) (#5=#:G774 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)))
              (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)))
              (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)))
              (LETT |nr| (LENGTH |rowList|))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                 (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| NIL) (LETT #5# |rowList|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #4# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |k| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND
                           ((OR (> |j| #1#)
                                (IF (MINUSP #2#)
                                    (< |l| #3#)
                                    (> |l| #3#)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;33|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G787 NIL) (|j| NIL) (#2=#:G788 NIL) (|l| NIL) (#3=#:G784 NIL)
          (|i| NIL) (#4=#:G785 NIL) (#5=#:G786 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
              (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
              (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc| (LENGTH |colList|))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                 (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND
                    ((OR (> |i| #3#)
                         (IF (MINUSP #4#)
                             (< |k| #5#)
                             (> |k| #5#)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| NIL) (LETT #2# |colList|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND
                           ((OR (> |j| #1#) (ATOM #2#)
                                (PROGN (LETT |l| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;34|
        ((|x| S) (|row| |Integer|) (|lsc| |List| (|Segment| (|Integer|)))
         (|y| S) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G798 NIL) (#2=#:G799 NIL) (|l| NIL)
          (#3=#:G797 NIL) (|sc| NIL) (|i| (|Integer|))
          (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) 1 (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                       (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                       (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sc| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 48)))
                                   (LETT #2# (SPADCALL |sc| (QREFELT $ 49)))
                                   (LETT #1# (SPADCALL |sc| (QREFELT $ 47)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |l| #2#)
                                         (> |l| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |x| |row| |l|
                                              (SPADCALL |y| |i| |j|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 40))
                                    (EXIT (LETT |j| (+ |j| 1))))
                                   (LETT |l| (+ |l| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;35|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|))) (|col| |Integer|)
         (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G809 NIL) (#2=#:G810 NIL) (|k| NIL)
          (#3=#:G808 NIL) (|sr| NIL) (|j| (|Integer|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) 1 (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                       (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                       (SEQ (LETT |sr| NIL) (LETT #3# |lsr|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |sr| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 48)))
                                   (LETT #2# (SPADCALL |sr| (QREFELT $ 49)))
                                   (LETT #1# (SPADCALL |sr| (QREFELT $ 47)))
                                   G190
                                   (COND
                                    ((IF (MINUSP #1#)
                                         (< |k| #2#)
                                         (> |k| #2#))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |x| |k| |col|
                                              (SPADCALL |y| |i| |j|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 40))
                                    (EXIT (LETT |i| (+ |i| 1))))
                                   (LETT |k| (+ |k| #1#)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;36|
        ((|x| S) (|sr| |Segment| (|Integer|))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G822 NIL) (|i| NIL) (#2=#:G823 NIL)
          (#3=#:G824 NIL) (|k| NIL) (#4=#:G820 NIL) (#5=#:G821 NIL) (|l| NIL)
          (#6=#:G819 NIL) (|sc| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
         (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
              (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
              (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc|
                    (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                 (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
              (SEQ (LETT |sc| NIL) (LETT #6# |lsc|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 48)))
                          (LETT #5# (SPADCALL |sc| (QREFELT $ 49)))
                          (LETT #4# (SPADCALL |sc| (QREFELT $ 47))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |l| #5#)
                                (> |l| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |k| |lr|) (LETT #3# |ur|) (LETT #2# |ir|)
                                (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                                (LETT #1# (SPADCALL |y| (QREFELT $ 12))) G190
                                (COND
                                 ((OR (> |i| #1#)
                                      (IF (MINUSP #2#)
                                          (< |k| #3#)
                                          (> |k| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |k| |l|
                                            (SPADCALL |y| |i| |j|
                                                      (QREFELT $ 15))
                                            (QREFELT $ 40))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT |k| (+ |k| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |j| (+ |j| 1))))
                          (LETT |l| (+ |l| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;37|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|sc| |Segment| (|Integer|)) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G836 NIL) (|j| NIL) (#2=#:G837 NIL)
          (#3=#:G838 NIL) (|l| NIL) (#4=#:G834 NIL) (#5=#:G835 NIL) (|k| NIL)
          (#6=#:G833 NIL) (|sr| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
         (SEQ (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)))
              (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)))
              (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)))
              (LETT |nr|
                    (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                     (SPADCALL |x| (QREFELT $ 12)) $))
              (LETT |nc|
                    (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                     (SPADCALL |x| (QREFELT $ 14)) $))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                 (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
                (EXIT (|error| "setelt!: matrix has bad dimensions"))))
              (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
              (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
              (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 48)))
                          (LETT #5# (SPADCALL |sr| (QREFELT $ 49)))
                          (LETT #4# (SPADCALL |sr| (QREFELT $ 47))) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ
                           (SEQ (LETT |l| |lc|) (LETT #3# |uc|) (LETT #2# |ic|)
                                (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                                (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                                (COND
                                 ((OR (> |j| #1#)
                                      (IF (MINUSP #2#)
                                          (< |l| #3#)
                                          (> |l| #3#)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |k| |l|
                                            (SPADCALL |y| |i| |j|
                                                      (QREFELT $ 15))
                                            (QREFELT $ 40))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;38|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G854 NIL) (#2=#:G855 NIL)
          (|l| NIL) (#3=#:G853 NIL) (|sc| NIL) (#4=#:G851 NIL) (#5=#:G852 NIL)
          (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|))
          (#6=#:G850 NIL) (|sr| NIL) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
          (SEQ (LETT |sr| NIL) (LETT #6# |lsr|) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)))
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)))
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)))
                    (EXIT
                     (SEQ (LETT |k| |lr|) (LETT #5# |ur|) (LETT #4# |ir|) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                               (SEQ (LETT |sc| NIL) (LETT #3# |lsc|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |sc| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l|
                                             (SPADCALL |sc| (QREFELT $ 48)))
                                       (LETT #2#
                                             (SPADCALL |sc| (QREFELT $ 49)))
                                       (LETT #1#
                                             (SPADCALL |sc| (QREFELT $ 47)))
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |x| |k| |l|
                                                  (SPADCALL |y| |i| |j|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 40))
                                        (EXIT (LETT |j| (+ |j| 1))))
                                       (LETT |l| (+ |l| #1#)) (GO G190) G191
                                       (EXIT NIL))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (+ |k| #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setsubMatrix!;S2I2S;39|
        ((|x| S) (|i1| |Integer|) (|j1| |Integer|) (|y| S) ($ S))
        (SPROG
         ((#1=#:G866 NIL) (|j| NIL) (#2=#:G867 NIL) (|l| NIL) (#3=#:G864 NIL)
          (|i| NIL) (#4=#:G865 NIL) (|k| NIL) (|j2| #5=(|Integer|)) (|i2| #5#))
         (SEQ (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 21))) 1))
              (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 22))) 1))
              (COND
               ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                              (QREFELT $ 32)))
                (EXIT
                 (|error|
                  (SPADCALL "setsubMatrix!: inserted matrix too big, "
                            "use subMatrix to restrict it" (QREFELT $ 77))))))
              (COND
               ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                    (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                              (QREFELT $ 32)))
                (EXIT
                 (|error|
                  (SPADCALL "setsubMatrix!: inserted matrix too big, "
                            "use subMatrix to restrict it" (QREFELT $ 77))))))
              (SEQ (LETT |k| |i1|) (LETT #4# |i2|)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)))
                   (LETT #3# (SPADCALL |y| (QREFELT $ 12))) G190
                   (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |j1|) (LETT #2# |j2|)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)))
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14))) G190
                          (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |x| |k| |l|
                                      (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                      (QREFELT $ 40))))
                          (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |x|)))) 

(SDEFUN |ARR2CAT-;swapRows!;S2IS;40|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G877 NIL) (|j| NIL))
               (SEQ
                (COND
                 ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                      (OR
                       (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 12))
                                 (QREFELT $ 32))
                       (OR (< |i2| (SPADCALL |x| (QREFELT $ 11)))
                           (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                     (QREFELT $ 32)))))
                  (|error| "swapRows!: index out of range"))
                 ('T
                  (COND ((EQL |i1| |i2|) |x|)
                        ('T
                         (SEQ
                          (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 13)))
                               (LETT #1# (SPADCALL |x| (QREFELT $ 14))) G190
                               (COND ((> |j| #1#) (GO G191)))
                               (SEQ
                                (LETT |r|
                                      (SPADCALL |x| |i1| |j| (QREFELT $ 15)))
                                (SPADCALL |x| |i1| |j|
                                          (SPADCALL |x| |i2| |j|
                                                    (QREFELT $ 15))
                                          (QREFELT $ 40))
                                (EXIT
                                 (SPADCALL |x| |i2| |j| |r| (QREFELT $ 40))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;swapColumns!;S2IS;41|
        ((|x| S) (|j1| |Integer|) (|j2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G887 NIL) (|i| NIL))
               (SEQ
                (COND
                 ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                      (OR
                       (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 14))
                                 (QREFELT $ 32))
                       (OR (< |j2| (SPADCALL |x| (QREFELT $ 13)))
                           (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                                     (QREFELT $ 32)))))
                  (|error| "swapColumns!: index out of range"))
                 ('T
                  (COND ((EQL |j1| |j2|) |x|)
                        ('T
                         (SEQ
                          (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 11)))
                               (LETT #1# (SPADCALL |x| (QREFELT $ 12))) G190
                               (COND ((> |i| #1#) (GO G191)))
                               (SEQ
                                (LETT |r|
                                      (SPADCALL |x| |i| |j1| (QREFELT $ 15)))
                                (SPADCALL |x| |i| |j1|
                                          (SPADCALL |x| |i| |j2|
                                                    (QREFELT $ 15))
                                          (QREFELT $ 40))
                                (EXIT
                                 (SPADCALL |x| |i| |j2| |r| (QREFELT $ 40))))
                               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;transpose;2S;42| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G893 NIL) (|j| NIL) (#2=#:G892 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |x| (QREFELT $ 22))
                          (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 39)))
          (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 11)))
               (LETT #2# (SPADCALL |ans| (QREFELT $ 12))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 13)))
                      (LETT #1# (SPADCALL |ans| (QREFELT $ 14))) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |x| |j| |i| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;squareTop;2S;43| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G900 NIL) (|j| NIL) (#2=#:G899 NIL) (|i| NIL) (|ans| (S))
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (SPADCALL |x| (QREFELT $ 21))
               (LETT |cols| (SPADCALL |x| (QREFELT $ 22))))
            (|error| "squareTop: number of columns exceeds number of rows"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |cols| |cols| (QREFELT $ 39)))
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 11)))
                      (LETT #2# (- (+ (SPADCALL |x| (QREFELT $ 11)) |cols|) 1))
                      G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 13)))
                             (LETT #1# (SPADCALL |x| (QREFELT $ 14))) G190
                             (COND ((> |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j|
                                         (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                         (QREFELT $ 40))))
                             (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;horizConcat;3S;44| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 84))) 

(SDEFUN |ARR2CAT-;horizConcat;LS;45| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G915 NIL) (|j| NIL) (#2=#:G914 NIL) (|a| NIL)
          (#3=#:G913 NIL) (|i| NIL) (|ans| (S)) (|nc| (|NonNegativeInteger|))
          (#4=#:G912 NIL) (|nr| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "horizConcat: empty list"))
                ('T
                 (SEQ (LETT |a1| (|SPADfirst| |la|))
                      (LETT |nr| (SPADCALL |a1| (QREFELT $ 21)))
                      (LETT |nc| (SPADCALL |a1| (QREFELT $ 22)))
                      (SEQ (LETT |a| NIL) (LETT #4# (CDR |la|)) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |nr| (SPADCALL |a| (QREFELT $ 21))
                                         (QREFELT $ 67))
                               (|error|
                                "horizConcat: array must have same number of rows"))
                              ('T
                               (LETT |nc|
                                     (+ |nc|
                                        (SPADCALL |a| (QREFELT $ 22))))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |nr| |nc| (QREFELT $ 39)))
                      (SEQ (LETT |i| (SPADCALL |a1| (QREFELT $ 11)))
                           (LETT #3# (SPADCALL |a1| (QREFELT $ 12))) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 13)))
                                (EXIT
                                 (SEQ (LETT |a| NIL) (LETT #2# |la|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |a| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |j|
                                               (SPADCALL |a| (QREFELT $ 13)))
                                         (LETT #1#
                                               (SPADCALL |a| (QREFELT $ 14)))
                                         G190 (COND ((> |j| #1#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |ans| |i| |l|
                                                    (SPADCALL |a| |i| |j|
                                                              (QREFELT $ 15))
                                                    (QREFELT $ 40))
                                          (EXIT (LETT |l| (+ |l| 1))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;vertConcat;3S;46| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 87))) 

(SDEFUN |ARR2CAT-;vertConcat;LS;47| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G929 NIL) (|j| NIL) (#2=#:G928 NIL) (|i| NIL)
          (#3=#:G927 NIL) (|a| NIL) (|ans| (S)) (|nr| (|NonNegativeInteger|))
          (#4=#:G926 NIL) (|nc| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "vertConcat: empty list"))
                ('T
                 (SEQ (LETT |a1| (|SPADfirst| |la|))
                      (LETT |nr| (SPADCALL |a1| (QREFELT $ 21)))
                      (LETT |nc| (SPADCALL |a1| (QREFELT $ 22)))
                      (SEQ (LETT |a| NIL) (LETT #4# (CDR |la|)) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |nc| (SPADCALL |a| (QREFELT $ 22))
                                         (QREFELT $ 67))
                               (|error|
                                "vertConcat: array must have same number of columns"))
                              ('T
                               (LETT |nr|
                                     (+ |nr|
                                        (SPADCALL |a| (QREFELT $ 21))))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |nr| |nc| (QREFELT $ 39)))
                      (LETT |l| (SPADCALL |ans| (QREFELT $ 11)))
                      (SEQ (LETT |a| NIL) (LETT #3# |la|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 11)))
                                  (LETT #2# (SPADCALL |a| (QREFELT $ 12))) G190
                                  (COND ((> |i| #2#) (GO G191)))
                                  (SEQ
                                   (SEQ
                                    (LETT |j| (SPADCALL |a| (QREFELT $ 13)))
                                    (LETT #1# (SPADCALL |a| (QREFELT $ 14)))
                                    G190 (COND ((> |j| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |ans| |l| |j|
                                                (SPADCALL |a| |i| |j|
                                                          (QREFELT $ 15))
                                                (QREFELT $ 40))))
                                    (LETT |j| (+ |j| 1)) (GO G190) G191
                                    (EXIT NIL))
                                   (EXIT (LETT |l| (+ |l| 1))))
                                  (LETT |i| (+ |i| 1)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;blockConcat;LS;48| ((LLA |List| (|List| S)) ($ S))
        (SPROG ((#1=#:G933 NIL) (LA NIL) (#2=#:G932 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT LA NIL) (LETT #1# LLA) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL LA (QREFELT $ 84)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 87))))) 

(SDEFUN |ARR2CAT-;vertSplit;SPiL;49|
        ((A S) (|r| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G942 NIL) (|i| NIL) (#2=#:G941 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|dr| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dr| (SPADCALL (SPADCALL A (QREFELT $ 21)) |r| (QREFELT $ 93)))
          (EXIT
           (COND
            ((QEQCAR |dr| 1)
             (|error| "split does not result in an equal division"))
            ('T
             (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 11)))
                  (LETT |mic| (SPADCALL A (QREFELT $ 13)))
                  (LETT |mac| (SPADCALL A (QREFELT $ 14)))
                  (EXIT
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |i| 0) (LETT #1# (- |r| 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A (+ |mir| (* |i| (QCDR |dr|)))
                                            (-
                                             (+ |mir|
                                                (* (+ |i| 1) (QCDR |dr|)))
                                             1)
                                            |mic| |mac| (QREFELT $ 52))
                                  #2#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;vertSplit;SLL;50|
        ((A S) (|lr| |List| (|NonNegativeInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G960 NIL) (|i| NIL) (#2=#:G959 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 96) |lr| (QREFELT $ 99))
                      (SPADCALL A (QREFELT $ 21)) (QREFELT $ 67))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 96) |lr| 1 (QREFELT $ 101))))
             (LETT |mir| (- (SPADCALL A (QREFELT $ 11)) 1))
             (LETT |mic| (SPADCALL A (QREFELT $ 13)))
             (LETT |mac| (SPADCALL A (QREFELT $ 14)))
             (EXIT
              (PROGN
               (LETT #2# NIL)
               (SEQ (LETT |i| 2) (LETT #1# (SPADCALL |l| (QREFELT $ 102))) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A
                                       (+ |mir|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 103)))
                                       (-
                                        (+ |mir|
                                           (SPADCALL |l| |i| (QREFELT $ 103)))
                                        1)
                                       |mic| |mac| (QREFELT $ 52))
                             #2#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SPiL;51|
        ((A S) (|c| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G969 NIL) (|i| NIL) (#2=#:G968 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|dc| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dc| (SPADCALL (SPADCALL A (QREFELT $ 22)) |c| (QREFELT $ 93)))
          (EXIT
           (COND
            ((QEQCAR |dc| 1)
             (|error| "split does not result in an equal division"))
            ('T
             (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 11)))
                  (LETT |mar| (SPADCALL A (QREFELT $ 12)))
                  (LETT |mic| (SPADCALL A (QREFELT $ 13)))
                  (EXIT
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |i| 0) (LETT #1# (- |c| 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A |mir| |mar|
                                            (+ |mic| (* |i| (QCDR |dc|)))
                                            (-
                                             (+ |mic|
                                                (* (+ |i| 1) (QCDR |dc|)))
                                             1)
                                            (QREFELT $ 52))
                                  #2#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SLL;52|
        ((A S) (|lc| |List| (|NonNegativeInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G987 NIL) (|i| NIL) (#2=#:G986 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 96) |lc| (QREFELT $ 99))
                      (SPADCALL A (QREFELT $ 22)) (QREFELT $ 67))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 96) |lc| 1 (QREFELT $ 101))))
             (LETT |mir| (SPADCALL A (QREFELT $ 11)))
             (LETT |mar| (SPADCALL A (QREFELT $ 12)))
             (LETT |mic| (- (SPADCALL A (QREFELT $ 13)) 1))
             (EXIT
              (PROGN
               (LETT #2# NIL)
               (SEQ (LETT |i| 2) (LETT #1# (SPADCALL |l| (QREFELT $ 102))) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A |mir| |mar|
                                       (+ |mic|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 103)))
                                       (-
                                        (+ |mic|
                                           (SPADCALL |l| |i| (QREFELT $ 103)))
                                        1)
                                       (QREFELT $ 52))
                             #2#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2PiL;53|
        ((A S) (|nr| |PositiveInteger|) (|nc| |PositiveInteger|)
         ($ |List| (|List| S)))
        (SPROG ((#1=#:G991 NIL) (X NIL) (#2=#:G990 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT X NIL) (LETT #1# (SPADCALL A |nr| (QREFELT $ 107)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL X |nc| (QREFELT $ 108)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2LL;54|
        ((A S) (|lr| |List| (|NonNegativeInteger|))
         (|lc| |List| (|NonNegativeInteger|)) ($ |List| (|List| S)))
        (SPROG ((#1=#:G995 NIL) (X NIL) (#2=#:G994 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT X NIL) (LETT #1# (SPADCALL A |lr| (QREFELT $ 110)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL X |lc| (QREFELT $ 111)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;copy;2S;55| ((|m| S) ($ S))
        (SPROG
         ((#1=#:G1001 NIL) (|j| NIL) (#2=#:G1000 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) (QREFELT $ 39)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
               (LETT #2# (SPADCALL |m| (QREFELT $ 12))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                      (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;fill!;SRS;56| ((|m| S) (|r| R) ($ S))
        (SPROG ((#1=#:G1007 NIL) (|j| NIL) (#2=#:G1006 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                     (LETT #2# (SPADCALL |m| (QREFELT $ 12))) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                            (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT (SPADCALL |m| |i| |j| |r| (QREFELT $ 40))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M2S;57| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG
         ((#1=#:G1014 NIL) (|j| NIL) (#2=#:G1013 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) (QREFELT $ 39)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
               (LETT #2# (SPADCALL |m| (QREFELT $ 12))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                      (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;map!;M2S;58| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG ((#1=#:G1020 NIL) (|j| NIL) (#2=#:G1019 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                     (LETT #2# (SPADCALL |m| (QREFELT $ 12))) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                            (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |m| |i| |j|
                                        (SPADCALL
                                         (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                         |f|)
                                        (QREFELT $ 40))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M3S;59| ((|f| |Mapping| R R R) (|m| S) (|n| S) ($ S))
        (SPROG
         ((#1=#:G1029 NIL) (|j| NIL) (#2=#:G1028 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (COND
           ((OR
             (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                       (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 63))
             (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                       (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 63)))
            (|error| "map: arguments must have same dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |m| (QREFELT $ 22)) (QREFELT $ 39)))
             (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                  (LETT #2# (SPADCALL |m| (QREFELT $ 12))) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                         (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                      (SPADCALL |n| |i| |j| (QREFELT $ 15))
                                      |f|)
                                     (QREFELT $ 40))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;map;M2SRS;60|
        ((|f| |Mapping| R R R) (|m| S) (|n| S) (|r| R) ($ S))
        (SPROG
         ((#1=#:G1047 NIL) (|j| NIL) (#2=#:G1046 NIL) (|i| NIL) (|ans| (S))
          (|maxCol| #3=(|Integer|)) (|maxRow| #3#))
         (SEQ
          (LETT |maxRow|
                (MAX (SPADCALL |m| (QREFELT $ 12))
                     (SPADCALL |n| (QREFELT $ 12))))
          (LETT |maxCol|
                (MAX (SPADCALL |m| (QREFELT $ 14))
                     (SPADCALL |n| (QREFELT $ 14))))
          (LETT |ans|
                (SPADCALL
                 (MAX (SPADCALL |m| (QREFELT $ 21))
                      (SPADCALL |n| (QREFELT $ 21)))
                 (MAX (SPADCALL |m| (QREFELT $ 22))
                      (SPADCALL |n| (QREFELT $ 22)))
                 (QREFELT $ 39)))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11))) (LETT #2# |maxRow|)
               G190 (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                      (LETT #1# |maxCol|) G190 (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| |r| (QREFELT $ 120))
                                   (SPADCALL |n| |i| |j| |r| (QREFELT $ 120))
                                   |f|)
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;setRow!;SIRowS;61|
        ((|m| S) (|i| |Integer|) (|v| |Row|) ($ S))
        (SPROG ((#1=#:G1053 NIL) (|j| NIL) (#2=#:G1054 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                      (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12))
                                (QREFELT $ 32)))
                  (|error| "setRow!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 122)))
                        (LETT #2# (SPADCALL |v| (QREFELT $ 123)))
                        (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                        (LETT #1# (SPADCALL |m| (QREFELT $ 14))) G190
                        (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL |v| |k| (QREFELT $ 124))
                                    (QREFELT $ 40))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;setColumn!;SIColS;62|
        ((|m| S) (|j| |Integer|) (|v| |Col|) ($ S))
        (SPROG ((#1=#:G1060 NIL) (|i| NIL) (#2=#:G1061 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                      (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14))
                                (QREFELT $ 32)))
                  (|error| "setColumn!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 126)))
                        (LETT #2# (SPADCALL |v| (QREFELT $ 127)))
                        (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                        (LETT #1# (SPADCALL |m| (QREFELT $ 12))) G190
                        (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL |v| |k| (QREFELT $ 128))
                                    (QREFELT $ 40))))
                        (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;=;2SB;63| ((|m| S) (|n| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G1070 NIL) (#2=#:G1071 NIL) (#3=#:G1073 NIL) (|j| NIL)
          (#4=#:G1072 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |m| |n| (QREFELT $ 130)) 'T)
                 ((OR
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 63))
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                             (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 63)))
                  NIL)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                        (LETT #4# (SPADCALL |m| (QREFELT $ 12))) G190
                        (COND ((> |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                               (LETT #3# (SPADCALL |m| (QREFELT $ 14))) G190
                               (COND ((> |j| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                     (SPADCALL |n| |i| |j| (QREFELT $ 15))
                                     (QREFELT $ 29)))
                                   (PROGN
                                    (LETT #1#
                                          (PROGN
                                           (LETT #2# NIL)
                                           (GO #5=#:G1069)))
                                    (GO #6=#:G1065))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;member?;RSB;64| ((|r| R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G1079 NIL) (#2=#:G1080 NIL) (#3=#:G1082 NIL) (|j| NIL)
          (#4=#:G1081 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                 (LETT #4# (SPADCALL |m| (QREFELT $ 12))) G190
                 (COND ((> |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                        (LETT #3# (SPADCALL |m| (QREFELT $ 14))) G190
                        (COND ((> |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |r|
                                      (QREFELT $ 29))
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# 'T) (GO #5=#:G1078)))
                             (GO #6=#:G1075))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                  #6# (EXIT #1#))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;count;RSNni;65| ((|r| R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG NIL
               (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;65!0| (VECTOR $ |r|))
                         |m| (QREFELT $ 133)))) 

(SDEFUN |ARR2CAT-;count;RSNni;65!0| ((|x| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 29)))))) 

(SDEFUN |ARR2CAT-;row;SIRow;66| ((|m| S) (|i| |Integer|) ($ |Row|))
        (SPROG
         ((#1=#:G1091 NIL) (|j| NIL) (#2=#:G1092 NIL) (|k| NIL) (|v| (|Row|))
          (|mci| (|Integer|)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 32)))
            (|error| "row: index out of range"))
           ('T
            (SEQ (LETT |nc| (SPADCALL |m| (QREFELT $ 22)))
                 (EXIT
                  (COND ((EQL |nc| 0) (SPADCALL (QREFELT $ 135)))
                        ('T
                         (SEQ (LETT |mci| (SPADCALL |m| (QREFELT $ 13)))
                              (LETT |v|
                                    (SPADCALL |nc|
                                              (SPADCALL |m| |i| |mci|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 136)))
                              (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 122)))
                                   (LETT #2# (SPADCALL |v| (QREFELT $ 123)))
                                   (LETT |j| |mci|)
                                   (LETT #1# (SPADCALL |m| (QREFELT $ 14)))
                                   G190
                                   (COND
                                    ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |v| |k|
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT $ 15))
                                               (QREFELT $ 137))))
                                   (LETT |j|
                                         (PROG1 (+ |j| 1)
                                           (LETT |k| (+ |k| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT |v|))))))))))) 

(SDEFUN |ARR2CAT-;column;SICol;67| ((|m| S) (|j| |Integer|) ($ |Col|))
        (SPROG
         ((#1=#:G1099 NIL) (|i| NIL) (#2=#:G1100 NIL) (|k| NIL) (|v| (|Col|))
          (|mri| (|Integer|)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 32)))
            (|error| "column: index out of range"))
           ('T
            (SEQ (LETT |nr| (SPADCALL |m| (QREFELT $ 21)))
                 (EXIT
                  (COND ((EQL |nr| 0) (SPADCALL (QREFELT $ 139)))
                        ('T
                         (SEQ (LETT |mri| (SPADCALL |m| (QREFELT $ 11)))
                              (LETT |v|
                                    (SPADCALL |nr|
                                              (SPADCALL |m| |mri| |j|
                                                        (QREFELT $ 15))
                                              (QREFELT $ 140)))
                              (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 126)))
                                   (LETT #2# (SPADCALL |v| (QREFELT $ 127)))
                                   (LETT |i| |mri|)
                                   (LETT #1# (SPADCALL |m| (QREFELT $ 12)))
                                   G190
                                   (COND
                                    ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |v| |k|
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT $ 15))
                                               (QREFELT $ 141))))
                                   (LETT |i|
                                         (PROG1 (+ |i| 1)
                                           (LETT |k| (+ |k| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT |v|))))))))))) 

(SDEFUN |ARR2CAT-;coerce;SOf;68| ((|m| S) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|List| (|OutputForm|)))) (#1=#:G1108 NIL) (|j| NIL)
          (#2=#:G1107 NIL) (#3=#:G1106 NIL) (|i| NIL) (#4=#:G1105 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)))
                      (LETT #3# (SPADCALL |m| (QREFELT $ 12))) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)))
                                     (LETT #1# (SPADCALL |m| (QREFELT $ 14)))
                                     G190 (COND ((> |j| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |m| |i| |j|
                                                         (QREFELT $ 15))
                                               (QREFELT $ 144))
                                              #2#))))
                                     (LETT |j| (+ |j| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (SPADCALL |l| (QREFELT $ 145)))))) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory&;|)) 

(DEFUN |TwoDimensionalArrayCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|TwoDimensionalArrayCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 147))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Comparable|))))))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |ARR2CAT-;smaller?;2SB;6|) $))))
    (COND
     ((|HasSignature| |#2|
                      (LIST '=
                            (LIST '(|Boolean|) (|devaluate| |#2|)
                                  (|devaluate| |#2|))))
      (PROGN
       (QSETREFV $ 131 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;63|) $))
       (QSETREFV $ 132 (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;64|) $))
       (QSETREFV $ 134
                 (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;65|) $)))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#3| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV $ 138
                  (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;66|) $))))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#4| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV $ 142
                  (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;67|) $))))))
    (COND
     ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
      (QSETREFV $ 146 (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;68|) $))))
    $))) 

(MAKEPROP '|TwoDimensionalArrayCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minRowIndex|)
              (5 . |maxRowIndex|) (10 . |minColIndex|) (15 . |maxColIndex|)
              (20 . |qelt|) (|Boolean|) (|Mapping| 16 7) |ARR2CAT-;any?;MSB;1|
              |ARR2CAT-;every?;MSB;2| (|NonNegativeInteger|) (27 . |nrows|)
              (32 . |ncols|) |ARR2CAT-;size?;SNniB;3| |ARR2CAT-;less?;SNniB;4|
              (37 . >) |ARR2CAT-;more?;SNniB;5| (43 . |elt|) (50 . |smaller?|)
              (56 . =) (62 . |smaller?|) |ARR2CAT-;#;SNni;7| (68 . >)
              |ARR2CAT-;elt;S2I2R;8| |ARR2CAT-;count;MSNni;9| (|List| 7)
              |ARR2CAT-;parts;SL;10| (|List| 35) |ARR2CAT-;listOfLists;SL;11|
              (74 . |qnew|) (80 . |qsetelt!|) |ARR2CAT-;subMatrix;S4IS;12|
              (|List| 10) |ARR2CAT-;elt;SILS;13| |ARR2CAT-;elt;SLIS;14|
              |ARR2CAT-;elt;S2LS;15| (|Segment| 10) (88 . |incr|) (93 . |low|)
              (98 . |high|) |ARR2CAT-;elt;SLSS;17| |ARR2CAT-;elt;SSLS;18|
              (103 . |subMatrix|) |ARR2CAT-;elt;S2SS;19| (|List| 46)
              |ARR2CAT-;elt;SILS;21| |ARR2CAT-;elt;SLIS;22|
              |ARR2CAT-;elt;SSLS;23| |ARR2CAT-;elt;SLSS;24|
              |ARR2CAT-;elt;S2LS;25| (112 . SEGMENT) |ARR2CAT-;rowSlice;SS;26|
              |ARR2CAT-;colSlice;SS;27| (118 . ~=) |ARR2CAT-;setelt!;SIL2S;28|
              |ARR2CAT-;setelt!;SLI2S;29| |ARR2CAT-;setelt!;S2L2S;30|
              (124 . ~=) |ARR2CAT-;setelt!;S2S2S;31|
              |ARR2CAT-;setelt!;SLS2S;32| |ARR2CAT-;setelt!;SSL2S;33|
              |ARR2CAT-;setelt!;SIL2S;34| |ARR2CAT-;setelt!;SLI2S;35|
              |ARR2CAT-;setelt!;SSL2S;36| |ARR2CAT-;setelt!;SLS2S;37|
              |ARR2CAT-;setelt!;S2L2S;38| (|String|) (130 . |elt|)
              |ARR2CAT-;setsubMatrix!;S2I2S;39| |ARR2CAT-;swapRows!;S2IS;40|
              |ARR2CAT-;swapColumns!;S2IS;41| |ARR2CAT-;transpose;2S;42|
              |ARR2CAT-;squareTop;2S;43| (|List| $) (136 . |horizConcat|)
              |ARR2CAT-;horizConcat;3S;44| |ARR2CAT-;horizConcat;LS;45|
              (141 . |vertConcat|) |ARR2CAT-;vertConcat;3S;46|
              |ARR2CAT-;vertConcat;LS;47| (|List| 83)
              |ARR2CAT-;blockConcat;LS;48| (|Union| $ '"failed")
              (146 . |exquo|) (|PositiveInteger|) |ARR2CAT-;vertSplit;SPiL;49|
              (152 . +) (|Mapping| 20 20 20) (|List| 20) (158 . |reduce|)
              (|ListFunctions2| 20 20) (164 . |scan|) (171 . |#|) (176 . |elt|)
              |ARR2CAT-;vertSplit;SLL;50| |ARR2CAT-;horizSplit;SPiL;51|
              |ARR2CAT-;horizSplit;SLL;52| (182 . |vertSplit|)
              (188 . |horizSplit|) |ARR2CAT-;blockSplit;S2PiL;53|
              (194 . |vertSplit|) (200 . |horizSplit|)
              |ARR2CAT-;blockSplit;S2LL;54| |ARR2CAT-;copy;2S;55|
              |ARR2CAT-;fill!;SRS;56| (|Mapping| 7 7) |ARR2CAT-;map;M2S;57|
              |ARR2CAT-;map!;M2S;58| (|Mapping| 7 7 7) |ARR2CAT-;map;M3S;59|
              (206 . |elt|) |ARR2CAT-;map;M2SRS;60| (214 . |minIndex|)
              (219 . |maxIndex|) (224 . |elt|) |ARR2CAT-;setRow!;SIRowS;61|
              (230 . |minIndex|) (235 . |maxIndex|) (240 . |elt|)
              |ARR2CAT-;setColumn!;SIColS;62| (246 . |eq?|) (252 . =)
              (258 . |member?|) (264 . |count|) (270 . |count|) (276 . |empty|)
              (280 . |new|) (286 . |qsetelt!|) (293 . |row|) (299 . |empty|)
              (303 . |new|) (309 . |qsetelt!|) (316 . |column|) (|OutputForm|)
              (322 . |coerce|) (327 . |matrix|) (332 . |coerce|))
           '#(|vertSplit| 337 |vertConcat| 349 |transpose| 360 |swapRows!| 365
              |swapColumns!| 372 |subMatrix| 379 |squareTop| 388 |smaller?| 393
              |size?| 399 |setsubMatrix!| 405 |setelt!| 413 |setRow!| 501
              |setColumn!| 508 |rowSlice| 515 |row| 520 |parts| 526 |more?| 531
              |member?| 537 |map!| 543 |map| 549 |listOfLists| 570 |less?| 575
              |horizSplit| 581 |horizConcat| 593 |fill!| 604 |every?| 610 |elt|
              616 |count| 701 |copy| 713 |column| 718 |colSlice| 724 |coerce|
              729 |blockSplit| 734 |blockConcat| 748 |any?| 753 = 759 |#| 765)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((= ((|Boolean|) |#1| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1| |#2|))
                                     T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1|))
                                     T)
                                   '((|map!| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|blockSplit|
                                      ((|List| (|List| |#1|)) |#1|
                                       (|List| (|NonNegativeInteger|))
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|blockSplit|
                                      ((|List| (|List| |#1|)) |#1|
                                       (|PositiveInteger|)
                                       (|PositiveInteger|)))
                                     T)
                                   '((|horizSplit|
                                      ((|List| |#1|) |#1|
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|horizSplit|
                                      ((|List| |#1|) |#1| (|PositiveInteger|)))
                                     T)
                                   '((|vertSplit|
                                      ((|List| |#1|) |#1|
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|vertSplit|
                                      ((|List| |#1|) |#1| (|PositiveInteger|)))
                                     T)
                                   '((|blockConcat|
                                      (|#1| (|List| (|List| |#1|))))
                                     T)
                                   '((|vertConcat| (|#1| (|List| |#1|))) T)
                                   '((|vertConcat| (|#1| |#1| |#1|)) T)
                                   '((|horizConcat| (|#1| (|List| |#1|))) T)
                                   '((|horizConcat| (|#1| |#1| |#1|)) T)
                                   '((|squareTop| (|#1| |#1|)) T)
                                   '((|transpose| (|#1| |#1|)) T)
                                   '((|swapColumns!|
                                      (|#1| |#1| (|Integer|) (|Integer|)))
                                     T)
                                   '((|swapRows!|
                                      (|#1| |#1| (|Integer|) (|Integer|)))
                                     T)
                                   '((|setsubMatrix!|
                                      (|#1| |#1| (|Integer|) (|Integer|) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|List| (|Segment| (|Integer|))) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Segment| (|Integer|))) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|List| (|Integer|)) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Integer|) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Integer|)) |#1|))
                                     T)
                                   '((|setColumn!|
                                      (|#1| |#1| (|Integer|) |#4|))
                                     T)
                                   '((|setRow!| (|#1| |#1| (|Integer|) |#3|))
                                     T)
                                   '((|setelt!|
                                      (|#2| |#1| (|Integer|) (|Integer|) |#2|))
                                     T)
                                   '((|colSlice|
                                      ((|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|rowSlice|
                                      ((|Segment| (|Integer|)) |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|List| (|Segment| (|Integer|)))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Segment| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Segment| (|Integer|)))))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Integer|) |#1|))
                                     T)
                                   '((|setelt!|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Segment| (|Integer|))) |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| |#1|
                                       (|List| (|Segment| (|Integer|)))
                                       (|Integer|)))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Segment| (|Integer|)))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|List| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Segment| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Segment| (|Integer|))
                                       (|Segment| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|List| (|Integer|))))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|List| (|Integer|))
                                       (|Integer|)))
                                     T)
                                   '((|elt|
                                      (|#1| |#1| (|Integer|)
                                       (|List| (|Integer|))))
                                     T)
                                   '((|subMatrix|
                                      (|#1| |#1| (|Integer|) (|Integer|)
                                       (|Integer|) (|Integer|)))
                                     T)
                                   '((|listOfLists|
                                      ((|List| (|List| |#2|)) |#1|))
                                     T)
                                   '((|parts| ((|List| |#2|) |#1|)) T)
                                   '((|column| (|#4| |#1| (|Integer|))) T)
                                   '((|row| (|#3| |#1| (|Integer|))) T)
                                   '((|elt|
                                      (|#2| |#1| (|Integer|) (|Integer|) |#2|))
                                     T)
                                   '((|elt|
                                      (|#2| |#1| (|Integer|) (|Integer|)))
                                     T)
                                   '((|fill!| (|#1| |#1| |#2|)) T)
                                   '((|member?| ((|Boolean|) |#2| |#1|)) T)
                                   '((|count|
                                      ((|NonNegativeInteger|) |#2| |#1|))
                                     T)
                                   '((|count|
                                      ((|NonNegativeInteger|)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|every?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|any?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|#| ((|NonNegativeInteger|) |#1|)) T)
                                   '((|size?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|more?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|less?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|copy| (|#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 146
                                            '(1 6 10 0 11 1 6 10 0 12 1 6 10 0
                                              13 1 6 10 0 14 3 6 7 0 10 10 15 1
                                              6 20 0 21 1 6 20 0 22 2 20 16 0 0
                                              25 3 6 7 0 10 10 27 2 7 16 0 0 28
                                              2 7 16 0 0 29 2 0 16 0 0 30 2 10
                                              16 0 0 32 2 6 0 20 20 39 4 6 7 0
                                              10 10 7 40 1 46 10 0 47 1 46 10 0
                                              48 1 46 10 0 49 5 6 0 0 10 10 10
                                              10 52 2 46 0 10 10 60 2 10 16 0 0
                                              63 2 20 16 0 0 67 2 76 0 0 0 77 1
                                              6 0 83 84 1 6 0 83 87 2 20 92 0 0
                                              93 2 20 0 0 0 96 2 98 20 97 0 99
                                              3 100 98 97 98 20 101 1 98 20 0
                                              102 2 98 20 0 10 103 2 6 83 0 94
                                              107 2 6 83 0 94 108 2 6 83 0 98
                                              110 2 6 83 0 98 111 4 6 7 0 10 10
                                              7 120 1 8 10 0 122 1 8 10 0 123 2
                                              8 7 0 10 124 1 9 10 0 126 1 9 10
                                              0 127 2 9 7 0 10 128 2 6 16 0 0
                                              130 2 0 16 0 0 131 2 0 16 7 0 132
                                              2 6 20 17 0 133 2 0 20 7 0 134 0
                                              8 0 135 2 8 0 20 7 136 3 8 7 0 10
                                              7 137 2 0 8 0 10 138 0 9 0 139 2
                                              9 0 20 7 140 3 9 7 0 10 7 141 2 0
                                              9 0 10 142 1 7 143 0 144 1 143 0
                                              90 145 1 0 143 0 146 2 0 83 0 94
                                              95 2 0 83 0 98 104 1 0 0 83 89 2
                                              0 0 0 0 88 1 0 0 0 81 3 0 0 0 10
                                              10 79 3 0 0 0 10 10 80 5 0 0 0 10
                                              10 10 10 41 1 0 0 0 82 2 0 16 0 0
                                              30 2 0 16 0 20 23 4 0 0 0 10 10 0
                                              78 4 0 0 0 54 54 0 75 4 0 0 0 46
                                              54 0 73 4 0 0 0 54 46 0 74 4 0 0
                                              0 42 46 0 69 4 0 0 0 46 42 0 70 4
                                              0 0 0 42 42 0 66 4 0 0 0 46 46 0
                                              68 4 0 0 0 10 42 0 64 4 0 0 0 42
                                              10 0 65 4 0 0 0 54 10 0 72 4 0 0
                                              0 10 54 0 71 3 0 0 0 10 8 125 3 0
                                              0 0 10 9 129 1 0 46 0 61 2 0 8 0
                                              10 138 1 0 35 0 36 2 0 16 0 20 26
                                              2 0 16 7 0 132 2 0 0 115 0 117 4
                                              0 0 118 0 0 7 121 3 0 0 118 0 0
                                              119 2 0 0 115 0 116 1 0 37 0 38 2
                                              0 16 0 20 24 2 0 83 0 94 105 2 0
                                              83 0 98 106 2 0 0 0 0 85 1 0 0 83
                                              86 2 0 0 0 7 114 2 0 16 17 0 19 3
                                              0 0 0 54 46 58 3 0 0 0 54 54 59 3
                                              0 0 0 46 54 57 3 0 0 0 54 10 56 3
                                              0 0 0 46 42 51 3 0 0 0 10 54 55 3
                                              0 0 0 46 46 53 3 0 0 0 42 46 50 3
                                              0 0 0 42 10 44 3 0 0 0 42 42 45 3
                                              0 0 0 10 42 43 4 0 7 0 10 10 7 33
                                              2 0 20 7 0 134 2 0 20 17 0 34 1 0
                                              0 0 113 2 0 9 0 10 142 1 0 46 0
                                              62 1 0 143 0 146 3 0 90 0 94 94
                                              109 3 0 90 0 98 98 112 1 0 0 90
                                              91 2 0 16 17 0 18 2 0 16 0 0 131
                                              1 0 20 0 31)))))
           '|lookupComplete|)) 