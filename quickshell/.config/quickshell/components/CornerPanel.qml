import QtQuick
import Quickshell
import "../services" as Services

PanelWindow {
	id: root

	required property var modelData
	required property bool topEdge
	required property bool leftEdge

	default property alias content: contentLayer.data

	property bool holdOpen: false

	readonly property int peekSize:
		Services.Settings.cornerPanelPeekSize
	readonly property int expandedThickness:
		Services.Settings.cornerPanelExpandedThickness
	readonly property int expandedLength:
		Services.Settings.cornerPanelExpandedLength

	readonly property bool expanded:
	horizontalHover.hovered
	|| verticalHover.hovered
	|| root.holdOpen

	screen: modelData

	implicitWidth: expandedLength
	implicitHeight: expandedLength

	color: "transparent"
	exclusionMode: ExclusionMode.Ignore

	anchors {
		top: root.topEdge
		bottom: !root.topEdge
		left: root.leftEdge
		right: !root.leftEdge
	}

	mask: Region {
		item: horizontalArm

		Region {
			item: verticalArm
		}
	}

	Rectangle {
		id: horizontalArm

		anchors {
			top: root.topEdge ? parent.top : undefined
			bottom: root.topEdge ? undefined : parent.bottom
			left: root.leftEdge ? parent.left : undefined
			right: root.leftEdge ? undefined : parent.right
		}

		width: root.expanded
			? root.expandedLength
			: root.peekSize

		height: root.expanded
			? root.expandedThickness
			: root.peekSize

		radius: height / 2
		color: Services.Settings.panelBackgroundColor

		HoverHandler {
			id: horizontalHover
		}

		Behavior on width {
			NumberAnimation {
				duration: Services.Settings.panelAnimationDurationMs
				easing.type: Easing.OutCubic
			}
		}

		Behavior on height {
			NumberAnimation {
				duration: Services.Settings.panelAnimationDurationMs
				easing.type: Easing.OutCubic
			}
		}
	}

	Rectangle {
		id: verticalArm

		anchors {
			top: root.topEdge ? parent.top : undefined
			bottom: root.topEdge ? undefined : parent.bottom
			left: root.leftEdge ? parent.left : undefined
			right: root.leftEdge ? undefined : parent.right
		}

		width: root.expanded
			? root.expandedThickness
			: root.peekSize

		height: root.expanded
			? root.expandedLength
			: root.peekSize

		radius: width / 2
		color: Services.Settings.panelBackgroundColor

		HoverHandler {
			id: verticalHover
		}

		Behavior on width {
			NumberAnimation {
				duration: Services.Settings.panelAnimationDurationMs
				easing.type: Easing.OutCubic
			}
		}

		Behavior on height {
			NumberAnimation {
				duration: Services.Settings.panelAnimationDurationMs
				easing.type: Easing.OutCubic
			}
		}
	}

	Item {
		id: contentLayer

		anchors.fill: parent

		visible: root.expanded
	}
}
