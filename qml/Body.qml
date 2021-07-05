import QtQuick 2.11


Rectangle {
	id: root
	property var fpz: 10
	property var fpz2: 10
	color: "transparent"

	Text {
		id: vj
		anchors.right: parent.right
		text: "#Vacinejá"
		color: Qt.darker("green", 2)
		font {
			bold: true
			pointSize: root.fpz*1.5
			family: "Comic Sans MS, Comic Sans, cursive"
		}
	}
	

	Rectangle {
		id: mroot
		color: "transparent"
		border.width: 3
		width: parent.width
		height: parent.height-vj.font.pointSize*2.2
		anchors.bottom: parent.bottom


		Image {
			id: img
			source: "qrc:///bk.png"
			width: parent.width*.5
			height: parent.height*1.13
			y: -parent.height*.05
			anchors {
				horizontalCenter: parent.horizontalCenter
			}
			opacity: .1
			sourceSize {
				width: img.width
				height: img.height
			}
		}

		GridView {
			anchors.fill: parent
			cellWidth: width*1.5
			cellHeight: height/9
			boundsMovement: Flickable.StopAtBounds
			model: ListModel {
				ListElement { text: "NOME"; dw: 1; c1: "black";  bd: false; }

				ListElement { text: "1ª DOSE"; text2: "2ª DOSE"; dw: 2; c1: "darkgreen" ; bd: true; }

				ListElement { text: "UNIDADE"; text2: "UNIDADE"; dw: 2; c1: "black" ; bd: false; }

				ListElement { text: "CNES"; text2: "CNES"; dw: 2; c1: "black" ; bd: false; }

				ListElement { text: "DATA"; text2: "DATA"; dw: 2; c1: "black" ; bd: false; }

				ListElement { text: "LOTE"; text2: "LOTE"; dw: 2; c1: "black" ; bd: false; }

				ListElement { text: "FABRICANTE"; text2: "FABRICANTE"; dw: 2; c1: "black" ; bd: false; }


				ListElement { text: "VACINADOR"; text2: "VACINADOR"; dw: 2; c1: "black" ; bd: false; }

				ListElement { text: "REG. PROF"; text2: "REG. PROF"; dw: 2; c1: "black" ; bd: false; }

			}
			delegate: Row {
				width: mroot.width
				height: mroot.height/9
				Box {
					width: parent.width/dw
					height: parent.height
					textIn: text
					fpz: root.fpz
					fpz2: root.fpz
					tic: c1
					bold: bd
					readOnly: false	
				}
				Box {
					width: parent.width/dw
					height: parent.height
					textIn: text2
					fpz: root.fpz
					fpz2: root.fpz
					tic: c1
					visible: dw==2
					bold: bd
					readOnly: false	
				}
			}		
		}
	}

}
