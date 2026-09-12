import Quickshell

Scope {
	required property AudioService audioService

	readonly property bool hasAudioOutput: audioService.hasOutputDevice
	readonly property bool hasAudioInput: audioService.hasInputDevice
	readonly property bool hasAudio: hasAudioOutput || hasAudioInput
}
