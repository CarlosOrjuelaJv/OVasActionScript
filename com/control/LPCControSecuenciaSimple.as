package com.control
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import com.greensock.*;
	import com.greensock.text.SplitTextField;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.*;
	import com.control.Global;
	
	/**
	 * ...
	 * @author CArlos
	 */
	public class  LPCControSecuenciaSimple extends MovieClip
	{
		var btnSi:Object;
		var btnAnte:Object;
		var arrSecuen:Array;
		var runo:SimpleButton;
		var secActual:Number;
		private var global:Global;//<----- isntancia singleton del global si necesita algun elemento
		private var stageTmp;
		
		private  static var numeroSecuen:Number = 0;	
		var animaBtn:TimelineMax;
		function LPCControSecuenciaSimple(arrSecuen, btnSi, btnAnte) {
				numeroSecuen++;
				global = Global.getInstance();			
				stageTmp = global.stage;
		
				this.btnSi=btnSi;
				this.btnAnte=btnAnte;
				this.secActual=0;
				this.arrSecuen = arrSecuen;
				
				animaBtn = new TimelineMax();
				//console.log(this.btnSi, this.btnAnte,this.arrSecuen);
					for (var i:int = 1; i < arrSecuen.length; i++) {
							this.arrSecuen[i].visible = false;
					}
				if (arrSecuen.length>1) {
					this.btnSi.visible = true;
					this.btnAnte.visible = false;
				}else{
					this.btnSi.visible = true;
					this.btnAnte.visible = false;      
				}
				this.arrSecuen[0].visible = true;
			global["secSimpl" + numeroSecuen] = this;
		}
			
		public function siguiente() 
		{  
			if (this.secActual< (this.arrSecuen.length-1)) {
				this.secActual++;
				this.actualizar();
				this.btnAnte.visible = true;   
			} 
			if (this.secActual==(this.arrSecuen.length-1)) {
				this.btnSi.visible = false;
			}
		}
		
		public function anterior() 
		{
			if (this.secActual>0) {
				this.secActual--;
				this.actualizar();
				 this.btnSi.visible = true;
			}
			if (this.secActual==(0)) {
				this.btnAnte.visible = false;   
			}
				
		}
		
		private function actualizar()  
		{
			for (var i:int= 0; i < this.arrSecuen.length; i++) {
						this.arrSecuen[i].visible = false; 
				}
				this.arrSecuen[this.secActual].visible = true; 
				animaBtn.append(TweenMax.to(this.arrSecuen[this.secActual], 0.01, {alpha:0}), 0);
				animaBtn.append(TweenMax.to(this.arrSecuen[this.secActual], 1, {alpha:1}), 0);
		}  
	}
}

