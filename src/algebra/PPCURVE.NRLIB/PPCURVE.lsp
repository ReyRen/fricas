
(DECLAIM (NOTINLINE |PlottablePlaneCurveCategory;|)) 

(DEFPARAMETER |PlottablePlaneCurveCategory;AL| 'NIL) 

(DEFUN |PlottablePlaneCurveCategory| ()
  (COND (|PlottablePlaneCurveCategory;AL|)
        (T
         (SETQ |PlottablePlaneCurveCategory;AL|
                 (|PlottablePlaneCurveCategory;|))))) 

(DEFUN |PlottablePlaneCurveCategory;| ()
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
                                          T))
                                       NIL NIL NIL))))
           (SETELT #1# 0 '(|PlottablePlaneCurveCategory|))))) 

(MAKEPROP '|PlottablePlaneCurveCategory| 'NILADIC T) 
