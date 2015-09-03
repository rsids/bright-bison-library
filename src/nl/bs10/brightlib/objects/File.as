package nl.bs10.brightlib.objects {
	import flash.events.Event;
	import flash.events.EventDispatcher;

	[RemoteClass(alias="OFile")]
	public dynamic class File extends EventDispatcher
	{
		private var _path:String;
		
		private var _filename:String;
		private var _extension:String;
		private var _filesize:Number;
		private var _width:int;
		private var _height:int;
		private var _exif:Object;
		
		[Bindable(event="pathChanged")]
		public function set path(value:String):void {
			if(value !== _path) {
				_path = (value.substr(0,1) == "/") ? value.substring(1) : value;
				dispatchEvent(new Event("pathChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the path property
		 **/
		public function get path():String {
			return _path;
		}
		
		[Bindable(event="filenameChanged")]
		public function set filename(value:String):void {
			if(value !== _filename) {
				_filename = value;
				dispatchEvent(new Event("filenameChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the filename property
		 **/
		public function get filename():String {
			return _filename;
		}
		
		
		[Bindable(event="extensionChanged")]
		public function set extension(value:String):void {
			if(value !== _extension) {
				_extension = value;
				dispatchEvent(new Event("extensionChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the extension property
		 **/
		public function get extension():String {
			return _extension;
		}
		
		
		[Bindable(event="filesizeChanged")]
		public function set filesize(value:Number):void {
			if(value !== _filesize) {
				_filesize = value;
				dispatchEvent(new Event("filesizeChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the filesize property
		 **/
		public function get filesize():Number {
			return _filesize;
		}
		
		
		[Bindable(event="widthChanged")]
		public function set width(value:int):void {
			if(value !== _width) {
				_width = value;
				dispatchEvent(new Event("widthChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the width property
		 **/
		public function get width():int {
			return _width;
		}
		
		
		
		[Bindable(event="heightChanged")]
		public function set height(value:int):void {
			if(value !== _height) {
				_height = value;
				dispatchEvent(new Event("heightChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the height property
		 **/
		public function get height():int {
			return _height;
		}
		
		[Bindable(event="exifChanged")]
		public function set exif(value:Object):void {
			if(value !== _exif) {
				_exif = value;
				dispatchEvent(new Event("exifChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the exif property
		 **/
		public function get exif():Object {
			return _exif;
		}
	}
}