updating
update: event

	event == self inputStream
		ifTrue: [^ self handleInput: event upToEnd].
	event == #prompt	"display $PS1"
		ifTrue: [^ self prompt].
	event == #alternatePrompt	"display $PS2"
		ifTrue: [^ self promptTwo].
	event == #restorePrompt	"restore last prompt display"
		ifTrue: [self flag: #FIXME. ^ self prompt].
	event == #exit
		ifTrue: [^ self close].
	event == #clearText
		ifTrue: [^ self error: 'FIXME'].
	event == #interruptCharacter
		ifTrue: [^ self doInterruptCharHandler].
	"Treat anything other than the symbols above as a string to be displayed on
	the command line in the view"
	self show: event asString; cr.
