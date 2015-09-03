package nl.bs10.brightlib.controllers {
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import nl.bs10.brightlib.objects.File;
	public class IconController {
		
		[Embed(source="../../../../assets/gray.swf", mimeType="application/octet-stream")]
		private static var _icons:Class;
		
		[Embed(source='../../../../assets/gear.png')]
		public static const SETTINGS:Class;
		
		[Embed(source="../../../../assets/arrow_down.png")]
		public static const DOWNARROW:Class;
		
		[Embed(source="../../../../assets/arrow_up.png")]
		public static const UPARROW:Class;
		
		[Embed(source="../../../../assets/arrow_left.png")]
		public static const LEFTARROW:Class;
		
		[Embed(source="../../../../assets/arrow_right.png")]
		public static const RIGHTARROW:Class;

		
		[Embed(source="../../../../assets/delete.png")]
		public static const DELETE:Class;
		
		[Embed(source="../../../../assets/add_gray.png")]
		public static const ADD:Class;
		
		
		[Embed(source='../../../../assets/trash_gray.png')]
		public static const TRASH:Class;
		
		[Embed(source='../../../../assets/lock_gray.png')]
		public static const LOCK:Class;
		
		[Embed(source='../../../../assets/refresh_gray.png')]
		public static const REFRESH:Class;
		
		[Embed(source='../../../../assets/edit.png')]
		public static const EDIT:Class;
		
		[Embed(source='../../../../assets/login_gray.png')]
		public static const LOGIN:Class; 
		
		public static var definitions:ArrayCollection;
		
		public static var grayicons:Loader;
		public static var icons:LoaderInfo;
		public static var langs:LoaderInfo;
		
		/**
		 * Loads the icons swf, proceed loading application when done 
		 * @param callback Function to call and inform the application the loading is complete
		 * 
		 */		
		public static function init(callback:Function):void {
			grayicons = new Loader();
			grayicons.contentLoaderInfo.addEventListener(Event.COMPLETE, callback);
			grayicons.loadBytes(new _icons());
		}
		
		public static function getIcon(value:Object, dataField:String = null):* {
			if(!value)
				return;
				
			if(value is File)
				return '/' + value.path + value.filename;
			if(dataField && dataField != "itemType") {
				if(value.hasOwnProperty(dataField) && value[dataField]) {	
					if(value[dataField] is String && value[dataField].indexOf(".") != -1)
						return value[dataField];
					
					return _getIcon(value[dataField]);
				}
				
				return null;
				
			}
			
			if(value is String) {
				if(value.toString().indexOf(".") != -1)
						return value;
					
				return _getIcon(value.toString());
			}
			
			var itemType:Number = (value.hasOwnProperty("page")) ? value.page.itemType : value.itemType;
			if(value.hasOwnProperty("page") && !definitions) {
				return _getIcon(value.icon);
			}
			
			for each(var definition:Object in definitions) {
				if(definition.id == itemType) {
					return _getIcon(definition.icon);
				}
			}
			
			return null;
		}
		
		public static function getGray(name:String):MovieClip { 
			var icon:Class;
			if(grayicons.contentLoaderInfo.applicationDomain.hasDefinition(name)) {
				icon = grayicons.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
			} else {
				icon = grayicons.contentLoaderInfo.applicationDomain.getDefinition('question_white') as Class;
			}
			var myIcon:MovieClip = new icon() as MovieClip;
			return myIcon;
			
		}
		
		public static function getLang(name:String):MovieClip {
			if(!name)
				return null;
				
			var icon:Class = langs.applicationDomain.getDefinition(name) as Class;
			var myIcon:MovieClip = new icon() as MovieClip;
			
			return myIcon;
		}
		
		private static function _getIcon(name:String):MovieClip {
			if(!name)
				return null;
				
			if(!icons.applicationDomain.hasDefinition(name))
				return null;
				
			var icon:Class = icons.applicationDomain.getDefinition(name) as Class;
			var myIcon:MovieClip = new icon() as MovieClip;
			return myIcon;
		}
	}
}