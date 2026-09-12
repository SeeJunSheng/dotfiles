import Quickshell
import Quickshell.Services.Pipewire

Scope {
	id: root

	readonly property bool ready: Pipewire.ready

	readonly property PwNode output: Pipewire.defaultAudioSink

	readonly property bool hasOutputDevice: root.ready
		&& Pipewire.nodes.values.some(node =>
			node.audio !== null
			&& !node.isStream
			&& node.isSink
		)

	readonly property bool hasInputDevice: root.ready
		&& Pipewire.nodes.values.some(node =>
			node.audio !== null
			&& !node.isStream
			&& !node.isSink
		)

	readonly property string outputName: output === null
		? ""
		: output.description.length > 0
			? output.description
			: output.name

	readonly property real volume: output !== null && output.ready && output.audio !== null
		? output.audio.volume
		: 0

	readonly property bool muted: output !== null && output.ready && output.audio !== null
		? output.audio.muted
		: false

	PwObjectTracker {
		objects: [root.output]
	}
}
