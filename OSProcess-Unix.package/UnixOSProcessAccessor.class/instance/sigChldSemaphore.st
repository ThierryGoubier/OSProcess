accessing
sigChldSemaphore
	"Answer the value of sigChldSemaphore"

	^ sigChldSemaphore ifNil: [sigChldSemaphore := self forwardSigChld].
