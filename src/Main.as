package {
	
	
	import com.hexagonstar.util.debug.Debug;
	
	import flash.display.Sprite;
	
	import ColorSwatch;
	
	
	public class Main extends Sprite {
		
		private var __colorSwatch:ISubject;
		
		private var __zoomMonitor:IObserver;
		private var __textMonitor:IObserver;
		private var __histogramMonitor:IObserver;
		private var __trinitronMonitor:IObserver;
		
		
		//____________________________________________________________________NEW
		
		public function Main() {
			
			Debug.clear();
			Debug.time();
			
			__colorSwatch      = new ColorSwatch();
			
			__zoomMonitor      = new ZoomMonitor();
			__textMonitor      = new TextMonitor();
			__histogramMonitor = new HistogramMonitor();
			__trinitronMonitor = new TrinitronMonitor();
			
			__run();	
		}
		
		//____________________________________________________________________METHODS
		
		private function __run():void {
			
			__colorSwatch.subscribeObserver( __zoomMonitor      );
			__colorSwatch.subscribeObserver( __textMonitor      );
			__colorSwatch.subscribeObserver( __histogramMonitor );
			__colorSwatch.subscribeObserver( __trinitronMonitor );
			
			this.addChild(  __colorSwatch.displayObject       );
			this.addChild(  __zoomMonitor.displayObject       );
			this.addChild(  __textMonitor.displayObject       );
			this.addChild(  __histogramMonitor.displayObject  );
			this.addChild(  __trinitronMonitor.displayObject  );
			
			__colorSwatch.displayObject.x = __colorSwatch.displayObject.y = 10;
			
			__zoomMonitor.displayObject.x = 300;
			__zoomMonitor.displayObject.y = 10;
			
			__textMonitor.displayObject.x = 300;
			__textMonitor.displayObject.y = 60; 
			
			__histogramMonitor.displayObject.x = 300;
			__histogramMonitor.displayObject.y = 90;
			
			__trinitronMonitor.displayObject.x = 300;
			__trinitronMonitor.displayObject.y = 230;
		}
		
	}
}