;nyquist plug-in;version 1;type process;name "CUSTOM Delay Pitch-Shift";action "...processing...";info "Delay Pitch-Shift: decay/delaytime/repeats/pitchshift1/pitchshift2"
;control decay "decay" real "dB" 0 0 24;control delay "delaytime" real "seconds" 0.5 0.0 5.0;control count "repeats" int "repeats" 5 1 30;control toneshift1 "pitchshift1 (semitones)" int "semitones" 1 -24 24;control toneshift2 "pitchshift2 (cents)" int "cents" 0 -100 100
(setf toneshift (sum toneshift1 (mult toneshift2 0.01)))(setf toneshift (expt 2.0 (/ toneshift 12.0)))(setf toneshift (/ 1.0 toneshift))
(defun change (s toneshift)  (force-srate 44100 (stretch-abs toneshift (sound s))))
(defun delays (s decay delay count)  (if (= count 0) (cue s)      (sim (cue s)                    (loud decay (at delay (delays (change s toneshift) decay delay (- count 1))))))) 
(stretch-abs 1 (delays s (- 0 decay) delay count))