package nl.bs10.brightlib.objects
{
	import flash.events.Event;
	
	import nl.bs10.brightlib.interfaces.IMarker;

	[RemoteClass(alias="OMarker")]
	public dynamic class MarkerPage extends Page implements IMarker
	{
		private var _markerId:int;
		private var _lat:Number;
		private var _lng:Number;
		private var _layer:int;
		private var _iconsize:uint = 16;
		private var _icon:String;
		private var _color:uint;
		private var _uselayercolor:Boolean;
		private var _enabled:Boolean = true;
		private var _street:String;
		private var _number:String;
		private var _zip:String;
		private var _city:String;
		private var _country:String;
		
		[Bindable(event="uselayercolorChanged")]
		public function set uselayercolor(value:Boolean):void {
		 	if(value !== _uselayercolor) {
		 		_uselayercolor = value;
		 		dispatchEvent(new Event("uselayercolorChanged"));
		 	}
		}		
		
		public function get uselayercolor():Boolean {
			return _uselayercolor;
		}
		
		public function set deleted(value:Boolean):void {
			
		}		
		
		public function get deleted():Boolean {
			return false;
		}
		
		
		[Bindable(event="enabledChanged")]
		public function set enabled(value:Boolean):void {
		 	if(value !== _enabled) {
		 		_enabled = value;
		 		dispatchEvent(new Event("enabledChanged"));
		 	}
		}		
		
		public function get enabled():Boolean {
			return _enabled;
		}
		
		[Bindable(event="iconChanged")]
		public function set icon(value:String):void {
		 	if(value !== _icon) {
		 		_icon = value;
		 		dispatchEvent(new Event("iconChanged"));
		 	}
		}		
		
		public function get icon():String {
			return _icon;
		}
		
		[Bindable(event="iconsizeChanged")]
		public function set iconsize(value:uint):void {
		 	if(value !== _iconsize) {
		 		_iconsize = value;
		 		dispatchEvent(new Event("iconsizeChanged"));
		 	}
		}		
		
		public function get iconsize():uint {
			return _iconsize;
		}
		
		[Bindable(event="colorChanged")]
		public function set color(value:uint):void {
		 	if(value !== _color) {
		 		_color = value;
		 		dispatchEvent(new Event("colorChanged"));
		 	}
		}		
		
		public function get color():uint {
			return _color;
		}
		
		[Bindable(event="layerChanged")]
		public function set layer(value:int):void {
		 	if(value !== _layer) {
		 		_layer = value;
		 		dispatchEvent(new Event("layerChanged"));
		 	}
		}		
		
		public function get layer():int {
			return _layer;
		}
		
		[Bindable(event="markerIdChanged")]
		public function set markerId(value:int):void {
			if(value !== _markerId) {
				_markerId = value;
				dispatchEvent(new Event("markerIdChanged"));
			}
		}		
		
		public function get markerId():int {
			return _markerId;
		}
		
		[Bindable(event="lngChanged")]
		public function set lng(value:Number):void {
		 	if(value !== _lng) {
		 		_lng = value;
		 		dispatchEvent(new Event("lngChanged"));
		 	}
		}		
		
		public function get lng():Number {
			return _lng;
		}
		
		[Bindable(event="latChanged")]
		public function set lat(value:Number):void {
		 	if(value !== _lat) {
		 		_lat = value;
		 		dispatchEvent(new Event("latChanged"));
		 	}
		}		
		
		public function get lat():Number {
			return _lat;
		}
		
		private var _search:String;
		
		[Bindable(event="searchChanged")]
		public function set search(value:String):void {
			if(value !== _search) {
				_search = value;
				dispatchEvent(new Event("searchChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the search property
		 **/
		public function get search():String {
			return _search;
		}
		
		[Bindable(event="streetChanged")]
		public function set street(value:String):void {
			if(value !== _street) {
				_street = value;
				dispatchEvent(new Event("streetChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the street property
		 **/
		public function get street():String {
			return _street;
		}
		
		
		[Bindable(event="numberChanged")]
		public function set number(value:String):void {
			if(value !== _number) {
				_number = value;
				dispatchEvent(new Event("numberChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the number property
		 **/
		public function get number():String {
			return _number;
		}
		
		
		[Bindable(event="zipChanged")]
		public function set zip(value:String):void {
			if(value !== _zip) {
				_zip = value;
				dispatchEvent(new Event("zipChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the zip property
		 **/
		public function get zip():String {
			return _zip;
		}
		
		[Bindable(event="cityChanged")]
		public function set city(value:String):void {
			if(value !== _city) {
				_city = value;
				dispatchEvent(new Event("cityChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the city property
		 **/
		public function get city():String {
			return _city;
		}
		
		[Bindable(event="countryChanged")]
		public function set country(value:String):void {
			if(value !== _country) {
				_country = value;
				dispatchEvent(new Event("countryChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the country property
		 **/
		public function get country():String {
			return _country;
		}
	}
}