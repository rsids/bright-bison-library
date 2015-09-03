package nl.bs10.brightlib.components
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.text.TextField;
	
	import mx.controls.TextInput;
	import mx.core.EdgeMetrics;
	import mx.core.IRectangularBorder;
	import mx.events.FlexEvent;
	import mx.events.ValidationResultEvent;
	import mx.validators.ValidationResult;
	
	import nl.bs10.brightlib.interfaces.IValidatable;
	
	public class BrightTextInput extends TextInput implements IValidatable
	{
		private var _hasFocus:Boolean = false;
		private var _isValid:Boolean = true;
		private var _textChanged:Boolean;
		private var _placeHolderChanged:Boolean;
		private var _placeHolder:String = "";
		
		private var _placeHolderTxt:TextField;
		
		public function BrightTextInput()
		{
			super();
			
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			_placeHolderTxt = new TextField();
			_placeHolderTxt.selectable = false;
			_placeHolderTxt.tabEnabled = false;
			_placeHolderTxt.height = unscaledHeight;
			_placeHolderTxt.width = unscaledWidth;
			_placeHolderTxt.alpha = .5;
			addChildAt(_placeHolderTxt, 1);
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if(_placeHolderChanged) {
				_placeHolderChanged = false;
				_placeHolderTxt.text = placeHolder;
			}
			
			if(_textChanged) {
				_textChanged = false;
				if(text == null || text == '') {
					_placeHolderTxt.visible = !_hasFocus;
				} else {
					_placeHolderTxt.visible = false;
				}
			}
		}
		
		override protected function focusInHandler(event:FocusEvent):void {
			super.focusInHandler(event);
			_hasFocus = true;
			_placeHolderTxt.visible = false;
		}
		
		override protected function focusOutHandler(event:FocusEvent):void {
			super.focusOutHandler(event);
			_hasFocus = false;
			_textChanged = true;
			invalidateProperties();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight); 
			
			_placeHolderTxt.height = unscaledHeight;
			_placeHolderTxt.width = unscaledWidth;
			
			var paddingLeft:Number = getStyle("paddingLeft");
			var paddingTop:Number = getStyle("paddingTop");
			
			_placeHolderTxt.x = paddingLeft;
			_placeHolderTxt.y = paddingTop;
			
		}
		
		override public function validationResultHandler(event:ValidationResultEvent):void {
			if (event.type == ValidationResultEvent.VALID) {
				styleName = '';
				if(_isValid == false) {
					_isValid = true;
					dispatchEvent(new Event("isValidChanged"));
				}
			} else {
				styleName = 'error';
				if(_isValid == true) {
					_isValid = false;
					dispatchEvent(new Event("isValidChanged"));
				}
			}
			
			super.validationResultHandler(event);
		}
		
		public function addValidationResults(results:Array):void {
			var type:String = ValidationResultEvent.VALID;
			for(var i:uint = 0; i < results.length; i++) {
				if(results[i].isError) {
					type = ValidationResultEvent.INVALID;
				}
			}
			
			var vre:ValidationResultEvent = new ValidationResultEvent(type, false, false, null, results);
			validationResultHandler(vre);
		}
		
		
		[Bindable(event="isValidChanged")]
		public function get isValid():Boolean
		{
			return _isValid;
		}

		public function get placeHolder():String
		{
			return _placeHolder;
		}

		public function set placeHolder(value:String):void
		{
			_placeHolder = value;
			_placeHolderChanged = true;
			invalidateProperties();
		}
		
		override public function set text(value:String):void {
			super.text = value;
			_textChanged = true;
			invalidateProperties();
		}
	}
}