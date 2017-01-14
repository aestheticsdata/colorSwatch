package {
	
	
	import com.hexagonstar.util.debug.Debug;
	
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	
	
	public class ZoomMonitor extends Sprite implements IObserver {
		
		
		private var __canvas:Sprite = new Sprite();
		private var __ct:ColorTransform = new ColorTransform();
		
		//_____________________________________________________________NEW
		
		public function ZoomMonitor() {
		
			__init();
		}
		
		
		//_____________________________________________________________METHODS
		
		private function __init():void {
			
			/*__canvas.graphics.beginFill( 0x000000 );
			__canvas.graphics.drawRect( 0 , 0 , 30 , 30 );
			__canvas.graphics.endFill();*/
			
			with( __canvas.graphics ) {
				
				beginFill( 0x000000 );
				drawRect( 0 , 0 , 30 , 30 );
				endFill();
			}
			
			this.addChild( __canvas );
			__canvas.transform.colorTransform = __ct;
			
		}
		
		
		public function update( color:String ):void {

			__ct.color = uint(color);
			__canvas.transform.colorTransform = __ct;
		}
		
		public function get displayObject():DisplayObject {
			
			return this;
		}
	}
}