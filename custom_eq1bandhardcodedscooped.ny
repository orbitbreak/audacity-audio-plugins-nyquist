;nyquist plug-in
;version 1
;type process
;name "CUSTOM EQ 1-Band Hardcoded Scooped"
;action "...processing..."
;info "EQ 1-Band Hardcoded Scooped: NO CONTROLS, SEE SRC"

;control dummyvar "DUMMYVAR" real "Bananas/second" 440.0 20.0 20000.0

; mids cut SCOOPED
(setf f 800) ; center freq in Hz
(setf width 1.5) ; bandwidth in octaves
(setf gain -20.0)  ; gain output level in dB

; high cut WARM
;(setf f 3000) ; center freq in Hz
;(setf width 1.5) ; bandwidth in octaves
;(setf gain -20.0)  ; gain output level in dB

; lows cut COLD
;(setf f 150) ; center freq in Hz
;(setf width 1.5) ; bandwidth in octaves
;(setf gain -20.0)  ; gain output level in dB

(eq-band s f gain width)

