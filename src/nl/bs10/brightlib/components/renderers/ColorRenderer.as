package nl.bs10.brightlib.components.renderers
{
	import mx.containers.Canvas;

	public class ColorRenderer extends Canvas {
		
		public function ColorRenderer() {
			super();
			width = 16;
			height = 16;
		}
		
		override public function set data(value:Object):void {
			super.data = value;

			if(!value)
				return;

			if(value.hasOwnProperty('color') && value.color != null) {
				var clr:uint = value.color;
				graphics.clear();
				graphics.beginFill(clr,1);
				graphics.drawRoundRect(2,2,12,12,2,2);
				graphics.endFill();
			}

		}

		
	}
}