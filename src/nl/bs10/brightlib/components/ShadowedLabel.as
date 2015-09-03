package nl.bs10.brightlib.components
{
	import flash.filters.DropShadowFilter;
	
	import mx.containers.Canvas;
	import mx.controls.Label;

	public class ShadowedLabel extends Canvas
	{
		
		public var label_txt:Label;
		
		private var _clickable:Boolean;
		
		private var _text:String;
		private var _textChanged:Boolean = false;
		
		override protected function createChildren():void {
			super.createChildren();
			label_txt = new Label();
			addChild(label_txt);
			filters = [new DropShadowFilter(1,90,0xffffff,1,1,1,2,3)];
		}
		
		[Bindable]
		public function set text(value:String):void {
			_text = value;
			_textChanged = true;
			invalidateProperties();
		}
		
		public function get text():String {
			return _text;
		}
		
		[Bindable]
		[Inspectable(type="Boolean")]
		public function set clickable(value:Boolean):void {
			_clickable = value;
			
			mouseChildren = !value;
			useHandCursor =
			buttonMode = value;
			
		}
		
		public function get clickable():Boolean {
			return _clickable;
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if(_textChanged) {
				_textChanged = false;
				
				label_txt.text = _text;
			}
		}
		
		public function get shadow():* {
			return filters[0];
		}
		
		public function set shadow(filter:*):void {
			filters = [filter];
		}
		
	}
}