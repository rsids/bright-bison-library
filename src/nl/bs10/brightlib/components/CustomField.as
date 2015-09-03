package nl.bs10.brightlib.components  {
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.controls.Alert;
	import mx.controls.TextInput;
	import mx.core.UIComponent;
	import mx.events.CloseEvent;
	import mx.utils.StringUtil;
	
	import nl.bs10.brightlib.controllers.IconController;

	public class CustomField extends HBox
	{
		private var _label_txt:TextInput;
		private var _value_txt:TextInput;
		private var _delete_btn:GrayImageButton;
		
		private var _data:Object;
		private var _valueField:String = 'value';
		private var _labelField:String = 'name';
		private var _datachanged:Boolean;
		private var _labelWidthChanged:Boolean
		private var _percentLabelWidthChanged:Boolean
		
		private var _labelWidth:Number;
		private var _percentLabelWidth:Number = 35;
		
		public function CustomField(lblwidth:* = null) {
			super();
			setStyle("paddingRight", 5);
			setStyle("paddingTop", 5);
			setStyle('verticalAlign', 'middle');
			
			percentWidth = 100;
			
			if(lblwidth !== null) {
				
				if(isNaN(Number(lblwidth))) {
					
					var str:String = String(lblwidth);
					if(str && str.indexOf('%') == str.length-1) {
						percentLabelWidth = Number(str.substr(0, str.length-2));
					}
				
				} else {
					labelWidth = lblwidth;
				}
			}
		}
		
		[Bindable(event="labelWidthChanged")]
		public function set labelWidth(value:Number):void {
			if(value !== _labelWidth) {
				_labelWidth = value;
				_labelWidthChanged = true;
				dispatchEvent(new Event("labelWidthChanged"));
				invalidateProperties();
			}
		}
		
		public function get labelWidth():Number {
			return _labelWidth;
		}
		
		[Bindable(event="labelWidthPercentChanged")]
		public function set percentLabelWidth(value:Number):void {
			if(value !== _percentLabelWidth) {
				_percentLabelWidth = value;
				_percentLabelWidthChanged = true;
				dispatchEvent(new Event("labelWidthPercentChanged"));
				invalidateProperties();
			}
		}
		
		public function get percentLabelWidth():Number {
			return _percentLabelWidth;
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			_label_txt = new TextInput();
			_value_txt = new TextInput();
			_delete_btn = new GrayImageButton();
			
			_label_txt.percentWidth = percentLabelWidth;
			_value_txt.percentWidth = 100 - percentLabelWidth;
			
			
			_delete_btn.source = IconController.getIcon('delete');
			_delete_btn.addEventListener(MouseEvent.CLICK, _deleteClickHandler, false, 0, true);
			_delete_btn.buttonMode =
			_delete_btn.useHandCursor = true;
			
			addChild(_label_txt);
			addChild(_value_txt);
			addChild(_delete_btn);
		}
		
		override public function set data(value:Object):void {
			super.data = value;
			if(!value)
				return;
			_data  = value;
			_datachanged = true;
			invalidateProperties();
		}
		
		override public function get data():Object {
			var obj:Object = {};
			obj[labelField] = StringUtil.trim(_label_txt.text);
			obj[valueField] = StringUtil.trim(_value_txt.text);
			return obj;
		}
		
		
		public function set labelField(value:String):void {
			if(value !== _labelField) {
				_labelField  = value;
				_datachanged = true;
				invalidateProperties();
			}
		}
		
		public function get labelField():String {
			return _labelField;
		}
		
		public function set valueField(value:String):void {
			if(value !== _valueField) {
				_valueField  = value;
				_datachanged = true;
				invalidateProperties();
			}
		}
		
		public function get valueField():String {
			return _valueField;
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if(_datachanged && _data) {
				_datachanged = false;
				
				_label_txt.text = _data[labelField];
				_value_txt.text = _data[valueField];
				//invalidateDisplayList();
			}
			
			if(_labelWidthChanged) {
				_labelWidthChanged = false;
				_label_txt.width = labelWidth;
				_value_txt.percentWidth = 100;
			}
			
			if(_percentLabelWidthChanged) {
				_percentLabelWidthChanged = false;
				_label_txt.percentWidth = percentLabelWidth;
				_value_txt.percentWidth = 100 - percentLabelWidth;
			}
			
			
		}
		
		private function _deleteClickHandler(event:MouseEvent):void {
			
			Alert.show("Are you sure you want to delete this field?", 
				"Please Confirm", 
				Alert.YES|Alert.CANCEL,
				null, 
				_deleteHandler);
		}
		
		private function _deleteHandler(event:CloseEvent):void {
			if(event.detail == Alert.YES) {
				parent.removeChild(this);
			}
		}
	}
}