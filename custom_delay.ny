;nyquist plug-in
;version 1
;type process
;name "CUSTOM Delay"
;action "...processing..."
;info "Delay: decay/delaytime/repeats"

;control decay "decay" int "dB" 6 0 24
;control delay "delaytime" real "seconds" 0.5 0.0 5.0
;control repeats "repeats" int "repeats" 5 1 30

(defun delays (s decay delay repeats)
              (if (= repeats 0) (cue s)
                  (sim (cue s)
                       (loud decay (at delay (delays s decay delay (- repeats 1)))))))

(stretch-abs 1 (delays s (- 0 decay) delay repeats))
