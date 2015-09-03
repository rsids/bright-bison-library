package nl.bs10.brightlib.components {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.ToolTip;

	public class ToolTip extends mx.controls.ToolTip {
		
		public function ToolTip() {
			super();
		}
		
		override public function get measuredHeight():Number {
			return super.measuredHeight + 7;
		}
		
		override public function move(x:Number, y:Number):void {
			super.move(mouseX - 20, mouseY - 50);
		}
		
	}
}