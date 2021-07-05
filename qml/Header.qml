import QtQuick 2.0


Rectangle {
	id: header
	color: Qt.darker("green", 2)
	Image {
		id: img_gsp
		source: "qrc:///gsp.png"
		width: parent.width*.07
		height: parent.height*.5
		anchors {
			verticalCenter: parent.verticalCenter
			leftMargin: parent.width*.05
			left: parent.left
		}
		sourceSize {
			width: img_gsp.width
			height: img_gsp.height
		}
	}

	Text {
		color: "white"
		font {
			pointSize: 16
			bold: true
		}
		text: "CAMPANHA CONTRA A COVID-19"
		anchors.centerIn: parent
	}

	Image {
		id: img_gsp2
		source: "qrc:///gsp2.png"
		width: parent.width*.1
		height: parent.height*.5
		anchors {
			verticalCenter: parent.verticalCenter
			rightMargin: parent.width*.05
			right: parent.right
		}
		sourceSize {
			width: img_gsp.width
			height: img_gsp.height
		}
	}
}

