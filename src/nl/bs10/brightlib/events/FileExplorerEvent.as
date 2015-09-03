package nl.bs10.brightlib.events {
	import flash.events.Event;

	public class FileExplorerEvent extends Event
	{
		public static var OPENFILEEXPLOREREVENT:String = "OpenFileExplorerEvent";
		
		public var callback:Function;
		public var multiple:Boolean = false;
		public var foldersOnly:Boolean = false;
		public var filter:Array;
		
		public function FileExplorerEvent(type:String, callback:Function, multiple:Boolean = false, filter:Array = null, foldersOnly:Boolean = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.callback = callback;
			this.multiple = multiple;
			this.filter = filter;
			this.foldersOnly = foldersOnly;
		}
		
	}
}