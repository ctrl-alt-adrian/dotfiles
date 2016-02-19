;;; timesheet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "timesheet" "timesheet.el" (22050 24850 0 0))
;;; Generated autoloads from timesheet.el

(autoload 'timesheet-next-invoice "timesheet" "\
Get next invoice number (following `timesheet-invoice-number' or INVOICE if present).

\(fn &optional INVOICE)" t nil)

(autoload 'timesheet-debug-msg "timesheet" "\
Display some debug MSGS.

\(fn &rest MSGS)" t nil)

(autoload 'timesheet-debug-time "timesheet" "\
Display TIME with some debug MSGS.

\(fn TIME &rest MSGS)" t nil)

(autoload 'timesheet-debug-time-cal "timesheet" "\
Display TIME-CAL with some debug MSGS.

\(fn TIME-CAL &rest MSGS)" t nil)

(autoload 'timesheet-clock-update-timeclock "timesheet" "\
If this is a CLOCK line, update /round it and return t.
Otherwise, return nil.  Optionally using WITHPATH.

\(fn &optional WITHPATH)" t nil)

(autoload 'timesheet-today "timesheet" "\
Date for calculating timesheet: today.

\(fn)" t nil)

(autoload 'timesheet-yesterday "timesheet" "\
Date for calculating timesheet: yesterday.

\(fn)" t nil)

(autoload 'timesheet-at-point "timesheet" "\
Date for calculating timesheet: current clock line.

\(fn)" t nil)

(autoload 'timesheet-calc-today "timesheet" "\
Calculate timesheet for today.

\(fn)" t nil)

(autoload 'timesheet-calc-yesterday "timesheet" "\
Calculate timesheet for yesterday.

\(fn)" t nil)

(autoload 'timesheet-calc-at-point "timesheet" "\
Calculate timesheet for the date on this line.

\(fn)" t nil)

(autoload 'timesheet-weekly-at-point "timesheet" "\
Calculate week for the date on this line.

\(fn)" t nil)

(autoload 'timesheet-table-goto "timesheet" "\
In the table given at TOP move to a position COL ROW.

\(fn TOP COL ROW)" t nil)

(autoload 'timesheet-this-week "timesheet" "\
Date for calculating timesheet: today.

\(fn)" t nil)

(autoload 'timesheet-last-week "timesheet" "\
Date for calculating timesheet: yesterday.

\(fn)" t nil)

(autoload 'timesheet-weekly-this "timesheet" "\
Calculate timesheet this week.

\(fn)" t nil)

(autoload 'timesheet-weekly-last "timesheet" "\
Calculate timesheet last week.

\(fn)" t nil)

(autoload 'timesheet-this-month "timesheet" "\
Date for calculating timesheet: this month.

\(fn)" t nil)

(autoload 'timesheet-last-month "timesheet" "\
Date for calculating timesheet: last month.

\(fn)" t nil)

(autoload 'timesheet-last-day-in-month "timesheet" "\
Return the date for the last day in this month.
Current month or month for TIME if present.

\(fn &optional TIME)" t nil)

(autoload 'timesheet-first-day-next-month "timesheet" "\
Return the date for the first day in the next month.
Current month or month for TIME if present.

\(fn &optional TIME)" t nil)

(autoload 'timesheet-invoice-this "timesheet" "\
Calculate invoice this month.

\(fn)" t nil)

(autoload 'timesheet-invoice-at-point "timesheet" "\
Calculate invoice at point (a CLOCK line).

\(fn)" t nil)

(autoload 'timesheet-invoice-last "timesheet" "\
Calculate invoice last month.

\(fn)" t nil)

(autoload 'timesheet-goto-invoices "timesheet" "\
Goto (or create) the Invoices heading.

\(fn)" t nil)

(autoload 'timesheet-goto-invoice "timesheet" "\
Goto the invoice for the MONTH.

\(fn MONTH)" t nil)

(autoload 'timesheet-example "timesheet" "\
Setup a timesheet example with a customer called Yoyodyne.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("timesheet-pkg.el") (22050 24850 607059
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; timesheet-autoloads.el ends here
