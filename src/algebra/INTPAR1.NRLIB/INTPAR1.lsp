
(SDEFUN |INTPAR1;monologextint;LMMR;1|
        ((|lup| |List| UP)
         (|csolve| |Mapping| #1=(|List| (|Vector| (|Fraction| (|Integer|))))
          (|Matrix| F))
         (|rec1| |Mapping|
          #2=(|Record| (|:| |logands| #3=(|List| F))
                       (|:| |basis|
                            #4=(|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| F))
         ($ |Record| (|:| |logands| (|List| (|Fraction| UP)))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#5=#:G425 NIL) (|i| NIL) (|j| NIL) (#6=#:G424 NIL)
          (|pv| (|Vector| (|Fraction| (|Integer|)))) (#7=#:G422 NIL)
          (|rbv| NIL) (#8=#:G423 NIL) (|bv| NIL)
          (|nl| (|List| (|Fraction| UP))) (#9=#:G421 NIL) (|le| NIL)
          (#10=#:G420 NIL) (|rbl| (|List| (|Vector| (|Fraction| (|Integer|)))))
          (#11=#:G419 NIL) (#12=#:G418 NIL) (|n3| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|n1| (|NonNegativeInteger|))
          (|bl| #4#) (|ll| #3#) (|#G11| #2#) (|nlc0| (|List| F))
          (#13=#:G417 NIL) (#14=#:G416 NIL) (|cb| #1#) (|rs1| (|Matrix| F))
          (|m1| (|Matrix| UP)) (|lup2| (|List| UP)) (#15=#:G414 NIL) (|p| NIL)
          (#16=#:G415 NIL) (|c0| NIL) (#17=#:G413 NIL) (|lc0| (|List| F))
          (#18=#:G412 NIL) (#19=#:G411 NIL) (|n0| (|NonNegativeInteger|)))
         (SEQ (LETT |n0| (LENGTH |lup|))
              (LETT |lc0|
                    (PROGN
                     (LETT #19# NIL)
                     (SEQ (LETT |p| NIL) (LETT #18# |lup|) G190
                          (COND
                           ((OR (ATOM #18#) (PROGN (LETT |p| (CAR #18#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #19#
                                  (CONS (SPADCALL |p| 0 (QREFELT $ 11))
                                        #19#))))
                          (LETT #18# (CDR #18#)) (GO G190) G191
                          (EXIT (NREVERSE #19#)))))
              (LETT |lup2|
                    (PROGN
                     (LETT #17# NIL)
                     (SEQ (LETT |c0| NIL) (LETT #16# |lc0|) (LETT |p| NIL)
                          (LETT #15# |lup|) G190
                          (COND
                           ((OR (ATOM #15#) (PROGN (LETT |p| (CAR #15#)) NIL)
                                (ATOM #16#) (PROGN (LETT |c0| (CAR #16#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS
                                   (SPADCALL |p| (SPADCALL |c0| (QREFELT $ 12))
                                             (QREFELT $ 13))
                                   #17#))))
                          (LETT #15# (PROG1 (CDR #15#) (LETT #16# (CDR #16#))))
                          (GO G190) G191 (EXIT (NREVERSE #17#)))))
              (LETT |m1| (SPADCALL (LIST |lup2|) (QREFELT $ 16)))
              (LETT |rs1| (SPADCALL |m1| (QREFELT $ 19)))
              (LETT |cb| (SPADCALL |rs1| |csolve|))
              (LETT |nlc0|
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |bv| NIL) (LETT #13# |cb|) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |bv| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |bv| |lc0| (QREFELT $ 23))
                                        #14#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (PROGN
               (LETT |#G11| (SPADCALL |nlc0| |rec1|))
               (LETT |ll| (QCAR |#G11|))
               (LETT |bl| (QCDR |#G11|))
               |#G11|)
              (EXIT
               (COND ((NULL |bl|) (CONS NIL NIL))
                     ('T
                      (SEQ (LETT |n1| (LENGTH |cb|)) (LETT |n2| (LENGTH |ll|))
                           (LETT |n3| (+ |n0| |n2|))
                           (LETT |rbl|
                                 (PROGN
                                  (LETT #12# NIL)
                                  (SEQ (LETT |bv| NIL) (LETT #11# |bl|) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |bv| (CAR #11#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #12#
                                               (CONS
                                                (MAKEARR1 |n3|
                                                          (|spadConstant| $
                                                                          25))
                                                #12#))))
                                       (LETT #11# (CDR #11#)) (GO G190) G191
                                       (EXIT (NREVERSE #12#)))))
                           (LETT |nl|
                                 (PROGN
                                  (LETT #10# NIL)
                                  (SEQ (LETT |le| NIL) (LETT #9# |ll|) G190
                                       (COND
                                        ((OR (ATOM #9#)
                                             (PROGN (LETT |le| (CAR #9#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #10#
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |le| (QREFELT $ 12))
                                                 (QREFELT $ 27))
                                                #10#))))
                                       (LETT #9# (CDR #9#)) (GO G190) G191
                                       (EXIT (NREVERSE #10#)))))
                           (SEQ (LETT |bv| NIL) (LETT #8# |bl|)
                                (LETT |rbv| NIL) (LETT #7# |rbl|) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |rbv| (CAR #7#)) NIL)
                                      (ATOM #8#)
                                      (PROGN (LETT |bv| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |pv|
                                       (SPADCALL
                                        (SPADCALL |bv|
                                                  (SPADCALL 1 |n1|
                                                            (QREFELT $ 32))
                                                  (QREFELT $ 33))
                                        |cb| (QREFELT $ 36)))
                                 (SEQ (LETT |i| 1) (LETT #6# |n0|) G190
                                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |rbv| |i|
                                                  (SPADCALL |pv| |i|
                                                            (QREFELT $ 37))
                                                  (QREFELT $ 38))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (SEQ (LETT |j| (+ |n1| 1))
                                       (LETT |i| (+ |n0| 1)) (LETT #5# |n3|)
                                       G190 (COND ((> |i| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rbv| |i|
                                                   (SPADCALL |bv| |j|
                                                             (QREFELT $ 37))
                                                   (QREFELT $ 38))))
                                       (LETT |i|
                                             (PROG1 (+ |i| 1)
                                               (LETT |j| (+ |j| 1))))
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT #7#
                                      (PROG1 (CDR #7#) (LETT #8# (CDR #8#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |nl| |rbl|))))))))) 

(SDEFUN |INTPAR1;logextint;MMMMLR;2|
        ((|der| |Mapping| UP UP) (|ufactor| |Mapping| (|Factored| UP) UP)
         (|csolve| |Mapping| #1=(|List| (|Vector| (|Fraction| (|Integer|))))
          (|Matrix| F))
         (|rec| |Mapping|
          #2=(|Record| (|:| |logands| (|List| (|Fraction| UP)))
                       (|:| |basis|
                            (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| UP))
         (|lg| |List| (|Fraction| UP))
         ($ |Record| (|:| |logands| #3=(|List| (|Fraction| UP)))
          (|:| |basis| #4=(|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#5=#:G568 NIL) (|i| NIL) (#6=#:G569 NIL) (|j| NIL) (#7=#:G566 NIL)
          (#8=#:G567 NIL) (|pv| #9=(|Vector| (|Fraction| (|Integer|))))
          (#10=#:G565 NIL) (|bv1| #11=(|Vector| (|Fraction| (|Integer|))))
          (#12=#:G563 NIL) (|rbv| NIL) (#13=#:G564 NIL) (|bv| NIL)
          (|rbas| (|List| (|Vector| (|Fraction| (|Integer|)))))
          (#14=#:G562 NIL) (#15=#:G561 NIL) (|n6| (|NonNegativeInteger|))
          (|n5| #16=(|NonNegativeInteger|)) (|nlog| (|List| (|Fraction| UP)))
          (|rbasl1| (|List| (|Fraction| UP))) (#17=#:G560 NIL) (|up| NIL)
          (#18=#:G559 NIL) (|fbas| #4#) (|flog| #3#) (|#G54| #2#)
          (#19=#:G558 NIL) (|g| NIL) (#20=#:G557 NIL) (|n4| #16#)
          (|lg7| (|List| #21=(|Fraction| UP))) (#22=#:G556 NIL)
          (#23=#:G555 NIL) (|cb4e| (|List| #9#)) (#24=#:G554 NIL)
          (#25=#:G553 NIL) (|ncb2| (|List| #9#)) (#26=#:G552 NIL)
          (#27=#:G551 NIL) (|cb4| #1#) (|rs2| #28=(|Matrix| F))
          (|rs1| (|Matrix| UP)) (|m1| (|Matrix| (|Fraction| UP)))
          (|lg6| (|List| (|Fraction| UP))) (|lrf| (|List| (|Fraction| UP)))
          (|r| (UP)) (|q| (UP))
          (|#G50| #29=(|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|den| (UP)) (#30=#:G550 NIL) (|lg5| (|List| #31=(|Fraction| UP)))
          (#32=#:G548 NIL) (#33=#:G549 NIL) (|pc| NIL) (#34=#:G547 NIL)
          (|lg4| (|List| #31#)) (#35=#:G546 NIL) (|ghr| NIL) (#36=#:G545 NIL)
          (|nlpc| (|List| #21#)) (#37=#:G544 NIL) (#38=#:G543 NIL)
          (|ncb| (|List| #9#)) (#39=#:G542 NIL) (#40=#:G541 NIL)
          (|cb3e| (|List| #11#)) (#41=#:G540 NIL) (#42=#:G539 NIL)
          (|cb3| (|List| #11#)) (#43=#:G538 NIL) (#44=#:G537 NIL) (|cb2| #1#)
          (|rs3| #28#) (|lpc| (|List| (|Fraction| UP))) (|#G41| #29#)
          (|dbj| (UP)) (#45=#:G535 NIL) (#46=#:G536 NIL) (|bj| NIL)
          (#47=#:G533 NIL) (|num| NIL) (#48=#:G534 NIL) (|nl| (|List| UP))
          (|jl| (|List| (|Integer|))) (|fl| (|List| UP)) (|j0| (|Integer|))
          (|j1| (|Integer|)) (|sl1| #49=(|List| (|NonNegativeInteger|)))
          (#50=#:G531 NIL) (#51=#:G532 NIL) (|fj| NIL) (|fl1| (|List| UP))
          (#52=#:G529 NIL) (#53=#:G530 NIL) (|m3| (|Matrix| UP))
          (|n3| (|NonNegativeInteger|)) (|sl| #49#) (#54=#:G528 NIL)
          (#55=#:G527 NIL) (|basl1| (|List| UP))
          (|mbasfl| (|List| (|List| UP))) (#56=#:G526 NIL) (|frr| NIL)
          (#57=#:G525 NIL) (#58=#:G524 NIL) (|mbasp| NIL) (#59=#:G523 NIL)
          (|mbasl| (|List| UP)) (|n2| (|NonNegativeInteger|)) (|n1| #16#)
          (|m2| #60=(|Matrix| (|Integer|))) (|mbas| #61=(|Vector| UP))
          (|#G29| (|Record| (|:| |basis| #61#) (|:| |transform| #60#)))
          (|lden1| (|List| UP)) (#62=#:G522 NIL) (#63=#:G521 NIL)
          (|lg3| (|List| #21#)) (#64=#:G520 NIL) (#65=#:G519 NIL)
          (|lg2| (|List| #66=(|Fraction| UP))) (#67=#:G518 NIL)
          (#68=#:G517 NIL) (|cb| #1#) (|lg1| (|List| #69=(|Fraction| UP)))
          (#70=#:G516 NIL) (#71=#:G515 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #69#) (|:| |logpart| #66#)
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#72=#:G514 NIL) (#73=#:G513 NIL) (|n0| #16#))
         (SEQ
          (COND ((NULL |lg|) (CONS NIL NIL))
                (#74='T
                 (SEQ (LETT |n0| (LENGTH |lg|))
                      (LETT |lghr|
                            (PROGN
                             (LETT #73# NIL)
                             (SEQ (LETT |g| NIL) (LETT #72# |lg|) G190
                                  (COND
                                   ((OR (ATOM #72#)
                                        (PROGN (LETT |g| (CAR #72#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #73#
                                          (CONS
                                           (SPADCALL |g| |der| (QREFELT $ 48))
                                           #73#))))
                                  (LETT #72# (CDR #72#)) (GO G190) G191
                                  (EXIT (NREVERSE #73#)))))
                      (LETT |lg1|
                            (PROGN
                             (LETT #71# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #70# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #70#)
                                        (PROGN (LETT |ghr| (CAR #70#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #71# (CONS (QVELT |ghr| 0) #71#))))
                                  (LETT #70# (CDR #70#)) (GO G190) G191
                                  (EXIT (NREVERSE #71#)))))
                      (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)))
                      (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)))
                      (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)))
                      (LETT |cb| (SPADCALL |rs2| |csolve|))
                      (LETT |lg2|
                            (PROGN
                             (LETT #68# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #67# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #67#)
                                        (PROGN (LETT |ghr| (CAR #67#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #68# (CONS (QVELT |ghr| 1) #68#))))
                                  (LETT #67# (CDR #67#)) (GO G190) G191
                                  (EXIT (NREVERSE #68#)))))
                      (LETT |lg3|
                            (PROGN
                             (LETT #65# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #64# |cb|) G190
                                  (COND
                                   ((OR (ATOM #64#)
                                        (PROGN (LETT |bv| (CAR #64#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #65#
                                          (CONS
                                           (SPADCALL |bv| |lg2| (QREFELT $ 54))
                                           #65#))))
                                  (LETT #64# (CDR #64#)) (GO G190) G191
                                  (EXIT (NREVERSE #65#)))))
                      (LETT |lden1|
                            (PROGN
                             (LETT #63# NIL)
                             (SEQ (LETT |g| NIL) (LETT #62# |lg3|) G190
                                  (COND
                                   ((OR (ATOM #62#)
                                        (PROGN (LETT |g| (CAR #62#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #63#
                                          (CONS (SPADCALL |g| (QREFELT $ 55))
                                                #63#))))
                                  (LETT #62# (CDR #62#)) (GO G190) G191
                                  (EXIT (NREVERSE #63#)))))
                      (PROGN
                       (LETT |#G29|
                             (SPADCALL (SPADCALL |lden1| (QREFELT $ 57))
                                       (QREFELT $ 60)))
                       (LETT |mbas| (QCAR |#G29|))
                       (LETT |m2| (QCDR |#G29|))
                       |#G29|)
                      (LETT |n1| (LENGTH |lg3|)) (LETT |n2| (QVSIZE |mbas|))
                      (LETT |mbasl| (SPADCALL |mbas| (QREFELT $ 61)))
                      (LETT |mbasfl|
                            (PROGN
                             (LETT #59# NIL)
                             (SEQ (LETT |mbasp| NIL) (LETT #58# |mbasl|) G190
                                  (COND
                                   ((OR (ATOM #58#)
                                        (PROGN (LETT |mbasp| (CAR #58#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #59#
                                          (CONS
                                           (PROGN
                                            (LETT #57# NIL)
                                            (SEQ (LETT |frr| NIL)
                                                 (LETT #56#
                                                       (SPADCALL
                                                        (SPADCALL |mbasp|
                                                                  |ufactor|)
                                                        (QREFELT $ 66)))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #56#)
                                                       (PROGN
                                                        (LETT |frr| (CAR #56#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #57#
                                                         (CONS (QVELT |frr| 1)
                                                               #57#))))
                                                 (LETT #56# (CDR #56#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #57#))))
                                           #59#))))
                                  (LETT #58# (CDR #58#)) (GO G190) G191
                                  (EXIT (NREVERSE #59#)))))
                      (LETT |basl1|
                            (SPADCALL (ELT $ 69) |mbasfl| NIL (QREFELT $ 71)))
                      (LETT |sl|
                            (PROGN
                             (LETT #55# NIL)
                             (SEQ (LETT |fl1| NIL) (LETT #54# |mbasfl|) G190
                                  (COND
                                   ((OR (ATOM #54#)
                                        (PROGN (LETT |fl1| (CAR #54#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #55# (CONS (LENGTH |fl1|) #55#))))
                                  (LETT #54# (CDR #54#)) (GO G190) G191
                                  (EXIT (NREVERSE #55#)))))
                      (LETT |n3| (SPADCALL (ELT $ 76) |sl| 0 (QREFELT $ 79)))
                      (LETT |m3|
                            (MAKE_MATRIX1 |n3| (+ |n1| |n3|)
                                          (|spadConstant| $ 9)))
                      (SEQ (LETT |g| NIL) (LETT #53# |lg3|) (LETT |i| 1)
                           (LETT #52# |n1|) G190
                           (COND
                            ((OR (|greater_SI| |i| #52#) (ATOM #53#)
                                 (PROGN (LETT |g| (CAR #53#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |fl| NIL) (LETT |jl| NIL)
                                (LETT |sl1| |sl|) (LETT |fl1| NIL)
                                (LETT |j0| 1) (LETT |j1| 0)
                                (SEQ (LETT |fj| NIL) (LETT #51# |basl1|)
                                     (LETT |j| 1) (LETT #50# |n3|) G190
                                     (COND
                                      ((OR (|greater_SI| |j| #50#) (ATOM #51#)
                                           (PROGN (LETT |fj| (CAR #51#)) NIL))
                                       (GO G191)))
                                     (SEQ (LETT |j1| (+ |j1| 1))
                                          (COND
                                           ((SPADCALL |j1| (|SPADfirst| |sl1|)
                                                      (QREFELT $ 81))
                                            (SEQ (LETT |sl1| (CDR |sl1|))
                                                 (LETT |j1| 0)
                                                 (EXIT
                                                  (LETT |j0| (+ |j0| 1))))))
                                          (EXIT
                                           (COND
                                            ((EQL
                                              (SPADCALL |m2| |j0| |i|
                                                        (QREFELT $ 83))
                                              1)
                                             (SEQ (LETT |fl| (CONS |fj| |fl|))
                                                  (EXIT
                                                   (LETT |jl|
                                                         (CONS |j| |jl|))))))))
                                     (LETT |j|
                                           (PROG1 (|inc_SI| |j|)
                                             (LETT #51# (CDR #51#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |nl|
                                      (SPADCALL (SPADCALL |g| (QREFELT $ 84))
                                                |fl| (QREFELT $ 86)))
                                (EXIT
                                 (SEQ (LETT |j| NIL) (LETT #48# |jl|)
                                      (LETT |num| NIL) (LETT #47# |nl|) G190
                                      (COND
                                       ((OR (ATOM #47#)
                                            (PROGN (LETT |num| (CAR #47#)) NIL)
                                            (ATOM #48#)
                                            (PROGN (LETT |j| (CAR #48#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |m3| |j| |i| |num|
                                                  (QREFELT $ 87))))
                                      (LETT #47#
                                            (PROG1 (CDR #47#)
                                              (LETT #48# (CDR #48#))))
                                      (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #53# (CDR #53#))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |lpc| NIL)
                      (SEQ (LETT |bj| NIL) (LETT #46# |basl1|) (LETT |j| 1)
                           (LETT #45# |n3|) G190
                           (COND
                            ((OR (|greater_SI| |j| #45#) (ATOM #46#)
                                 (PROGN (LETT |bj| (CAR #46#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dbj| (SPADCALL |bj| |der|))
                                (PROGN
                                 (LETT |#G41|
                                       (SPADCALL |dbj| |bj| (QREFELT $ 89)))
                                 (LETT |q| (QCAR |#G41|))
                                 (LETT |r| (QCDR |#G41|))
                                 |#G41|)
                                (SPADCALL |m3| |j| (+ |n1| |j|) |r|
                                          (QREFELT $ 87))
                                (EXIT
                                 (LETT |lpc|
                                       (CONS (SPADCALL |q| (QREFELT $ 27))
                                             |lpc|))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|) (LETT #46# (CDR #46#))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |lpc| (NREVERSE |lpc|))
                      (LETT |rs3| (SPADCALL |m3| (QREFELT $ 19)))
                      (LETT |cb2| (SPADCALL |rs3| |csolve|))
                      (LETT |cb3|
                            (PROGN
                             (LETT #44# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #43# |cb2|) G190
                                  (COND
                                   ((OR (ATOM #43#)
                                        (PROGN (LETT |bv| (CAR #43#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #44#
                                          (CONS
                                           (SPADCALL |bv|
                                                     (SPADCALL 1 |n1|
                                                               (QREFELT $ 32))
                                                     (QREFELT $ 33))
                                           #44#))))
                                  (LETT #43# (CDR #43#)) (GO G190) G191
                                  (EXIT (NREVERSE #44#)))))
                      (LETT |cb3e|
                            (PROGN
                             (LETT #42# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #41# |cb2|) G190
                                  (COND
                                   ((OR (ATOM #41#)
                                        (PROGN (LETT |bv| (CAR #41#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #42#
                                          (CONS
                                           (SPADCALL |bv|
                                                     (SPADCALL (+ |n1| 1)
                                                               (+ |n1| |n3|)
                                                               (QREFELT $ 32))
                                                     (QREFELT $ 33))
                                           #42#))))
                                  (LETT #41# (CDR #41#)) (GO G190) G191
                                  (EXIT (NREVERSE #42#)))))
                      (LETT |ncb|
                            (PROGN
                             (LETT #40# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #39# |cb3|) G190
                                  (COND
                                   ((OR (ATOM #39#)
                                        (PROGN (LETT |bv| (CAR #39#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #40#
                                          (CONS
                                           (SPADCALL |bv| |cb| (QREFELT $ 36))
                                           #40#))))
                                  (LETT #39# (CDR #39#)) (GO G190) G191
                                  (EXIT (NREVERSE #40#)))))
                      (LETT |nlpc|
                            (PROGN
                             (LETT #38# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #37# |cb3e|) G190
                                  (COND
                                   ((OR (ATOM #37#)
                                        (PROGN (LETT |bv| (CAR #37#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #38#
                                          (CONS
                                           (SPADCALL |bv| |lpc| (QREFELT $ 54))
                                           #38#))))
                                  (LETT #37# (CDR #37#)) (GO G190) G191
                                  (EXIT (NREVERSE #38#)))))
                      (LETT |lg4|
                            (PROGN
                             (LETT #36# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #35# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #35#)
                                        (PROGN (LETT |ghr| (CAR #35#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #36#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL (QVELT |ghr| 3)
                                                      (QREFELT $ 27))
                                            (QVELT |ghr| 2) (QREFELT $ 72))
                                           #36#))))
                                  (LETT #35# (CDR #35#)) (GO G190) G191
                                  (EXIT (NREVERSE #36#)))))
                      (LETT |lg5|
                            (PROGN
                             (LETT #34# NIL)
                             (SEQ (LETT |pc| NIL) (LETT #33# |nlpc|)
                                  (LETT |bv| NIL) (LETT #32# |ncb|) G190
                                  (COND
                                   ((OR (ATOM #32#)
                                        (PROGN (LETT |bv| (CAR #32#)) NIL)
                                        (ATOM #33#)
                                        (PROGN (LETT |pc| (CAR #33#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #34#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |bv| |lg4|
                                                      (QREFELT $ 54))
                                            |pc| (QREFELT $ 72))
                                           #34#))))
                                  (LETT #32#
                                        (PROG1 (CDR #32#)
                                          (LETT #33# (CDR #33#))))
                                  (GO G190) G191 (EXIT (NREVERSE #34#)))))
                      (LETT |lrf| NIL) (LETT |lg6| NIL)
                      (SEQ (LETT |g| NIL) (LETT #30# |lg5|) G190
                           (COND
                            ((OR (ATOM #30#) (PROGN (LETT |g| (CAR #30#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |den| (SPADCALL |g| (QREFELT $ 55)))
                                (PROGN
                                 (LETT |#G50|
                                       (SPADCALL (SPADCALL |g| (QREFELT $ 84))
                                                 |den| (QREFELT $ 89)))
                                 (LETT |q| (QCAR |#G50|))
                                 (LETT |r| (QCDR |#G50|))
                                 |#G50|)
                                (LETT |lrf|
                                      (CONS (SPADCALL |r| |den| (QREFELT $ 90))
                                            |lrf|))
                                (EXIT
                                 (LETT |lg6|
                                       (CONS (SPADCALL |q| (QREFELT $ 27))
                                             |lg6|))))
                           (LETT #30# (CDR #30#)) (GO G190) G191 (EXIT NIL))
                      (LETT |lrf| (NREVERSE |lrf|))
                      (LETT |lg6| (NREVERSE |lg6|))
                      (LETT |m1| (SPADCALL (LIST |lrf|) (QREFELT $ 51)))
                      (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)))
                      (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)))
                      (LETT |cb4| (SPADCALL |rs2| |csolve|))
                      (LETT |ncb2|
                            (PROGN
                             (LETT #27# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #26# |cb4|) G190
                                  (COND
                                   ((OR (ATOM #26#)
                                        (PROGN (LETT |bv| (CAR #26#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #27#
                                          (CONS
                                           (SPADCALL |bv| |ncb| (QREFELT $ 36))
                                           #27#))))
                                  (LETT #26# (CDR #26#)) (GO G190) G191
                                  (EXIT (NREVERSE #27#)))))
                      (LETT |cb4e|
                            (PROGN
                             (LETT #25# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #24# |cb4|) G190
                                  (COND
                                   ((OR (ATOM #24#)
                                        (PROGN (LETT |bv| (CAR #24#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #25#
                                          (CONS
                                           (SPADCALL |bv| |cb3e|
                                                     (QREFELT $ 36))
                                           #25#))))
                                  (LETT #24# (CDR #24#)) (GO G190) G191
                                  (EXIT (NREVERSE #25#)))))
                      (LETT |lg7|
                            (PROGN
                             (LETT #23# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #22# |cb4|) G190
                                  (COND
                                   ((OR (ATOM #22#)
                                        (PROGN (LETT |bv| (CAR #22#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #23#
                                          (CONS
                                           (SPADCALL |bv| |lg6| (QREFELT $ 54))
                                           #23#))))
                                  (LETT #22# (CDR #22#)) (GO G190) G191
                                  (EXIT (NREVERSE #23#)))))
                      (LETT |n4| (LENGTH |lg7|))
                      (PROGN
                       (LETT |#G54|
                             (SPADCALL
                              (PROGN
                               (LETT #20# NIL)
                               (SEQ (LETT |g| NIL) (LETT #19# |lg7|) G190
                                    (COND
                                     ((OR (ATOM #19#)
                                          (PROGN (LETT |g| (CAR #19#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #20#
                                            (CONS (SPADCALL |g| (QREFELT $ 91))
                                                  #20#))))
                                    (LETT #19# (CDR #19#)) (GO G190) G191
                                    (EXIT (NREVERSE #20#))))
                              |rec|))
                       (LETT |flog| (QCAR |#G54|))
                       (LETT |fbas| (QCDR |#G54|))
                       |#G54|)
                      (EXIT
                       (COND ((NULL |fbas|) (CONS NIL NIL))
                             (#74#
                              (SEQ
                               (LETT |rbasl1|
                                     (PROGN
                                      (LETT #18# NIL)
                                      (SEQ (LETT |up| NIL) (LETT #17# |basl1|)
                                           G190
                                           (COND
                                            ((OR (ATOM #17#)
                                                 (PROGN
                                                  (LETT |up| (CAR #17#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #18#
                                                   (CONS
                                                    (SPADCALL |up|
                                                              (QREFELT $ 27))
                                                    #18#))))
                                           (LETT #17# (CDR #17#)) (GO G190)
                                           G191 (EXIT (NREVERSE #18#)))))
                               (LETT |nlog|
                                     (SPADCALL |rbasl1| |flog| (QREFELT $ 68)))
                               (LETT |n5| (LENGTH |flog|))
                               (LETT |n6| (+ (+ |n0| |n3|) |n5|))
                               (LETT |rbas|
                                     (PROGN
                                      (LETT #15# NIL)
                                      (SEQ (LETT |bv| NIL) (LETT #14# |fbas|)
                                           G190
                                           (COND
                                            ((OR (ATOM #14#)
                                                 (PROGN
                                                  (LETT |bv| (CAR #14#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #15#
                                                   (CONS
                                                    (MAKEARR1 |n6|
                                                              (|spadConstant| $
                                                                              25))
                                                    #15#))))
                                           (LETT #14# (CDR #14#)) (GO G190)
                                           G191 (EXIT (NREVERSE #15#)))))
                               (SEQ (LETT |bv| NIL) (LETT #13# |fbas|)
                                    (LETT |rbv| NIL) (LETT #12# |rbas|) G190
                                    (COND
                                     ((OR (ATOM #12#)
                                          (PROGN (LETT |rbv| (CAR #12#)) NIL)
                                          (ATOM #13#)
                                          (PROGN (LETT |bv| (CAR #13#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |bv1|
                                           (SPADCALL |bv|
                                                     (SPADCALL 1 |n4|
                                                               (QREFELT $ 32))
                                                     (QREFELT $ 33)))
                                     (LETT |pv|
                                           (SPADCALL |bv1| |ncb2|
                                                     (QREFELT $ 36)))
                                     (SEQ (LETT |i| 1) (LETT #10# |n0|) G190
                                          (COND
                                           ((|greater_SI| |i| #10#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |rbv| |i|
                                                      (SPADCALL |pv| |i|
                                                                (QREFELT $ 37))
                                                      (QREFELT $ 38))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |pv|
                                           (SPADCALL |bv1| |cb4e|
                                                     (QREFELT $ 36)))
                                     (SEQ (LETT |j| 1) (LETT #8# |n3|)
                                          (LETT |i| (+ |n0| 1))
                                          (LETT #7# (+ |n0| |n3|)) G190
                                          (COND
                                           ((OR (> |i| #7#)
                                                (|greater_SI| |j| #8#))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |rbv| |i|
                                                      (SPADCALL |pv| |j|
                                                                (QREFELT $ 37))
                                                      (QREFELT $ 38))))
                                          (LETT |i|
                                                (PROG1 (+ |i| 1)
                                                  (LETT |j| (|inc_SI| |j|))))
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SEQ (LETT |j| (+ |n4| 1))
                                           (LETT #6# (+ |n4| |n5|))
                                           (LETT |i| (+ (+ |n0| |n3|) 1))
                                           (LETT #5# |n6|) G190
                                           (COND
                                            ((OR (> |i| #5#) (> |j| #6#))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL |rbv| |i|
                                                       (SPADCALL |bv| |j|
                                                                 (QREFELT $
                                                                          37))
                                                       (QREFELT $ 38))))
                                           (LETT |i|
                                                 (PROG1 (+ |i| 1)
                                                   (LETT |j| (+ |j| 1))))
                                           (GO G190) G191 (EXIT NIL))))
                                    (LETT #12#
                                          (PROG1 (CDR #12#)
                                            (LETT #13# (CDR #13#))))
                                    (GO G190) G191 (EXIT NIL))
                               (EXIT (CONS |nlog| |rbas|)))))))))))) 

(SDEFUN |INTPAR1;RF_to_GP| ((|f| |Fraction| UP) ($ |LaurentPolynomial| F UP))
        (SPROG ((#1=#:G571 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT $ 84))
                                    (QREFELT $ 96))
                          (SPADCALL (SPADCALL |f| (QREFELT $ 55))
                                    (QREFELT $ 96))
                          (QREFELT $ 98)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LaurentPolynomial| (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                 (|Union|
                                  (|LaurentPolynomial| (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                  "failed")
                                 #1#)))) 

(SDEFUN |INTPAR1;primextint;MMMLL;4|
        ((|der| |Mapping| UP UP)
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| F))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G743 NIL) (|bv| NIL) (#2=#:G744 NIL) (|ba| NIL) (#3=#:G742 NIL)
          (|nlba| (|List| (|Fraction| UP))) (#4=#:G740 NIL) (#5=#:G741 NIL)
          (#6=#:G739 NIL) (|lba| (|List| (|Fraction| UP)))
          (|cb| (|List| (|Vector| F))) (#7=#:G737 NIL) (|be| NIL)
          (#8=#:G738 NIL) (#9=#:G736 NIL) (|cba| (|List| F)) (#10=#:G735 NIL)
          (#11=#:G734 NIL) (|ncb| (|List| (|Vector| F))) (#12=#:G733 NIL)
          (#13=#:G732 NIL) (|cb0| (|List| (|Vector| F))) (#14=#:G731 NIL)
          (#15=#:G730 NIL) (|n1p| (|NonNegativeInteger|))
          (|b2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#16=#:G728 NIL) (#17=#:G729 NIL)
          (|aa| NIL) (|lgj| (|List| F)) (|gij| (F)) (|gi| (UP))
          (#18=#:G727 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|)) (|j| NIL)
          (#19=#:G726 NIL) (#20=#:G725 NIL) (|dk| (F))
          (|d| (|NonNegativeInteger|)) (|ldg| (|List| (|NonNegativeInteger|)))
          (#21=#:G724 NIL) (|g2| NIL) (#22=#:G723 NIL) (|vg2| (|Vector| UP))
          (|lg2| (|List| UP)) (#23=#:G722 NIL) (|ghr| NIL) (#24=#:G721 NIL)
          (#25=#:G720 NIL) (#26=#:G719 NIL)
          (|a1l| (|List| #27=(|Fraction| UP))) (#28=#:G718 NIL)
          (#29=#:G717 NIL) (|rs2| (|Matrix| F)) (|rs1| (|Matrix| UP))
          (|m1| (|Matrix| (|Fraction| UP)))
          (|lg1| (|List| #30=(|Fraction| UP))) (#31=#:G716 NIL)
          (#32=#:G715 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #27#) (|:| |logpart| #30#)
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#33=#:G714 NIL) (|g| NIL) (#34=#:G713 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lg|) NIL)
                ('T
                 (SEQ (LETT |n| (LENGTH |lg|))
                      (LETT |lghr|
                            (PROGN
                             (LETT #34# NIL)
                             (SEQ (LETT |g| NIL) (LETT #33# |lg|) G190
                                  (COND
                                   ((OR (ATOM #33#)
                                        (PROGN (LETT |g| (CAR #33#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #34#
                                          (CONS
                                           (SPADCALL |g| |der| (QREFELT $ 48))
                                           #34#))))
                                  (LETT #33# (CDR #33#)) (GO G190) G191
                                  (EXIT (NREVERSE #34#)))))
                      (LETT |lg1|
                            (PROGN
                             (LETT #32# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #31# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #31#)
                                        (PROGN (LETT |ghr| (CAR #31#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #32# (CONS (QVELT |ghr| 1) #32#))))
                                  (LETT #31# (CDR #31#)) (GO G190) G191
                                  (EXIT (NREVERSE #32#)))))
                      (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)))
                      (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)))
                      (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)))
                      (LETT |cb| (SPADCALL |rs2| |csolve|))
                      (LETT |a1l|
                            (PROGN
                             (LETT #29# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #28# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #28#)
                                        (PROGN (LETT |ghr| (CAR #28#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #29# (CONS (QVELT |ghr| 0) #29#))))
                                  (LETT #28# (CDR #28#)) (GO G190) G191
                                  (EXIT (NREVERSE #29#)))))
                      (LETT |lba|
                            (PROGN
                             (LETT #26# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #25# |cb|) G190
                                  (COND
                                   ((OR (ATOM #25#)
                                        (PROGN (LETT |bv| (CAR #25#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #26#
                                          (CONS (|spadConstant| $ 99) #26#))))
                                  (LETT #25# (CDR #25#)) (GO G190) G191
                                  (EXIT (NREVERSE #26#)))))
                      (LETT |lg2|
                            (PROGN
                             (LETT #24# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #23# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #23#)
                                        (PROGN (LETT |ghr| (CAR #23#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #24# (CONS (QVELT |ghr| 3) #24#))))
                                  (LETT #23# (CDR #23#)) (GO G190) G191
                                  (EXIT (NREVERSE #24#)))))
                      (LETT |vg2| (SPADCALL |lg2| (QREFELT $ 57)))
                      (LETT |ldg|
                            (PROGN
                             (LETT #22# NIL)
                             (SEQ (LETT |g2| NIL) (LETT #21# |lg2|) G190
                                  (COND
                                   ((OR (ATOM #21#)
                                        (PROGN (LETT |g2| (CAR #21#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #22#
                                          (CONS (SPADCALL |g2| (QREFELT $ 100))
                                                #22#))))
                                  (LETT #21# (CDR #21#)) (GO G190) G191
                                  (EXIT (NREVERSE #22#)))))
                      (LETT |d| (SPADCALL (ELT $ 101) |ldg| (QREFELT $ 102)))
                      (LETT |dk|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 28) 1
                                        (QREFELT $ 103))
                              |der|)
                             (QREFELT $ 104)))
                      (LETT |cba|
                            (PROGN
                             (LETT #20# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #19# |cb|) G190
                                  (COND
                                   ((OR (ATOM #19#)
                                        (PROGN (LETT |bv| (CAR #19#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #20#
                                          (CONS (|spadConstant| $ 8) #20#))))
                                  (LETT #19# (CDR #19#)) (GO G190) G191
                                  (EXIT (NREVERSE #20#)))))
                      (SEQ (LETT |j| |d|) G190 (COND ((< |j| 0) (GO G191)))
                           (SEQ (LETT |n1| (LENGTH |cb|)) (LETT |lgj| NIL)
                                (SEQ (LETT |i| 1) (LETT #18# |n|) G190
                                     (COND ((|greater_SI| |i| #18#) (GO G191)))
                                     (SEQ
                                      (LETT |gi|
                                            (SPADCALL |vg2| |i|
                                                      (QREFELT $ 105)))
                                      (LETT |gij| (|spadConstant| $ 8))
                                      (COND
                                       ((EQL (SPADCALL |gi| (QREFELT $ 100))
                                             |j|)
                                        (SEQ
                                         (LETT |gij|
                                               (SPADCALL |gi| (QREFELT $ 106)))
                                         (EXIT
                                          (SPADCALL |vg2| |i|
                                                    (SPADCALL |gi|
                                                              (QREFELT $ 107))
                                                    (QREFELT $ 108))))))
                                      (EXIT (LETT |lgj| (CONS |gij| |lgj|))))
                                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |lgj| (NREVERSE |lgj|)) (LETT |lgj1| NIL)
                                (SEQ (LETT |aa| NIL) (LETT #17# |cba|)
                                     (LETT |bv| NIL) (LETT #16# |cb|) G190
                                     (COND
                                      ((OR (ATOM #16#)
                                           (PROGN (LETT |bv| (CAR #16#)) NIL)
                                           (ATOM #17#)
                                           (PROGN (LETT |aa| (CAR #17#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |ff|
                                            (SPADCALL
                                             (SPADCALL |bv| |lgj|
                                                       (QREFELT $ 110))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (+ |j| 1)
                                                         (QREFELT $ 111))
                                               |dk| (QREFELT $ 112))
                                              |aa| (QREFELT $ 112))
                                             (QREFELT $ 113)))
                                      (EXIT (LETT |lgj1| (CONS |ff| |lgj1|))))
                                     (LETT #16#
                                           (PROG1 (CDR #16#)
                                             (LETT #17# (CDR #17#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |lgj1| (NREVERSE |lgj1|))
                                (LETT |b2| (SPADCALL (CONS |dk| |lgj1|) |ext|))
                                (LETT |n1p| (+ |n1| 1))
                                (LETT |cb0|
                                      (PROGN
                                       (LETT #15# NIL)
                                       (SEQ (LETT |be| NIL) (LETT #14# |b2|)
                                            G190
                                            (COND
                                             ((OR (ATOM #14#)
                                                  (PROGN
                                                   (LETT |be| (CAR #14#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #15#
                                                    (CONS
                                                     (SPADCALL (QCDR |be|)
                                                               (SPADCALL 2
                                                                         |n1p|
                                                                         (QREFELT
                                                                          $
                                                                          32))
                                                               (QREFELT $ 114))
                                                     #15#))))
                                            (LETT #14# (CDR #14#)) (GO G190)
                                            G191 (EXIT (NREVERSE #15#)))))
                                (LETT |ncb|
                                      (PROGN
                                       (LETT #13# NIL)
                                       (SEQ (LETT |bv| NIL) (LETT #12# |cb0|)
                                            G190
                                            (COND
                                             ((OR (ATOM #12#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #12#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #13#
                                                    (CONS
                                                     (SPADCALL |bv| |cb|
                                                               (QREFELT $ 116))
                                                     #13#))))
                                            (LETT #12# (CDR #12#)) (GO G190)
                                            G191 (EXIT (NREVERSE #13#)))))
                                (LETT |cba|
                                      (PROGN
                                       (LETT #11# NIL)
                                       (SEQ (LETT |be| NIL) (LETT #10# |b2|)
                                            G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |be| (CAR #10#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #11#
                                                    (CONS (QCAR |be|) #11#))))
                                            (LETT #10# (CDR #10#)) (GO G190)
                                            G191 (EXIT (NREVERSE #11#)))))
                                (LETT |nlba|
                                      (PROGN
                                       (LETT #9# NIL)
                                       (SEQ (LETT |bv| NIL) (LETT #8# |cb0|)
                                            (LETT |be| NIL) (LETT #7# |b2|)
                                            G190
                                            (COND
                                             ((OR (ATOM #7#)
                                                  (PROGN
                                                   (LETT |be| (CAR #7#))
                                                   NIL)
                                                  (ATOM #8#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |bv| |lba|
                                                                 (QREFELT $
                                                                          117))
                                                       (SPADCALL
                                                        (SPADCALL (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT $
                                                                           103))
                                                        (QREFELT $ 27))
                                                       (QREFELT $ 72))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL (QCDR |be|)
                                                                   1
                                                                   (QREFELT $
                                                                            118))
                                                         (SPADCALL (+ |j| 1)
                                                                   (QREFELT $
                                                                            111))
                                                         (QREFELT $ 119))
                                                        (+ |j| 1)
                                                        (QREFELT $ 103))
                                                       (QREFELT $ 27))
                                                      (QREFELT $ 72))
                                                     #9#))))
                                            (LETT #7#
                                                  (PROG1 (CDR #7#)
                                                    (LETT #8# (CDR #8#))))
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#)))))
                                (LETT |cb| |ncb|) (EXIT (LETT |lba| |nlba|)))
                           (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                      (LETT |nlba|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |ba| NIL) (LETT #5# |lba|)
                                  (LETT |bv| NIL) (LETT #4# |cb|) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |bv| (CAR #4#)) NIL)
                                        (ATOM #5#)
                                        (PROGN (LETT |ba| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |ba|
                                                     (SPADCALL |bv| |a1l|
                                                               (QREFELT $ 117))
                                                     (QREFELT $ 120))
                                           #6#))))
                                  (LETT #4#
                                        (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                                  (GO G190) G191 (EXIT (NREVERSE #6#)))))
                      (EXIT
                       (PROGN
                        (LETT #3# NIL)
                        (SEQ (LETT |ba| NIL) (LETT #2# |nlba|) (LETT |bv| NIL)
                             (LETT #1# |cb|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |bv| (CAR #1#)) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |ba| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #3# (CONS (CONS |ba| |bv|) #3#))))
                             (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                             (GO G190) G191 (EXIT (NREVERSE #3#))))))))))) 

(SDEFUN |INTPAR1;expextint;MMMLL;5|
        ((|der| |Mapping| UP UP)
         (|rde| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|Integer|) (|List| F))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G875 NIL) (|bv| NIL) (#2=#:G876 NIL) (|bar| NIL)
          (#3=#:G874 NIL) (|lbar| (|List| (|Fraction| UP))) (#4=#:G872 NIL)
          (#5=#:G873 NIL) (|ba| NIL) (#6=#:G871 NIL) (|j| #7=(|Integer|))
          (|lba| (|List| (|LaurentPolynomial| F UP)))
          (|cb| (|List| (|Vector| F)))
          (|nlba| (|List| #8=(|LaurentPolynomial| F UP))) (#9=#:G870 NIL)
          (|be| NIL) (#10=#:G869 NIL) (|ncb| (|List| (|Vector| F)))
          (#11=#:G868 NIL) (#12=#:G867 NIL) (#13=#:G850 NIL)
          (|b2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#14=#:G866 NIL) (|lgj| (|List| F))
          (#15=#:G849 NIL) (|gij| (F)) (|last_iter| (|Boolean|))
          (|gi| (|LaurentPolynomial| F UP)) (#16=#:G865 NIL) (|i| NIL)
          (|n1| (|NonNegativeInteger|)) (|cba| (|List| F)) (#17=#:G864 NIL)
          (#18=#:G863 NIL) (|d| #7#) (|ldg| (|List| (|Integer|)))
          (#19=#:G862 NIL) (|g2| NIL) (#20=#:G861 NIL)
          (|vg2| (|Vector| (|LaurentPolynomial| F UP))) (|lg2| (|List| #8#))
          (#21=#:G860 NIL) (|ghr| NIL) (#22=#:G859 NIL) (#23=#:G858 NIL)
          (#24=#:G857 NIL) (|a1l| (|List| #25=(|Fraction| UP)))
          (#26=#:G856 NIL) (#27=#:G855 NIL) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| UP)) (|m1| (|Matrix| (|Fraction| UP)))
          (|lg1| (|List| #28=(|Fraction| UP))) (#29=#:G854 NIL)
          (#30=#:G853 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #25#) (|:| |logpart| #28#)
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#31=#:G852 NIL) (|g| NIL) (#32=#:G851 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |lg|) NIL)
                 ('T
                  (SEQ
                   (LETT |lghr|
                         (PROGN
                          (LETT #32# NIL)
                          (SEQ (LETT |g| NIL) (LETT #31# |lg|) G190
                               (COND
                                ((OR (ATOM #31#)
                                     (PROGN (LETT |g| (CAR #31#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #32#
                                       (CONS
                                        (SPADCALL |g| |der| (QREFELT $ 48))
                                        #32#))))
                               (LETT #31# (CDR #31#)) (GO G190) G191
                               (EXIT (NREVERSE #32#)))))
                   (LETT |lg1|
                         (PROGN
                          (LETT #30# NIL)
                          (SEQ (LETT |ghr| NIL) (LETT #29# |lghr|) G190
                               (COND
                                ((OR (ATOM #29#)
                                     (PROGN (LETT |ghr| (CAR #29#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (LETT #30# (CONS (QVELT |ghr| 1) #30#))))
                               (LETT #29# (CDR #29#)) (GO G190) G191
                               (EXIT (NREVERSE #30#)))))
                   (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)))
                   (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)))
                   (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)))
                   (LETT |cb| (SPADCALL |rs2| |csolve|))
                   (LETT |a1l|
                         (PROGN
                          (LETT #27# NIL)
                          (SEQ (LETT |ghr| NIL) (LETT #26# |lghr|) G190
                               (COND
                                ((OR (ATOM #26#)
                                     (PROGN (LETT |ghr| (CAR #26#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (LETT #27# (CONS (QVELT |ghr| 0) #27#))))
                               (LETT #26# (CDR #26#)) (GO G190) G191
                               (EXIT (NREVERSE #27#)))))
                   (LETT |lba|
                         (PROGN
                          (LETT #24# NIL)
                          (SEQ (LETT |bv| NIL) (LETT #23# |cb|) G190
                               (COND
                                ((OR (ATOM #23#)
                                     (PROGN (LETT |bv| (CAR #23#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #24#
                                       (CONS (|spadConstant| $ 127) #24#))))
                               (LETT #23# (CDR #23#)) (GO G190) G191
                               (EXIT (NREVERSE #24#)))))
                   (LETT |lg2|
                         (PROGN
                          (LETT #22# NIL)
                          (SEQ (LETT |ghr| NIL) (LETT #21# |lghr|) G190
                               (COND
                                ((OR (ATOM #21#)
                                     (PROGN (LETT |ghr| (CAR #21#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #22#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QVELT |ghr| 3)
                                                   (QREFELT $ 96))
                                         (|INTPAR1;RF_to_GP| (QVELT |ghr| 2) $)
                                         (QREFELT $ 128))
                                        #22#))))
                               (LETT #21# (CDR #21#)) (GO G190) G191
                               (EXIT (NREVERSE #22#)))))
                   (LETT |vg2| (SPADCALL |lg2| (QREFELT $ 131)))
                   (LETT |ldg|
                         (PROGN
                          (LETT #20# NIL)
                          (SEQ (LETT |g2| NIL) (LETT #19# |lg2|) G190
                               (COND
                                ((OR (ATOM #19#)
                                     (PROGN (LETT |g2| (CAR #19#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #20#
                                       (CONS (SPADCALL |g2| (QREFELT $ 132))
                                             #20#))))
                               (LETT #19# (CDR #19#)) (GO G190) G191
                               (EXIT (NREVERSE #20#)))))
                   (LETT |d| (SPADCALL (ELT $ 133) |ldg| (QREFELT $ 136)))
                   (LETT |cba|
                         (PROGN
                          (LETT #18# NIL)
                          (SEQ (LETT |bv| NIL) (LETT #17# |cb|) G190
                               (COND
                                ((OR (ATOM #17#)
                                     (PROGN (LETT |bv| (CAR #17#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #18# (CONS (|spadConstant| $ 8) #18#))))
                               (LETT #17# (CDR #17#)) (GO G190) G191
                               (EXIT (NREVERSE #18#)))))
                   (LETT |j| |d|)
                   (SEQ
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ (LETT |last_iter| 'T) (LETT |n1| (LENGTH |cb|))
                               (LETT |lgj| NIL)
                               (SEQ (LETT |i| 1) (LETT #16# (QVSIZE |vg2|))
                                    G190
                                    (COND ((|greater_SI| |i| #16#) (GO G191)))
                                    (SEQ
                                     (LETT |gi|
                                           (SPADCALL |vg2| |i|
                                                     (QREFELT $ 137)))
                                     (LETT |gij| (|spadConstant| $ 8))
                                     (COND
                                      ((SPADCALL |gi| (|spadConstant| $ 127)
                                                 (QREFELT $ 138))
                                       (SEQ (LETT |last_iter| NIL)
                                            (EXIT
                                             (COND
                                              ((EQL
                                                (SPADCALL |gi| (QREFELT $ 132))
                                                |j|)
                                               (SEQ
                                                (LETT |gij|
                                                      (SPADCALL |gi|
                                                                (QREFELT $
                                                                         139)))
                                                (EXIT
                                                 (SPADCALL |vg2| |i|
                                                           (SPADCALL |gi|
                                                                     (QREFELT $
                                                                              140))
                                                           (QREFELT $
                                                                    141))))))))))
                                     (EXIT (LETT |lgj| (CONS |gij| |lgj|))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (COND
                                 (|last_iter|
                                  (PROGN
                                   (LETT #15# |$NoValue|)
                                   (GO #33=#:G842)))
                                 ('T
                                  (SEQ (LETT |lgj| (NREVERSE |lgj|))
                                       (LETT |lgj1| NIL)
                                       (SEQ (LETT |bv| NIL) (LETT #14# |cb|)
                                            G190
                                            (COND
                                             ((OR (ATOM #14#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #14#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |ff|
                                                   (SPADCALL |bv| |lgj|
                                                             (QREFELT $ 110)))
                                             (EXIT
                                              (LETT |lgj1|
                                                    (CONS |ff| |lgj1|))))
                                            (LETT #14# (CDR #14#)) (GO G190)
                                            G191 (EXIT NIL))
                                       (LETT |lgj1| (NREVERSE |lgj1|))
                                       (LETT |b2| (SPADCALL |j| |lgj1| |rde|))
                                       (EXIT
                                        (COND
                                         ((NULL |b2|)
                                          (PROGN
                                           (LETT #13# NIL)
                                           (GO #34=#:G848)))
                                         ('T
                                          (SEQ
                                           (LETT |ncb|
                                                 (PROGN
                                                  (LETT #12# NIL)
                                                  (SEQ (LETT |be| NIL)
                                                       (LETT #11# |b2|) G190
                                                       (COND
                                                        ((OR (ATOM #11#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #11#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #12#
                                                               (CONS
                                                                (SPADCALL
                                                                 (QCDR |be|)
                                                                 |cb|
                                                                 (QREFELT $
                                                                          116))
                                                                #12#))))
                                                       (LETT #11# (CDR #11#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #12#)))))
                                           (LETT |nlba|
                                                 (PROGN
                                                  (LETT #10# NIL)
                                                  (SEQ (LETT |be| NIL)
                                                       (LETT #9# |b2|) G190
                                                       (COND
                                                        ((OR (ATOM #9#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #9#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #10#
                                                               (CONS
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QCDR |be|)
                                                                  |lba|
                                                                  (QREFELT $
                                                                           142))
                                                                 (SPADCALL
                                                                  (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT $
                                                                           143))
                                                                 (QREFELT $
                                                                          128))
                                                                #10#))))
                                                       (LETT #9# (CDR #9#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #10#)))))
                                           (LETT |cb| |ncb|)
                                           (LETT |lba| |nlba|)
                                           (EXIT (LETT |j| (- |j| 1))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))
                    #33# (EXIT #15#))
                   (LETT |lbar|
                         (PROGN
                          (LETT #6# NIL)
                          (SEQ (LETT |ba| NIL) (LETT #5# |lba|) (LETT |bv| NIL)
                               (LETT #4# |cb|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |bv| (CAR #4#)) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |ba| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |ba| (QREFELT $ 144))
                                         (SPADCALL |bv| |a1l| (QREFELT $ 117))
                                         (QREFELT $ 120))
                                        #6#))))
                               (LETT #4#
                                     (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                               (GO G190) G191 (EXIT (NREVERSE #6#)))))
                   (EXIT
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |bar| NIL) (LETT #2# |lbar|) (LETT |bv| NIL)
                          (LETT #1# |cb|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |bv| (CAR #1#)) NIL)
                                (ATOM #2#) (PROGN (LETT |bar| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #3# (CONS (CONS |bar| |bv|) #3#))))
                          (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT (NREVERSE #3#)))))))))
          #34# (EXIT #13#)))) 

(SDEFUN |INTPAR1;diffextint1|
        ((|trim| |Mapping| UP (|Fraction| UP))
         (|ext| |Mapping|
          #1=(|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| UP))
         (|csolve| |Mapping| #2=(|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#3=#:G892 NIL) (|re| NIL) (#4=#:G891 NIL) (|res1| #1#)
          (|lup1| (|List| UP)) (#5=#:G890 NIL) (|bv| NIL) (#6=#:G889 NIL)
          (|cb| #2#) (|rs2| (|Matrix| F)) (|rs1| (|Matrix| UP))
          (|m1| (|Matrix| (|Fraction| UP))) (|lg1| (|List| (|Fraction| UP)))
          (#7=#:G887 NIL) (|g| NIL) (#8=#:G888 NIL) (|up| NIL) (#9=#:G886 NIL)
          (|lup| (|List| UP)) (#10=#:G885 NIL) (#11=#:G884 NIL))
         (SEQ
          (LETT |lup|
                (PROGN
                 (LETT #11# NIL)
                 (SEQ (LETT |g| NIL) (LETT #10# |lg|) G190
                      (COND
                       ((OR (ATOM #10#) (PROGN (LETT |g| (CAR #10#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #11# (CONS (SPADCALL |g| |trim|) #11#))))
                      (LETT #10# (CDR #10#)) (GO G190) G191
                      (EXIT (NREVERSE #11#)))))
          (LETT |lg1|
                (PROGN
                 (LETT #9# NIL)
                 (SEQ (LETT |up| NIL) (LETT #8# |lup|) (LETT |g| NIL)
                      (LETT #7# |lg|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#)) NIL)
                            (ATOM #8#) (PROGN (LETT |up| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL |g| (SPADCALL |up| (QREFELT $ 27))
                                         (QREFELT $ 120))
                               #9#))))
                      (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#))))
                      (GO G190) G191 (EXIT (NREVERSE #9#)))))
          (LETT |m1| (SPADCALL (LIST |lg1|) (QREFELT $ 51)))
          (LETT |rs1| (SPADCALL |m1| (QREFELT $ 52)))
          (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 19)))
          (LETT |cb| (SPADCALL |rs2| |csolve|))
          (LETT |lup1|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |bv| NIL) (LETT #5# |cb|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |bv| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |bv| |lup| (QREFELT $ 147))
                                    #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |res1| (SPADCALL |lup1| |ext|))
          (EXIT
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |re| NIL) (LETT #3# |res1|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |re| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (CONS (QCAR |re|)
                                (SPADCALL (QCDR |re|) |cb| (QREFELT $ 116)))
                          #4#))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |INTPAR1;lin_part| ((|f| |Fraction| UP) ($ UP))
        (SPROG ((|p| (UP)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 84))
                                (SPADCALL |f| (QREFELT $ 55)) (QREFELT $ 148)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| 1 (QREFELT $ 11)) 1 (QREFELT $ 103))
                  (SPADCALL (SPADCALL |p| 0 (QREFELT $ 11)) (QREFELT $ 12))
                  (QREFELT $ 75)))))) 

(SDEFUN |INTPAR1;diffextint;MMLL;8|
        ((|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| UP))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (|INTPAR1;diffextint1| (CONS #'|INTPAR1;diffextint;MMLL;8!0| $) |ext|
         |csolve| |lg| $)) 

(SDEFUN |INTPAR1;diffextint;MMLL;8!0| ((|x| NIL) ($ NIL))
        (|INTPAR1;lin_part| |x| $)) 

(SDEFUN |INTPAR1;coeff0| ((|f| |Fraction| UP) ($ UP))
        (SPROG ((|p| (UP)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 84))
                                (SPADCALL |f| (QREFELT $ 55)) (QREFELT $ 148)))
                (EXIT
                 (SPADCALL (SPADCALL |p| 0 (QREFELT $ 11)) (QREFELT $ 12)))))) 

(SDEFUN |INTPAR1;unkextint;MMLL;10|
        ((|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| F))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| (|Fraction| UP))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ext1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| UP))))
         (SEQ
          (LETT |ext1| (CONS #'|INTPAR1;unkextint;MMLL;10!0| (VECTOR |ext| $)))
          (EXIT
           (|INTPAR1;diffextint1| (CONS #'|INTPAR1;unkextint;MMLL;10!1| $)
            |ext1| |csolve| |lg| $))))) 

(SDEFUN |INTPAR1;unkextint;MMLL;10!1| ((|x| NIL) ($ NIL))
        (|INTPAR1;coeff0| |x| $)) 

(SDEFUN |INTPAR1;unkextint;MMLL;10!0| ((|lup| NIL) ($$ NIL))
        (PROG ($ |ext|)
          (LETT $ (QREFELT $$ 1))
          (LETT |ext| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|lf| NIL) (#1=#:G907 NIL) (|p| NIL) (#2=#:G906 NIL))
                   (SEQ
                    (LETT |lf|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |p| NIL) (LETT #1# |lup|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |p| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |p| (QREFELT $ 104))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                    (EXIT (SPADCALL |lf| |ext|)))))))) 

(DECLAIM (NOTINLINE |ParametricTranscendentalIntegration;|)) 

(DEFUN |ParametricTranscendentalIntegration| (&REST #1=#:G913)
  (SPROG NIL
         (PROG (#2=#:G914)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricTranscendentalIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ParametricTranscendentalIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParametricTranscendentalIntegration|)))))))))) 

(DEFUN |ParametricTranscendentalIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ParametricTranscendentalIntegration| DV$1 DV$2))
          (LETT $ (GETREFV 153))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|ParametricTranscendentalIntegration| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ParametricTranscendentalIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|NonNegativeInteger|)
              (8 . |coefficient|) (14 . |coerce|) (19 . -) (|List| 40)
              (|Matrix| 7) (25 . |matrix|) (|Matrix| 6) (|Matrix| $)
              (30 . |reducedSystem|) (|Vector| 24) (|List| 6)
              (|LinearCombinationUtilities| 6 7) (35 . |lin_comb|)
              (|Fraction| 30) (41 . |Zero|) (|Fraction| 7) (45 . |coerce|)
              (50 . |One|) (54 . |One|) (|Integer|) (|UniversalSegment| 30)
              (58 . SEGMENT) (64 . |elt|) (|List| 20)
              (|LinearCombinationUtilities| 24
                                            (|SparseUnivariatePolynomial| 24))
              (70 . |lin_comb|) (76 . |elt|) (82 . |setelt!|)
              (|Record| (|:| |logands| 53) (|:| |basis| 34)) (|List| 7)
              (|Mapping| 34 17) (|Record| (|:| |logands| 21) (|:| |basis| 34))
              (|Mapping| 42 21) |INTPAR1;monologextint;LMMR;1|
              (|Record| (|:| |answer| 26) (|:| |logpart| 26)
                        (|:| |specpart| 26) (|:| |polypart| 7))
              (|Mapping| 7 7) (|TranscendentalHermiteIntegration| 6 7)
              (89 . |HermiteIntegrate|) (|List| 53) (|Matrix| 26)
              (95 . |matrix|) (100 . |reducedSystem|) (|List| 26)
              (105 . |lin_comb|) (111 . |denom|) (|Vector| 7) (116 . |vector|)
              (|Record| (|:| |basis| 56) (|:| |transform| 82)) (|GcdBasis| 7)
              (121 . |gcdDecomposition|) (126 . |entries|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 62) (|:| |factor| 7) (|:| |exponent| 10))
              (|List| 63) (|Factored| 7) (131 . |factorList|) (136 . |concat|)
              (142 . |concat|) (148 . |concat|) (|Mapping| 40 40 40)
              (154 . |reduce|) (161 . +) (167 . +) (173 . +) (179 . +)
              (185 . +) (|Mapping| 10 10 10) (|List| 10) (191 . |reduce|)
              (|Boolean|) (198 . >) (|Matrix| 30) (204 . |elt|) (211 . |numer|)
              (|PartialFractionUtilities| 6 7) (216 . |decompose|)
              (222 . |setelt!|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (230 . |divide|) (236 . /) (242 . |retract|) (|Mapping| 65 7)
              (|Mapping| 39 40) |INTPAR1;logextint;MMMMLR;2|
              (|LaurentPolynomial| 6 7) (247 . |coerce|) (|Union| $ '"failed")
              (252 . |exquo|) (258 . |Zero|) (262 . |degree|) (267 . |max|)
              (273 . |reduce|) (279 . |monomial|) (285 . |retract|)
              (290 . |elt|) (296 . |leadingCoefficient|) (301 . |reductum|)
              (306 . |setelt!|) (|Vector| 6) (313 . |lin_comb|)
              (319 . |coerce|) (324 . *) (330 . +) (336 . |elt|) (|List| 109)
              (342 . |lin_comb|) (348 . |lin_comb|) (354 . |elt|) (360 . /)
              (366 . -) (|Record| (|:| |ratpart| 26) (|:| |coeffs| 109))
              (|List| 121) (|Record| (|:| |ratpart| 6) (|:| |coeffs| 109))
              (|Mapping| 149 21) (|Mapping| 115 17)
              |INTPAR1;primextint;MMMLL;4| (372 . |Zero|) (376 . +) (|List| 95)
              (|Vector| 95) (382 . |vector|) (387 . |degree|) (392 . |max|)
              (|Mapping| 30 30 30) (|List| 30) (398 . |reduce|) (404 . |elt|)
              (410 . ~=) (416 . |leadingCoefficient|) (421 . |reductum|)
              (426 . |setelt!|) (433 . |lin_comb|) (439 . |monomial|)
              (445 . |convert|) (|Mapping| 149 30 21)
              |INTPAR1;expextint;MMMLL;5| (450 . |lin_comb|) (456 . |quo|)
              (|List| 123) (|Mapping| 149 40) |INTPAR1;diffextint;MMLL;8|
              |INTPAR1;unkextint;MMLL;10|)
           '#(|unkextint| 462 |primextint| 469 |monologextint| 477 |logextint|
              484 |expextint| 493 |diffextint| 501)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|primextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| (|Fraction| |#2|))
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping| |#2| |#2|)
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|List| |#1|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|expextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| (|Fraction| |#2|))
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping| |#2| |#2|)
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|Integer|) (|List| |#1|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|diffextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#1|)
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|List| |#2|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|unkextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#1|)
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|List| |#1|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|logextint|
                                 ((|Record|
                                   (|:| |logands| (|List| (|Fraction| |#2|)))
                                   (|:| |basis|
                                        (|List|
                                         (|Vector| (|Fraction| (|Integer|))))))
                                  (|Mapping| |#2| |#2|)
                                  (|Mapping| (|Factored| |#2|) |#2|)
                                  (|Mapping|
                                   (|List| (|Vector| (|Fraction| (|Integer|))))
                                   (|Matrix| |#1|))
                                  (|Mapping|
                                   (|Record|
                                    (|:| |logands| (|List| (|Fraction| |#2|)))
                                    (|:| |basis|
                                         (|List|
                                          (|Vector|
                                           (|Fraction| (|Integer|))))))
                                   (|List| |#2|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|monologextint|
                                 ((|Record|
                                   (|:| |logands| (|List| (|Fraction| |#2|)))
                                   (|:| |basis|
                                        (|List|
                                         (|Vector| (|Fraction| (|Integer|))))))
                                  (|List| |#2|)
                                  (|Mapping|
                                   (|List| (|Vector| (|Fraction| (|Integer|))))
                                   (|Matrix| |#1|))
                                  (|Mapping|
                                   (|Record| (|:| |logands| (|List| |#1|))
                                             (|:| |basis|
                                                  (|List|
                                                   (|Vector|
                                                    (|Fraction|
                                                     (|Integer|))))))
                                   (|List| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 152
                                            '(0 6 0 8 0 7 0 9 2 7 6 0 10 11 1 7
                                              0 6 12 2 7 0 0 0 13 1 15 0 14 16
                                              1 7 17 18 19 2 22 6 20 21 23 0 24
                                              0 25 1 26 0 7 27 0 6 0 28 0 7 0
                                              29 2 31 0 30 30 32 2 20 0 0 31 33
                                              2 35 20 20 34 36 2 20 24 0 30 37
                                              3 20 24 0 30 24 38 2 47 45 26 46
                                              48 1 50 0 49 51 1 26 15 18 52 2
                                              22 26 20 53 54 1 26 7 0 55 1 56 0
                                              40 57 1 59 58 56 60 1 56 40 0 61
                                              1 65 64 0 66 2 20 0 0 0 67 2 53 0
                                              0 0 68 2 40 0 0 0 69 3 14 40 70 0
                                              40 71 2 26 0 0 0 72 2 24 0 0 0 73
                                              2 20 0 0 0 74 2 7 0 0 0 75 2 10 0
                                              0 0 76 3 78 10 77 0 10 79 2 30 80
                                              0 0 81 3 82 30 0 30 30 83 1 26 7
                                              0 84 2 85 40 7 40 86 4 15 7 0 30
                                              30 7 87 2 7 88 0 0 89 2 26 0 7 7
                                              90 1 26 7 0 91 1 95 0 7 96 2 95
                                              97 0 0 98 0 26 0 99 1 7 10 0 100
                                              2 10 0 0 0 101 2 78 10 77 0 102 2
                                              7 0 6 10 103 1 7 6 0 104 2 56 7 0
                                              30 105 1 7 6 0 106 1 7 0 0 107 3
                                              56 7 0 30 7 108 2 22 6 109 21 110
                                              1 6 0 30 111 2 6 0 0 0 112 2 6 0
                                              0 0 113 2 109 0 0 31 114 2 22 109
                                              109 115 116 2 22 26 109 53 117 2
                                              109 6 0 30 118 2 6 0 0 0 119 2 26
                                              0 0 0 120 0 95 0 127 2 95 0 0 0
                                              128 1 130 0 129 131 1 95 30 0 132
                                              2 30 0 0 0 133 2 135 30 134 0 136
                                              2 130 95 0 30 137 2 95 80 0 0 138
                                              1 95 6 0 139 1 95 0 0 140 3 130
                                              95 0 30 95 141 2 22 95 109 129
                                              142 2 95 0 6 30 143 1 95 26 0 144
                                              2 22 7 109 40 147 2 7 0 0 0 148 3
                                              0 149 124 125 53 152 4 0 122 46
                                              124 125 53 126 3 0 39 40 41 43 44
                                              5 0 39 46 92 41 93 53 94 4 0 122
                                              46 145 125 53 146 3 0 149 150 125
                                              53 151)))))
           '|lookupComplete|)) 
