;nyquist plug-in
;version 1
;type generate
;name "CUSTOM Pan"
;action "...processing..."
;info "Pan: position [0=left, 1=right, default is 0.5 (center-panned)]"

;;; Pan position: [0=left, 1=right, default is 0.5 (center-panned)]

;control where "Pan position" int "0=left 1=right" 0.5 0 1.0

(defun pan2 (sound where)
   (vector (mult (aref sound 0) (sum 1 (mult -1 where)))
       (mult (aref sound 1) where)))

(pan2 ; sum stereo input to mono for panning
    (vector 
        (sum (aref s 0) (aref s 1))  ; left channel
        (sum (aref s 1) (aref s 0))) ; right channel
    where)
