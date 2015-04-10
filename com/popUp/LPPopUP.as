package com.popUp
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;  
	import flash.display.MovieClip;
	import com.control.Global;
	/**
	 * ...
	 * @author CArlos
	 */
	public class LPPopUP extends MovieClip 
	{
		private var fondoOpa:Object;
		private var arrPop:Array = new Array();
		private var popUpActual:Number;
		private var popDisponible:Array= new Array();
		private var popYaVistos:Array= new Array();
		private var global:Global;//<----- isntancia singleton del global si necesita algun elemento
		private var stageTmp;
		private var numPopUps:Number;
		function  LPPopUP(arrPop, fondoOpa) {
			
				//publicas
				this.popUpActual;
				this.popDisponible= new Array();
				this.popYaVistos= new Array();
				this.arrPop = arrPop;
			   
				this.fondoOpa;
				if (fondoOpa!="none") {
					 this.fondoOpa = fondoOpa;
				}
				
				this.numPopUps = arrPop.length;
				for (var i:Number = 0; i < arrPop.length; i++) {
				   this.popDisponible.push(false);
				   this.popYaVistos.push(false);
				   this.arrPop[i].x = 0;
				   this.arrPop[i].y = 0;
				}
				this.popDisponible[0]=true;
				//this.popDisponible[1]=true;
				this.popUpActual = 0;
				this.cerrarPopUp();
				
				/////////////////////////
				//global = Global.getInstance();
				//stageTmp = global.stage;
			}
			
			//obtiene el array de slides
			public function getArrPop() {
				return this.arrPop;
			};
			public function  getPopUpActual() {
				return this.popUpActual;
			};
//retorna el fondo opa
			public function getFondoOpa() {
				return this.fondoOpa;
			};
//retorna el fondo opa
			public function getPopYaVistos(num) {
				return this.popYaVistos[num];
			};
//retorna los popVistos
			public function getDisponible(num) {
				return this.popDisponible[num];
			};
//setea los popVistos
			public function setVisiPops(visibili) {
				for (var i:Number = 1; i < this.arrPop.length; i++) {
				   this.popDisponible[i]=visibili;
				}
			};
//
public function siVioTodosLosPop() {
				var siLosVio=false;
				var cont=0;
		   
				for (var i:Number = 0; i < this.popYaVistos.length; i++) {
				//trace(this.popYaVistos[i]);
				if (this.popYaVistos[i]) {
					
				   cont++; 
				}
				}
				if (cont>=this.popYaVistos.length) {
					siLosVio=true;
				}
			return siLosVio;
			};
//retorna los popVistos
			public function  verPopUp(num) {
				//trace(num);
				var estado=false;
				if (num>=0 && num < this.arrPop.length && this.popDisponible[num]) {
					this.cerrarPopUp();
					this.fondoOpa.visible = true;//<------
					this.popUpActual=num;
					this.arrPop[(num)].visible=true;// empieza desde 0
					estado=true;
					if (num< (this.arrPop.length-1)) {
						this.popDisponible[num+1]=true;
					}
					this.popYaVistos[num]=true;
				}
				return estado;
			};

			//retorna los popVistos
			public function cerrarPopUp() {
				this.fondoOpa.visible = false;//<------
				for (var i:Number = 0; i < this.arrPop.length; i++) {
				   this.arrPop[i].visible=false;;
				}

			};
	}
	
}