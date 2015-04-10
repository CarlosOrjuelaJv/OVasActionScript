package com.zoom
{
	import flash.display.MovieClip;
	import com.greensock.*;
	/**
	 * ...
	 * @author CArlos
	 */
	public class LPControZoom extends MovieClip 
	{
		
		private var arrBtn:Array = new Array();;
		private var arrZoom:Array = new Array();;
		private var fondoZoom:Object;


		function LPControZoom(arrZoom:Array, fondoZoom:Object, arrBtn:Array) 
		{
			this.arrBtn = arrBtn;
			this.arrZoom = arrZoom;
			this.fondoZoom = fondoZoom;
			this.fondoZoom.visible=false;
			for (i = 0; i < this.arrZoom.length; i++) {
				this.arrZoom[i].visible=false;
			}
		}
		public function verZoom(numZoom) {
		 // console.log(numZoom+" aca en zoom");
			this.arrZoom[numZoom].visible = true;
			this.fondoZoom.visible = true;
			//console.log(this.fondoZoom);
			 var x = 0.2;

			var puzz = this.arrZoom[numZoom];
			//console.log($(puzz).children());
			
			for (var j:int = 0; j <puzz.numChildren ; j++) 
					{
						TweenMax.from(puzz.getChildAt(j), 0.1, {scaleX:0, scaleY:0, delay:x});
						x += 0.1;			
					}	
		};

		public function ocultarZoom() {
			for (i = 0; i < this.arrZoom.length; i++) {
				this.arrZoom[i].visible = false;
			}
			this.fondoZoom.visible = false;
		};

	}
	
}