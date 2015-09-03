package nl.bs10.brightlib.components.renderers
{
	import flash.events.Event;
	
	import mx.controls.Image;
	
	import nl.bs10.brightlib.controllers.IconController;

	public class IconRenderer extends Image
	{
		public function IconRenderer()
		{
			super();
			width = 16;
			height = 16;
			scaleContent = false;
			addEventListener(Event.COMPLETE, _setX, false, 0, true);
		}
		
		override public function set data(value:Object):void {
			super.data = value;

			if(!value)
				return;

			var df:String = (listData && listData.hasOwnProperty("dataField")) ? listData["dataField"] : "icon";
			source = IconController.getIcon(value, df);

		}
		
		private function _setX(event:Event):void {
			this.content.x = 2;
		}
		
	}
}