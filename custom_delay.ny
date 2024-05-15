;nyquist plug-in
;version 4
;type process
;name "CUSTOM Delay"
;action "...processing..."
;info "Delay: decay/delaytime/repeats"
;TODO effect category?

;control decay "decay" int "dB" 6 0 24
;control delay "delaytime" real "Seconds" 0.5 0.0 5.0
;control repeats "repeats" int "Repeats" 5 1 30

(defun delays (s decay delay repeats)
(if (= repeats 0) (cue s)
   (sim (cue s)
	(loud decay (at delay (delays s decay delay (- repeats 1)))))))
(stretch-abs 1 (delays s (- 0 decay) delay repeats))
