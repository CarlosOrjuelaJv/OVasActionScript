package com.slide
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;  
	/**
	 * ...
	 * @author CArlos
	 */
	public class Slide extends MovieClip
	{
		private var mc:MovieClip;
		private var mcFondoSlide:Sprite;
		private var visivilidad:Boolean = true;

		
		public function Slide(target:Object, fondoSlide:Object, visi:Boolean) {
			//trace(target.name)
			if (target == null) {
				throw new Error("no encontrado slide");
			}
			this.mc =(MovieClip)(target);
			this.mc.visible = visi;
			
			this.mcFondoSlide = (MovieClip)(fondoSlide);
			mcFondoSlide.visible = true;
			mc.x = 0;
			mc.y = 118.75;
		
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
					
			public function retornaObjeto():MovieClip {			
				return this.mc;
				}
			
	}
	
	
}