package nl.bs10.brightlib.objects {
	
	public class PluginProperties {
		
		/**
		 * @var type The name of the plugin 
		 */		
		public var type:String;
		
		/**
		 * @var pluginname The (display) name of the plugin 
		 */		
		public var pluginname:String;
		
		/**
		 * @var contenttype The datatype of the plugin (string, array, json, gmaps, etc); 
		 */		
		public var contenttype:String;
		
		/**
		 * @var version The version of the plugin 
		 */		
		public var version:String;
		
		/**
		 * @var isplugin Indicates whether this is a plugin (for in a template), or a module (like the fileexplorer)
		 */		
		public var isplugin:Boolean = true;
		
		/**
		 * @var properties Array of Name value pair objects of available properties
		 * @example [{restrict:"string"},{maxChars:"number"},{required:"boolean"}]; 
		 */		
		public var properties:Array;
		
		/**
		 * @var modificationdate The date of the last modification
		 */
		public var modificationdate:Date;
		
		
	}
}