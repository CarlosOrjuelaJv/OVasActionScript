package com.toolBar {
	
	import flash.display.MovieClip;
	import flash.events.*; 
	import flash.events.MouseEvent;
	
	
	public class ToolBar extends MovieClip {
		private var controPos:Boolean = false;

		public function ToolBar(posX:Number,posY:Number) {
			// constructor code
			x = posX;
			this.y = posY;
			this.gotoAndStop(1);
			this.textoTool.gotoAndStop(1);
			this.textoTool.addEventListener(MouseEvent.CLICK, mouseClic);
			this.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
		}
		
		public function removeSelf():void 
		{
			
			this.parent.removeChild(this);
		}
		public function mouseOver(e:MouseEvent):void 
			{
				this.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
				this.addEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico
				this.textoTool.gotoAndStop(2);
				
			}
			public function mouseOut(e:MouseEvent):void 
			{
				this.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
				this.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico
				this.textoTool.gotoAndStop(1);
			}
		public function mouseClic(e:MouseEvent):void 
			{
				this.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
				this.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
				this.textoTool.removeEventListener(MouseEvent.CLICK, mouseClic);
				this.gotoAndStop(2);
				this.cerrar.addEventListener(MouseEvent.CLICK, mouseClicCerrar);
				this.cerrar.addEventListener(MouseEvent.ROLL_OVER, mouseOverCerrar);
			}
			
			public function mouseOverCerrar(e:MouseEvent):void 
			{
				this.cerrar.removeEventListener(MouseEvent.ROLL_OVER, mouseOverCerrar);
				this.cerrar.addEventListener(MouseEvent.ROLL_OUT, mouseOutCerrar);
				////comportamiento especifico
				this.cerrar.gotoAndStop(2);
				
			}
			public function mouseOutCerrar(e:MouseEvent):void 
			{
				this.cerrar.addEventListener(MouseEvent.ROLL_OVER, mouseOverCerrar);
				this.cerrar.removeEventListener(MouseEvent.ROLL_OUT, mouseOutCerrar);
				////comportamiento especifico
				this.cerrar.gotoAndStop(1);
			}
			
			private function mouseClicCerrar(e:MouseEvent):void 
			{
				this.cerrar.removeEventListener(MouseEvent.ROLL_OVER, mouseOverCerrar);
				this.cerrar.removeEventListener(MouseEvent.ROLL_OUT, mouseOutCerrar);
				this.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
				this.cerrar.removeEventListener(MouseEvent.CLICK, mouseClicCerrar);
				this.gotoAndStop(1);
				this.textoTool.addEventListener(MouseEvent.CLICK, mouseClic);
				this.textoTool.gotoAndStop(1);
			}
	}
	
}
