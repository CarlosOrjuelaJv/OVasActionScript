package com.control
{
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
	import com.popUp.LPPopUP;
	
	/**
	 * ...
	 * @author CArlos
	 */
	public class LPControPopUPs extends MovieClip
	{
		private var numPopUps;
		private var padreBtn;
		private var nombre;
		private var arrTempPop = new Array();
		private var global:Global;//<----- isntancia singleton del global si necesita algun elemento
		private var stageTmp;
		private var nombreBotones:String = "btnPop"
		private  static var numeroPop:Number = 0;
		private var controPopTema1:LPPopUP;
		private var nombrePopTema1:Number = 0;
		function LPControPopUPs(numPopUps:Number, padreBtn:MovieClip, nombrePop:String,fondo:Object) {
			numeroPop++;
			this.numPopUps = numPopUps;
			this.padreBtn = padreBtn;
			this.nombre = nombre;
			global = Global.getInstance();			
			stageTmp = global.stage;
			
				for(var i = 1; i <= numPopUps; i++)
				{
					var tempName:String = "";
					
					tempName = (nombrePop + (i));//<--- toma el nombre asignado
				
					try 
					{
						arrTempPop.push(stageTmp.getChildByName(tempName));
					}catch (Error) {
						trace("ERROR ->>revise, nombre  del PopUp, en el Menu pop:"+numeroPop);
						}
					
					//si tiene cerrar
					try 
					{
						(padreBtn.getChildByName("btnPop" + i) as MovieClip).buttonMode = true;	
						new LPResalteGenerico(padreBtn.getChildByName("btnPop" + i), "clicBtnBlanco");
					}catch (Error) {
						trace("ERROR ->>revise, nombre  del botones, en el Menu pop:"+numeroPop);
						}
					
					
					//eventos
					try 
					{
						arrTempPop[(i - 1)].getChildByName("cerrar").addEventListener(MouseEvent.CLICK, cerrarPop);
						new LPResalteGenerico(arrTempPop[(i - 1)].getChildByName("cerrar"), "clic");
						padreBtn.getChildByName("btnPop"+i).addEventListener(MouseEvent.CLICK, abrirPop );
					}catch (Error) {
						trace("ERROR ->>revise, nombre  del boton cerrar,pop:"+i+", en el Menu pop:"+numeroPop);
						}
					
					
				}

				//EL fondo puede ser un String nonee
				controPopTema1 = new LPPopUP(arrTempPop, fondo);
				global["pop" + numeroPop] = controPopTema1;
				
					
			
			}
			
			private function abrirPop(e:MouseEvent):void 
			{	
						nombrePopTema1 = (Number)(e.currentTarget.name.replace(nombreBotones, ""));
						controPopTema1.verPopUp((nombrePopTema1 - 1));
						//////////////////////////////////////////////////////
						animacion();
						//for (var i:int = 2; i <=3; i++) 
								//{
							//		if (global.controPopTema1.getDisponible((i-1))==true && global.controPopTema1.getPopYaVistos((i-1))==false) 
								//	{
								//		new LPResalteGenerico(global.stage.tema1_slide1.getChildByName("btnPop" + i) , "clicBtnBlanco");
										//global.stage.rueda.select.gotoAndStop(i);
							//		}		
							//	}
			}
			
			private function animacion():void 
			{
				/////animacion
				 var x = 0.2;
				//trace(nombrePopTema1,arrTempPop[(nombrePopTema1-1)].numChildren);
					for (var i:int = 0; i <(arrTempPop[(nombrePopTema1-1)].numChildren) ; i++) 
					{
						TweenMax.from(arrTempPop[(nombrePopTema1-1)].getChildAt(i), 0.3, {scaleX:0, scaleY:0, delay:x});
							x += 0.1;
					}
			}
			var soloUna:Boolean = true;
			var soloUnaDos:Boolean = true;
			var solo
			private function cerrarPop(e:MouseEvent):void 
			{
				controPopTema1.cerrarPopUp(); 
						///////////////////////////////////////////////////////
						trace();
							if (e.currentTarget.parent==global.stage.Tem1pop1) 
							{
								if (global.pop1.siVioTodosLosPop()) 
								{
										global.menu1.verBtnSigui(true); 
								}
							}	
							if (e.currentTarget.parent==global.stage.Tem2pop1) 
							{
								if (global.pop2.siVioTodosLosPop()) 
								{
										global.menu1.verBtnSigui(true); 
								}
							}	
							if (e.currentTarget.parent==global.stage.Tem3pop1) 
							{
								if (global.pop3.siVioTodosLosPop()) 
								{
										global.menu1.verBtnSigui(true); 
								}	
							}	
							if (e.currentTarget.parent==global.stage.Tem4pop1) 
							{
								if (global.pop4.siVioTodosLosPop()) 
								{
									if (soloUnaDos) 
									{
										global.menu1.verBtnSigui(false); 
										soloUnaDos = false;
									}
										
										global.stage.slide1_5.boton1.visible = true;//<--------------------
								}
							}	
							if (e.currentTarget.parent==global.stage.Tem5pop1) 
							{
								if (global.pop5.siVioTodosLosPop()) 
								{
									if (soloUna) 
									{
										(global.menu2 as LPMenu).verVolver(true);//<--------------------
										soloUna = false;
									}
										
								}
							}
							if (e.currentTarget.parent==global.stage.Tem6pop1) 
							{
								if (global.pop6.siVioTodosLosPop()) 
								{
										global.menu1.verBtnSigui(true); 
								}
							}
							if (e.currentTarget.parent==global.stage.Tem7pop1) 
							{
								if (global.pop7.siVioTodosLosPop()) 
								{
										global.menu1.verBtnSigui(true); 
								}
							}
							if (e.currentTarget.parent==global.stage.Tem8pop1) 
							{
								if (global.pop8.siVioTodosLosPop()) 
								{
										global.menu1.verBtnSigui(true); 
								}
							}
							if (e.currentTarget.parent==global.stage.Tem9pop1) 
							{
								if (global.pop9.siVioTodosLosPop()) 
								{
									trace("entra pop9");
									(global.menu1 as LPMenu).verVolver(true);
									global.menu1.verBtnSigui(false); 

								}
							}
								
								
								
								
								
								
							
								
								
								
								
								
								
			}
	}
	
}