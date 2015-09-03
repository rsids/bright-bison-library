package nl.bs10.brightlib.components {
	import flash.events.Event;
	import flash.events.FocusEvent;
	
	import mx.charts.CategoryAxis;
	import mx.containers.HBox;
	import mx.controls.Label;
	import mx.controls.TextInput;
	
	[Event(name="focusOut", type="flash.events.FocusEvent")]
	/**
	 * A labeled input is a textinput with a label attached to it
	 * @author Ids Klijnsma - Fur
	 * @copyright (c) 2011 - Fur, wewantfur.com
	 * @version 1.2
	 **/
	public class LabeledInput extends HBox
	{
		
		private var _label_lbl:Label;
		private var _text_txt:TextInput;
		
		private var _label:String;
		private var _text:String;
		
		private var _enabled:Boolean;
		
		private var _editable:Boolean = true;
		private var _editableChanged:Boolean;
		private var _textChanged:Boolean;
		private var _labelChanged:Boolean;
		private var _enabledChanged:Boolean;
		private var _labelWidthChanged:Boolean;
		private var _labelWidthPercentMode:Boolean;
		
		public function LabeledInput()
		{
			super();
			percentWidth = 100;
			setStyle("verticalAlign", "middle");
			setStyle("paddingBottom", 10);
		}
		
		public function get text():String {
			return _text;
		}
		
		[Bindable(event="textChanged")]
		public function set text(value:String):void {
			if(_text !== value) {
				_text = value;
				_textChanged = true;
				invalidateProperties();
				dispatchEvent(new Event("textChanged"));
			}
		}
		
		override public function get label():String {
			return _label;
		}
		
		[Bindable(event="labelChanged")]
		override public function set label(value:String):void {
			if(_label !== value) {
				_label = value;
				_labelChanged = true;
				invalidateProperties();
				dispatchEvent(new Event("labelChanged"));
			}
		}
		
		[Bindable(event="enabledChanged")]
		override public function set enabled(value:Boolean):void {
			if(value !== _enabled) {
				_enabled = value;
				_enabledChanged = true;
				invalidateProperties();
				dispatchEvent(new Event("enabledChanged"));
			}
			super.enabled = true;
		}
	
		public function get editable():Boolean {
			return _editable;
		}
		
		[Bindable(event="editableChanged")]
		public function set editable(value:Boolean):void {
			if(_editable !== value) {
				_editable = value;
				_editableChanged = true;
				invalidateProperties();
				dispatchEvent(new Event("editableChanged"));
			}
		}
		
		private var _labelWidth:Number;
		[Inspectable(type="Number", category="Size", defaultValue="100")]
		[PercentProxy("labelWidthPercent")]
		[Bindable(event="labelWidthChanged")]
		public function set labelWidth(value:Number):void {
			if(value !== _labelWidth) {
				_labelWidth = value;
				_labelWidthPercentMode = false;
				_labelWidthChanged = true;
				invalidateProperties();
				dispatchEvent(new Event("labelWidthChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the labelWidth property
		 **/
		public function get labelWidth():Number {
			return _labelWidth;
		}
		
		private var _labelWidthPercent:Number;
		
		[Bindable(event="labelWidthPercentChanged")]
		public function set labelWidthPercent(value:Number):void {
			if(value !== _labelWidthPercent) {
				_labelWidthPercent = value;
				_labelWidthPercentMode = true;
				_labelWidthChanged = true;
				invalidateProperties();
				dispatchEvent(new Event("labelWidthPercentChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the labelWidthPercent property
		 **/
		public function get labelWidthPercent():Number {
			return _labelWidthPercent;
		}
			
		override protected function createChildren():void {
			super.createChildren();
			
			_label_lbl = new Label();
			_label_lbl.width = 100;
			
			_text_txt = new TextInput();
			_text_txt.percentWidth = 100;
			_text_txt.editable = _editable;
			_text_txt.addEventListener(FocusEvent.FOCUS_OUT, _focusOutHandler);
			
			addChild(_label_lbl);
			addChild(_text_txt);
			
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			if(_labelChanged) {
				_labelChanged = false;
				_label_lbl.text = label;
			}
			
			if(_textChanged) {
				_textChanged = false;
				_text_txt.text = text;
			}
			
			if(_editableChanged) {
				_editableChanged = false;
				_text_txt.editable = editable;
			}
			
			if(_labelWidthChanged) {
				_labelWidthChanged = false;
				if(_labelWidthPercentMode) {
					_label_lbl.percentWidth = labelWidthPercent;
					
				} else {					
					_label_lbl.width = labelWidth;
				}
			}
			
			if(_enabledChanged) {
				_enabledChanged = false;
				_text_txt.enabled = _enabled;
			}
			
		}
		
		private function _focusOutHandler(event:FocusEvent):void {
			text = _text_txt.text;
			dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT));
		}
		
	}
}