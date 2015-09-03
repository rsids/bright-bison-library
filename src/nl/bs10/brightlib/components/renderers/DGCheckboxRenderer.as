package nl.bs10.brightlib.components.renderers {
	import flash.events.Event;
	
	import mx.controls.CheckBox;
	import mx.controls.dataGridClasses.DataGridListData;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.events.DataGridEvent;
	import mx.events.DataGridEventReason;
	
	public class DGCheckboxRenderer extends CheckBox implements IDropInListItemRenderer {
	
		public function DGCheckboxRenderer() {
			setStyle("paddingLeft", 4);
			mouseEnabled = false;
			enabled = false;
		}
		
		override public function set data(value:Object):void {
			super.data = value;
			
			if(!value) return;
			if(!this.listData) return;
			var dataField:String = this.listData["dataField"];
			this.selected = value[dataField];
		}

	}
}