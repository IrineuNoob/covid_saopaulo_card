import QtQuick 2.0


Item {
	id: root
	property var fpz: 15
	
	Item {
		x: parent.width*.025
		width: parent.width*.95
		height: parent.height

		Text {
			text: "COMPROVANTE DE VACINAÇÃO"
			font.pointSize: root.fpz
			verticalAlignment: Text.AlignVCenter
			color: "black"
			height: parent.height*.5
			anchors.left: parent.left
		}

		Image {
			id: img
			width: parent.width*.1
			height: parent.height*.5
			source: "qrc:///vcd.png"
			y: -height*.2
			anchors {
				right: parent.right
			}

			sourceSize {
				width: img.width
				height: img.height
			}
		}
	}

	Rectangle {
		id: ftg
		width: parent.width
		height: parent.height/2
		color: Qt.darker("green", 2)
		anchors.bottom: parent.bottom
	}

}

