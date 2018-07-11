
(DEFPARAMETER |UnivariateLaurentSeriesConstructorCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesConstructorCategory;|)) 

(DEFPARAMETER |UnivariateLaurentSeriesConstructorCategory;AL| 'NIL) 

(DEFUN |UnivariateLaurentSeriesConstructorCategory| (|t#1| |t#2|)
  (LET (#1=#:G383 (#2=#:G384 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND
     ((SETQ #1# (|assoc| #2# |UnivariateLaurentSeriesConstructorCategory;AL|))
      (CDR #1#))
     (T
      (SETQ |UnivariateLaurentSeriesConstructorCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY
                              #'|UnivariateLaurentSeriesConstructorCategory;|
                              #2#)))
               |UnivariateLaurentSeriesConstructorCategory;AL|))
      #1#)))) 

(DEFUN |UnivariateLaurentSeriesConstructorCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND
                               (|UnivariateLaurentSeriesConstructorCategory;CAT|)
                               ('T
                                (LETT
                                 |UnivariateLaurentSeriesConstructorCategory;CAT|
                                 (|Join|
                                  (|UnivariateLaurentSeriesCategory| '|t#1|)
                                  (|RetractableTo| '|t#2|)
                                  (|mkCategory|
                                   '(((|laurent| ($ (|Integer|) |t#2|)) T)
                                     ((|degree| ((|Integer|) $)) T)
                                     ((|taylorRep| (|t#2| $)) T)
                                     ((|removeZeroes| ($ $)) T)
                                     ((|removeZeroes| ($ (|Integer|) $)) T)
                                     ((|coerce| ($ |t#2|)) T)
                                     ((|taylor| (|t#2| $)) T)
                                     ((|taylorIfCan|
                                       ((|Union| |t#2| "failed") $))
                                      T))
                                   '(((|QuotientFieldCategory| |t#2|)
                                      (|has| |t#1| (|Field|))))
                                   NIL NIL)))))))
           (SETELT #1# 0
                   (LIST '|UnivariateLaurentSeriesConstructorCategory| |t#1|
                         |t#2|))))) 