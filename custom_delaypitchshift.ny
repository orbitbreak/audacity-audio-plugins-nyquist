;nyquist plug-in
;control decay "decay" real "dB" 0 0 24
(setf toneshift (sum toneshift1 (mult toneshift2 0.01)))
(defun change (s toneshift)
(defun delays (s decay delay count)
(stretch-abs 1 (delays s (- 0 decay) delay count))