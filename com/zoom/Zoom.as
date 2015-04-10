package com.zoom 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;  
	
	/**
	 * ...
	 * @author CArlos
	 */
	public class Zoom extends MovieClip
	{
		private var mc:Sprite;
		private var mcFondoSlide:MovieClip;
		private var visivilidad:Boolean = true;
		private	var NumParteZoom:int = 0; //numero de partes de zoom a animar
		private var parteZoom:Array;
		
		public function Zoom(target:Object,fondoSlide:Object, visi:Boolean) {
			if (target == null) {
				throw new Error("no encontrado Zoom");
			}
			
			this.mc =(MovieClip)(target);
			this.mc.visible = visi;
			this.mcFondoSlide = (MovieClip)(fondoSlide);
			mcFondoSlide.visible = visi;
			mc.x = 0;
			mc.y = 0;
			fondoSlide.x = 0;
			fondoSlide.y = 0;
			}
			
			public function setVisibilidad(visi:Boolean) {
				mc.visible = visi;
				mcFondoSlide.visible = visi;
				
				}
				
			public function getName():String {
					
					return mc.name;
					}
			/*
			private function animacionZoom(numZoom:int):void {
				parteZoom= new Array();
				
				trace("num "+NumParteZoom[numZoom]);
				for (var i:int = 1; i <=NumParteZoom[(numZoom)] ; i++) 
				{
					parteZoom.push(this["zoom"+numZoom].getChildByName("p" + i));
				}
				trace("tam "+parteZoom.length);
				var timelineZoom:TimelineMax = new TimelineMax({onComplete:vaciarArreglo});
				
					if ( numZoom==300) 
					{
						
					}else 
					{
						timelineZoom.insertMultiple( TweenMax.allFrom(parteZoom, 0.5, { delay:0.5,scaleX: 0, scaleY: 0,ease: Quint.easeIn}, 0.1), 0.3);
					}
				
				}
				
				private function vaciarArreglo():void 
				{
					parteZoom = null;
					trace("vacia");
				}*/
	}
	
}