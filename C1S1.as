package  {
	

	import com.botones.*;
	import com.greensock.*;
	import com.control.*;
	import com.popUp.LPPopUP;
	import com.zoom.ControladorZoom;
	import com.slide.*;
	import com.toolBar.*;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import com.greensock.text.SplitTextField;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.*;
	import com.control.Global;
	import com.utils.LPResalteGenerico;
	/////////////////////////
	import flash.net.LocalConnection;
	import flash.net.URLRequest;
	import fl.display.ProLoader;
	import com.control.LPCControSecuenciaSimple;
	
	public class C1S1 extends MovieClip {//funciona reconociendo los nombres de los movieClips , los unicos que toca anexar soon los zoom esa parte
		

		
		var zoomNames:Array ;
		var imaZoom:Array = new Array();
		var btnZoom:Array = new Array();
		var zoomBtn:Array = new Array();
		var sigArrMc:Array = new Array();
		var atraArrMc:Array = new Array();
		var volArrMc:Array = new Array(); 
		var secuencial:Boolean = false;
		var barTool1:MovieClip;
		var timelineInicial=new TimelineMax( );
		var timelIniCurso = new TimelineMax( );
		var soloUnaVez = true;
		var global:Global;
		
		///////////////////
		public var contromenuPrinci:LPMenu;
		public var contromenuTema2:LPMenu;
		public var controPopTema1:LPPopUP;
		public var controPopTema2:LPPopUP;
		var inicioTmL:TimelineMax;
		var instrucTmL:TimelineMax;
		var estrucTmL:TimelineMax;
		var errorTmL:TimelineMax;
		var verContenido:TimelineMax;
		var soloUnaGlowPrimBoton = true;
		//////////////////////////////
		//conexion
		//var conexionLocal:LocalConnection = new LocalConnection();
		//var conexionLocal2:LocalConnection = new LocalConnection();
		//var url:Array = new Array("no se lee","Act__4.swf");//se llama a los 2 swf que se van a cargar <------------------------------------------------linea de black board
		//var url:Array = new Array("no se lee","/bbcswebdav/xid-218477179_4");//se llama a los 2 swf que se van a cargar <------------------------------------------------linea de black board
		//var fl_ProLoader_1:ProLoader = new ProLoader();
		public function C1S1() {
			///conexion
			/*try 
			{
				conexionLocal.connect("tema1");
				conexionLocal.client = this;
			}catch (err:Error)
			{
				trace("error de conexion1");
				
			}*/
			/*for (var k:int = 1; k <=url.length-1; k++)
			{
				fl_ProLoader_1.load(new URLRequest(url[k]));
				addChild(fl_ProLoader_1);
				fl_ProLoader_1.visible = false;	
				
			}*/
			btnError.visible = false;
			//estruc.visible = false;
			//instruc.visible = false;
			estBtn.visible = false;
			insBtn.visible = false;

//			volverPrinci.buttonMode = true;
			boton1.buttonMode = true;
			boton2.buttonMode = true;
			boton3.buttonMode = true;
			
			volverPrinci.buttonMode = true;
			/////////////////////////////////
			//se indica si es secuencial
			secuencial = true;
			zoomNames = new Array();///si no tiene Zoom no poner, no quitar la linea de codigo
			//zoomNames = new Array();///si no tiene Zoom no poner, no quitar la linea de codigo

			new LPResalteGenerico(volverPrinci, "clic");
			new LPResalteGenerico(siguientePrinci, "clic2");
			new LPResalteGenerico(siguienteTema2, "clic2");
			new LPResalteGenerico(slide2_1.boton2 , "clicBtnBlanco");
			new LPResalteGenerico(slide3_1.boton2 , "clicBtnBlanco");
			//new LPResalteGenerico(slide1_3.boton1, "clicBtnBlanco");
			
			

			for (var i:int = 1; i <=7 ; i++) 
			{
				//this["zoom" + i].visible = false;
				if (i<4) 
				{
					(slide3_1.getChildByName("boton" + i) as MovieClip).buttonMode = true;
				}
				if (i<7) 
				{
					(slide2_1.getChildByName("boton" + i) as MovieClip).buttonMode = true;
				}
			}
			for ( i = 1; i <=3; i++) 
			{
				this["roll" + i].scaleX = 0;
				this["roll" + i].scaleY = 0;
				this["boton" + i].addEventListener(MouseEvent.ROLL_OVER, manageMouseOver, false, 0, true);

			}
			//animaciones iniciales
		
			
			var arrCosas:Array = new Array();
			for (var j:int = 1; j <=26; j++) 
			{
			//	arrCosas.push((cosas as MovieClip).getChildByName("f"+j));
			}
			
			//verContenido = new TimelineMax(  );
			//verContenido.call(function() { } );
			//verContenido.append(TweenMax.to(boton2, 0, { x:460.7 ,rotationY:0,alpha:1,scaleX:1,scaleY:1,y:201.95 } ), 0);//
			//verContenido.append(TweenMax.to(boton2, 0.5, { x:771 ,rotationY:15 } ), 0);//
			//verContenido.append(TweenMax.to(boton2, 1, { x:273 ,rotationY:0,scaleX:1.4,scaleY:1.4,y:120} ), 0);//
			///verContenido.append(TweenMax.to(boton2, 0.5, { alpha:0 } ), 0);//
			//verContenido.stop();
			/*
			fondoTmL = new TimelineMax( { delay:1, onComplete:function() { instrucTmL.restart(); }} );
			fondoTmL.appendMultiple(TweenMax.allFrom([r1,r2,r3,r4,r5], 1, { scaleX:0, scaleY:0, ease:Elastic.easeOut }, 0.2), 0);
			fondoTmL.appendMultiple(TweenMax.allFrom([e1,e2,e3,e4], 1, { scaleX:0, scaleY:0, ease:Elastic.easeOut }, 0.2), 0);
			*/
			inicioTmL = new TimelineMax(  );
			inicioTmL.append(TweenMax.from(paisaje, 1, { x:1600  } ), 0);//
			inicioTmL.appendMultiple(TweenMax.allFrom([ed1, ed4,ed3,ed2], 1, { y:-89, ease:Bounce.easeOut }, 0.2), 0);
			inicioTmL.appendMultiple(TweenMax.allFrom([a1,a2,a3,a4,a5,a6,a7,a8], 1, { scaleY:0, ease:Back.easeOut }, 0.2), 0);
			inicioTmL.appendMultiple(TweenMax.allFrom([c1,c2,c3], 1, { y:-89, ease:Bounce.easeOut }, 0.2), 0);
			inicioTmL.appendMultiple(TweenMax.allFrom([n1,n2,n3,n4,n5], 1, { scaleY:0,scaleX:0, ease:Elastic.easeOut }, 0.2), 0);
			inicioTmL.appendMultiple(TweenMax.allFrom([boton3,glob3], 2, { scaleY:0,scaleX:0, ease:Elastic.easeOut }, 0.5), 0);
			inicioTmL.appendMultiple(TweenMax.allFrom([boton2,glob2], 2, { scaleY:0,scaleX:0, ease:Elastic.easeOut }, 0.5), 0);
			inicioTmL.appendMultiple(TweenMax.allFrom([boton1,glob1], 2, { scaleY:0,scaleX:0, ease:Elastic.easeOut }, 0.5), 0);
			inicioTmL.call(function() {  
				if (soloUnaGlowPrimBoton) 
				{
					new LPResalteGenerico(boton1, "clicBtnBlanco"); 
					soloUnaGlowPrimBoton = false;
				}
				
				insBtn.visible = true;
				estBtn.visible = true;
			} );
			inicioTmL.stop();
			
			instrucTmL = new TimelineMax( { } );
			instrucTmL.append(TweenMax.to(instruc, 0, {scaleY:0,scaleX:0} ), 0);//
			instrucTmL.append(TweenMax.to(instruc, 0.5, {scaleY:1,scaleX:1} ), 0);//
			instrucTmL.append(TweenMax.from(instruc.mundo, 1, {x:-523,rotationZ:-360, ease:Back.easeOut} ), 0);//
			instrucTmL.append(TweenMax.from(instruc.person, 1, {y:-132,ease:Bounce.easeOut} ), 0);//
			instrucTmL.appendMultiple(TweenMax.allFrom([instruc.g1, instruc.g2, instruc.g3], 1, { rotationX: -180,alpha:0,ease:Back.easeOut }, 0.2), 0);
			instrucTmL.append(TweenMax.from(instruc.globo, 2, {scaleY:0, scaleX:0,ease:Bounce.easeOut} ), 0);//
			instrucTmL.append(TweenMax.from(instruc.volver, 1, { scaleY:0, scaleX:0, ease:Elastic.easeOut } ), 0);//
			
			
			estrucTmL = new TimelineMax( );
			estrucTmL.append(TweenMax.to(estruc, 0, {scaleY:0,scaleX:0} ), 0);//
			estrucTmL.append(TweenMax.to(estruc, 1, {scaleY:1,scaleX:1} ), 0);//
			estrucTmL.append(TweenMax.from(estruc.papel, 1, {x:-540, ease:Back.easeOut} ), 0);//
			estrucTmL.append(TweenMax.from(estruc.volver, 1,  {scaleY:0,scaleX:0,ease:Elastic.easeOut}), 0);//
			estrucTmL.stop();
			
			errorTmL = new TimelineMax();
			errorTmL.append(TweenMax.from(error, 0.5, { scaleX:0,scaleY:0  } ), 0);//
			errorTmL.append(TweenMax.from(error.infoMC, 0.5, {x:-693,rotationY:45,ease:Back.easeOut  } ), 0);//
			errorTmL.append(TweenMax.from(error.cerrar, 0.5, {scaleX:0,scaleY:0,ease:Elastic.easeOut  } ), 0);//
			errorTmL.stop();

			//buttonMode
		
			//eventos
			insBtn.addEventListener(MouseEvent.CLICK, abrirInstruc);
			instruc.volver.addEventListener(MouseEvent.CLICK, cerrarInstruc);
			estBtn.addEventListener(MouseEvent.CLICK, abrirEstruc);
			estruc.volver.addEventListener(MouseEvent.CLICK, cerrarEstruc);
			error.cerrar.addEventListener(MouseEvent.CLICK, cerrarError);
			btnError.addEventListener(MouseEvent.CLICK, abrirError);
			///////////////////////////////////////////////////////////////
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);///ejecuta el evento cuando se carga el stage
		}//fin funcion
		
		private function cerrarError(e:MouseEvent):void 
		{
			//error.visible = false;
			errorTmL.reverse(2);
			
		}
		private function abrirError(e:MouseEvent):void 
		{
			errorTmL.restart();
		}
		
		
		
	
		//////////////////////
		var soloUna2:Boolean = true;
		private function cerrarEstruc(e:MouseEvent):void 
		{
			//estruc.volver.visible = false;
			estrucTmL.reverse(2);
			insBtn.visible = true;
			estBtn.visible = true;
			if (soloUna2) 
			{
				TweenMax.delayedCall(2,function(){ inicioTmL.restart();  });
				
				soloUna2 = false;
			}
		}//fin funcion
		
		private function abrirEstruc(e:MouseEvent):void 
		{
		
			insBtn.visible = false;
			estBtn.visible = false;
			estrucTmL.restart();
		}//fin funcion
		
		var soloUna:Boolean = true;
		private function cerrarInstruc(e:MouseEvent):void 
		{
			//instruc.visible = false;
			//fondoPrinci2.visible = false;
			insBtn.visible = true;
			estBtn.visible = true;
			instrucTmL.reverse(2);
			if (soloUna) 
			{
				new LPResalteGenerico(estBtn, "clic3");
				soloUna = false;
			}
		}
		
		private function abrirInstruc(e:MouseEvent):void 
		{
			 instruc.visible = true;
			insBtn.visible = false;
			estBtn.visible = false;
			instrucTmL.restart();
		}//fin funcion
		
		
		
		//la mejor manera de hacer un roll_over
		  var nombreBotonTemp:Number;
		function manageMouseOver(event:MouseEvent):void {
			//trace("entra");
		 event.target.removeEventListener(MouseEvent.ROLL_OVER, manageMouseOver);
		event.target.addEventListener(MouseEvent.ROLL_OUT, manageMouseOut, false, 0, true);
		  //your over code here
		   nombreBotonTemp = (Number)(event.target.name.replace("boton", ""));
		 //  trace(nombreBotonTemp);
		  TweenMax.to(this["roll" + nombreBotonTemp], 0.5, { scaleY:1, scaleX:1 } );
		  
		}//fin funcion
		 
		function manageMouseOut(event:MouseEvent):void{
		  event.target.removeEventListener(MouseEvent.ROLL_OUT, manageMouseOut);
			event.target.addEventListener(MouseEvent.ROLL_OVER, manageMouseOver, false, 0, true);
		  //your out code here
		  var nombreBotonTemp:Number = (Number)(event.target.name.replace("boton", ""));
		  TweenMax.to(this["roll" + nombreBotonTemp], 0.5, { scaleY:0, scaleX:0} );
		  
		}//fin funcion
	

		


		
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function addedToStageHandler(e:Event):void {//funcion llama solo al cargar el stage
			 removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			 ///////////////////////////////
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHand);
			global = Global.getInstance();
			global.stage = this;
			var object:Object = this;
			 /////si tiene Zooms, se puede tambien poner por el controlador
			for (var k:int = 0; k <zoomNames.length ; k++) 
			{
				imaZoom.push(this["zoom" + (k + 1)]);
				zoomBtn.push(zoomNames[k].getChildByName("lupa" + (k + 1)));
				new LPResalteGenerico(zoomBtn[k], "clic3");
			}
			//var controlZoom:ControladorZoom=new ControladorZoom(zoomBtn, imaZoom, fondoZoom);
			crearMenuPrinci();///<-----------------------------------
			crearMenuTema2();
			crearMenuTema3();
			//secuenciaSimple1();
			//secuenciaSimple2();
			
			
		}//fin funcion

		private function keyDownHand(e:KeyboardEvent):void//evento del ltecldo se le asigna al stage global
		{
			if (e.keyCode == 48) //leef
				{
					
					global.menu1.setSecuencial(false);
				}
			
		}//fin funcion
		
		 function crearMenuPrinci()
         {
											///1,2,3,4,5,6,7,8,9,10,11,12,13,14				
			var subSlidesNum:Array = new Array(1,1,1);//numero subslide
			var controMenu1:LPControInterfaz = new LPControInterfaz(subSlidesNum.length, this, "slide", subSlidesNum, siguientePrinci, anteriorPrinci , volverPrinci, fondoPrinci, true);	
			
        }//fin funcion
		
		function crearMenuTema2()
         {
											///1,2,3,4,5,6,7,8,9,10,11,12,13,14				
			var subSlidesNum:Array = new Array(0,0,0,2,2,0);//numero subslide
			var controMenuTema2:LPControInterfaz = new LPControInterfaz(subSlidesNum.length, slide2_1, "tema2_slide", subSlidesNum, siguienteTema2, anteriorTema2 , volverTema2, fondoTema2, true);	
			(global.menu2 as LPMenu).setYaVisitado(0,true);
			(global.menu2 as LPMenu).setTemaDisponible(1,true);
        }//fin funcion
		
		function crearMenuTema3()
         {
											///1,2,3,4,5,6,7,8,9,10,11,12,13,14				
			var subSlidesNum:Array = new Array(0,0,0);//numero subslide
			var crearMenuTema3:LPControInterfaz = new LPControInterfaz(subSlidesNum.length, slide3_1, "tema3_slide", subSlidesNum, siguienteTema3, anteriorTema3 , volverTema3, fondoTema3, true);	
			(global.menu3 as LPMenu).setYaVisitado(0,true);
			(global.menu3 as LPMenu).setTemaDisponible(1,true);
        }//fin funcion
		
	
		
		function crearMenuPopUp1()
				{
//					var controPop1:LPControPopUPs = new LPControPopUPs(1, slide1, "Tem1pop", fondoPop);
				}
				
		function secuenciaSimple1()
				{
				//	var arraySlides:Array = new Array(tema2_slide4.slide1,tema2_slide4.slide2,tema2_slide4.slide3);//numero subslide
				//	var controPop1:LPCControSecuenciaSimple = new LPCControSecuenciaSimple(arraySlides,tema2_slide4.siguiente, tema2_slide4.anterior);
				//	tema2_slide4.siguiente.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) { (controPop1 as LPCControSecuenciaSimple).siguiente(); } );
				//	tema2_slide4.anterior.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){ (controPop1 as LPCControSecuenciaSimple).anterior(); });
				}
		function secuenciaSimple2()
				{
				//	var arraySlides:Array = new Array(tema2_slide5.slide1,tema2_slide5.slide2,tema2_slide5.slide3);//numero subslide
				//	var controPop2:LPCControSecuenciaSimple = new LPCControSecuenciaSimple(arraySlides,tema2_slide5.siguiente, tema2_slide5.anterior);
				//	tema2_slide5.siguiente.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) { (controPop2 as LPCControSecuenciaSimple).siguiente(); } );
				//	tema2_slide5.anterior.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){ (controPop2 as LPCControSecuenciaSimple).anterior(); });
				}
				

	}
	
}
