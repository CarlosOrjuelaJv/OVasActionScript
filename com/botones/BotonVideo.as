package com.botones
{
	
	/**
	 * ...
	 * @author CArlos
	 */
	
	 import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.events.MouseEvent;
	 
	public class BotonVideo extends Botones
	{
		private var mc:MovieClip;
		private var visivilidad:Boolean = true;

		
		public function BotonVideo(target:Object, visi:Boolean) {
			
				super(target, visi);
				this.mc = (target as MovieClip);
		this.mc.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
			}
		override public function mouseOver(e:MouseEvent):void 
			{
				mc.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
				mc.addEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico
				this.mc.gotoAndPlay(2);
				
			}
		override public function mouseOut(e:MouseEvent):void 
			{
				mc.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
				mc.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico
				this.mc.gotoAndStop(1);
			}
		
	}
	
}