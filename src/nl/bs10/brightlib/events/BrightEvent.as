package nl.bs10.brightlib.events
{
	import flash.events.Event;

	public class BrightEvent extends Event
	{
		public static var DATAEVENT:String = "DataEvent";
		
		public var data:Object;
		
		public function BrightEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
		
	}
}