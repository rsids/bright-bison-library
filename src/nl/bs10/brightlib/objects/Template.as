package nl.bs10.brightlib.objects {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.describeType;
	
		
	[RemoteClass(alias="OTemplate")]
	public class Template extends EventDispatcher {
		
		private var _id:int;
		private var _itemtype:String;
		private var _templatename:String;
		private var _templatetype:int;
		private var _parser:int;
		private var _visible:Boolean;
		private var _lifetime:String = "0 hours";
		private var _priority:Number = .5;
		private var _maxchildren:Number = -1;
		private var _fields:Array;
		private var _icon:String;
		
		[Transient]
		public function clone():Template {
			var clone:Template = new Template();
			var description:XML = describeType(this);
			for each(var accessor:XML in description..accessor) {
				var prop:String = accessor.@name;
				clone[prop] = this[prop];
			}
			return clone;
		}
		
		[Transient]
		public function merge(tpl:Template):void {
			var description:XML = describeType(this);
			for each(var accessor:XML in description..accessor) {
				var prop:String = accessor.@name;
				if(prop != "id") {
					this[prop] = tpl[prop];
				}
			}
		}

		public function get icon():String
		{
			return _icon;
		}

		[Bindable(event="iconChanged")]
		public function set icon(value:String):void
		{
			if(value !== _icon) {
				_icon = value;
				dispatchEvent(new Event("iconChanged"));
			}
		}
		
		[Bindable(event="idChanged")]
		public function set id(value:int):void {
			if(value !== _id) {
				_id = value;
				dispatchEvent(new Event("idChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the id property
		 **/
		public function get id():int {
			return _id;
		}
		
		[Bindable(event="itemtypeChanged")]
		public function set itemtype(value:String):void {
			if(value !== _itemtype) {
				_itemtype = value;
				dispatchEvent(new Event("itemtypeChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the itemtype property
		 **/
		public function get itemtype():String {
			return _itemtype;
		}
		
		[Bindable(event="templatenameChanged")]
		public function set templatename(value:String):void {
			if(value !== _templatename) {
				_templatename = value;
				dispatchEvent(new Event("templatenameChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the templatename property
		 **/
		public function get templatename():String {
			return _templatename;
		}
		
		[Bindable(event="templatetypeChanged")]
		public function set templatetype(value:int):void {
			if(value !== _templatetype) {
				_templatetype = value;
				dispatchEvent(new Event("templatetypeChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the templatetype property
		 **/
		public function get templatetype():int {
			return _templatetype;
		}
		
		[Bindable(event="parserChanged")]
		public function set parser(value:int):void {
			if(value !== _parser) {
				_parser = value;
				dispatchEvent(new Event("parserChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the parser property
		 **/
		public function get parser():int {
			return _parser;
		}
		
		[Bindable(event="visibleChanged")]
		public function set visible(value:Boolean):void {
			if(value !== _visible) {
				_visible = value;
				dispatchEvent(new Event("visibleChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the visible property
		 **/
		public function get visible():Boolean {
			return _visible;
		}
		
		[Bindable(event="lifetimeChanged")]
		public function set lifetime(value:String):void {
			if(value !== _lifetime) {
				_lifetime = value;
				dispatchEvent(new Event("lifetimeChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the lifetime property
		 **/
		public function get lifetime():String {
			return _lifetime;
		}
		
		[Bindable(event="priorityChanged")]
		public function set priority(value:Number):void {
			if(value !== _priority) {
				_priority = value;
				dispatchEvent(new Event("priorityChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the priority property
		 **/
		public function get priority():Number {
			return _priority;
		}
		
		
		[Bindable(event="maxchildrenChanged")]
		public function set maxchildren(value:Number):void {
			if(value !== _maxchildren) {
				_maxchildren = value;
				dispatchEvent(new Event("maxchildrenChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the maxchildren property
		 **/
		public function get maxchildren():Number {
			return _maxchildren;
		}
		
		
		[Bindable(event="fieldsChanged")]
		public function set fields(value:Array):void {
			if(value !== _fields) {
				_fields = value;
				dispatchEvent(new Event("fieldsChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the fields property
		 **/
		public function get fields():Array {
			return _fields;
		}
	}
}