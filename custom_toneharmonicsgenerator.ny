;nyquist plug-in
;version 1
;type generate
;name "CUSTOM Tone Harmonics Generator"
;action "...generating..."
;info "Tone Harmonics Generator: FreqOrMidi/freq/midi-note/harmonicscount/duration/level"

;;; Frequency or MIDI number: [0=frequency, 1=MIDI (default)]
;;; Frequency: [20 - 5000 Hz, default 110]
;;; MIDI note number: [16 - 127, default 45]
;;; Number of harmonics: [1 - 60, default 12]
;;; Buzz tone duration: [0.1 - 120 seconds, default 5.0]
;;; Volume: [1 - 100 percent, default 95]

;control fm "Frequency or MIDI number" int "0=freq 1=MIDI" 1 0 1 
;control freq "Frequency" real "hz" 110.0 20.0 5000.0
;control midi-note "MIDI note" int "MIDI number" 45 16 127
;control n "Number of harmonics" int "harmonics" 12 1 60 
;control dur "buzz tone duration" real "seconds" 5.0 0.1 120.0
;control level "Volume" int "percent" 95 0 100

; if note is 100 hz with 4 harmonics, outputs 4 freqs:
; 100, 200, 300 and 400 hz with equal amplitude

; buzz function's note arg must be MIDI

(setf note (if (= fm 1) midi-note
           (hz-to-step freq)))

(defun buzz (n pitch modulation)
            (let ((modulation-srate (snd-srate modulation))
                 (hz (step-to-hz (+ pitch (get-transpose)))))
                     (cond ((< *SOUND-SRATE* modulation-srate)
                         (format t "Warning: down-sampling modulation in buzz~%")
                         (setf modulation (snd-down *SOUND-SRATE* modulation))))
                     (cond ((> hz (/ *SOUND-SRATE* 2))
                         (format t "Warning: buzz nominal frequency (~A hz) will alias at current sample rate (~A hz).\n"
                                 hz *SOUND-SRATE*)))
                     (setf n (max n 1)) ; avoid divide by zero problem
                     (scale-db (get-loud)
                               (snd-buzz n             ; number of harmonics
                                   *SOUND-SRATE*       ; output sample rate
                                   hz                  ; output hz
                                   (local-to-global 0) ; starting time
                                   modulation))))      ; freq. modulation
                                

; generate tone
(mult 0.01 level (pwl 0.002 1 (- dur 0.002) 1 dur)
                 (buzz n note (s-rest dur)))
