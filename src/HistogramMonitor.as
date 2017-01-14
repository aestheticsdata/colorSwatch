package {
	
	
	import com.hexagonstar.util.debug.Debug;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	
	
	public class HistogramMonitor extends Sprite implements IObserver {
		
		
		private var __canvas:Shape = new Shape();
		
		private var __r:int;
		private var __g:int;
		private var __b:int;
		
		
		//____________________________________________________________________NEW
		
		public function HistogramMonitor()	{
			
			__init();
		}
		
		
		
		//____________________________________________________________________METHODS
		
		private function __init():void {
			
			/*
			this.graphics.beginFill( 0x000000 , 1 );
			this.graphics.drawRect( 0 , 0 , 80 , 127 );
			this.graphics.endFill();
			*/
			this.graphics.lineStyle( 2, 0x0 );
			
			this.graphics.moveTo( 0   , 0   );
			this.graphics.lineTo( 80  , 0   );
			this.graphics.moveTo( 0   , 0   );
			this.graphics.lineTo( 0   , 127 );
			
			this.graphics.endFill();
			
			this.addChild( __canvas );
			
			
		}
		
		
		public function update( color:String ):void{
			
			__canvas.graphics.clear();
			
			__r = ( uint(color) & 0xFF0000 ) >> 16;
			__g = ( uint(color) & 0x00FF00 ) >> 8;
			__b = ( uint(color) & 0x0000FF ) ;
			
			/*
			var matr:Matrix = new Matrix();
			matr.createGradientBox(20, 20, 0, 0, 0);
			var spreadMethod:String = SpreadMethod.PAD;
			*/
			
			//Debug.trace( "histogram -> red : " + __r.toString(16) , Debug.LEVEL_FATAL );
			//Debug.trace( "int r g b : " + __r + " " + __g + " " + __b , Debug.LEVEL_DEBUG );
			
			//__canvas.graphics.beginGradientFill( GradientType.LINEAR , [0x000000,0xFF0000] , [1,1], [0x00,0xFF] , matr , spreadMethod );
			__canvas.graphics.beginFill( 0xFF0000);
			__canvas.graphics.drawRect( 10 , 1 , 10 , __r / 2 );
			__canvas.graphics.endFill();
			
			//__canvas.graphics.beginGradientFill( GradientType.LINEAR , [0x000000,0x00FF00] , [1,1], [0xFF,0xFF]);
			__canvas.graphics.beginFill( 0x00FF00 );
			__canvas.graphics.drawRect( 30 , 1 , 10 , __g / 2 );
			__canvas.graphics.endFill();
			
			//__canvas.graphics.beginGradientFill( GradientType.LINEAR , [0x000000,0x0000FF] , [1,1], [0xFF,0xFF]);
			__canvas.graphics.beginFill( 0x0000FF );
			__canvas.graphics.drawRect( 50 , 1 , 10 , __b / 2 );
			__canvas.graphics.endFill();
			
		}
		
		public function get displayObject():DisplayObject {
			
			return this;
		}
	}
}