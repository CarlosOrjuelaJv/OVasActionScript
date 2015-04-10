package  com.botones
{
	
	/**
	 * ...
	 * @author CArlos
	 */
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.utils.getQualifiedClassName;
	 
	public class BotonesPrinci extends Botones
	{
		
		private var mc:Object;
		private var visivilidad:Boolean = true;
		private var rollAct:Boolean = true;
		
		public function BotonesPrinci(target:Object, visi:Boolean) {
			
				super(target, visi);
				if (getQualifiedClassName(target) == "flash.display::SimpleButton") {
					
						this.mc = (SimpleButton)(target);
						
					}else if (getQualifiedClassName(target) == "flash.display::MovieClip")
					{
						this.mc = (MovieClip)(target);
						this.mc.useHandCursor = true;
						this.mc.buttonMode = true;
						mc.gotoAndStop(1);
						mc.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
					}
			}
		override public function mouseOver(e:MouseEvent):void 
			{
				mc.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
				mc.addEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico
				if (rollAct) 
				{
					this.mc.gotoAndStop(2);
				}
				
				
			}
		override	public function mouseOut(e:MouseEvent):void 
			{
				mc.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
				mc.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico
				
				this.mc.gotoAndStop(1);
			}
			public function activarRoll():void {
				rollAct = !rollAct;
				}
			
	}
	
}