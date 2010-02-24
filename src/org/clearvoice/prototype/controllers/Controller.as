package  org.clearvoice.prototype.controllers
{
	import org.clearvoice.prototype.controllers.framescontrollers.IFrameController;
	/**
	 * ...
	 * @author Amen Kamaleldine, Tony Broyez
	 */
	public class Controller
	{
		private var static _instance:Controller;
		private var _framesControllers:Vector.<IFrameController>;
		public function Controller( pSecure:SingletonSecure ) 
		{
			if ( pSecure == null ) throw new Error( "Use Controller.getInstance() instead." );
		}
		
		public function init():void {
			_framesControllers = new Array();
			
		}
		
		public static function getInstance():Controller{
			if (!_instance) _instance = new Controller( new SingletonSecure() );
			return _instance;
		}
		
		public function pushFrameController(pFrameController:IFrameController):void {
			if (!pFrameController) return;
			var len:uint = _framesControllers.length;
			
			if (len > 0) _framesControllers[len - 1].onDeActivate();
			_framesControllers.push(pFrameController);
			pFrameController.onEnter();
			pFrameController.onActivate();
			
		}
		
		public function popFrameController():IFrameController {
			var len:uint = _framesControllers.length;
			var popedFrameController:IFrameController;
			
			if (len > 0) {
				popedFrameController = _framesControllers.pop();
				popedFrameController.onDeActivate();
				popedFrameController.onExit();
				--len;
				if (len > 0) _framesControllers[len].onActivate();
			}
			
		}
		
		public function setFrameController(pFrameController:IFrameController):void {
			if (!pFrameController) return;
			
			resetFramesControllers();
			_framesControllers.push(pFrameController);
			pFrameController.onEnter();
			pFrameController.onActivate();
		}
		
		public function resetFramesControllers():void {
			var len:uint = _framesControllers.length;
			var popedFrameController:IFrameController;
			
			while (--len) {
				popedFrameController = _framesControllers.pop();
				popedFrameController.onDeActivate();
				popedFrameController.onExit();
			}
		}
		
	}

}

internal class SingletonSecure { }
