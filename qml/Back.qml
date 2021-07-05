import QtQuick 2.0

import "jsBack.js" as JsBack

Rectangle {
	opacity: .5

	Canvas {
		anchors.fill: parent
		onPaint: {
			var ctx = getContext("2d")
			var w = width
			var h = height
			var color1 = Qt.darker("green", 2)
			var color2 = "#aa006400"
			var color3 = "#55ffffff"

			JsBack.drawCircles(ctx, w, h, color1)

			JsBack.drawRosaceasP1(ctx, w, h, .2, color1)
			JsBack.drawRosaceasP2(ctx, w, h, .15, color1)
			JsBack.drawCenterStart(ctx, w, h, color1, color2, color3)

			JsBack.drawParametrica(ctx, w, h, color2)
			
			JsBack.drawBack(ctx, w, h, color1)
		}
	}

}
