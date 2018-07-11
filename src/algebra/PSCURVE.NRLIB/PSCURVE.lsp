
(DECLAIM (NOTINLINE |PlottableSpaceCurveCategory;|)) 

(DEFPARAMETER |PlottableSpaceCurveCategory;AL| 'NIL) 

(DEFUN |PlottableSpaceCurveCategory| ()
  (COND (|PlottableSpaceCurveCategory;AL|)
        (T
         (SETQ |PlottableSpaceCurveCategory;AL|
                 (|PlottableSpaceCurveCategory;|))))) 

(DEFUN |PlottableSpaceCurveCategory;| ()
  (SPROG ((#1=#:G383 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G382) (LIST '(|OutputForm|)))
                              (|Join| (|CoercibleTo| '#2#)
                                      (|mkCategory|
                                       '(((|listBranches|
                                           ((|List|
                                             (|List|
                                              (|Point| (|DoubleFloat|))))
                                            $))
                                          T)
                                         ((|xRange|
                                           ((|Segment| (|DoubleFloat|)) $))
                                          T)
                                         ((|yRange|
                                           ((|Segment| (|DoubleFloat|)) $))
                                          T)
                                         ((|zRange|
                                           ((|Segment| (|DoubleFloat|)) $))
                                          T))
                                       NIL NIL NIL))))
           (SETELT #1# 0 '(|PlottableSpaceCurveCategory|))))) 

(MAKEPROP '|PlottableSpaceCurveCategory| 'NILADIC T) 
