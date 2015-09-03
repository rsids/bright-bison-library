package nl.bs10.brightlib.components {
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.Image;

	public class GrayImageButton extends Image {
		
		private var _toggle:Boolean;
		private var _mode:String = "button";
		
		public function GrayImageButton() {
			super();
			useHandCursor =
			buttonMode = true;
			alpha = .65;
			mouseChildren = false;
			addEventListener(MouseEvent.MOUSE_OVER, _hoverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, _hoverHandler);
			addEventListener(MouseEvent.CLICK, _clickHandler);
		}
		
		override public function set enabled(value:Boolean):void {
			useHandCursor =
			buttonMode =
			super.enabled = value; 
		}
		
		[Bindable(event="toggleChanged")]
		public function set toggle(value:Boolean):void {
			if(value != _toggle) {
				_toggle = value;
				alpha = (toggle) ? 1 : .65;
				dispatchEvent(new Event("toggleChanged"));
			}
		}
		
		public function get toggle():Boolean {
			return _toggle;
		}
		
		[Bindable(event="modeChanged")]
		[Inspectable(category="General", enumeration="normal,toggle")]
		public function set mode(value:String):void {
			if(value !== _mode) {
				_mode = value;
				dispatchEvent(new Event("modeChanged"));
			}
		}
		
		public function get mode():String {
			return _mode;
		}
		
		override public function get includeInLayout():Boolean {
			return visible;
		}
		
		private function _hoverHandler(event:MouseEvent):void {
			if(mode == "toggle" && toggle) {
				alpha = 1;
				return;
			}
			alpha = (event.type == MouseEvent.MOUSE_OVER && enabled) ? 1 : .65;
		}
		
		private function _clickHandler(event:MouseEvent):void {
			if(mode == "toggle")
				toggle = !toggle;	
		}
	}
}