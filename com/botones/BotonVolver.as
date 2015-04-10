package  com.botones
{
	
	/**
	 * ...
	 * @author CArlos
	 */
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*; 
	import flash.display.DisplayObject;
	
	public class BotonVolver extends Botones
	{
		private var mc:MovieClip;
		private var visivilidad:Boolean = true;
		public static var botonesPrin:Array = new Array();
		public static var numBotVolver:int = 0;
		
		public function BotonVolver(target:Object, visi:Boolean) {
				numBotVolver++;
				super(target, visi);
				
			}

	}
	
}