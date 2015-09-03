package nl.bs10.brightlib.components {
	import flash.display.DisplayObject;
	
	import mx.containers.Canvas;
	import mx.containers.HBox;
	
	public class IconBox extends Canvas {
		
		private var _hb:HBox;
		
		public function IconBox()
		{
			super();
			percentWidth = 100;
			height = 43;
			verticalScrollPolicy = "off";
			horizontalScrollPolicy = "off";
		}
		
		override protected function createChildren():void {
			_hb = new HBox();
			_hb.height = height;
			_hb.percentWidth = 100;
			_hb.verticalScrollPolicy = "off";
			_hb.horizontalScrollPolicy = "off";
			_hb.styleName = 'grayIconBar';
			_hb.setStyle('paddingLeft', 14);
			_hb.setStyle('paddingRight', 14);
			_hb.setStyle('verticalAlign', 'middle');
			rawChildren.addChild(_hb);
			super.createChildren();
		}
		
		override public function addChild(child:DisplayObject):DisplayObject {
			return _hb.addChild(child);
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject {
			return _hb.addChildAt(child, index);
		}
		
		override public function getChildAt(index:int):DisplayObject {
			return _hb.getChildAt(index);
		}
		
		override public function getChildByName(name:String):DisplayObject {
			return _hb.getChildByName(name);
		}
		
		override public function getChildIndex(child:DisplayObject):int {
			return _hb.getChildIndex(child);
		}
		
		override public function getChildren():Array {
			return _hb.getChildren();
		}
		
		override public function removeAllChildren():void {
			return _hb.removeAllChildren();
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject {
			return _hb.removeChild(child);
		}
		
		override public function removeChildAt(index:int):DisplayObject {
			return _hb.removeChildAt(index);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			_hb.width = unscaledWidth;
			_hb.height = unscaledHeight;
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
	
}