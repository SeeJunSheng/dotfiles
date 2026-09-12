import Quickshell
import Quickshell.Bluetooth

Scope {
	id: root

	readonly property BluetoothAdapter adapter: Bluetooth.defaultAdapter

	readonly property bool enabled: adapter !== null
		&& adapter.enabled

	readonly property bool discovering: adapter !== null
		&& adapter.discovering

	readonly property bool hasConnectedDevice: adapter !== null
		&& adapter.devices.values.some(device =>
			device.connected
		)
}
