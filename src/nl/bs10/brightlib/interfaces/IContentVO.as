package nl.bs10.brightlib.interfaces {
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import nl.bs10.brightlib.objects.Template;

	public interface IContentVO extends IEventDispatcher
	{
		[Bindable(event="ItemChanged")]
		function set currentItem(value:IPage):void;
		function get currentItem():IPage;
		
		[Bindable(event="currentDefinitionChanged")]
		function set currentDefinition(value:Template):void;
		function get currentDefinition():Template;
		
		[Bindable(event="tabsChanged")]
		function set tabs(value:ArrayCollection):void;
		function get tabs():ArrayCollection;
		
		[Bindable(event="lockedChanged")]
		function set locked(value:Boolean):void;
		function get locked():Boolean;
		
		function save(callback:Function):void;
	}
}