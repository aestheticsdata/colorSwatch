package {
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	
	
	public class TrinitronMonitor extends Sprite implements IObserver {
		
		
		private var __redM:Shape;
		private var __greenM:Shape;
		private var __blueM:Shape;
		
		private var __r:int;
		private var __g:int;
		private var __b:int;
		
		private var __ctR:ColorTransform = new ColorTransform();
		private var __ctG:ColorTransform = new ColorTransform();
		private var __ctB:ColorTransform = new ColorTransform();
		
		
		//____________________________________________________________________NEW
		
		public function TrinitronMonitor()	{
			
			__init();
		}
		
		
		//____________________________________________________________________METHOD
		
		
		private function __init():void {
			
			__redM = new Shape();
			__greenM = new Shape();
			__blueM = new Shape();
			
			
			__redM.graphics.beginFill( 0x000000 );
			__redM.graphics.drawRect( 0 , 0 , 15 , 15 );
			__redM.graphics.endFill();
			
			__greenM.graphics.beginFill( 0x000000 );
			__greenM.graphics.drawRect( 0 , 0 , 15 , 15 );
			__greenM.graphics.endFill();
			
			__blueM.graphics.beginFill( 0x000000 );
			__blueM.graphics.drawRect( 0 , 0 , 15 , 15 );
			__blueM.graphics.endFill();
			
			this.addChild( __redM );
			this.addChild( __greenM );
			this.addChild( __blueM );
			
			__redM.x = 0;
			__greenM.x = 17;
			__blueM.x = 34;
			
			__redM.y = __greenM.y = __blueM.y = 0;
			
		}
		
		
		public function update(color:String):void {
		
			__r = ( uint(color) & 0xFF0000 );
			__g = ( uint(color) & 0x00FF00 );
			__b = ( uint(color) & 0x0000FF );
			
			__ctR.color = __r;
			__ctG.color = __g;
			__ctB.color = __b;
			
			__redM.transform.colorTransform = __ctR;
			__greenM.transform.colorTransform = __ctG;
			__blueM.transform.colorTransform = __ctB;
			
		}
		
		public function get displayObject():DisplayObject {
			
			return this;
		}
	}
}