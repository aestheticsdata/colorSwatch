package {
	
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	
	
	public class TextMonitor extends Sprite implements IObserver {
		
		private var __tf:TextField = new TextField();
		
		private var __r:int;
		private var __g:int;
		private var __b:int;
		
		
		//____________________________________________________________________NEW
		
		public function TextMonitor() {
			
			__init();
		}
		
		
		//____________________________________________________________________METHODS
		
		private function __init():void {
			
			this.addChild( __tf );
			__tf.text = "0x000000";
			
		}
		
		
		public function update( color:String ):void {
			
			//__r = int(color) & 0x110000;
			//__g = int(color) & 0x001100;
			//__b = int(color) & 0x000011;
			
			//__tf.text = "0x"+ __r;// + __g + __b;
			
			__tf.text = this.getNumberAsHexString( uint(color) );
		}
		
		public function getNumberAsHexString(number:uint, minimumLength:uint = 1, showHexDenotation:Boolean = true):String {
			// The string that will be output at the end of the function.
			var string:String = number.toString(16).toUpperCase();
			
			// While the minimumLength argument is higher than the length of the string, add a leading zero.
			while (minimumLength > string.length) {
				string = "0" + string;
			}
			
			// Return the result with a "0x" in front of the result.
			if (showHexDenotation) { string = "0x" + string; }
			
			return string;
		}
		
		public function get displayObject():DisplayObject {
			
			return this;
		}

	}
}