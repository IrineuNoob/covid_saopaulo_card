import QtQuick 2.0


Rectangle {
	id: root
	color: "transparent"

	property var fontSize: root.height*.02
	property var fontFamily: "Trebuchet MS"
	property var fontColor: "#888"	

	property var text: ""
	property var pressed: false

	onPressed: root.pressed = true
	onEntered: root.pressed = true
	onReleased: root.pressed = false
	onCanceled: root.pressed = false

	signal clicked()
	signal entered()
	signal exited()
	signal pressAndHold()
//	signal pressed()
	signal released()
	signal canceled()

	Text {
		anchors.fill: parent
		verticalAlignment: Text.AlignVCenter
		horizontalAlignment: Text.AlignHCenter
		text: root.text
		color: root.fontColor
		font {
			family: root.fontFamily
			pointSize: root.fontSize
		}
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		onClicked: root.clicked()
	//	onPressed: root.pressed()
		onReleased: root.released()
		onEntered: root.entered()
		onExited: root.exited()
		onCanceled: root.canceled()
		onPressAndHold: root.pressAndHold()
	}
}
