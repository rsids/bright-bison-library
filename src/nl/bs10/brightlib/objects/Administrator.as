package nl.bs10.brightlib.objects {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[RemoteClass(alias="OAdministratorObject")]
	public class Administrator extends EventDispatcher {
		
		private var _id:int;
		private var _name:String;
		private var _sessionId:String;
		private var _email:String;
		private var _password:String;
		private var _permissions:Array = new Array();
		/*private var _labels:Array = new Array();
		private var _visibleColumns:Array = new Array();
		private var _defaultSort:int = 5;*/
		private var _settings:Object;
		
		[Transient]
		public function labelsChanged():void {
			dispatchEvent(new Event('labelsChanged'));
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
		
		[Bindable(event="nameChanged")]
		public function set name(value:String):void {
			if(value !== _name) {
				_name = value;
				dispatchEvent(new Event("nameChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the name property
		 **/
		public function get name():String {
			return _name;
		}
		
		[Bindable(event="sessionIdChanged")]
		public function set sessionId(value:String):void {
			if(value !== _sessionId) {
				_sessionId = value;
				dispatchEvent(new Event("sessionIdChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the sessionId property
		 **/
		public function get sessionId():String {
			return _sessionId;
		}
		
		[Bindable(event="emailChanged")]
		public function set email(value:String):void {
			if(value !== _email) {
				_email = value;
				dispatchEvent(new Event("emailChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the email property
		 **/
		public function get email():String {
			return _email;
		}
		
		[Bindable(event="passwordChanged")]
		public function set password(value:String):void {
			if(value !== _password) {
				_password = value;
				dispatchEvent(new Event("passwordChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the password property
		 **/
		public function get password():String {
			return _password;
		}
		
		[Bindable(event="permissionsChanged")]
		public function set permissions(value:Array):void {
			if(value !== _permissions) {
				_permissions = value;
				dispatchEvent(new Event("permissionsChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the permissions property
		 **/
		public function get permissions():Array {
			return _permissions;
		}
		
/*		DEPRECATED
		[Bindable(event="labelsChanged")]
		public function set labels(value:Array):void {
			if(value !== _labels) {
				_labels = value;
				dispatchEvent(new Event("labelsChanged"));
			}
		}
		
		/* * 
		 * Getter/Setter methods for the labels property
		 * * /
		public function get labels():Array {
			return _labels;
		}
		
		[Bindable(event="visibleColumnsChanged")]
		public function set visibleColumns(value:Array):void {
			if(value !== _visibleColumns) {
				_visibleColumns = value;
				dispatchEvent(new Event("visibleColumnsChanged"));
			}
		}
		
		/ ** 
		 * Getter/Setter methods for the visibleColumns property
		 ** /
		public function get visibleColumns():Array {
			return _visibleColumns;
		}
		
		[Bindable(event="defaultSortChanged")]
		public function set defaultSort(value:int):void {
			if(value !== _defaultSort) {
				_defaultSort = value;
				dispatchEvent(new Event("defaultSortChanged"));
			}
		}
		
		/ ** 
		 * Getter/Setter methods for the defaultSort property
		 ** /
		public function get defaultSort():int {
			return _defaultSort;
		}*/
		
		[Bindable(event="settingsChanged")]
		public function set settings(value:Object):void {
			if(value !== _settings) {
				_settings = value;
				dispatchEvent(new Event("settingsChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the settings property
		 **/
		public function get settings():Object {
			return _settings;
		}
	}
}