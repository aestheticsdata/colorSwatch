package {
	
	
	import com.hexagonstar.util.debug.Debug;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	
	public class ColorSwatch extends Sprite implements ISubject {
		
		
		public var bmpd:BitmapData = new BitmapData( 255 , 255 , false , 0xEEEEEE );
		public var bmp:Bitmap = new Bitmap( bmpd );
		
		public var sensor:Sprite = new Sprite();
		
		public var r:int = 0;
		public var g:int = 0;
		public var b:int = 0;
		
		public var color:int;
		
		public var aObservers:Array = [];
		
		//________________________________________________NEW
		
		public function ColorSwatch() {
			
			__init();
			__initListener();
		}
		
		//________________________________________________METHODS
		
		private function __init():void {
			
			Debug.trace( "__init" , Debug.LEVEL_FATAL );
			
			
			sensor.graphics.beginFill( 0x0000FF );
			sensor.graphics.drawRect( 0 , 0 , 255 , 255 );
			sensor.graphics.endFill();
			
			for( var i:int = 0 ; i < 255 ; i += 1 ) {
				
				r++;
				g = 0;
				b = 0;
				
				for ( var j:int = 0 ; j < 255 ; j += 1 ) {
					
					g++;
					if( ( j % 2 ) == 0 ) b++;
					
					bmpd.setPixel( i , j , r << 16 | g << 8 | b );
				}
				
			}
			
			this.addChild( bmp );
			bmp.x = bmp.y = sensor.x = sensor.y = 0;
			sensor.alpha = 0;
			this.addChild(sensor);
			
		}
		
		private function __initListener():void {
			
			Debug.trace( "__initListener()" );	
			
			sensor.addEventListener( MouseEvent.MOUSE_MOVE , __update );
		
		}
		
		private function __update( me:MouseEvent ):void {
			
			//Debug.trace( "mouse event");
			
			try {
				
				color = bmpd.getPixel( mouseX , mouseY );
				//Debug.trace( color );
				this.notifyObserver();
			} catch( e:Error ) {
				Debug.trace(e);
			}
		}
		
		
		
		public function subscribeObserver( obs:IObserver ):void {
			
			aObservers.push( obs );
		}
		
		public function notifyObserver():void {
			
			for ( var o:int ; o < aObservers.length ; o += 1 ) {
				
				aObservers[ o ].update( color );
			}
		}
		
		public function get displayObject():DisplayObject {
			
			return this;
		}
		
	}
}