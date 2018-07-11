
(DECLAIM (NOTINLINE |Eltable;|)) 

(DEFPARAMETER |Eltable;AL| 'NIL) 

(DEFUN |Eltable| (|t#1| |t#2|)
  (LET (#1=#:G383 (#2=#:G384 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |Eltable;AL|)) (CDR #1#))
          (T
           (SETQ |Eltable;AL|
                   (|cons5| (CONS #2# (SETQ #1# (APPLY #'|Eltable;| #2#)))
                            |Eltable;AL|))
           #1#)))) 

(DEFUN |Eltable;| (|t#1| |t#2|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|Join|
                               (|mkCategory| '(((|elt| (|t#2| $ |t#1|)) T)) NIL
                                             NIL NIL))))
           (SETELT #1# 0 (LIST '|Eltable| |t#1| |t#2|))))) 