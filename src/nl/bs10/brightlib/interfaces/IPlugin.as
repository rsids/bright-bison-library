package nl.bs10.brightlib.interfaces
{
	import flash.events.IEventDispatcher;
	
	import nl.bs10.brightlib.objects.PluginProperties;
	
	/**
	 * Defines the default methods for every plugin 
	 * @author Fur
	 * 
	 */	
	public interface IPlugin extends IEventDispatcher {
		function set data(value:Object):void;
		function get data():Object;
		
		function set value(value:*):void;
		function get value():*;
		
		function set label(value:String):void;
		function get label():String;
		
		function set displaylabel(value:String):void;
		function get displaylabel():String;
		
		/**
		 * Gets the additional properties available for this plugin.
		 * @return A pluginproperties object 
		 * 
		 */		
		function getProperties():PluginProperties;
		
		function validate():Object;
		
		function destroy():void;
		
	}
}