
(defvar zhcosin/utils/date-time/date-format "%Y-%m-%d")
(defvar zhcosin/utils/date-time/date-time-format "%Y-%m-%d %H:%M:%S")

(defun zhcosin/utils/date-time/current-time-string ()
  (current-time-string))

(defun zhcosin/utils/format-time-string (&optional format)
  (format-time-string (if format format zhcosin/utils/date-time/date-time-format)))
