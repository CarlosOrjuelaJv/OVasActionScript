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
	import com.greensock.*;
	import com.greensock.easing.*;
	//filtros
	import com.greensock.plugins.TweenPlugin; 
	import com.greensock.plugins.GlowFilterPlugin; 
		import flash.utils.getQualifiedClassName;
	
	public class BotonSiguiente extends Botones
	{
		private var mc:Object;
		private var visibilidad:Boolean = true;
		private var timelineGlow:TimelineMax ;

		
		public function BotonSiguiente(target:Object, visi:Boolean) {
				super(target, visi);
				
				if (getQualifiedClassName(target) == "flash.display::SimpleButton") {
					
						this.mc = (SimpleButton)(target);
						
					}else if (getQualifiedClassName(target) == "flash.display::MovieClip")
					{
						this.mc = (MovieClip)(target);
						this.mc.useHandCursor = true;
						this.mc.buttonMode = true;
						mc.gotoAndStop(1);
					}
				
				TweenPlugin.activate([GlowFilterPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.
				this.mc = super.retornaObjeto();
				animarBtn();
			}
		public function animarBtn():void {
			//trace("si");
				timelineGlow  = new TimelineMax({repeat:-1,yoyo:true});
				//timelineGlow.add(TweenLite.from(mc, 1, { glowFilter: { color:0xFFFFFF, blurX:30, blurY:30, strength:1, alpha:1 }} ));
				timelineGlow.add(TweenLite.from(mc, 1, { scaleX:0.7,scaleY:0.7} ));
			}
	}
	
}