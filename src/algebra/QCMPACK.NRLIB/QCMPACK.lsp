
(SDEFUN |QCMPACK;squareFreeFactors| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|lsflp| (|List| P)) (|lsfp| (|List| P)) (#1=#:G448 NIL) (|p| NIL))
         (SEQ (LETT |lsflp| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lsfp| (SPADCALL |p| (QREFELT $ 13)))
                        (EXIT
                         (LETT |lsflp|
                               (SPADCALL |lsfp| |lsflp| (QREFELT $ 14)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT $ 16) (SPADCALL |lsflp| (QREFELT $ 17))
                         (QREFELT $ 19)))))) 

(SDEFUN |QCMPACK;startTable!;3SV;2|
        ((|ok| |String|) (|ko| |String|) (|domainName| |String|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 23))
             (COND
              ((NULL (SPADCALL |ok| (QREFELT $ 25)))
               (COND
                ((NULL (SPADCALL |ko| (QREFELT $ 25)))
                 (SPADCALL |ok| |ko| (QREFELT $ 26))))))
             (COND
              ((NULL (SPADCALL |domainName| (QREFELT $ 25)))
               (SPADCALL |domainName| (QREFELT $ 27))))
             (EXIT (SPADCALL (QREFELT $ 28))))) 

(SDEFUN |QCMPACK;stopTable!;V;3| (($ |Void|))
        (SEQ (COND ((SPADCALL (QREFELT $ 30)) (SPADCALL (QREFELT $ 31))))
             (EXIT (SPADCALL (QREFELT $ 32))))) 

