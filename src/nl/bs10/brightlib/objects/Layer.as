package nl.bs10.brightlib.objects
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[RemoteClass(alias="OLayer")]
	public class Layer extends EventDispatcher
	{
		private var _label:String;
		private var _layerId:int;
		private var _color:Number;
		private var _index:int;
		private var _visible:Boolean;
		private var _deleted:Boolean;
		private var _content:Object;
		
		public var modificationdate:int;
		
		public function get label():String {
			return _label;
		}
		
		[Bindable(event="labelChanged")]
		public function set label(value:String):void {
			if(_label !== value) {
				_label = value;
				dispatchEvent(new Event("labelChanged"));
			}
		}
		
		public function get layerId():int {
			return _layerId;
		}
		
		[Bindable(event="layerIdChanged")]
		public function set layerId(value:int):void {
			if(_layerId !== value) {
				_layerId = value;
				dispatchEvent(new Event("layerIdChanged"));
			}
		}
		
		public function get color():Number {
			return _color;
		}
		
		[Bindable(event="colorChanged")]
		public function set color(value:Number):void {
			if(_color !== value) {
				_color = value;
				dispatchEvent(new Event("colorChanged"));
			}
		}
		
		public function get index():int {
			return _index;
		}
		
		[Bindable(event="indexChanged")]
		public function set index(value:int):void {
			if(_index !== value) {
				_index = value;
				dispatchEvent(new Event("indexChanged"));
			}
		}
		
		public function get deleted():Boolean {
			return _deleted;
		}
		
		[Bindable(event="deletedChanged")]
		public function set deleted(value:Boolean):void {
			if(_deleted !== value) {
				_deleted = value;
				dispatchEvent(new Event("deletedChanged"));
			}
		}
		
		public function get content():Object {
			return _content;
		}
		
		[Bindable(event="contentChanged")]
		public function set content(value:Object):void {
			if(_content !== value) {
				_content = value;
				dispatchEvent(new Event("contentChanged"));
			}
		}
		
		public function get visible():Boolean {
			return _visible;
		}
		
		[Bindable(event="visibleChanged")]
		public function set visible(value:Boolean):void {
			if(_visible !== value) {
				_visible = value;
				dispatchEvent(new Event("visibleChanged"));
			}
		}

	}
}