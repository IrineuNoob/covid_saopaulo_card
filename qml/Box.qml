import QtQuick 2.0


Rectangle {
	id: root
	color: "transparent"
	border.width: 1
	property var textIn: ""
	property var textOut: ""
	property var fpz: 15
	property var fpz2: 15
	property var tic: "black"
	property var toc: Qt.lighter("blue", 1.1)
	property var bold: false
	property var readOnly: true

	Text {
		id: title
		text: root.textIn
		font {
			bold: root.bold
			pointSize: root.fpz
		}
		color: root.tic
		height: parent.height
		verticalAlignment: Text.AlignVCenter
		x: parent.width*.02
	}

	TextInput {
		readOnly: root.readOnly
		x: title.contentWidth+parent.width*.05
		width: parent.width-x
		height: parent.height
		verticalAlignment: Text.AlignVCenter
		color: root.toc
		text: root.textOut
		font {
			pointSize: root.fpz*1.5
			italic: true
			family: "California Signature"
		}
	}
}
