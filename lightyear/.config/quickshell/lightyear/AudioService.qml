import Quickshell
import Quickshell.Services.Pipewire

Scope {
	id: root

	readonly property bool ready: Pipewire.ready

	readonly property PwNode output: Pipewire.defaultAudioSink
	readonly property bool hasOutput: output !== null

	readonly property string outputName: !hasOutput
		? ""
		: output.description.length > 0
			? output.description
			: output.name

	readonly property real volume: hasOutput && output.ready && output.audio !== null
		? output.audio.volume
		: 0

	readonly property bool muted: hasOutput && output.ready && output.audio !== null
		? output.audio.muted
		: false

	PwObjectTracker {
		objects: [root.output]
	}
}
