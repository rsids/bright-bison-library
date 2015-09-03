package nl.bs10.brightlib.objects
{
	import flash.events.Event;
	
	import nl.bs10.brightlib.interfaces.IMarker;

	[RemoteClass(alias="OPoly")]
	public dynamic class PolyPage extends Page implements IMarker
	{
		private var _polyId:int;
		private var _layer:int;
		private var _uselayercolor:Boolean;
		private var _color:uint;
		/**
		 * @var boolean Indicates whether this poly is a line (false) or a shape (true)
		 */
		private var _isShape:Boolean = false;
		private var _enabled:Boolean = true;
		private var _points:Array;
		
		public var deleted:Boolean;
		
		[Bindable(event="polyIdChanged")]
		public function set polyId(value:int):void
		{
			if(value !== _polyId) {
				_polyId = value;
				dispatchEvent(new Event("polyIdChanged"));
			}
		}		
		
		public function get polyId():int {
			return _polyId;
		}
		
		
		[Bindable(event="enabledChanged")]
		public function set enabled(value:Boolean):void {
			if(value !== _enabled) {
				_enabled = value;
				dispatchEvent(new Event("enabledChanged"));
			}
		}		
		
		public function get enabled():Boolean {
			return _enabled;
		}
		
		
		[Bindable(event="layerChanged")]
		public function set layer(value:int):void
		{
		 	if (value !== _layer)
		 	{
		 		_layer = value;
		 		dispatchEvent(new Event("layerChanged"));
		 	}
		}		
		
		public function get layer():int {
			return _layer;
		}
		
		
		[Bindable(event="uselayercolorChanged")]
		public function set uselayercolor(value:Boolean):void
		{
		 	if (value !== _uselayercolor)
		 	{
		 		_uselayercolor = value;
		 		dispatchEvent(new Event("uselayercolorChanged"));
		 	}
		}		
		
		public function get uselayercolor():Boolean
		{
			return _uselayercolor;
		}
		
		
		
		
		[Bindable(event="colorChanged")]
		public function set color(value:uint):void
		{
		 	if (value !== _color)
		 	{
		 		_color = value;
		 		dispatchEvent(new Event("colorChanged"));
		 	}
		}		
		
		public function get color():uint
		{
			return _color;
		}
		
		
		
		
		[Bindable(event="isShapeChanged")]
		public function set isShape(value:Boolean):void
		{
		 	if (value !== _isShape)
		 	{
		 		_isShape = value;
		 		dispatchEvent(new Event("isShapeChanged"));
		 	}
		}
		
		public function get isShape():Boolean
		{
			return _isShape;
		}
		
		
		
		[Bindable(event="pointsChanged")]
		public function set points(value:Array):void
		{
			_points = value;
		 	dispatchEvent(new Event("pointsChanged"));
		}		
		
		
		public function get points():Array
		{
		 	if (_points == null)
		 	{
		 		_points = new Array();
		 	}
			return _points;
		}
		
		private var _search:String;
		
		[Bindable(event="searchChanged")]
		public function set search(value:String):void {
			if(value !== _search) {
				_search = value;
				dispatchEvent(new Event("searchChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the search property
		 **/
		public function get search():String {
			return _search;
		}
	}
}