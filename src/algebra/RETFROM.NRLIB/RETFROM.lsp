
(DECLAIM (NOTINLINE |RetractableFrom;|)) 

(DEFPARAMETER |RetractableFrom;AL| 'NIL) 

(DEFUN |RetractableFrom| (|t#1|)
  (LET (#1=#:G383 (#2=#:G384 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |RetractableFrom;AL|)) (CDR #1#))
          (T
           (SETQ |RetractableFrom;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|RetractableFrom;| #2#)))
                            |RetractableFrom;AL|))
           #1#)))) 

(DEFUN |RetractableFrom;| (|t#1|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory|
                                '(((|coerce| (|t#1| $)) T)
                                  ((|retractIfCan|
                                    ((|Union| $ "failed") |t#1|))
                                   T)
                                  ((|retract| ($ |t#1|)) T))
                                NIL NIL NIL))))
           (SETELT #1# 0 (LIST '|RetractableFrom| |t#1|))))) 
