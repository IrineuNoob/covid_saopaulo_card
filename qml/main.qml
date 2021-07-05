import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

Item {
	id: root
	//width: printMode ? widget.size.width  : Screen.desktopAvailableWidth
	//height: printMode ? widget.size.height : Screen.desktopAvailableHeight
	width: widget.size.width 
	height: widget.size.height


	property var ta: " Recomendado preencher manualmente apos impressão para ficar mais identico.<br> Ao clicar em sauvar os arquivos pdf's com tamanhos normais serão sauvos em /sdcard/front.pdf e /sdcard/back.pdf.<br> Imprima o arquivo front.pdf , entao vire a folha e imprima o arquivo back.pdf"

	property var ca: "red"
	
	property var fpz: 10
	property var printMode: false
	property var cardWidth: printMode ? 150*5 : root.width
	property var cardHeight: printMode ? 100*5 : root.height*.5

	Column {
		anchors.fill: parent
		Text {
			visible: !root.printMode
			width: parent.width
			height: contentHeight
			text: root.ta
			color: root.ca
			wrapMode: Text.WordWrap
			font {
				pointSize: root.fpz*1.5
			}
		}

		Rectangle {
			id: paper
			width: root.cardWidth
			height: root.cardHeight
		
			Back {
				id: back
				width: parent.width
				height: parent.height
				visible: false
				clip: true
			}

			Rectangle {
				id: card
				visible: true
				width: parent.width
				height: parent.height
				clip: true
				
				Watermark {
					y: -height*.2
					x: y*2
					width: parent.width
					height: parent.height
					text: "Governo do Estado de São Paulo"
					lx: 10
					ly: 120
					rotation: -30
					opacity: .1
					fpz: root.fpz*.5
				}

				Header {
					id: header
					width: parent.width
					height: parent.height*.2

				}
				Body {
					anchors {
						top: header.bottom
					}
					x: parent.width*.025
					width: parent.width*.95
					height: parent.height*.7
					fpz: root.fpz
					fpz2: root.fpz*2
					z: 100
				}

				Footer {
					width: parent.width
					height: parent.height*.08
					fpz: root.fpz*.7
					anchors.bottom: parent.bottom
				}
			}
		}
	}
	CustomButton {
		id: btn
		visible: !root.printMode
		width: parent.width
		height: parent.height*.1
		text: "Sauvar"
		fontSize: root.fpz*2
		anchors.bottom: parent.bottom
		border.width: entered ? 2 : 1

		onClicked: {
			root.printMode = true
			widget.takeAPrint("/sdcard/front.pdf");
			card.visible = false
			back.visible = true
				widget.takeAPrint("/sdcard/back.pdf");
			card.visible = true
			back.visible = false
			root.printMode = false
		}
	
	}
}
