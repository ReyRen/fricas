
(SDEFUN |TESTCNT;testsuite;SV;1| ((|s| |String|) ($ |Void|))
        (SEQ (SPADCALL "clear all" (QREFELT $ 19))
             (EXIT (SPADCALL |s| (QREFELT $ 20))))) 

(SDEFUN |TESTCNT;testsuiteNoClear;SV;2| ((|s| |String|) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (QCSIZE |s|) 15 (QREFELT $ 24))
           (SPADCALL
            (SPADCALL "WARNING: string for testsuite should have less than "
                      "15 characters!" (QREFELT $ 25))
            (QREFELT $ 27))))
         (SETELT $ 15 |s|)
         (EXIT
          (SPADCALL (CONS (QREFELT $ 15) (SPADCALL (QREFELT $ 29)))
                    (QREFELT $ 12) (QREFELT $ 31))))) 

(SDEFUN |TESTCNT;testcaseNoClear;SV;3| ((|s| |String|) ($ |Void|))
        (SEQ (SETELT $ 14 |s|)
             (EXIT
              (SPADCALL (CONS (QREFELT $ 14) (VECTOR 0 0 0 0 NIL NIL NIL))
                        (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                        (QREFELT $ 34))))) 

(SDEFUN |TESTCNT;testcase;SV;4| ((|s| |String|) ($ |Void|))
        (SEQ (SPADCALL "clear all" (QREFELT $ 19))
             (EXIT (SPADCALL |s| (QREFELT $ 35))))) 

(SDEFUN |TESTCNT;incPass;V;5| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;chkLibraryError;V;6| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;incLibraryError;SLV;7|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
          (EXIT
           (QSETVELT |cur| 6
                     (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                           (QVELT |cur| 6))))))) 

(SDEFUN |TESTCNT;incXfLibraryError;SLV;8|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (EXIT (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1)))))) 

(SDEFUN |TESTCNT;incXfFail;V;9| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;incFail;SLV;10|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
          (QSETVELT |cur| 6
                    (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                          (QVELT |cur| 6)))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;incXfPass;SLV;11|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 3 (+ (QVELT |cur| 3) 1))
          (QSETVELT |cur| 5
                    (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                          (QVELT |cur| 5)))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;decXfPass;V;12| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
          (QSETVELT |cur| 5 (CDR (QVELT |cur| 5)))
          (EXIT (QSETVELT |cur| 3 (- (QVELT |cur| 3) 1)))))) 

(SDEFUN |TESTCNT;incFatal;SV;13| ((|inp| |String|) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))
          (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
          (EXIT
           (QSETVELT |cur| 4
                     (CONS (CONS (QVELT |cur| 0) |inp|) (QVELT |cur| 4))))))) 

(SDEFUN |TESTCNT;decFatal;V;14| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
          (QSETVELT |cur| 1 (- (QVELT |cur| 1) 1))
          (EXIT (QSETVELT |cur| 4 (CDR (QVELT |cur| 4))))))) 

(SDEFUN |TESTCNT;incXfFatal;SV;15| ((|inp| |String|) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))
          (EXIT (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1)))))) 

(SDEFUN |TESTCNT;decXfFatal;V;16| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                 (QREFELT $ 14) (QREFELT $ 37)))
          (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
          (EXIT (QSETVELT |cur| 2 (- (QVELT |cur| 2) 1)))))) 

(SDEFUN |TESTCNT;addWarning;OfV;17| ((|s| |OutputForm|) ($ |Void|))
        (SPROG ((|idx| (|Integer|)))
               (SEQ
                (LETT |idx|
                      (QVELT
                       (SPADCALL
                        (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 32))
                        (QREFELT $ 14) (QREFELT $ 37))
                       0))
                (EXIT
                 (SETELT $ 13
                         (CONS
                          (SPADCALL
                           (LIST
                            (SPADCALL
                             (SPADCALL "Testsuite: " (QREFELT $ 15)
                                       (QREFELT $ 25))
                             (QREFELT $ 51))
                            (SPADCALL
                             (SPADCALL "Testcase: " (QREFELT $ 14)
                                       (QREFELT $ 25))
                             (QREFELT $ 51))
                            (SPADCALL
                             (SPADCALL "test: " (STRINGIMAGE |idx|)
                                       (QREFELT $ 25))
                             (QREFELT $ 51))
                            |s|)
                           (QREFELT $ 53))
                          (QREFELT $ 13))))))) 

