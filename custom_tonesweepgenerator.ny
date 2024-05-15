;nyquist plug-in
;version 4
;type generate
;name "CUSTOM Tone Sweep Generator"
;action "...generating..."
;info "Tone Sweep Generator: startfreq/endfreq/duration/level/scale"
;TODO effect category?

;control startf "start freq (Hz)" real "" 20 20 20000
;control endf "end freq (Hz)" real "" 20000 20 20000
;control duration "duration (secs)" real "" 30 1 300
;control level "level (dBFS)" real " " 0 -40 0
;control type "Sweep scale [1=Linear, 2=Exponential]" int "" 2 1 2
 
(if (= type 2)
(scale-db level (fmosc 0 (pwev startf duration endf))) 
(scale-db level (fmosc 0 (pwlv startf duration endf))) )
