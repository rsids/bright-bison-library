package nl.bs10.brightlib.interfaces
{
	import mx.events.ValidationResultEvent;

	public interface IValidatable
	{
		function addValidationResults(results:Array):void;
		function validationResultHandler(event:ValidationResultEvent):void;
		
		[Bindable(event="isValidChanged")]
		function get isValid():Boolean;
	}
}