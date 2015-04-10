package com.control
{
	
	/**
	 * ...
	 * @author CArlos
	 */
	import com.greensock.*;
	import com.popUp.LPPopUP;
	import com.slide.*;
	import com.control.Global;
	
	public class LPTema 
	{
		private var slideActual:Number;
		private var slidesVistos:Array = new Array();
		private var boolViotema:Boolean = false;
		private var arrSlide:Array = new Array();
		private var bntSigui:Object;
		private var btnAnte:Object;
		private var btnVolver:Object;
		private var fondoOpa:Object;
		private var numSlide:Number;
		private var global:Global;//<----- isntancia singleton del global si necesita algun elemento
		private var stageTmp;
		function LPTema(arrSlide:Array, bntSigui:Object, btnAnte:Object, btnVolver:Object, fondoOpa:Object) 
		{
			//trace(arrSlide,bntSigui,btnAnte,btnVolver,fondoOpa);
			
				this.slideActual;
				this.slidesVistos = new Array();
				this.boolViotema = false;
				this.arrSlide = arrSlide;
				this.bntSigui = bntSigui;
				this.btnAnte = btnAnte;
				this.btnVolver = btnVolver;
				this.fondoOpa = fondoOpa;
				this.numSlide = arrSlide.length;
		try{
				for (var i:Number = 0; i < arrSlide.length; i++) {
					this.slidesVistos.push(false);
					this.arrSlide[i].x = 0;///<--------------pos inicial
					this.arrSlide[i].y = 0;//<-----------------------------------------------------------------------------------------------------------------------------
				}
		} catch (Error) {
				
				trace("falta algun Slide....");
		}
				this.slidesVistos[0] = true;
				this.slideActual = 0;
				this.ocultarTodo();
				/////////////////////////
				global = Global.getInstance();			
				stageTmp = global.stage;
				//trace('global.stage ' + stageTmp)
		}//fin funcion
	public function visiFondo(visi) {
		return this.fondoOpa=visi;
	};	//fin funcion	
	//cambia pos inicial
	public function setPosInicial(x, y) 
	{
		for (var i:Number = 0; i < arrSlide.length; i++) 
		{
			this.arrSlide[i].x = x;
			this.arrSlide[i].y = y;
		}	
	};//fin funcion
	public function getArrSlide() {
		return this.arrSlide;
	};//fin funcion
//obtiene el array de slides
	public function getVioTemaCompleto() {
		return this.boolViotema;

	};//fin funcion
//obtiene el div con el btn sigui
	public function getBntSigui() {
		return this.bntSigui;
	};//fin funcion
//obtiene el div con el btn anterior
	public function getBtnAnte() {
		return this.btnAnte;
	};//fin funcion
//obtiene el div de btn volver
	public function getBtnVolver() {
		return this.btnVolver;
	};//fin funcion
//retorna slides vistos
	public function getSlidesVistos() {
		return this.slidesVistos;
	};//fin funcion
//retorna slides vistos
	public function visiVolver(visi:Boolean) {
			this.btnVolver.visible=visi;;
	};//fin funcion
//muestra el primer slide del tema
	public function empezarTema() {
		this.arrSlide[0].visible=true;
		if (this.numSlide > 1) {
			this.bntSigui.visible=true;
		}
		if (this.numSlide == 1) {//si solo tiene un slide muestra volver<------------------------------------------------------------------------
			 this.btnVolver.visible=true;
		}
		if (this.boolViotema) {
			this.btnVolver.visible=true;
		}
		this.fondoOpa.visible=true;
		///animaciones personalizadas


	};//fin funcion
////controla click al boton siguiente slide
	public function siguSlide() {


		if (this.slideActual < (this.numSlide - 1)) {
			this.ocultarSlide();
			this.btnAnte.visible=true;
			this.slideActual++;
			this.bntSigui.visible=true;
			this.arrSlide[this.slideActual].visible=true;
			TweenMax.to(this.arrSlide[this.slideActual], 0, {alpha:0});
			TweenMax.to(this.arrSlide[this.slideActual], 0.5, {alpha:1});
		}
		if (this.slideActual >= (this.numSlide - 1)) {
			this.bntSigui.visible=false;
			this.btnVolver.visible=true;
			
			this.boolViotema = true;
			//animacion

		}
		;
	};//fin funcion
//oculta todo
	public function ocultarSlide() {

		for (var i:Number = 0; i < this.numSlide; i++) {
			this.arrSlide[i].visible=false;;
		}
		this.bntSigui.visible=false;
		this.btnAnte.visible=false;
		if (!this.boolViotema) {
			this.btnVolver.visible=false;
		}

	};//fin funcion
//oculta todo
	public function ocultarTodo() {

		for (var i:Number = 0; i < this.numSlide; i++) {
			this.arrSlide[i].visible=false;
		}
		this.fondoOpa.visible=false;
		this.bntSigui.visible=false;
		this.btnAnte.visible=false;
		this.btnVolver.visible=false;
		this.slideActual = 0;

	};//fin funcion
////controla click al boton anterior slide
	public function antSlide() {

		if (this.slideActual >= 1) {
			this.ocultarSlide();
			this.bntSigui.visible=true;
			this.slideActual--;
			this.btnAnte.visible=true;;
			this.arrSlide[this.slideActual].visible = true;
			///////////<--------------------------------------------------------
			TweenMax.to(this.arrSlide[this.slideActual], 0, {alpha:0});
			TweenMax.to(this.arrSlide[this.slideActual], 0.5, { alpha:1 } );
			
		}
		if (this.slideActual < 1) {
			this.btnAnte.visible=false;;
		}

		
	};//fin funcion
	
	public function getSlideActual () {
		return this.slideActual;
	};//fin funcion
	public function getSlideActualMovieClip () {
		return this.arrSlide[this.slideActual];
	};//fin funcion
	
	public function llegoLimite() {
		var limite = false;
		if (this.slideActual < 1) {
			limite = true;
		}
		if (this.slideActual >= (this.numSlide - 1)) {
			limite = true;
		}
		return limite;
	};//fin funcion
		
	}
	
}