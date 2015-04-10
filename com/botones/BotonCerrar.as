package  com.botones
{
	
	/**
	 * ...
	 * @author CArlos
	 */
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;  
	
	public class BotonCerrar extends Botones
	{
		private var mc:MovieClip;
		private var visivilidad:Boolean = true;

		
		public function BotonCerrar(target:Object, visi:Boolean) {
			
				super(target, visi);
			}
	}
}