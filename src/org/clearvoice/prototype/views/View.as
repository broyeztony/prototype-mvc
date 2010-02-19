package  org.clearvoice.prototype.views
{
	/**
	 * ...
	 * @author Amen Kamaleldine, Tony Broyez
	 */
	public class View
	{
		
		private var static _instance:View;
		
		public function View() 
		{
			
		}
		
		public static function getInstance():View{
			if (!_instance) _instance = new View();
			return _instance;
		}
	}

}