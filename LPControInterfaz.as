package 
{
	import com.control.LPMenu;
	import com.control.LPTema;
	import com.popUp.LPPopUP;
	import flash.display.MovieClip;
	import com.control.Global;
	import flash.events.Event;
	import flash.events.*;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.text.SplitTextField;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.*;
	import flash.geom.Point;
	import com.utils.LPResalteGenerico;
	/**
	 * ...
	 * @author CArlos
	 */
	public class LPControInterfaz extends MovieClip 
	{
		private var numBtn:Number;//numero de Botones
		private var subSlidesNum:Array = new Array();//numero subslide
		private	var subSlides:Array = new Array();
		private	var arrTemas:Array= new Array();
		private	var arrBtnPrinci:Array = new Array();
		private var contromenuPrinci:LPMenu;
		private var global:Global;//<----- isntancia singleton del global si necesita algun elemento
		private var stageTmp;
		private  static var numeroMenu:Number = 0;
		var map:Object = { };
		//controla los eventos funcionamiento general
		function LPControInterfaz(numeroBtn:Number,padreBtn:Object,nombreSlide:String, subSlidesNum:Array, btnSiguien:Object, btnAnterior:Object, btnVolver:Object,fondoPrinci:Object,secuencial:Boolean)
		{
			numeroMenu++;
			this.numBtn = numeroBtn;
			this.subSlidesNum = subSlidesNum;
			global = Global.getInstance();			
			stageTmp = global.stage;
			
			//trace(numeroBtn,padreBtn,nombreSlide,subSlidesNum,btnSiguien,btnAnterior,btnVolver,fondoPrinci,secuencial);
			///controlar objetos que estan en el stage
			
				for (var i = 0; i < numBtn; i++)
				 {
					 var tempName:String = "";
					 
					try 
					{
						arrBtnPrinci.push(padreBtn.getChildByName("boton" + (i + 1)));//crea aareglo de botones del menu
						padreBtn.getChildByName("boton" + (i + 1)).addEventListener(MouseEvent.CLICK, verTEmaMenuPrinci);	
					}catch (Error) {
						trace("ERROR----> no se encuentra un boton,revise nombres de los botones del menu...");
						}
					
					subSlides.push(new Array());//crea un array para almacenar los subslides 
					tempName = (nombreSlide + (i + 1));//<--- toma el nombre asignado
					subSlides[i][0] = stageTmp.getChildByName(tempName);
					//trace(tempName);
					for (var j:Number = 1; j <= subSlidesNum[i]; j++)
					{
						tempName = (nombreSlide + (i + 1) + "_" + j);//<--- toma el nombre asignado
						try 
						{
							subSlides[i][j]=stageTmp.getChildByName(tempName); //arreglo de slides del tema
						}catch (Error) {
						trace("ERROR---->no se encuentra un slide o subslide,revise nombres de los slides...");
						}
						
					}
					arrTemas.push(new LPTema(subSlides[i], btnSiguien, btnAnterior, btnVolver, fondoPrinci));	
				 }
				 //eventos
				 btnSiguien.addEventListener(MouseEvent.CLICK, verSiguiente);
				 btnAnterior.addEventListener(MouseEvent.CLICK, verAnterior);
				 btnVolver.addEventListener(MouseEvent.CLICK, volver );
				 //crea el controlador del menu
				 contromenuPrinci = new LPMenu(arrTemas, arrBtnPrinci, secuencial);
				 global["menu" + numeroMenu] = contromenuPrinci;
				 //////////////visibilidad fondo
				 //fondoPrinci.visible = true;
				 
		}
		///controlarlo con los nombres de los botones jeje
		//<--------------------------------------------------------------------------------------------------------------------------------------------------------------------
		private function volver(e:Event):void 
		{
			contromenuPrinci.volverMenu(); 
				//////////////////////////////////////////////
				
			if (e.currentTarget.name=="volverPrinci") 
			{
				(global.menu2 as LPMenu).volverMenu();
				(global.menu3 as LPMenu).volverMenu();
				for (var i:int = 2; i <=3; i++) 
				{
					if (global.menu1.siTemaDispo((i-1))==true && global.menu1.getYaVisitado((i-1))==false) 
					{
						new LPResalteGenerico(global.stage.getChildByName("boton" + i) , "clicBtnBlanco");
					}
				}
				if ((global.menu1 as LPMenu).siVioTodosLosTemas()) 
				{
					global.stage.btnError.visible = true;
					new LPResalteGenerico(global.stage.btnError, "clic");
				}
					
			}

		}
		
		private function verAnterior(e:Event):void 
		{
			contromenuPrinci.getTemaActual(contromenuPrinci.getNumTemaActual()).antSlide();
			//////////////////////////////////
			if (e.target.name=="anteriorPrinci") 
				{
					//trace(global.menu1.getTemaActualSLideActual().name);
					if (global.menu1.getTemaActualSLideActual().name == "slide2") 
					{
						(global.menu2 as LPMenu).volverMenu();
					}	
					
				}
			if (e.target.name=="anteriorPrinci") 
				{
					//trace(global.menu1.getTemaActualSLideActual().name);
					if (global.menu1.getTemaActualSLideActual().name == "slide3") 
					{
						(global.menu3 as LPMenu).volverMenu();
					}
					
				}
		}
		
		private function verSiguiente(e:Event):void 
		{
			 contromenuPrinci.getTemaActual(contromenuPrinci.getNumTemaActual()).siguSlide();	 
			////////////////
			if (e.target.name=="siguientePrinci") 
				{
					//trace(global.menu1.getTemaActualSLideActual().name);
					if (global.menu1.getTemaActualSLideActual().name == "slide2_1") 
					{
						(global.menu2 as LPMenu).verTema(0);
						(global.menu2 as LPMenu).verBotonesPrinci();
						if (!(global.menu2 as LPMenu).siVioTodosLosTemas()) 
						{
							(global.menu1 as LPMenu).verVolver(false);
							TweenMax.to(global.stage.slide2_1.boton1, 1, { colorTransform: { tint: 0xffffff, tintAmount: 0.3 }} );
						}
					}

					if (global.menu1.getTemaActualSLideActual().name == "slide3_1") 
					{
						(global.menu3 as LPMenu).verTema(0);
						(global.menu3 as LPMenu).verBotonesPrinci();
						if (!(global.menu3 as LPMenu).siVioTodosLosTemas()) 
						{
							(global.menu1 as LPMenu).verVolver(false);
							TweenMax.to(global.stage.slide3_1.boton1, 1, { colorTransform: { tint: 0xffffff, tintAmount: 0.3 }} );
						}
					}
					
				}	
		}

		private function verTEmaMenuPrinci(e:MouseEvent):void 
		{	
			var nombreBotonTemp:Number = (Number)(e.currentTarget.name.replace("boton", ""));
			//contromenuPrinci.verTema((nombreBotonTemp - 1));			
			//////////////////////////////////
			var x = 0.2;
			if (e.currentTarget.parent==global.stage) 
			{
				contromenuPrinci.verTema((nombreBotonTemp - 1));
				
				//trace(nombrePopTema1,arrTempPop[(nombrePopTema1-1)].numChildren);
					for (var i:int = 0; i <((contromenuPrinci as LPMenu).getTemaActualSLideActual().numChildren) ; i++) 
					{
						//TweenMax.from((contromenuPrinci as LPMenu).getTemaActualSLideActual().getChildAt(i), 0.3, {scaleX:0, scaleY:0, delay:x});
							x += 0.1;
					}
				

				//contromenuPrinci.getTemaActual(contromenuPrinci.getNumTemaActual()).getSlideActualMovieClip().x = 1571;
				// contromenuPrinci.getTemaActual(contromenuPrinci.getNumTemaActual()).getSlideActualMovieClip().rotationY = 90;
				// TweenMax.to( contromenuPrinci.getTemaActual(contromenuPrinci.getNumTemaActual()).getSlideActualMovieClip(), 0.5, { x:0 } );	
			}
			if (e.currentTarget.parent==global.stage.slide2_1) 
			{
				if ((global.menu2 as LPMenu).siTemaDispo((nombreBotonTemp-1))) 
				{
					(global.menu2 as LPMenu).volverMenu();
					contromenuPrinci.verTema((nombreBotonTemp - 1));
					(global.menu2 as LPMenu).verBotonesPrinci();
					if (nombreBotonTemp==6) 
					{

						(global.menu1 as LPMenu).verVolver(true);

					}
				}
				for ( i = 3; i <=6; i++) 
				{
					if (global.menu2.siTemaDispo((i-1))==true && global.menu2.getYaVisitado((i-1))==false) 
					{
						new LPResalteGenerico(global.stage.slide2_1.getChildByName("boton" + i) , "clicBtnBlanco");
					}
				}
				
			}
			if (e.currentTarget.parent==global.stage.slide3_1) 
			{
				if ((global.menu3 as LPMenu).siTemaDispo((nombreBotonTemp-1))) 
				{
					(global.menu3 as LPMenu).volverMenu();
					contromenuPrinci.verTema((nombreBotonTemp - 1));
					(global.menu3 as LPMenu).verBotonesPrinci();
					if (nombreBotonTemp==3) 
					{

						(global.menu1 as LPMenu).verVolver(true);

					}
				}
				for ( i = 3; i <=3; i++) 
				{
					if (global.menu3.siTemaDispo((i-1))==true && global.menu3.getYaVisitado((i-1))==false) 
					{
						new LPResalteGenerico(global.stage.slide3_1.getChildByName("boton" + i) , "clicBtnBlanco");
					}
				}
				
			}

		}
	
	}

}