file testing
isAtEndOfFile: anIOHandle
	"Answer whether the file represented by anIOHandle is at end of file, as determined
	by a call to feof(). This is different from StandardFileStream>>primAtEnd: which answers
	true if the file pointer is at the end of the file, but which does not call feof() to
	determine that an end of file condition has occurred. The difference is significant
	if aSqFileStruct represents a pipe or a device file, which may not be positionable
	in the sense of a conventional disk file."

	^ self primTestEndOfFileFlag: (self handleFromAccessor: anIOHandle)
