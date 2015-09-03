package nl.bs10.brightlib.components {
	import mx.controls.DateField;
	import mx.events.ValidationResultEvent;
	
	import nl.bs10.brightlib.interfaces.IBrightControl;
	import nl.bs10.brightlib.interfaces.IValidatable;
	import nl.bs10.brightlib.utils.Formatter;

	public class BrightDateField extends DateField implements IBrightControl, IValidatable
	{
		private var _fieldname:String;
		private var _isValid:Boolean = true;
		
		[Bindable]
		public function set fieldname(value:String):void {
			_fieldname = value;
		}
		
		public function get fieldname():String {
			return _fieldname;	
		}
		
		override public function get formatString():String {
			return Formatter.dateFormat;
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
	}
}