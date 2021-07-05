

function drawCircles(ctx, w, h, color) {
	ctx.beginPath()
	
		var r = Math.min(w, h)*.45
		for (var i=0; i<18; i++) {
			ctx.moveTo(w/2+r, h/2)
			ctx.arc(w/2, h/2, r, 0, 2*Math.PI)
			r *= .9
		}

	ctx.strokeStyle = color
	ctx.stroke()
	ctx.closePath()
}


function drawRosaceasP1(ctx, w, h, sl, color) {

	var x=0
	var y=0
	var r=0

	ctx.strokeStyle = color
	for (var n=0; n<11; n++) {
		ctx.beginPath()
		for (var g=0; g<=2.1*Math.PI; g+=.001) {
			r = Math.sqrt(Math.cos(4*g))

			r *= w*sl

			x = w/2+Math.cos(g)*r
			y = h/2+Math.sin(g)*r

			ctx.lineTo(x, y)
			
		}
		
		ctx.stroke()
		ctx.closePath()
		sl *= .9
	}
}


function drawRosaceasP2(ctx, w, h, sl, color) {

	var x=0
	var y=0
	var r=0

	ctx.beginPath()
	for (var g=0; g<2.1*Math.PI; g+=.001) {
		r = Math.sqrt(Math.cos(4*g))

		r *= w*sl //scale

		x = w/2+Math.cos(g+.25*Math.PI)*r
		y = h/2+Math.sin(g+.25*Math.PI)*r

		ctx.lineTo(x, y)

	}
		
	ctx.strokeStyle = color
	ctx.stroke()
	ctx.closePath()

}


function drawCenterStart(ctx,  w, h, color1, color2, color3) {
	ctx.beginPath()

	var cx = Math.cos(.25*Math.PI)*w*.13
	var sy = Math.sin(.25*Math.PI)*w*.13
	
	ctx.beginPath()
		ctx.fillStyle = color2

		ctx.moveTo(w/2-cx, h/2-sy)
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2+Math.cos(.5)*w*.01,
			h/2-Math.sin(.5)*w*.01);
		
		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2+cx, 
			h/2+sy)


		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2-Math.cos(.5)*w*.01,
			h/2+Math.sin(.5)*w*.01);
		
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2-cx, 
			h/2-sy)

		ctx.fill()

	ctx.closePath()

	ctx.beginPath()
		cx /= 2
		sy /= 2
		ctx.moveTo(w/2-cx, h/2-sy)
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2+Math.cos(.5)*w*.01/5,
			h/2-Math.sin(.5)*w*.01/5);
		
		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2+cx, 
			h/2+sy)

		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2-Math.cos(.5)*w*.01/5,
			h/2+Math.sin(.5)*w*.01/5);
		
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2-cx, 
			h/2-sy)

		ctx.strokeStyle = color1
		ctx.fillStyle = color3
		ctx.fill()
		ctx.stroke()
	ctx.closePath()
	

	var cx = Math.cos(.75*Math.PI)*w*.13
	var sy = Math.sin(.75*Math.PI)*w*.13

	ctx.beginPath()
		ctx.moveTo(w/2-cx, h/2-sy)
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2+Math.cos(1)*w*.01,
			h/2+Math.sin(1)*w*.01);
		
		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2+cx, 
			h/2+sy)

		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2-Math.cos(1)*w*.01,
			h/2-Math.sin(1)*w*.01);
		
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2-cx, 
			h/2-sy)

		ctx.fillStyle = color2
		ctx.fill()

	ctx.closePath()

	ctx.beginPath()
		cx /= 2
		sy /= 2
		ctx.moveTo(w/2-cx, h/2-sy)
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2+Math.cos(1)*w*.01/5,
			h/2+Math.sin(1)*w*.01/5);
		
		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2+cx, 
			h/2+sy)

		ctx.quadraticCurveTo(
			w/2+cx*.2,
			h/2+sy*.2,
			w/2-Math.cos(1)*w*.01/5,
			h/2-Math.sin(1)*w*.01/5);
		
		ctx.quadraticCurveTo(
			w/2-cx*.2,
			h/2-sy*.2,
			w/2-cx, 
			h/2-sy)

		ctx.strokeStyle = color1
		ctx.fillStyle = color3
		ctx.fill()
		ctx.stroke()
	ctx.closePath()
	


	ctx.closePath()
}



function drawParametrica(ctx, w, h, color) {
	var x=0
	var y=0
	var fx=0
	var fy=0

	ctx.beginPath()
		for (var g=0; g<=14*Math.PI; g+=.01) {
		//	fx = 2*Math.cos(g)+Math.cos(g*Math.PI)
		//	fy = 2*Math.sin(g)+Math.sin(g*Math.PI)
			fx = 11*Math.cos(g)+6*Math.cos(g*Math.PI/2)
			fy = 11*Math.sin(g)+6*Math.sin(g*Math.PI/2)

			x = w/2+fx*w*.03
			y = h/2+fy*w*.03

			ctx.lineTo(x, y)
		}

	ctx.strokeStyle = color
	ctx.stroke()
	ctx.closePath()
}


function drawBack(ctx, w, h, color) {
	var r = Math.min(w, h)*.01
	var tx=25
	var ty=200
	
	ctx.beginPath()
	for (var y=0; y<ty; y++) {
		ctx.moveTo(0, (y/ty)*h*1.1)
		for (var x=0; x<tx; x += .01) {
			ctx.lineTo((x/tx)*w, ((y/ty)*h*1.1)+Math.sin(x*Math.PI)*r)
		}
	}
	ctx.strokeStyle = color
	ctx.stroke()
	ctx.closePath()

}
