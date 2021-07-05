import QtQuick 2.0

Item {
	id: root
	property var lx: 1
	property var ly: 1
	property var tcl: "black"
	property var fpz: 10
	property var text: ""

	function repeat(txt, l) {
		var ret=""
		for (var x=0; x<l; x++)
			ret += txt+ " "
		return ret
	}

	Column {
		anchors.fill: parent
		Repeater {
			model: root.ly
			delegate: Text {
				height: root.fpz*2
				text: root.repeat(root.text, root.lx)
				color: root.tcl
				font.pointSize: root.fpz
			}
		}
	}
}
