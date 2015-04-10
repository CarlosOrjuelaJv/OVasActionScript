package  com.botones
{
	 import flash.display.MovieClip;
	 import flash.display.SimpleButton;
	 import flash.events.*;
	 import flash.events.MouseEvent;
	 import flash.utils.getQualifiedClassName;
	public class Botones extends MovieClip {
		
		private var mc:Object;
		private var visivilidad:Boolean = true;
		
		public function Botones(target:Object, visi:Boolean) {
			
				if (target == null) {
					throw new Error("no encontrado boton");
				}
				
				if (getQualifiedClassName(target) == "flash.display::SimpleButton") {
					
						this.mc = (SimpleButton)(target);
						
					}else 
					{
						
						this.mc = (MovieClip)(target);
						this.mc.useHandCursor = true;
						this.mc.buttonMode = true;
						mc.gotoAndStop(1);
					}
				
				
				this.mc.visible = visi;
				mc.addEventListener(MouseEvent.CLICK, mouseClic);
				mc.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
				////comportamiento especifico
				//agragar acciones a un frame
				
				/*mc.addFrameScript(1, function () {
					trace("uno")
					});*/
					
			}
			
			public function mouseClic(e:MouseEvent):void 
			{
				
			}
			 public function mouseOver(e:MouseEvent):void 
			{
				mc.removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
				mc.addEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico

				
			}
			public function mouseOut(e:MouseEvent):void 
			{
				mc.addEventListener(MouseEvent.ROLL_OVER, mouseOver);
				mc.removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
				////comportamiento especifico

			}
			public function setVisibilidad(visi:Boolean) {
				mc.visible = visi;
				}
				
			public function getNumero():Number {
					
				var texto:Number = (Number)(mc.name.replace("boton", ""));
				return texto;
					}
			public function getName():String {
						return mc.name;
						}
			public function retornaObjeto():Object {			
				return mc;
				}
			public function moverObjeto(x:Number, y:Number):void
			{			
				 this.mc.x=x;
				 this.mc.y=y;
			}
		
	}
	
}
