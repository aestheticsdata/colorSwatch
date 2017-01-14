package {
		
	
	public interface ISubject extends IDisplayObject {
		
		function subscribeObserver( o:IObserver ):void;
		function notifyObserver():void;
	}
}