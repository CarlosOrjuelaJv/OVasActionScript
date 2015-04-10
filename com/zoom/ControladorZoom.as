package com.zoom
{
	import com.botones.*;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	/**
	 * ...
	 * @author CArlos
	 */
	public class ControladorZoom extends MovieClip 
	{
		private var btnZoomArr:Array = new Array();
		private var imaZoomArr:Array = new Array();
		private var ArrCerrar:Array = new Array();
		private var zoomActual:Number = 0;
		private var imaZoom:Array = new Array();
		
		private var estaEnZoom:Boolean = false;
		// private var NumParteZoom:Array = new Array("no se lee",5,4,4,10,0);//numero de partes en los zoom a animar
		 private var NumParteZoom:Array = new Array();//numero de partes en los zoom a animar
		function ControladorZoom(btnZoom:Array,imaZoom:Array,fondoZoom:MovieClip) {
			this.imaZoom = imaZoom;
			for (var i:int = 0; i <btnZoom.length ; i++) 
				{
					
					this.btnZoomArr.push(new BotonZoom(btnZoom[i], true));
					this.imaZoomArr.push( new Zoom(imaZoom[i], fondoZoom, false));
					this.ArrCerrar.push(new BotonCerrar(imaZoom[i].cerrarZ, true));
					this.btnZoomArr[i].retornaObjeto().addEventListener(MouseEvent.CLICK, verZoom);
					this.ArrCerrar[i].retornaObjeto().addEventListener(MouseEvent.CLICK, cerrar);
					///busca las partes del Zoom para animarlas
					var parConZoom:Number = 0;
					
					for (var j:int = 0; j< imaZoom[i].numChildren ; j++) 
					{
						
						var index:int = imaZoom[i].getChildAt(j).name.indexOf("p");
						// trace(stage1.getChildAt(i).name);
						if (index != -1)
						{
							parConZoom++;
							
						}
						
					}
					
					NumParteZoom.push(parConZoom);
				}
				
				
				
			
			}
			
			private function cerrar(e:MouseEvent):void 
			{
				this.imaZoomArr[(zoomActual - 1)].setVisibilidad(false);
				estaEnZoom = false;
			}
			
			private function verZoom(e:Event):void 
			{
				
				zoomActual = (Number)(e.currentTarget.name.replace("lupa", ""));
				//trace((this.imaZoomArr[(zoomActual - 1)] as Zoom).getName());
				this.imaZoomArr[(zoomActual - 1)].setVisibilidad(true);
				estaEnZoom = true;
				animacionZoom(zoomActual-1);
			}
			public function siEStaEnZoom():Boolean {//controla si tiene el Zoom activo
				return estaEnZoom;
				}
			////animacion de los Zoom, llega como parametro el numero del zoom, las partes se deben llamar p+num;...p1, p2, p3
			var parteZoom:Array;
			private function animacionZoom(numZoom:int):void {
				
				parteZoom= new Array();
				 var x = 0.2;
				for (var i:int = 0; i <(imaZoom[numZoom].numChildren-1) ; i++) 
				{
					TweenMax.from(imaZoom[numZoom].getChildAt(i), 0.3, {scaleX:0, scaleY:0, delay:x});
						x += 0.1;
				}
				
				var timelineZoom:TimelineMax = new TimelineMax( { onComplete:vaciarArreglo } );
				if (parteZoom!=null) 
				{
					//trace(numZoom);
					/*if ( numZoom==0) 
					{
						timelineZoom.insertMultiple( TweenMax.allFrom(parteZoom, 1, { delay:0.5, scaleX: 0, scaleY: 0, ease:Elastic.easeOut }, 0.4), 0.1);
						var arrTemp:Array;
						arrTemp=parteZoom.slice(1,8);
						rollZoom(arrTemp, numZoom);
						
					}else
					if ( numZoom==1) 
					{
						//trace(parteZoom);
						timelineZoom.insertMultiple( TweenMax.allFrom(parteZoom, 1, { delay:0.5, scaleX: 0, scaleY: 0, ease:Elastic.easeOut }, 0.4), 0.1);
					
						var arrTemp:Array;
						arrTemp=parteZoom.slice(1,7);
						rollZoom(arrTemp, numZoom);
						
					}
					else 
					{
						timelineZoom.insertMultiple( TweenMax.allFrom(parteZoom, 1, { delay:0.5, scaleX: 0, scaleY: 0,ease:Elastic.easeOut }, 0.4), 0.1);
					}*/
				}
				
					
				}//fin funcion 
				
				private function vaciarArreglo():void 
				{
					parteZoom = null;
					trace("vacia");
				}//fin funcion
				
				private function rollZoom(arrBtn:Array, numZoom:int):void {
					//trace(arrBtn.length);
					for (var i:int = 0; i <(arrBtn.length) ; i++) 
					{
						//trace(arrBtn[i].name);
					(arrBtn[i] as MovieClip).buttonMode = true;
						//trace(imaZoom[numZoom].getChildByName("r" + (Number)((arrBtn[i] as MovieClip).name.replace("p", ""))).name);
						(imaZoom[numZoom].getChildByName("r" + (Number)((arrBtn[i] as MovieClip).name.replace("p", ""))) as MovieClip).scaleX = 0;
						(imaZoom[numZoom].getChildByName("r" + (Number)((arrBtn[i] as MovieClip).name.replace("p", ""))) as MovieClip).scaleY = 0;
						arrBtn[i].addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
								var num = (Number)(e.currentTarget.name.replace("p", ""));								
								TweenMax.to(imaZoom[numZoom].getChildByName("r" + num), 1, {  scaleX: 1, scaleY: 1, ease:Elastic.easeOut });
							});
					}
					
				}//fin funcion
		
	}
	
}