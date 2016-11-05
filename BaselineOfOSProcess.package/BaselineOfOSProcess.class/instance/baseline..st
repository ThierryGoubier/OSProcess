baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				package: 'CommandShell-Base'
					with: [ 
							"Base actually requires the following packages, but the dependency is circular, so we'll include until it''s fixed"
							spec includes: #('CommandShell-Commands' 'CommandShell-Piping' 'CommandShell-UI') ];
				package: 'CommandShell-Commands' with: [ spec requires: #('CommandShell-Base') ];
				package: 'CommandShell-Morphic' with: [ spec requires: #('CommandShell-Base') ];
				package: 'CommandShell-Piping' with: [ spec requires: #('CommandShell-Base' 'OSProcess') ];
				package: 'CommandShell-UI' with: [ spec requires: #('CommandShell-Base' 'CommandShell-Morphic') ];
				package: 'CommandShellPharo' with: [ spec requires: #('CommandShell-Base') ];
				package: 'CommandShell-Tests' with: [ spec requires: #('CommandShell-Base' 'CommandShell-Piping' 'OSProcess') ].
			spec
				package: 'OSProcess-AIO';
				package: 'OSProcess-Base' with: [ spec requires: #('OSProcess-AIO') ];
				package: 'OSProcess-OS2' with: [ spec requires: #('OSProcess-Base') ];
				package: 'OSProcess-Win32' with: [ spec requires: #('OSProcess-Base') ];
				package: 'OSProcess-Unix' with: [ spec requires: #('OSProcess-Base') ];
				package: 'OSProcess-Mac' with: [ spec requires: #('OSProcess-Base') ];
				package: 'OSProcess-RiscOS' with: [ spec requires: #('OSProcess-Base') ];
				package: 'OSProcess-Tests' with: [ spec requires: #('OSProcess-Base') ].
			spec
				group: 'All OS' with: #('OSProcess-OS2' 'OSProcess-Win32' 'OSProcess-Unix' 'OSProcess-Mac' 'OSProcess-RiscOS');
				group: 'Tests' with: #('OSProcess-Tests').
			spec
				group: 'Core' with: #('CommandShell-Piping' 'OSProcess-AIO' 'OSProcess-Base' 'All OS');
				group: 'Tests' with: #('CommandShell-Tests') ]