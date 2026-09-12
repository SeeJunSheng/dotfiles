import Quickshell

Scope {
	required property AudioService audioService
	required property NetworkingService networkingService
	required property BluetoothService bluetoothService

	readonly property bool hasAudioOutput: audioService.hasOutputDevice
	readonly property bool hasAudioInput: audioService.hasInputDevice
	readonly property bool hasAudio: hasAudioOutput || hasAudioInput

	readonly property bool hasWifi: networkingService.hasWifiDevice
	readonly property bool hasWiredNetwork: networkingService.hasWiredDevice

	readonly property bool hasBluetooth: bluetoothService.hasAdapter
}
