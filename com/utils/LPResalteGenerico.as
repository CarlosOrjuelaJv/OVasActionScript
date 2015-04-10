package com.utils
{
	import flash.display.MovieClip;
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	import com.greensock.data.TweenMaxVars;
	import com.greensock.text.SplitTextField;;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author CArlos 
	 */
	public class  LPResalteGenerico extends MovieClip
	{
		var estadoAni:TimelineMax;
		
		function LPResalteGenerico(objet:Object,tipo:String) {
			switch (tipo) {
        case 'clic':
            estadoAni = new TimelineMax();
            
            estadoAni = new TimelineMax( { repeat: -1, yoyo: true } );
			 estadoAni.append(TweenMax.to(objet, 1, {colorTransform: {tint: 0xffffff, tintAmount: 0.8}}));
            estadoAni.play();
	/*			objet.addEventListener(MouseEvent.CLICK, function() { 
					estadoAni.stop();
					estadoAni.kill();
                TweenMax.to(objet, 0.0, {colorTransform: {tint: null, tintAmount: 0}});
				} );*/

        break;
		case 'clicBtn':
            estadoAni = new TimelineMax();
            
            estadoAni = new TimelineMax( { repeat: -1, yoyo: true } );
			 estadoAni.append(TweenMax.to(objet, 1, {colorTransform: {tint: 0x0000FF, tintAmount: 0.8}}));
            estadoAni.play();
				objet.addEventListener(MouseEvent.CLICK, function() { 
					estadoAni.restart();
					estadoAni.stop();
					estadoAni.kill();
                TweenMax.to(objet, 0.0, { colorTransform: { tint: 0x0000FF, tintAmount: 0.3 }} );
				 
				} );

        break; 
		case 'clicBtnBlanco':
            estadoAni = new TimelineMax();
            
            estadoAni = new TimelineMax( { repeat: -1, yoyo: true } );
			 estadoAni.append(TweenMax.to(objet, 1, {colorTransform: {tint: 0xffffff, tintAmount: 0.8}}));
            estadoAni.play();
				objet.addEventListener(MouseEvent.CLICK, function() { 
					estadoAni.restart();
					estadoAni.stop();
					estadoAni.kill();
                TweenMax.to(objet, 0.0, { colorTransform: { tint: 0xffffff, tintAmount: 0.3 }} );
				 
				} );

        break; 
        case 'clic2':
               estadoAni = new TimelineMax();
            
            estadoAni = new TimelineMax({repeat: -1, yoyo: true});
            estadoAni.append(TweenMax.to(objet, 1, {scaleY: 0.9, scaleX: 0.9}), 0);
            estadoAni.play();
        break; 
		case 'clic3':
              estadoAni = new TimelineMax();

				estadoAni = new TimelineMax( { repeat: -1, yoyo: true } );
				estadoAni.append(TweenMax.to(objet, 1, {colorTransform: {tint: 0xffffff, tintAmount: 0.4},scaleY: 1.2, scaleX: 1.2}));
				estadoAni.play();
				
            
				objet.addEventListener(MouseEvent.CLICK, function() { 
					estadoAni.stop();
					estadoAni.kill();
                TweenMax.to(objet, 0.0, {colorTransform: {tint: null, tintAmount: 0},scaleY: 1, scaleX: 1});
				} );
        break;  
    }
			
			
			}
	}
	
}