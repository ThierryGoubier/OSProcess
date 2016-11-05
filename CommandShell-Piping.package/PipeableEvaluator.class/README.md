I evaluate Smalltalk expressions, taking input from my pipeToInput, and print the results of the evaluation on my pipeFromOutput. I may append error messages to my errorPipelineStream. I provide a framework for pipelines of expressions, possibly combined in the same pipeline with ExternalOSProcess proxies executing external operating system commands.

My evaluationBlock may be supplied directly, or can be compiled from an expression string. If compiled from an expression string, the names 'stdin', 'stdout', 'stderr', and 'args' are used to refer to the input stream, output stream, error stream, and an array of arguments. If any of these names are used in the expression string, then the evaluation block will be compiled in such as way as to connect these names with their corresponding streams or argument array.