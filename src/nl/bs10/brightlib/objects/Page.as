package nl.bs10.brightlib.objects {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import nl.bs10.brightlib.interfaces.IPage;
	
	[RemoteClass(alias="OPage")]
	public dynamic class Page extends EventDispatcher implements IPage  {

		private var _itemLabel:String;
		private var _lifetime:String;
		
		private var _pageId:int;
		private var _label:String;
		private var _alwayspublished:Boolean = true;
		private var _showinnavigation:Boolean = true;
		private var _itemType:int;
		private var _content:Object;
		private var _usecount:Number;
		private var _flpublicationdate:Date = new Date();
		private var _flmodificationdate:Date = new Date();
		private var _flexpirationdate:Date = new Date(((new Date().fullYear) + 1), 1,1,0,0,0,0);
		
		private var _createdby:int;
		private var _modifiedby:int;
		private var _creationdate:int;
		private var _flcreationdate:Date = new Date();
		
		[Transient] public var coloredlabel:String = "";
		
		public function set modificationdate(value:Number):void {
			flmodificationdate = new Date(value * 1000);
		}
		
		public function get modificationdate():Number {
			return Math.round(flmodificationdate.getTime() / 1000);
		}
		
		public function set publicationdate(value:Number):void {
			flpublicationdate = new Date(value * 1000);
		}
		
		public function get publicationdate():Number {
			return Math.round(flpublicationdate.getTime() / 1000);
		}
		
		public function set expirationdate(value:Number):void {
			flexpirationdate = new Date(value * 1000);
		}
		
		public function get expirationdate():Number {
			return Math.round(flexpirationdate.getTime() / 1000);
		}
		
		[Transient]
		[Bindable(event="flmodificationdateChanged")]
		public function set flmodificationdate(value:Date):void {
			if(_flmodificationdate !== value) {
				_flmodificationdate = value;
				dispatchEvent(new Event("flmodificationdateChanged"));
			}
		}
		
		public function get flmodificationdate():Date {
			return _flmodificationdate;
		}
		
		[Transient]
		[Bindable(event="flpublicationdateChanged")]
		public function set flpublicationdate(value:Date):void {
			if(_flpublicationdate !== value) {
				_flpublicationdate = value;
				dispatchEvent(new Event("flpublicationdateChanged"));
			}
		}
		
		public function get flpublicationdate():Date {
			return _flpublicationdate;
		}
		
		[Transient]
		[Bindable(event="flexpirationdateChanged")]
		public function set flexpirationdate(value:Date):void {
			if(_flexpirationdate !== value) {
				_flexpirationdate = value;
				dispatchEvent(new Event("flexpirationdateChanged"));
			}
			
		}
		
		public function get flexpirationdate():Date {
			return _flexpirationdate;
		}
		
		[Bindable(event="alwayspublishedChanged")]
		public function set alwayspublished(value:Boolean):void {
			if(value !== _alwayspublished) {
				_alwayspublished = value;
				dispatchEvent(new Event("alwayspublishedChanged"));
			}
		}
		
		public function get alwayspublished():Boolean {
			return _alwayspublished;
		}
		
		[Bindable(event="showinnavigationChanged")]
		public function set showinnavigation(value:Boolean):void {
			if(value !== _showinnavigation) {
				_showinnavigation = value;
				dispatchEvent(new Event("showinnavigationChanged"));
			}
		}
		
		public function get showinnavigation():Boolean {
			return _showinnavigation;
		}
		
		[Bindable(event="pageIdChanged")]
		public function set pageId(value:int):void {
			if(value !== _pageId) {
				_pageId = value;
				dispatchEvent(new Event("pageIdChanged"));
			}
		}
		
		public function get pageId():int {
			return _pageId;
		}
		
		[Bindable(event="labelChanged")]
		public function set label(value:String):void {
			if(value !== _label) {
				_label = value;
				dispatchEvent(new Event("labelChanged"));
			}
		}
		
		public function get label():String {
			return _label;
		}
		
		[Bindable(event="lifetimeChanged")]
		public function set lifetime(value:String):void {
			if(value !== _lifetime) {
				_lifetime = value;
				dispatchEvent(new Event("lifetimeChanged"));
			}
		}
		
		public function get lifetime():String {
			return _lifetime;
		}
		
		[Bindable(event="itemLabelChanged")]
		public function set itemLabel(value:String):void {
			if(value !== _itemLabel) {
				_itemLabel = value;
				dispatchEvent(new Event("itemLabelChanged"));
			}
		}
		
		public function get itemLabel():String {
			return _itemLabel;
		}
		
		[Bindable(event="itemTypeChanged")]
		public function set itemType(value:int):void {
			if(value !== _itemType) {
				_itemType = value;
				dispatchEvent(new Event("itemTypeChanged"));
			}
		}
		
		public function get itemType():int {
			return _itemType;
		}
		
		[Bindable(event="usecountChanged")]
		public function set usecount(value:int):void {
			if(value !== _usecount) {
				_usecount = value;
				dispatchEvent(new Event("usecountChanged"));
			}
		}
		
		public function get usecount():int {
			return _usecount;
		}
		
		[Bindable(event="contentChanged")]
		public function set content(value:Object):void {
			if(value !== _content) {
				_content = value;
				dispatchEvent(new Event("contentChanged"));
			}
		}
		
		public function get content():Object {
			return _content;
		}
		
		[Bindable(event="createdbyChanged")]
		public function set createdby(value:int):void {
			if(value !== _createdby) {
				_createdby = value;
				dispatchEvent(new Event("createdbyChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the createdby property
		 **/
		public function get createdby():int {
			return _createdby;
		}
		
		[Bindable(event="modifiedbyChanged")]
		public function set modifiedby(value:int):void {
			if(value !== _modifiedby) {
				_modifiedby = value;
				dispatchEvent(new Event("modifiedbyChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the modifiedby property
		 **/
		public function get modifiedby():int {
			return _modifiedby;
		}
		
		[Bindable(event="creationdateChanged")]
		public function set creationdate(value:int):void {
			flcreationdate = new Date(value * 1000);
		}
		
		/** 
		 * Getter/Setter methods for the creationdate property
		 **/
		public function get creationdate():int {
			return  Math.round(flcreationdate.getTime() / 1000);;
		}
		
		[Transient]
		[Bindable(event="flcreationdateChanged")]
		public function set flcreationdate(value:Date):void {
			if(value !== _flcreationdate) {
				_flcreationdate = value;
				dispatchEvent(new Event("flcreationdateChanged"));
			}
		}
		
		/** 
		 * Getter/Setter methods for the flcreationdate property
		 **/
		public function get flcreationdate():Date {
			return _flcreationdate;
		}
	
		[Transient]
		public function clone():IPage {
			var p:Page = new Page();
			p.pageId = pageId;
			p.label = label;
			p.alwayspublished = alwayspublished;
			p.showinnavigation = showinnavigation;
			p.itemType = itemType;
			p.content = content;
			p.flexpirationdate = flexpirationdate;
			p.flmodificationdate = flmodificationdate;
			p.flpublicationdate = flpublicationdate;
			p.usecount = usecount;
			return p;
		}

	}
}