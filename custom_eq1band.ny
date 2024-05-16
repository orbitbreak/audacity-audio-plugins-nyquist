;nyquist plug-in
;version 1
;type process
;name "CUSTOM EQ 1-Band"
;action "...processing..."
;info "EQ 1-Band: freq/bandwidth/gain/normalize/level"

;control f "freq" real "Hz" 440.0 20.0 20000.0 
;control width "bandwidth (octaves)" real "octaves" 1.0 0.1 5.0 
;control gain "gain" real "dB" 0.0 -48.0 48.0
;control apply "normalize?" int "0=no 1=yes" 0 0 1
;control norm-level "normalized level" real "normlevel" 0.95 0.0 1.0

; normalize?
(defun normalize (signal norm-level)
                 (setf x (if (not (arrayp signal))
                         (peak signal ny:all) ; ;;;; mono handle
                         (max (peak (aref signal 0) ny:all) (peak (aref signal 1) ny:all)))) ; ;;;; stereo handle
                 (scale (/ norm-level x) signal))


; EQ
(if (= apply 0)
    (eq-band s f gain width)
    (normalize (eq-band s f gain width) norm-level))

