import QtQuick
import Quickshell

PanelWindow {
	id: root

	required property var modelData
	required property bool topEdge

	readonly property int peekWidth: 80
	readonly property int peekHeight: 10
	readonly property int expandedWidth: 360
	readonly property int expandedHeight: 64

	readonly property bool expanded: panelHover.hovered

	screen: modelData

	implicitHeight: expandedHeight

	color: "transparent"
	exclusionMode: ExclusionMode.Ignore

	anchors {
		top: root.topEdge
		bottom: !root.topEdge
		left: true
		right: true
	}

	margins {
		left: Math.max(
			0,
			Math.floor((root.screen.width - root.expandedWidth) / 2)
		)

		right: Math.max(
			0,
			Math.floor((root.screen.width - root.expandedWidth) / 2)
		)
	}

	mask: Region {
		item: panelBody
	}

	Rectangle {
		id: panelBody

		anchors {
			horizontalCenter: parent.horizontalCenter
			top: root.topEdge ? parent.top : undefined
			bottom: root.topEdge ? undefined : parent.bottom
		}

		width: root.expanded
			? root.expandedWidth
			: root.peekWidth

		height: root.expanded
			? root.expandedHeight
			: root.peekHeight

		radius: height / 2
		color: "#aa222222"

		HoverHandler {
			id: panelHover
		}

		Behavior on width {
			NumberAnimation {
				duration: 180
				easing.type: Easing.OutCubic
			}
		}

		Behavior on height {
			NumberAnimation {
				duration: 180
				easing.type: Easing.OutCubic
			}
		}
	}
}
