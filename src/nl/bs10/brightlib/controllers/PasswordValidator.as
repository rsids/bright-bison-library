package nl.bs10.brightlib.controllers
{
	import mx.events.ValidationResultEvent;
	import mx.validators.StringValidator;
	import mx.validators.ValidationResult;

	public class PasswordValidator extends StringValidator
	{
		private var _secondarysource:Object;
		private var _secondaryproperty:String;
		private var _inequalpasswordsError:String = "The entered passwords do not match";
		
		public function PasswordValidator()
		{
			super();
		}
		
		[Bindable]
		public function set secondarysource(source:Object):void {
			
			_secondarysource = source;	
		}
		
		public function get secondarysource():Object {
			return _secondarysource;	
		}
		
		[Bindable]
		public function set secondaryproperty(value:String):void {
			_secondaryproperty = value;
		}
		
		public function get secondaryproperty():String {
			return _secondaryproperty;
		}
		
		[Bindable]
		public function set inequalpasswordsError(value:String):void {
			_inequalpasswordsError = value;
		}
		
		public function get inequalpasswordsError():String {
			return _inequalpasswordsError;
		}
        
		override protected function doValidation(value:Object):Array {
			var results:Array = super.doValidation(value);
			var val:String = value ? String(value) : "";
			if(val != secondarysource[secondaryproperty])
				results.push(new ValidationResult(true, null, "inequalpasswords", inequalpasswordsError));
			
			return results;
		}
		
	}
}