package com.control
{
	/**
	 * ...
	 * @author CArlos
	 */
	import com.botones.*;
	import com.greensock.data.TweenMaxVars;
	import flash.display.MovieClip;
	import flash.events.*;  
	import flash.utils.getQualifiedClassName;
	import com.control.Global;
	
	public class LPMenu extends MovieClip
	{
		private var numTemaActual:Number=0;
		private var yaVisitado:Array= new Array();	
		private var contSecuendia:Number = 0;
		private var temaDisponible:Array = new Array();
		private var secuencial:Boolean = true;
		private var arrTemas:Array = new Array();
		private var arrBotonesPrinci:Array = new Array();
		private var estaEnTema:Boolean = false;
		private var global:Global;//<----- isntancia singleton del global si necesita algun elemento
		private var stageTmp;
		function LPMenu(arrTemas:Array,arrBotonesPrinci:Array,secuencial) 
		{
			this.secuencial = secuencial;
			this.arrTemas = arrTemas;
			this.arrBotonesPrinci = arrBotonesPrinci;
			for (var i:Number = 0; i < arrTemas.length; i++) {
				//this.arrTemas[i].ocultarTodo();
				this.temaDisponible.push(false);
				this.yaVisitado.push(false);
			}

			this.temaDisponible[0] = true;//el primer tema siempre sera visible
			if (!secuencial) {
					for (i = 0; i <this.arrTemas.length; i++) 
					{
					this.temaDisponible[i] = true;
					//this.yaVisitado[i] = true;
					}     
				}
				/////////////////////////
			//	global = Global.getInstance();
				//stageTmp = global.stage;
			
		}//fin funcion
	
		public function verTema(numTema) 
		{
			if (this.secuencial) {
				if (this.temaDisponible[numTema])
				{
					this.numTemaActual = numTema;
					this.ocultarBotonesPrinci();
					this.arrTemas[numTema].empezarTema();
					estaEnTema = true;
					if (this.contSecuendia < (this.arrTemas.length - 1)) // se le resta uno por que empieza desde 0
					{
						this.contSecuendia = numTema + 1;
					}
					this.temaDisponible[this.contSecuendia] = true;
					////////////////////
					this.yaVisitado[numTema]=true;

				}
			} else {
				
				this.numTemaActual = numTema;
				this.ocultarBotonesPrinci();
				this.arrTemas[numTema].empezarTema();
				estaEnTema = true;
				this.yaVisitado[numTema]=true;
				//////////////////////
			}
		};
		public function getYaVisitado(num) {
			return this.yaVisitado[num];
		}
		public function setYaVisitado(num,bool) {
			return this.yaVisitado[num]=bool;
		}

		public function setTemaDisponible(num,bool) {
			return this.temaDisponible[num]=bool;
		}
//////vio todos
		public function siVioTodosLosTemas() 
		{
			var siLosVio=false;
			var cont=0;
		   
			for (var i:Number = 0; i < this.yaVisitado.length; i++) {
				//trace(this.yaVisitado[i]);
				if (this.yaVisitado[i]) {
				   cont++; 
				}
			}
			if (cont>=this.yaVisitado.length) {
					siLosVio=true;
				}
			return siLosVio;
		}
		public function siTodosDisPonibles() 
		{
			var siLosVio=false;
			var cont=0;
		   
			for (var i:Number = 0; i < this.temaDisponible.length; i++) {
				if (this.temaDisponible[i]) {
				   cont++; 
				}
			}
			if (cont>=this.temaDisponible.length) {
					siLosVio=true;
				}
			return siLosVio;
		}
//////vio todos
		public function siTemaDispo (num) 
		{
			//trace(this.temaDisponible);
			return this.temaDisponible[num];
		}
	public function volverMenu() 
	{
		this.verBotonesPrinci();
		this.arrTemas[this.numTemaActual].ocultarTodo();//ponerle a todo el puto this...
		estaEnTema = false;
		/////////////////////////////////<--------------------------------------------------------
	};
	public function verBotonesPrinci() {
		for (var i:Number = 0; i < this.arrBotonesPrinci.length; i++) {
			this.arrBotonesPrinci[i].visible=true;
		}
	};
	public function ocultarBotonesPrinci() {
		for (var i:Number = 0; i < this.arrBotonesPrinci.length; i++) {

			this.arrBotonesPrinci[i].visible=false;
		}
	};
	public function verBtnSigui(visi) {
		this.arrTemas[this.numTemaActual].getBntSigui().visible = visi;
	};
	public function verBtnAnte(visi) {
		this.arrTemas[this.numTemaActual].getBtnAnte().visible = visi;
	};
	public function getTemaActual(numTema) {
		return   this.arrTemas[numTema];
	};
	public function getTemaActualSLideActual() {
		return   this.arrTemas[numTemaActual].getArrSlide()[ this.arrTemas[numTemaActual].getSlideActual()]; ;
	};
	public function getNumTemaActual() {
		return   this.numTemaActual;
	};
	public function siEstaEnTema() {
		return   estaEnTema;
	};
	public function setSecuencial(secuencial) {// o.o tecal rapida desactiva secuencial
		for (var i:int = 0; i <this.arrTemas.length; i++) 
					{
					this.temaDisponible[i] = secuencial;
					//this.yaVisitado[i] = secuencial;
					}   
		this.secuencial = secuencial;
	};
	public function verVolver(visi) {// o.o tecal rapida desactiva secuencial
		//if (this.numTemaActual!=0) //<--------------------------------------------------------------------------------------
		//{
			this.arrTemas[this.numTemaActual].visiVolver(visi);
		//}
		//animacion

	};
		
	}
	
}