package org.clearvoice.prototype.controllers.framescontrollers
{ 
	
	/**
	 * ...
	 * @author Amen Kamaleldine, Tony Broyez
	 */
	public interface IFrameController 
	{
		function onEnter():void;
		function onExit():void;
		function onActivate():void;
		function onDeActivate():void;
	}
	
}