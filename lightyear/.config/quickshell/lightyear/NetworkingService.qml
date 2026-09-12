import Quickshell
import Quickshell.Networking

Scope {
	readonly property bool wifiHardwareEnabled: Networking.wifiHardwareEnabled
	readonly property bool wifiEnabled: Networking.wifiEnabled

	readonly property bool hasWifiDevice: Networking.devices.values.some(device =>
		device.type === DeviceType.Wifi
	)

	readonly property bool hasWiredDevice: Networking.devices.values.some(device =>
		device.type === DeviceType.Wired
	)

	readonly property bool wifiConnected: Networking.devices.values.some(device =>
		device.type === DeviceType.Wifi
		&& device.connected
	)

	readonly property bool wiredConnected: Networking.devices.values.some(device =>
		device.type === DeviceType.Wired
		&& device.connected
	)
}
