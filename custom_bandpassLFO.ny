;nyquist plug-in
;version 1
;type process
;name "CUSTOM Band Pass LFO"
;action "...processing..."
;info "Band Pass LFO: freq/lowcut/highcut/phase"

;control f "LFO freq" real "Hz" 0.20 0.00 20.00 
;control lo-f "low cutoff freq" int "Hz" 160 20 20000
;control hi-f "high cutoff freq" int "Hz" 2560 20 20000
;control phase "LFO start phase" int "degrees" 0 -180 180

(setf factor (abs (- hi-f lo-f)))
(setf center (/ factor 2.0))

(defun get-lfo (f phase factor center)
               (sum center (mult factor
                           (sum 0.5 (mult 0.5 (lfo f 1.0 *sine-table* phase))))))

(defun normalize (signal)
    (setf x (if (arrayp signal)
            (max (peak (aref signal 0) ny:all) (peak (aref signal 1) ny:all))
            (peak signal ny:all)))
    (scale (/ 0.95 x) signal))

(normalize (hp s (get-lfo f phase factor center)))