(SDEFUN |QCMPACK;supDimElseRittWu?;2TSB;4| ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG ((|lp2| #1=(|List| P)) (|lp1| #1#))
               (SEQ
                (COND
                 ((< (SPADCALL |ts| (QREFELT $ 35))
                     (SPADCALL |us| (QREFELT $ 35)))
                  'T)
                 ((SPADCALL (SPADCALL |ts| (QREFELT $ 35))
                            (SPADCALL |us| (QREFELT $ 35)) (QREFELT $ 36))
                  NIL)
                 ('T
                  (SEQ (LETT |lp1| (SPADCALL |ts| (QREFELT $ 37)))
                       (LETT |lp2| (SPADCALL |us| (QREFELT $ 37)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((NULL |lp1|) NIL)
                                     ('T
                                      (NULL
                                       (SPADCALL (|SPADfirst| |lp2|)
                                                 (|SPADfirst| |lp1|)
                                                 (QREFELT $ 16))))))
                              (GO G191)))
                            (SEQ (LETT |lp1| (CDR |lp1|))
                                 (EXIT (LETT |lp2| (CDR |lp2|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (NULL (NULL |lp1|))))))))) 

(SDEFUN |QCMPACK;algebraicSort;2L;5| ((|lts| |List| TS) ($ |List| TS))
        (SEQ (LETT |lts| (SPADCALL |lts| (QREFELT $ 40)))
             (EXIT (SPADCALL (ELT $ 38) |lts| (QREFELT $ 42))))) 

(SDEFUN |QCMPACK;moreAlgebraic?;2TSB;6| ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG ((#1=#:G476 NIL) (#2=#:G477 NIL) (#3=#:G478 NIL) (|p| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |ts| (QREFELT $ 44))
                   (SPADCALL |us| (QREFELT $ 44)))
                  ((SPADCALL |us| (QREFELT $ 44)) 'T)
                  ((< (SPADCALL |ts| (QREFELT $ 35))
                      (SPADCALL |us| (QREFELT $ 35)))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |p| NIL)
                           (LETT #3# (SPADCALL |us| (QREFELT $ 37))) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 45)) |ts|
                                          (QREFELT $ 46)))
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# NIL) (GO #4=#:G475)))
                                (GO #5=#:G470))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #1#))
                    (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |QCMPACK;subTriSet?;2TSB;7| ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG ((#1=#:G480 NIL) (#2=#:G483 NIL))
               (COND ((SPADCALL |ts| (QREFELT $ 44)) 'T)
                     ((OR (SPADCALL |us| (QREFELT $ 44))
                          (SPADCALL (SPADCALL |ts| (QREFELT $ 48))
                                    (SPADCALL |us| (QREFELT $ 48))
                                    (QREFELT $ 49)))
                      NIL)
                     ((SPADCALL (SPADCALL |ts| (QREFELT $ 48))
                                (SPADCALL |us| (QREFELT $ 48)) (QREFELT $ 50))
                      (SPADCALL |ts|
                                (PROG2
                                    (LETT #1# (SPADCALL |us| (QREFELT $ 52)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                                  (|Union| (QREFELT $ 10)
                                                           #3="failed")
                                                  #1#))
                                (QREFELT $ 53)))
                     ((SPADCALL
                       (PROG2 (LETT #2# (SPADCALL |ts| (QREFELT $ 55)))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                         (|Union| (QREFELT $ 9) #3#) #2#))
                       (PROG2 (LETT #2# (SPADCALL |us| (QREFELT $ 55)))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                         (|Union| (QREFELT $ 9) #3#) #2#))
                       (QREFELT $ 56))
                      (SPADCALL
                       (PROG2 (LETT #1# (SPADCALL |ts| (QREFELT $ 52)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                         (|Union| (QREFELT $ 10) #3#) #1#))
                       (PROG2 (LETT #1# (SPADCALL |us| (QREFELT $ 52)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                         (|Union| (QREFELT $ 10) #3#) #1#))
                       (QREFELT $ 53)))
                     ('T NIL)))) 

(SDEFUN |QCMPACK;internalSubPolSet?;2LB;8|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (COND ((NULL |lp1|) 'T) ((NULL |lp2|) NIL)
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT $ 57))
               (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 58)))
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT $ 16))
               NIL)
              ('T (SPADCALL |lp1| (CDR |lp2|) (QREFELT $ 58))))) 

(SDEFUN |QCMPACK;subPolSet?;2LB;9|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (SEQ (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19)))
             (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)))
             (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 58))))) 

(SDEFUN |QCMPACK;infRittWu?;2LB;10|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (SEQ (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19)))
             (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)))
             (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 60))))) 

(SDEFUN |QCMPACK;internalInfRittWu?;2LB;11|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (COND ((NULL |lp1|) (NULL (NULL |lp2|))) ((NULL |lp2|) NIL)
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT $ 16))
               'T)
              ((SPADCALL (|SPADfirst| |lp2|) (|SPADfirst| |lp1|)
                         (QREFELT $ 16))
               NIL)
              ('T (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 61))))) 

(SDEFUN |QCMPACK;subCase?;2RB;12|
        ((|lpwt1| |Record| (|:| |val| (|List| P)) (|:| |tower| TS))
         (|lpwt2| |Record| (|:| |val| (|List| P)) (|:| |tower| TS))
         ($ |Boolean|))
        (COND
         ((NULL (SPADCALL (QCAR |lpwt2|) (QCAR |lpwt1|) (QREFELT $ 58))) NIL)
         ('T (SPADCALL (QCDR |lpwt1|) (QCDR |lpwt2|) (QREFELT $ 62))))) 

(SDEFUN |QCMPACK;internalSubQuasiComponent?;2TSU;13|
        ((|ts| TS) (|us| TS) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((#1=#:G538 NIL) (#2=#:G541 NIL) (#3=#:G544 NIL) (|p| NIL)
          (|lsfp| (|List| P)) (#4=#:G539 NIL) (#5=#:G543 NIL) (#6=#:G540 NIL)
          (#7=#:G524 NIL) (#8=#:G542 NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |us| |ts| (QREFELT $ 53)) (CONS 0 'T))
                 ((NULL (SPADCALL |ts| |us| (QREFELT $ 47))) (CONS 0 NIL))
                 ('T
                  (SEQ
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #8# (SPADCALL |us| (QREFELT $ 37))) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((< (SPADCALL |p| (QREFELT $ 65))
                                 (SPADCALL
                                  (PROG2
                                      (LETT #7#
                                            (SPADCALL |ts|
                                                      (SPADCALL |p|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 66)))
                                      (QCDR #7#)
                                    (|check_union2| (QEQCAR #7# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             "failed")
                                                    #7#))
                                  (QREFELT $ 65)))
                              (PROGN
                               (LETT #6#
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed"))
                                      (GO #9=#:G537)))
                               (GO #10=#:G527))))))
                          (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
                    #10# (EXIT #6#))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #5# (SPADCALL |us| (QREFELT $ 37))) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 67))
                                         (QREFELT $ 68)))
                              (PROGN
                               (LETT #4#
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed"))
                                      (GO #9#)))
                               (GO #11=#:G529))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
                    #11# (EXIT #4#))
                   (LETT |lsfp|
                         (|QCMPACK;squareFreeFactors|
                          (SPADCALL |us| (QREFELT $ 69)) $))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL) (LETT #3# |lsfp|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |p| |ts| (QREFELT $ 70)))
                              (PROGN
                               (LETT #1#
                                     (PROGN (LETT #2# (CONS 0 NIL)) (GO #9#)))
                               (GO #12=#:G531))))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                    #12# (EXIT #1#))
                   (EXIT (CONS 0 'T))))))
          #9# (EXIT #2#)))) 

(SDEFUN |QCMPACK;subQuasiComponent?;2TSB;14|
        ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG
         ((|b| (|Boolean|)) (|ubf| (|Union| (|Boolean|) "failed"))
          (|e| (|Union| (|Boolean|) "failed"))
          (|k| (|Record| (|:| |left| TS) (|:| |right| TS))))
         (SEQ (LETT |k| (CONS |ts| |us|))
              (LETT |e| (SPADCALL |k| (QREFELT $ 73)))
              (EXIT
               (COND ((QEQCAR |e| 0) (QCDR |e|))
                     (#1='T
                      (SEQ (LETT |ubf| (SPADCALL |ts| |us| (QREFELT $ 72)))
                           (LETT |b|
                                 (COND ((QEQCAR |ubf| 0) (QCDR |ubf|))
                                       (#1# NIL)))
                           (SPADCALL |k| |b| (QREFELT $ 74)) (EXIT |b|)))))))) 

(SDEFUN |QCMPACK;subQuasiComponent?;TSLB;15|
        ((|ts| TS) (|lus| |List| TS) ($ |Boolean|))
        (SPROG ((#1=#:G556 NIL) (#2=#:G557 NIL) (#3=#:G558 NIL) (|us| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |us| NIL) (LETT #3# |lus|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |us| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |ts| |us| (QREFELT $ 62))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G555)))
                              (GO #5=#:G553))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |QCMPACK;removeSuperfluousCases;2L;16|
        ((|cases| |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         ($ |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
        (SPROG
         ((|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|headmaxcases|
           #1=(|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|copymaxcases|
           (|List| #2=(|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|maxcases| #1#) (|toSave| (|List| #2#))
          (|lpwt1| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (#3=#:G587 NIL) (|lpwt2| NIL))
         (SEQ
          (COND ((< (LENGTH |cases|) 2) |cases|)
                ('T
                 (SEQ
                  (LETT |toSee|
                        (SPADCALL
                         (CONS #'|QCMPACK;removeSuperfluousCases;2L;16!0| $)
                         |cases| (QREFELT $ 78)))
                  (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                       (SEQ (LETT |lpwt1| (|SPADfirst| |toSee|))
                            (LETT |toSee| (CDR |toSee|)) (LETT |toSave| NIL)
                            (SEQ (LETT |lpwt2| NIL) (LETT #3# |toSee|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |lpwt2| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |lpwt1| |lpwt2| (QREFELT $ 64))
                                     (LETT |lpwt1| |lpwt2|))
                                    ((NULL
                                      (SPADCALL |lpwt2| |lpwt1|
                                                (QREFELT $ 64)))
                                     (LETT |toSave|
                                           (CONS |lpwt2| |toSave|))))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND
                             ((NULL |maxcases|)
                              (SEQ (LETT |headmaxcases| (LIST |lpwt1|))
                                   (EXIT (LETT |maxcases| |headmaxcases|))))
                             ('T
                              (SEQ (LETT |copymaxcases| |maxcases|)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND ((NULL |copymaxcases|) NIL)
                                                 ('T
                                                  (NULL
                                                   (SPADCALL |lpwt1|
                                                             (|SPADfirst|
                                                              |copymaxcases|)
                                                             (QREFELT $
                                                                      64))))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |copymaxcases|
                                                (CDR |copymaxcases|))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((NULL |copymaxcases|)
                                      (SEQ
                                       (SPADCALL |headmaxcases| (LIST |lpwt1|)
                                                 (QREFELT $ 79))
                                       (EXIT
                                        (LETT |headmaxcases|
                                              (CDR |headmaxcases|))))))))))
                            (EXIT (LETT |toSee| (REVERSE |toSave|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |maxcases|))))))) 

(SDEFUN |QCMPACK;removeSuperfluousCases;2L;16!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 38))) 

(SDEFUN |QCMPACK;removeSuperfluousQuasiComponents;2L;17|
        ((|lts| |List| TS) ($ |List| TS))
        (SPROG
         ((|toSee| (|List| TS)) (|headmaxlts| #1=(|List| TS))
          (|copymaxlts| (|List| TS)) (|maxlts| #1#) (|toSave| (|List| TS))
          (|ts| (TS)) (#2=#:G604 NIL) (|us| NIL))
         (SEQ (LETT |lts| (SPADCALL |lts| (QREFELT $ 40)))
              (EXIT
               (COND ((< (LENGTH |lts|) 2) |lts|)
                     ('T
                      (SEQ (LETT |toSee| (SPADCALL |lts| (QREFELT $ 43)))
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                                (SEQ (LETT |ts| (|SPADfirst| |toSee|))
                                     (LETT |toSee| (CDR |toSee|))
                                     (LETT |toSave| NIL)
                                     (SEQ (LETT |us| NIL) (LETT #2# |toSee|)
                                          G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |us| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |ts| |us|
                                                        (QREFELT $ 62))
                                              (LETT |ts| |us|))
                                             ((NULL
                                               (SPADCALL |us| |ts|
                                                         (QREFELT $ 62)))
                                              (LETT |toSave|
                                                    (CONS |us| |toSave|))))))
                                          (LETT #2# (CDR #2#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND
                                      ((NULL |maxlts|)
                                       (SEQ (LETT |headmaxlts| (LIST |ts|))
                                            (EXIT
                                             (LETT |maxlts| |headmaxlts|))))
                                      ('T
                                       (SEQ (LETT |copymaxlts| |maxlts|)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (COND
                                                     ((NULL |copymaxlts|) NIL)
                                                     ('T
                                                      (NULL
                                                       (SPADCALL |ts|
                                                                 (|SPADfirst|
                                                                  |copymaxlts|)
                                                                 (QREFELT $
                                                                          62))))))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |copymaxlts|
                                                         (CDR |copymaxlts|))))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL |copymaxlts|)
                                               (SEQ
                                                (SPADCALL |headmaxlts|
                                                          (LIST |ts|)
                                                          (QREFELT $ 81))
                                                (EXIT
                                                 (LETT |headmaxlts|
                                                       (CDR
                                                        |headmaxlts|))))))))))
                                     (EXIT (LETT |toSee| (REVERSE |toSave|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (SPADCALL |maxlts| (QREFELT $ 43)))))))))) 

(SDEFUN |QCMPACK;removeAssociates| ((|lp| |List| P) ($ |List| P))
        (SPROG ((#1=#:G608 NIL) (|p| NIL) (#2=#:G607 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 83)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 17))))) 

(SDEFUN |QCMPACK;branchIfCan;LTSL5BU;19|
        ((|leq| |List| P) (|ts| TS) (|lineq| |List| P) (|b1| |Boolean|)
         (|b2| |Boolean|) (|b3| |Boolean|) (|b4| |Boolean|) (|b5| |Boolean|)
         ($ |Union|
          (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                    (|:| |ineq| (|List| P)))
          "failed"))
        (SPROG
         ((|newleq| (|List| P)) (#1=#:G647 NIL) (|newp| (P)) (#2=#:G629 NIL)
          (|g| (P)) (#3=#:G651 NIL) (|q| NIL) (#4=#:G650 NIL) (|p| NIL)
          (#5=#:G644 NIL) (#6=#:G649 NIL) (#7=#:G645 NIL) (#8=#:G648 NIL)
          (|ps| (|GeneralPolynomialSet| R E V P)) (#9=#:G646 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|b1|
              (SEQ
               (EXIT
                (SEQ (LETT |leq| (|QCMPACK;removeAssociates| |leq| $))
                     (LETT |leq| (SPADCALL (ELT $ 68) |leq| (QREFELT $ 85)))
                     (EXIT
                      (COND
                       ((SPADCALL (ELT $ 86) |leq| (QREFELT $ 87))
                        (PROGN
                         (LETT #9#
                               (PROGN
                                (LETT #1# (CONS 1 "failed"))
                                (GO #10=#:G643)))
                         (GO #11=#:G616)))))))
               #11# (EXIT #9#))))
            (COND
             (|b2|
              (COND
               ((SPADCALL (ELT $ 68) |lineq| (QREFELT $ 87))
                (PROGN (LETT #1# (CONS 1 "failed")) (GO #10#)))
               ('T (LETT |lineq| (SPADCALL |lineq| (QREFELT $ 88)))))))
            (COND
             (|b3|
              (SEQ (LETT |ps| (SPADCALL |leq| (QREFELT $ 90)))
                   (EXIT
                    (SEQ
                     (EXIT
                      (SEQ (LETT |q| NIL) (LETT #8# |lineq|) G190
                           (COND
                            ((OR (ATOM #8#) (PROGN (LETT |q| (CAR #8#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (QVELT (SPADCALL |q| |ps| (QREFELT $ 92)) 1)
                                (QREFELT $ 68))
                               (PROGN
                                (LETT #7#
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed"))
                                       (GO #10#)))
                                (GO #12=#:G622))))))
                           (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
                     #12# (EXIT #7#))))))
            (COND
             ((OR (NULL |leq|) (NULL |lineq|))
              (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
            (COND
             (|b4|
              (SEQ
               (EXIT
                (SEQ (LETT |q| NIL) (LETT #6# |lineq|) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |q| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |q| |ts| (QREFELT $ 67))
                                   (QREFELT $ 68))
                         (PROGN
                          (LETT #5#
                                (PROGN (LETT #1# (CONS 1 "failed")) (GO #10#)))
                          (GO #13=#:G627))))))
                     (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
               #13# (EXIT #5#))))
            (COND
             (|b5|
              (SEQ (LETT |newleq| NIL)
                   (SEQ (LETT |p| NIL) (LETT #4# |leq|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |q| NIL) (LETT #3# |lineq|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |q| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |p| (QREFELT $ 45))
                                             (SPADCALL |q| (QREFELT $ 45))
                                             (QREFELT $ 93))
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL |p| |q| (QREFELT $ 94)))
                                    (LETT |newp|
                                          (PROG2
                                              (LETT #2#
                                                    (SPADCALL |p| |g|
                                                              (QREFELT $ 95)))
                                              (QCDR #2#)
                                            (|check_union2| (QEQCAR #2# 0)
                                                            (QREFELT $ 9)
                                                            (|Union|
                                                             (QREFELT $ 9)
                                                             "failed")
                                                            #2#)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |newp| (QREFELT $ 86))
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #10#)))
                                      ('T
                                       (LETT |newleq|
                                             (CONS |newp| |newleq|)))))))
                                  ('T (LETT |newleq| (CONS |p| |newleq|))))))
                               (LETT #3# (CDR #3#)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |leq| |newleq|)))))
            (LETT |leq|
                  (SPADCALL (ELT $ 16) (SPADCALL |leq| (QREFELT $ 17))
                            (QREFELT $ 19)))
            (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
          #10# (EXIT #1#)))) 

(SDEFUN |QCMPACK;prepareDecompose;LL2BL;20|
        ((|lp| |List| P) (|lts| |List| TS) (|b1| |Boolean|) (|b2| |Boolean|)
         ($ |List|
          (|Record| (|:| |eq| #1=(|List| P)) (|:| |tower| TS)
                    (|:| |ineq| #2=(|List| P)))))
        (SPROG
         ((#3=#:G690 NIL) (|ts| (TS)) (#4=#:G689 NIL)
          (|toSee|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P)))))
          (|lq| (|List| P))
          (|branches|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P)))))
          (#5=#:G660 NIL)
          (|newBranch|
           #6=(|Union|
               (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                         (|:| |ineq| (|List| P)))
               "failed"))
          (|lineq| #2#) (|leq| #1#) (|ubf2| #6#) (|ubf1| #6#) (#7=#:G688 NIL)
          (|branch| NIL) (#8=#:G687 NIL) (|f| NIL) (|lsfp| (|List| P))
          (#9=#:G686 NIL) (|p| NIL) (#10=#:G685 NIL) (#11=#:G684 NIL))
         (SEQ
          (LETT |lp|
                (SPADCALL (ELT $ 16)
                          (SPADCALL (ELT $ 68)
                                    (|QCMPACK;removeAssociates| |lp| $)
                                    (QREFELT $ 85))
                          (QREFELT $ 19)))
          (EXIT
           (COND
            ((OR (SPADCALL (ELT $ 86) |lp| (QREFELT $ 87)) (NULL |lts|)) NIL)
            ('T
             (SEQ (COND (|b1| (LETT |lts| (SPADCALL |lts| (QREFELT $ 82)))))
                  (EXIT
                   (COND
                    (|b2|
                     (SEQ (LETT |lq| NIL)
                          (LETT |toSee|
                                (PROGN
                                 (LETT #11# NIL)
                                 (SEQ (LETT |ts| NIL) (LETT #10# |lts|) G190
                                      (COND
                                       ((OR (ATOM #10#)
                                            (PROGN (LETT |ts| (CAR #10#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #11#
                                              (CONS
                                               (VECTOR |lq| |ts|
                                                       (|QCMPACK;squareFreeFactors|
                                                        (SPADCALL |ts|
                                                                  (QREFELT $
                                                                           69))
                                                        $))
                                               #11#))))
                                      (LETT #10# (CDR #10#)) (GO G190) G191
                                      (EXIT (NREVERSE #11#)))))
                          (EXIT
                           (COND ((NULL |lp|) |toSee|)
                                 (#12='T
                                  (SEQ
                                   (SEQ (LETT |p| NIL) (LETT #9# |lp|) G190
                                        (COND
                                         ((OR (ATOM #9#)
                                              (PROGN (LETT |p| (CAR #9#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |lsfp|
                                               (SPADCALL |p| (QREFELT $ 13)))
                                         (LETT |branches| NIL) (LETT |lq| NIL)
                                         (SEQ (LETT |f| NIL) (LETT #8# |lsfp|)
                                              G190
                                              (COND
                                               ((OR (ATOM #8#)
                                                    (PROGN
                                                     (LETT |f| (CAR #8#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (SEQ (LETT |branch| NIL)
                                                    (LETT #7# |toSee|) G190
                                                    (COND
                                                     ((OR (ATOM #7#)
                                                          (PROGN
                                                           (LETT |branch|
                                                                 (CAR #7#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |leq|
                                                           (QVELT |branch| 0))
                                                     (LETT |ts|
                                                           (QVELT |branch| 1))
                                                     (LETT |lineq|
                                                           (QVELT |branch| 2))
                                                     (LETT |ubf1|
                                                           (SPADCALL |leq| |ts|
                                                                     |lq| NIL
                                                                     NIL 'T 'T
                                                                     'T
                                                                     (QREFELT $
                                                                              98)))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |ubf1| 1)
                                                        "leave")
                                                       ('T
                                                        (SEQ
                                                         (LETT |ubf2|
                                                               (SPADCALL
                                                                (LIST |f|) |ts|
                                                                |lineq| NIL NIL
                                                                'T 'T 'T
                                                                (QREFELT $
                                                                         98)))
                                                         (EXIT
                                                          (COND
                                                           ((QEQCAR |ubf2| 1)
                                                            "leave")
                                                           ('T
                                                            (SEQ
                                                             (LETT |leq|
                                                                   (SPADCALL
                                                                    (ELT $ 16)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf1|)
                                                                       0)
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf2|)
                                                                       0)
                                                                      (QREFELT
                                                                       $ 14))
                                                                     (QREFELT $
                                                                              17))
                                                                    (QREFELT $
                                                                             19)))
                                                             (LETT |lineq|
                                                                   (SPADCALL
                                                                    (ELT $ 16)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf1|)
                                                                       2)
                                                                      (QVELT
                                                                       (QCDR
                                                                        |ubf2|)
                                                                       2)
                                                                      (QREFELT
                                                                       $ 14))
                                                                     (QREFELT $
                                                                              17))
                                                                    (QREFELT $
                                                                             19)))
                                                             (LETT |newBranch|
                                                                   (SPADCALL
                                                                    |leq| |ts|
                                                                    |lineq| NIL
                                                                    NIL NIL NIL
                                                                    NIL
                                                                    (QREFELT $
                                                                             98)))
                                                             (EXIT
                                                              (LETT |branches|
                                                                    (CONS
                                                                     (PROG2
                                                                         (LETT
                                                                          #5#
                                                                          |newBranch|)
                                                                         (QCDR
                                                                          #5#)
                                                                       (|check_union2|
                                                                        (QEQCAR
                                                                         #5# 0)
                                                                        (|Record|
                                                                         (|:|
                                                                          |eq|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            9)))
                                                                         (|:|
                                                                          |tower|
                                                                          (QREFELT
                                                                           $
                                                                           10))
                                                                         (|:|
                                                                          |ineq|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            9))))
                                                                        (|Union|
                                                                         (|Record|
                                                                          (|:|
                                                                           |eq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             $
                                                                             9)))
                                                                          (|:|
                                                                           |tower|
                                                                           (QREFELT
                                                                            $
                                                                            10))
                                                                          (|:|
                                                                           |ineq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             $
                                                                             9))))
                                                                         "failed")
                                                                        #5#))
                                                                     |branches|))))))))))))
                                                    (LETT #7# (CDR #7#))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |lq| (CONS |f| |lq|))))
                                              (LETT #8# (CDR #8#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (EXIT (LETT |toSee| |branches|)))
                                        (LETT #9# (CDR #9#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (SPADCALL
                                     (CONS
                                      #'|QCMPACK;prepareDecompose;LL2BL;20!0|
                                      $)
                                     |toSee| (QREFELT $ 101)))))))))
                    (#12#
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |ts| NIL) (LETT #3# |lts|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |ts| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (VECTOR |lp| |ts|
                                            (|QCMPACK;squareFreeFactors|
                                             (SPADCALL |ts| (QREFELT $ 69)) $))
                                    #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#)))))))))))))) 

(SDEFUN |QCMPACK;prepareDecompose;LL2BL;20!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QVELT |x| 1) (QVELT |y| 1) (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |QuasiComponentPackage;|)) 

(DEFUN |QuasiComponentPackage| (&REST #1=#:G691)
  (SPROG NIL
         (PROG (#2=#:G692)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|QuasiComponentPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |QuasiComponentPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|QuasiComponentPackage|)))))))))) 

(DEFUN |QuasiComponentPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|QuasiComponentPackage| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 103))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|QuasiComponentPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|QuasiComponentPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 9)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (0 . |squareFreeFactors|) (5 . |concat|) (|Boolean|)
              (11 . |infRittWu?|) (17 . |removeDuplicates|) (|Mapping| 15 9 9)
              (22 . |sort|) (|Void|)
              (|Record| (|:| |left| 10) (|:| |right| 10))
              (|TabulatedComputationPackage| 21 15) (28 . |initTable!|)
              (|String|) (32 . |empty?|) (37 . |printInfo!|)
              (43 . |startStats!|) (48 . |void|) |QCMPACK;startTable!;3SV;2|
              (52 . |makingStats?|) (56 . |printStats!|) (60 . |clearTable!|)
              |QCMPACK;stopTable!;V;3| (|NonNegativeInteger|) (64 . |#|)
              (69 . >) (75 . |members|) |QCMPACK;supDimElseRittWu?;2TSB;4|
              (|List| 10) (80 . |removeDuplicates|) (|Mapping| 15 10 10)
              (85 . |sort|) |QCMPACK;algebraicSort;2L;5| (91 . |empty?|)
              (96 . |mvar|) (101 . |algebraic?|)
              |QCMPACK;moreAlgebraic?;2TSB;6| (107 . |mvar|) (112 . >)
              (118 . <) (|Union| $ '#1="failed") (124 . |rest|)
              |QCMPACK;subTriSet?;2TSB;7| (|Union| 9 '#1#) (129 . |first|)
              (134 . =) (140 . |associates?|)
              |QCMPACK;internalSubPolSet?;2LB;8| |QCMPACK;subPolSet?;2LB;9|
              |QCMPACK;internalInfRittWu?;2LB;11| |QCMPACK;infRittWu?;2LB;10|
              |QCMPACK;subQuasiComponent?;2TSB;14|
              (|Record| (|:| |val| 11) (|:| |tower| 10))
              |QCMPACK;subCase?;2RB;12| (146 . |mdeg|) (151 . |select|)
              (157 . |initiallyReduce|) (163 . |zero?|) (168 . |initials|)
              (173 . |invertible?|) (|Union| 15 '"failed")
              |QCMPACK;internalSubQuasiComponent?;2TSU;13|
              (179 . |extractIfCan|) (184 . |insert!|)
              |QCMPACK;subQuasiComponent?;TSLB;15| (|Mapping| 15 63 63)
              (|List| 63) (190 . |sort|) (196 . |setrest!|)
              |QCMPACK;removeSuperfluousCases;2L;16| (202 . |setrest!|)
              |QCMPACK;removeSuperfluousQuasiComponents;2L;17|
              (208 . |primitivePart|) (|Mapping| 15 9) (213 . |remove|)
              (219 . |ground?|) (224 . |any?|) (230 . |removeRedundantFactors|)
              (|GeneralPolynomialSet| 6 7 8 9) (235 . |construct|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (240 . |remainder|) (246 . =) (252 . |gcd|) (258 . |exquo|)
              (|Record| (|:| |eq| 11) (|:| |tower| 10) (|:| |ineq| 11))
              (|Union| 96 '"failed") |QCMPACK;branchIfCan;LTSL5BU;19|
              (|Mapping| 15 96 96) (|List| 96) (264 . |sort|)
              |QCMPACK;prepareDecompose;LL2BL;20|)
           '#(|supDimElseRittWu?| 270 |subTriSet?| 276 |subQuasiComponent?| 282
              |subPolSet?| 294 |subCase?| 300 |stopTable!| 306 |startTable!|
              310 |removeSuperfluousQuasiComponents| 317
              |removeSuperfluousCases| 322 |prepareDecompose| 327
              |moreAlgebraic?| 335 |internalSubQuasiComponent?| 341
              |internalSubPolSet?| 347 |internalInfRittWu?| 353 |infRittWu?|
              359 |branchIfCan| 365 |algebraicSort| 377)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|startTable!|
                                 ((|Void|) (|String|) (|String|) (|String|)))
                                T)
                              '((|stopTable!| ((|Void|))) T)
                              '((|supDimElseRittWu?| ((|Boolean|) |#5| |#5|))
                                T)
                              '((|algebraicSort| ((|List| |#5|) (|List| |#5|)))
                                T)
                              '((|moreAlgebraic?| ((|Boolean|) |#5| |#5|)) T)
                              '((|subTriSet?| ((|Boolean|) |#5| |#5|)) T)
                              '((|subPolSet?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|internalSubPolSet?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|internalInfRittWu?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|infRittWu?|
                                 ((|Boolean|) (|List| |#4|) (|List| |#4|)))
                                T)
                              '((|internalSubQuasiComponent?|
                                 ((|Union| (|Boolean|) "failed") |#5| |#5|))
                                T)
                              '((|subQuasiComponent?| ((|Boolean|) |#5| |#5|))
                                T)
                              '((|subQuasiComponent?|
                                 ((|Boolean|) |#5| (|List| |#5|)))
                                T)
                              '((|removeSuperfluousQuasiComponents|
                                 ((|List| |#5|) (|List| |#5|)))
                                T)
                              '((|subCase?|
                                 ((|Boolean|)
                                  (|Record| (|:| |val| (|List| |#4|))
                                            (|:| |tower| |#5|))
                                  (|Record| (|:| |val| (|List| |#4|))
                                            (|:| |tower| |#5|))))
                                T)
                              '((|removeSuperfluousCases|
                                 ((|List|
                                   (|Record| (|:| |val| (|List| |#4|))
                                             (|:| |tower| |#5|)))
                                  (|List|
                                   (|Record| (|:| |val| (|List| |#4|))
                                             (|:| |tower| |#5|)))))
                                T)
                              '((|prepareDecompose|
                                 ((|List|
                                   (|Record| (|:| |eq| (|List| |#4|))
                                             (|:| |tower| |#5|)
                                             (|:| |ineq| (|List| |#4|))))
                                  (|List| |#4|) (|List| |#5|) (|Boolean|)
                                  (|Boolean|)))
                                T)
                              '((|branchIfCan|
                                 ((|Union|
                                   (|Record| (|:| |eq| (|List| |#4|))
                                             (|:| |tower| |#5|)
                                             (|:| |ineq| (|List| |#4|)))
                                   "failed")
                                  (|List| |#4|) |#5| (|List| |#4|) (|Boolean|)
                                  (|Boolean|) (|Boolean|) (|Boolean|)
                                  (|Boolean|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 102
                                            '(1 12 11 9 13 2 11 0 0 0 14 2 9 15
                                              0 0 16 1 11 0 0 17 2 11 0 18 0 19
                                              0 22 20 23 1 24 15 0 25 2 22 20
                                              24 24 26 1 22 20 24 27 0 20 0 28
                                              0 22 15 30 0 22 20 31 0 22 20 32
                                              1 10 34 0 35 2 34 15 0 0 36 1 10
                                              11 0 37 1 39 0 0 40 2 39 0 41 0
                                              42 1 10 15 0 44 1 9 8 0 45 2 10
                                              15 8 0 46 1 10 8 0 48 2 8 15 0 0
                                              49 2 8 15 0 0 50 1 10 51 0 52 1
                                              10 54 0 55 2 9 15 0 0 56 2 9 15 0
                                              0 57 1 9 34 0 65 2 10 54 0 8 66 2
                                              10 9 9 0 67 1 9 15 0 68 1 10 11 0
                                              69 2 10 15 9 0 70 1 22 71 21 73 2
                                              22 20 21 15 74 2 77 0 76 0 78 2
                                              77 0 0 0 79 2 39 0 0 0 81 1 9 0 0
                                              83 2 11 0 84 0 85 1 9 15 0 86 2
                                              11 15 84 0 87 1 12 11 11 88 1 89
                                              0 11 90 2 89 91 9 0 92 2 8 15 0 0
                                              93 2 9 0 0 0 94 2 9 51 0 0 95 2
                                              100 0 99 0 101 2 0 15 10 10 38 2
                                              0 15 10 10 53 2 0 15 10 39 75 2 0
                                              15 10 10 62 2 0 15 11 11 59 2 0
                                              15 63 63 64 0 0 20 33 3 0 20 24
                                              24 24 29 1 0 39 39 82 1 0 77 77
                                              80 4 0 100 11 39 15 15 102 2 0 15
                                              10 10 47 2 0 71 10 10 72 2 0 15
                                              11 11 58 2 0 15 11 11 60 2 0 15
                                              11 11 61 8 0 97 11 10 11 15 15 15
                                              15 15 98 1 0 39 39 43)))))
           '|lookupComplete|)) 