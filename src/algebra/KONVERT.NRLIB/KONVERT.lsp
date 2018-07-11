
(DECLAIM (NOTINLINE |ConvertibleTo;|)) 

(DEFPARAMETER |ConvertibleTo;AL| 'NIL) 

(DEFUN |ConvertibleTo| (|t#1|)
  (LET (#1=#:G383 (#2=#:G384 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |ConvertibleTo;AL|)) (CDR #1#))
          (T
           (SETQ |ConvertibleTo;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|ConvertibleTo;| #2#)))
                            |ConvertibleTo;AL|))
           #1#)))) 

(DEFUN |ConvertibleTo;| (|t#1|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory| '(((|convert| (|t#1| $)) T)) NIL
                                             NIL NIL))))
           (SETELT #1# 0 (LIST '|ConvertibleTo| |t#1|))))) 