(SDEFUN |TESTCNT;statistics;V;18| (($ |Void|))
        (SPROG
         ((#1=#:G523 NIL) (#2=#:G519 NIL) (#3=#:G515 NIL) (#4=#:G511 NIL)
          (#5=#:G507 NIL) (|stotalTests| #6=(|String|)) (|sfailedTests| #6#)
          (|stotalCases| #6#) (|sfailedCases| #6#)
          (|tsfailedTests| (|Integer|)) (|tstotalTests| (|Integer|))
          (|failedCases| (|Integer|)) (|totalCases| (|Integer|))
          (#7=#:G539 NIL) (|tstcase| NIL) (#8=#:G538 NIL) (|tstsuite| NIL)
          (#9=#:G537 NIL) (|f| NIL) (#10=#:G487 NIL) (#11=#:G536 NIL)
          (#12=#:G535 NIL) (|outstring| (|String|)) (#13=#:G533 NIL) (|o| NIL)
          (#14=#:G534 NIL) (|i| NIL) (#15=#:G532 NIL) (#16=#:G468 NIL)
          (#17=#:G531 NIL) (|xfpassedTests| (|Integer|))
          (|xfailedTests| (|Integer|)) (|failedTests| (|Integer|))
          (|totalTests| (|Integer|)) (|xfpassedCases| (|Integer|))
          (#18=#:G530 NIL) (#19=#:G529 NIL) (#20=#:G528 NIL) (|w| NIL))
         (SEQ
          (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                    (QREFELT $ 27))
          (SPADCALL "General WARNINGS:" (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "* do not use ')clear completely' before having used "
                     "'statistics()'" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL "  It clears the statistics without warning!"
                    (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "* do not forget to pass the arguments of the testXxxx "
                     "functions as Strings!" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "  Otherwise, the test will fail and statistics() will "
                     "not notice!" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "* testLibraryError does not prevent FriCAS from "
                     "aborting the current block." (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "  Thus, if a block contains other test functions, they "
                     "will not be executed" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL "  and statistics() will not notice!" (QREFELT $ 27))
          (COND
           ((SPADCALL (LENGTH (QREFELT $ 13)) 0 (QREFELT $ 24))
            (SEQ
             (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                       (QREFELT $ 27))
             (SPADCALL "WARNINGS:" (QREFELT $ 27))
             (EXIT
              (SEQ (LETT |w| NIL) (LETT #20# (REVERSE (QREFELT $ 13))) G190
                   (COND
                    ((OR (ATOM #20#) (PROGN (LETT |w| (CAR #20#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |w| (QREFELT $ 56))))
                   (LETT #20# (CDR #20#)) (GO G190) G191 (EXIT NIL))))))
          (SPADCALL "" (QREFELT $ 57)) (LETT |totalTests| 0)
          (LETT |failedTests| 0) (LETT |xfailedTests| 0)
          (LETT |xfpassedTests| 0)
          (SEQ (LETT |tstsuite| NIL)
               (LETT #19# (REVERSE (SPADCALL (QREFELT $ 12) (QREFELT $ 59))))
               G190
               (COND
                ((OR (ATOM #19#) (PROGN (LETT |tstsuite| (CAR #19#)) NIL))
                 (GO G191)))
               (SEQ (LETT |failedCases| 0) (LETT |xfpassedCases| 0)
                    (LETT |totalCases| 0)
                    (SEQ (LETT |tstcase| NIL)
                         (LETT #18#
                               (REVERSE
                                (SPADCALL (QCDR |tstsuite|) (QREFELT $ 61))))
                         G190
                         (COND
                          ((OR (ATOM #18#)
                               (PROGN (LETT |tstcase| (CAR #18#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |totalCases| (+ |totalCases| 1))
                              (COND
                               ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                          (QREFELT $ 63))
                                (LETT |failedCases| (+ |failedCases| 1))))
                              (COND
                               ((SPADCALL (QVELT (QCDR |tstcase|) 3) 0
                                          (QREFELT $ 63))
                                (LETT |xfpassedCases| (+ |xfpassedCases| 1))))
                              (LETT |totalTests|
                                    (+ |totalTests|
                                       (QVELT (QCDR |tstcase|) 0)))
                              (LETT |failedTests|
                                    (+ |failedTests|
                                       (QVELT (QCDR |tstcase|) 1)))
                              (LETT |xfailedTests|
                                    (+ |xfailedTests|
                                       (QVELT (QCDR |tstcase|) 2)))
                              (EXIT
                               (LETT |xfpassedTests|
                                     (+ |xfpassedTests|
                                        (QVELT (QCDR |tstcase|) 3)))))
                         (LETT #18# (CDR #18#)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL
                     (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                     (QREFELT $ 27))
                    (SPADCALL
                     (SPADCALL "Testsuite: " (QCAR |tstsuite|) (QREFELT $ 25))
                     (QREFELT $ 27))
                    (SPADCALL
                     (SPADCALL "  failed (total): "
                               (SPADCALL (STRINGIMAGE |failedCases|)
                                         (SPADCALL " ("
                                                   (SPADCALL
                                                    (STRINGIMAGE |totalCases|)
                                                    ")" (QREFELT $ 25))
                                                   (QREFELT $ 25))
                                         (QREFELT $ 25))
                               (QREFELT $ 25))
                     (QREFELT $ 27))
                    (COND
                     ((SPADCALL |failedCases| 0 (QREFELT $ 63))
                      (SEQ (SPADCALL "" (QREFELT $ 57))
                           (SPADCALL "  failed testcases were:" (QREFELT $ 27))
                           (EXIT
                            (SEQ (LETT |tstcase| NIL)
                                 (LETT #17#
                                       (REVERSE
                                        (SPADCALL (QCDR |tstsuite|)
                                                  (QREFELT $ 61))))
                                 G190
                                 (COND
                                  ((OR (ATOM #17#)
                                       (PROGN (LETT |tstcase| (CAR #17#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                               (QREFELT $ 63))
                                     (SEQ
                                      (SPADCALL
                                       (SPADCALL "  "
                                                 (|make_full_CVEC|
                                                  (PROG1
                                                      (LETT #16#
                                                            (- (QREFELT $ 6)
                                                               2))
                                                    (|check_subtype2|
                                                     (>= #16# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #16#))
                                                  (|STR_to_CHAR| "-"))
                                                 (QREFELT $ 25))
                                       (QREFELT $ 27))
                                      (SPADCALL
                                       (SPADCALL "  Testcase: "
                                                 (QCAR |tstcase|)
                                                 (QREFELT $ 25))
                                       (QREFELT $ 27))
                                      (SPADCALL
                                       (SPADCALL "    failed (total): "
                                                 (SPADCALL
                                                  (STRINGIMAGE
                                                   (QVELT (QCDR |tstcase|) 1))
                                                  (SPADCALL " ("
                                                            (SPADCALL
                                                             (STRINGIMAGE
                                                              (QVELT
                                                               (QCDR |tstcase|)
                                                               0))
                                                             ")"
                                                             (QREFELT $ 25))
                                                            (QREFELT $ 25))
                                                  (QREFELT $ 25))
                                                 (QREFELT $ 25))
                                       (QREFELT $ 27))
                                      (COND
                                       ((NULL
                                         (NULL (QVELT (QCDR |tstcase|) 6)))
                                        (SEQ (SPADCALL "" (QREFELT $ 57))
                                             (SPADCALL "    failed tests were:"
                                                       (QREFELT $ 27))
                                             (EXIT
                                              (SEQ (LETT |f| NIL)
                                                   (LETT #15#
                                                         (REVERSE
                                                          (QVELT
                                                           (QCDR |tstcase|)
                                                           6)))
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #15#)
                                                         (PROGN
                                                          (LETT |f| (CAR #15#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (SPADCALL ""
                                                              (QREFELT $ 57))
                                                    (SPADCALL
                                                     (SPADCALL "      "
                                                               (SPADCALL
                                                                (STRINGIMAGE
                                                                 (QVELT |f| 0))
                                                                (SPADCALL ": "
                                                                          (QVELT
                                                                           |f|
                                                                           1)
                                                                          (QREFELT
                                                                           $
                                                                           25))
                                                                (QREFELT $ 25))
                                                               (QREFELT $ 25))
                                                     (QREFELT $ 27))
                                                    (EXIT
                                                     (SEQ (LETT |i| 1)
                                                          (LETT #14#
                                                                (LENGTH
                                                                 (QVELT |f|
                                                                        2)))
                                                          (LETT |o| NIL)
                                                          (LETT #13#
                                                                (QVELT |f| 2))
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #13#)
                                                                (PROGN
                                                                 (LETT |o|
                                                                       (CAR
                                                                        #13#))
                                                                 NIL)
                                                                (|greater_SI|
                                                                 |i| #14#))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |outstring|
                                                                 (SPADCALL
                                                                  "      Output"
                                                                  (SPADCALL
                                                                   (STRINGIMAGE
                                                                    |i|)
                                                                   ": "
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           25)))
                                                           (EXIT
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |outstring|
                                                               (QREFELT $ 51))
                                                              |o|
                                                              (QREFELT $ 64))
                                                             (QREFELT $ 56))))
                                                          (LETT #13#
                                                                (PROG1
                                                                    (CDR #13#)
                                                                  (LETT |i|
                                                                        (|inc_SI|
                                                                         |i|))))
                                                          (GO G190) G191
                                                          (EXIT NIL))))
                                                   (LETT #15# (CDR #15#))
                                                   (GO G190) G191
                                                   (EXIT NIL))))))
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (NULL (QVELT (QCDR |tstcase|) 4)))
                                         (SEQ (SPADCALL "" (QREFELT $ 57))
                                              (SPADCALL "  fatal tests were:"
                                                        (QREFELT $ 27))
                                              (EXIT
                                               (SEQ (LETT |f| NIL)
                                                    (LETT #12#
                                                          (REVERSE
                                                           (QVELT
                                                            (QCDR |tstcase|)
                                                            4)))
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #12#)
                                                          (PROGN
                                                           (LETT |f|
                                                                 (CAR #12#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (SPADCALL ""
                                                               (QREFELT $ 57))
                                                     (EXIT
                                                      (SPADCALL
                                                       (SPADCALL "      "
                                                                 (SPADCALL
                                                                  (STRINGIMAGE
                                                                   (QCAR |f|))
                                                                  (SPADCALL
                                                                   ": "
                                                                   (QCDR |f|)
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           25))
                                                                 (QREFELT $
                                                                          25))
                                                       (QREFELT $ 27))))
                                                    (LETT #12# (CDR #12#))
                                                    (GO G190) G191
                                                    (EXIT NIL))))))))))))
                                 (LETT #17# (CDR #17#)) (GO G190) G191
                                 (EXIT NIL))))))
                    (EXIT
                     (COND
                      ((SPADCALL |xfpassedCases| 0 (QREFELT $ 63))
                       (SEQ (SPADCALL "" (QREFELT $ 57))
                            (SPADCALL
                             "  testcases with unexpected passed tests were:"
                             (QREFELT $ 27))
                            (EXIT
                             (SEQ (LETT |tstcase| NIL)
                                  (LETT #11#
                                        (REVERSE
                                         (SPADCALL (QCDR |tstsuite|)
                                                   (QREFELT $ 61))))
                                  G190
                                  (COND
                                   ((OR (ATOM #11#)
                                        (PROGN
                                         (LETT |tstcase| (CAR #11#))
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QVELT (QCDR |tstcase|) 3) 0
                                                (QREFELT $ 63))
                                      (SEQ
                                       (SPADCALL
                                        (SPADCALL "  "
                                                  (|make_full_CVEC|
                                                   (PROG1
                                                       (LETT #10#
                                                             (- (QREFELT $ 6)
                                                                2))
                                                     (|check_subtype2|
                                                      (>= #10# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #10#))
                                                   (|STR_to_CHAR| "-"))
                                                  (QREFELT $ 25))
                                        (QREFELT $ 27))
                                       (SPADCALL
                                        (SPADCALL "  Testcase: "
                                                  (QCAR |tstcase|)
                                                  (QREFELT $ 25))
                                        (QREFELT $ 27))
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (NULL (QVELT (QCDR |tstcase|) 5)))
                                          (SEQ (SPADCALL "" (QREFELT $ 57))
                                               (SPADCALL
                                                "  unexpected passed tests were:"
                                                (QREFELT $ 27))
                                               (EXIT
                                                (SEQ (LETT |f| NIL)
                                                     (LETT #9#
                                                           (REVERSE
                                                            (QVELT
                                                             (QCDR |tstcase|)
                                                             5)))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #9#)
                                                           (PROGN
                                                            (LETT |f|
                                                                  (CAR #9#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (SPADCALL ""
                                                                (QREFELT $ 57))
                                                      (EXIT
                                                       (SPADCALL
                                                        (SPADCALL "      "
                                                                  (SPADCALL
                                                                   (STRINGIMAGE
                                                                    (QVELT |f|
                                                                           0))
                                                                   (SPADCALL
                                                                    ": "
                                                                    (QVELT |f|
                                                                           1)
                                                                    (QREFELT $
                                                                             25))
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           25))
                                                        (QREFELT $ 27))))
                                                     (LETT #9# (CDR #9#))
                                                     (GO G190) G191
                                                     (EXIT NIL))))))))))))
                                  (LETT #11# (CDR #11#)) (GO G190) G191
                                  (EXIT NIL))))))))
               (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
          (SPADCALL "" (QREFELT $ 57))
          (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                    (QREFELT $ 27))
          (SPADCALL
           "testsuite | testcases: failed (total) | tests: failed (total)"
           (QREFELT $ 27))
          (SEQ (LETT |tstsuite| NIL)
               (LETT #8# (REVERSE (SPADCALL (QREFELT $ 12) (QREFELT $ 59))))
               G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |tstsuite| (CAR #8#)) NIL))
                 (GO G191)))
               (SEQ (LETT |failedCases| 0) (LETT |totalCases| 0)
                    (LETT |tsfailedTests| 0) (LETT |tstotalTests| 0)
                    (SEQ (LETT |tstcase| NIL)
                         (LETT #7#
                               (REVERSE
                                (SPADCALL (QCDR |tstsuite|) (QREFELT $ 61))))
                         G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |tstcase| (CAR #7#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |totalCases| (+ |totalCases| 1))
                              (COND
                               ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                          (QREFELT $ 63))
                                (LETT |failedCases| (+ |failedCases| 1))))
                              (LETT |tstotalTests|
                                    (+ |tstotalTests|
                                       (QVELT (QCDR |tstcase|) 0)))
                              (EXIT
                               (LETT |tsfailedTests|
                                     (+ |tsfailedTests|
                                        (QVELT (QCDR |tstcase|) 1)))))
                         (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                    (LETT |sfailedCases| (STRINGIMAGE |failedCases|))
                    (LETT |stotalCases| (STRINGIMAGE |totalCases|))
                    (LETT |sfailedTests| (STRINGIMAGE |tsfailedTests|))
                    (LETT |stotalTests| (STRINGIMAGE |tstotalTests|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QCAR |tstsuite|)
                                (SPADCALL
                                 (|make_full_CVEC|
                                  (PROG1
                                      (LETT #5#
                                            (MAX
                                             (- 24 (QCSIZE (QCAR |tstsuite|)))
                                             0))
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  (|STR_to_CHAR| " "))
                                 (SPADCALL
                                  (|make_full_CVEC|
                                   (PROG1
                                       (LETT #4#
                                             (MAX (- 5 (QCSIZE |sfailedCases|))
                                                  0))
                                     (|check_subtype2| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #4#))
                                   (|STR_to_CHAR| " "))
                                  (SPADCALL |sfailedCases|
                                            (SPADCALL
                                             (|make_full_CVEC|
                                              (PROG1
                                                  (LETT #3#
                                                        (MAX
                                                         (- 6
                                                            (QCSIZE
                                                             |stotalCases|))
                                                         0))
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (|STR_to_CHAR| " "))
                                             (SPADCALL "("
                                                       (SPADCALL |stotalCases|
                                                                 (SPADCALL ")"
                                                                           (SPADCALL
                                                                            (|make_full_CVEC|
                                                                             (PROG1
                                                                                 (LETT
                                                                                  #2#
                                                                                  (MAX
                                                                                   (-
                                                                                    16
                                                                                    (QCSIZE
                                                                                     |sfailedTests|))
                                                                                   0))
                                                                               (|check_subtype2|
                                                                                (>=
                                                                                 #2#
                                                                                 0)
                                                                                '(|NonNegativeInteger|)
                                                                                '(|Integer|)
                                                                                #2#))
                                                                             (|STR_to_CHAR|
                                                                              " "))
                                                                            (SPADCALL
                                                                             |sfailedTests|
                                                                             (SPADCALL
                                                                              (|make_full_CVEC|
                                                                               (PROG1
                                                                                   (LETT
                                                                                    #1#
                                                                                    (MAX
                                                                                     (-
                                                                                      6
                                                                                      (QCSIZE
                                                                                       |stotalTests|))
                                                                                     0))
                                                                                 (|check_subtype2|
                                                                                  (>=
                                                                                   #1#
                                                                                   0)
                                                                                  '(|NonNegativeInteger|)
                                                                                  '(|Integer|)
                                                                                  #1#))
                                                                               (|STR_to_CHAR|
                                                                                " "))
                                                                              (SPADCALL
                                                                               "("
                                                                               (SPADCALL
                                                                                |stotalTests|
                                                                                ")"
                                                                                (QREFELT
                                                                                 $
                                                                                 25))
                                                                               (QREFELT
                                                                                $
                                                                                25))
                                                                              (QREFELT
                                                                               $
                                                                               25))
                                                                             (QREFELT
                                                                              $
                                                                              25))
                                                                            (QREFELT
                                                                             $
                                                                             25))
                                                                           (QREFELT
                                                                            $
                                                                            25))
                                                                 (QREFELT $
                                                                          25))
                                                       (QREFELT $ 25))
                                             (QREFELT $ 25))
                                            (QREFELT $ 25))
                                  (QREFELT $ 25))
                                 (QREFELT $ 25))
                                (QREFELT $ 25))
                      (QREFELT $ 27))))
               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
          (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                    (QREFELT $ 27))
          (SPADCALL "File summary." (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "unexpected failures: " (STRINGIMAGE |failedTests|)
                     (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "expected failures: " (STRINGIMAGE |xfailedTests|)
                     (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "unexpected passes: " (STRINGIMAGE |xfpassedTests|)
                     (QREFELT $ 25))
           (QREFELT $ 27))
          (EXIT
           (SPADCALL
            (SPADCALL "total tests: " (STRINGIMAGE |totalTests|)
                      (QREFELT $ 25))
            (QREFELT $ 27)))))) 

(DECLAIM (NOTINLINE |UnittestCount;|)) 

(DEFUN |UnittestCount| ()
  (SPROG NIL
         (PROG (#1=#:G541)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|UnittestCount|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|UnittestCount|
                             (LIST (CONS NIL (CONS 1 (|UnittestCount;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|UnittestCount|)))))))))) 

(DEFUN |UnittestCount;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|UnittestCount|))
          (LETT $ (GETREFV 66))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|UnittestCount| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 77)
          (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
          (QSETREFV $ 13 NIL)
          (QSETREFV $ 14 #1="")
          (QSETREFV $ 15 #1#)
          $))) 

(MAKEPROP '|UnittestCount| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|maxWidth|
              (|Record| (|:| |index| 62) (|:| |input| 17))
              (|Record| (|:| |index| 62) (|:| |input| 17) (|:| |output| 40))
              (|Record| (|:| |total| 62) (|:| |fail| 62) (|:| |xfail| 62)
                        (|:| |xfpass| 62) (|:| |fatalities| (|List| 7))
                        (|:| |xfpassed| (|List| 8)) (|:| |failed| (|List| 8)))
              (|AssociationList| 17 28) (0 . |empty|) '|tests| '|warnings|
              '|currentTestcase| '|currentTestsuite| (|Void|) (|String|)
              (|MoreSystemCommands|) (4 . |systemCommand|)
              |TESTCNT;testsuiteNoClear;SV;2| |TESTCNT;testsuite;SV;1|
              (|Boolean|) (|NonNegativeInteger|) (9 . >) (15 . |elt|)
              (|OutputForm|) (21 . |messagePrint|) (|AssociationList| 17 9)
              (26 . |empty|) (|Record| (|:| |key| 17) (|:| |entry| 28))
              (30 . |insert!|) (36 . |elt|)
              (|Record| (|:| |key| 17) (|:| |entry| 9)) (42 . |insert!|)
              |TESTCNT;testcaseNoClear;SV;3| |TESTCNT;testcase;SV;4|
              (48 . |elt|) |TESTCNT;incPass;V;5| |TESTCNT;chkLibraryError;V;6|
              (|List| 26) |TESTCNT;incLibraryError;SLV;7|
              |TESTCNT;incXfLibraryError;SLV;8| |TESTCNT;incXfFail;V;9|
              |TESTCNT;incFail;SLV;10| |TESTCNT;incXfPass;SLV;11|
              |TESTCNT;decXfPass;V;12| |TESTCNT;incFatal;SV;13|
              |TESTCNT;decFatal;V;14| |TESTCNT;incXfFatal;SV;15|
              |TESTCNT;decXfFatal;V;16| (54 . |message|) (|List| $)
              (59 . |pile|) |TESTCNT;addWarning;OfV;17| (|OutputPackage|)
              (64 . |output|) (69 . |output|) (|List| 30) (74 . |parts|)
              (|List| 33) (79 . |parts|) (|Integer|) (84 . >) (90 . |hconcat|)
              |TESTCNT;statistics;V;18|)
           '#(|testsuiteNoClear| 96 |testsuite| 101 |testcaseNoClear| 106
              |testcase| 111 |statistics| 116 |incXfPass| 120
              |incXfLibraryError| 126 |incXfFatal| 132 |incXfFail| 137
              |incPass| 141 |incLibraryError| 145 |incFatal| 151 |incFail| 156
              |decXfPass| 162 |decXfFatal| 166 |decFatal| 170 |chkLibraryError|
              174 |addWarning| 178)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|testsuite| ((|Void|) (|String|))) T)
                                   '((|testsuiteNoClear| ((|Void|) (|String|)))
                                     T)
                                   '((|testcase| ((|Void|) (|String|))) T)
                                   '((|testcaseNoClear| ((|Void|) (|String|)))
                                     T)
                                   '((|statistics| ((|Void|))) T)
                                   '((|incPass| ((|Void|))) T)
                                   '((|incFail|
                                      ((|Void|) (|String|)
                                       (|List| (|OutputForm|))))
                                     T)
                                   '((|incXfPass|
                                      ((|Void|) (|String|)
                                       (|List| (|OutputForm|))))
                                     T)
                                   '((|decXfPass| ((|Void|))) T)
                                   '((|incXfFail| ((|Void|))) T)
                                   '((|chkLibraryError| ((|Void|))) T)
                                   '((|incLibraryError|
                                      ((|Void|) (|String|)
                                       (|List| (|OutputForm|))))
                                     T)
                                   '((|incXfLibraryError|
                                      ((|Void|) (|String|)
                                       (|List| (|OutputForm|))))
                                     T)
                                   '((|incFatal| ((|Void|) (|String|))) T)
                                   '((|incXfFatal| ((|Void|) (|String|))) T)
                                   '((|decFatal| ((|Void|))) T)
                                   '((|decXfFatal| ((|Void|))) T)
                                   '((|addWarning| ((|Void|) (|OutputForm|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 65
                                            '(0 10 0 11 1 18 16 17 19 2 23 22 0
                                              0 24 2 17 0 0 0 25 1 26 16 17 27
                                              0 28 0 29 2 10 0 30 0 31 2 10 28
                                              0 17 32 2 28 0 33 0 34 2 28 9 0
                                              17 37 1 26 0 17 51 1 26 0 52 53 1
                                              55 16 26 56 1 55 16 17 57 1 10 58
                                              0 59 1 28 60 0 61 2 62 22 0 0 63
                                              2 26 0 0 0 64 1 0 16 17 20 1 0 16
                                              17 21 1 0 16 17 35 1 0 16 17 36 0
                                              0 16 65 2 0 16 17 40 45 2 0 16 17
                                              40 42 1 0 16 17 49 0 0 16 43 0 0
                                              16 38 2 0 16 17 40 41 1 0 16 17
                                              47 2 0 16 17 40 44 0 0 16 46 0 0
                                              16 50 0 0 16 48 0 0 16 39 1 0 16
                                              26 54)))))
           '|lookupComplete|)) 

(MAKEPROP '|UnittestCount| 'NILADIC T) 