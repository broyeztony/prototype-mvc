package org.clearvoice.prototype.controllers.framescontrollers
{ 
	
	/**
	 * ...
	 * @author Amen Kamaleldine, Tony Broyez
	 */
	public interface IFrameController 
	{
		public function onEnter():void;
		public function onExit():void;
		public function onActivate():void;
		public function onDeActivate():void;
	}
	
}