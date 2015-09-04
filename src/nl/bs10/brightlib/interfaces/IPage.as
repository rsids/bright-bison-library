package nl.bs10.brightlib.interfaces
{
	public interface IPage
	{
		
		[Bindable(event="modificationdateChanged")]
		function set modificationdate(value:Number):void;
		function get modificationdate():Number;
		
		[Bindable(event="publicationdateChanged")]
		function set publicationdate(value:Number):void;
		function get publicationdate():Number;
		
		[Bindable(event="expirationdateChanged")]
		function set expirationdate(value:Number):void;
		function get expirationdate():Number;
		
		[Bindable(event="flpublicationdateChanged")]
		function set flpublicationdate(value:Date):void;
		function get flpublicationdate():Date;
		
		[Bindable(event="flexpirationdateChanged")]
		function set flexpirationdate(value:Date):void;
		function get flexpirationdate():Date;
		
		[Bindable(event="pageIdChanged")]
		function set pageId(value:int):void;
		function get pageId():int;
		
		[Bindable(event="labelChanged")]
		function set label(value:String):void;
		function get label():String;
		
		[Bindable(event="alwayspublishedChanged")]
		function set alwayspublished(value:Boolean):void;
		function get alwayspublished():Boolean;
		
		[Bindable(event="showinnavigationChanged")]
		function set showinnavigation(value:Boolean):void;
		function get showinnavigation():Boolean;
		
		[Bindable(event="itemTypeChanged")]
		function set itemType(value:int):void;
		function get itemType():int;
		
		[Bindable(event="usecountChanged")]
		function set usecount(value:int):void;
		function get usecount():int;
		
		[Bindable(event="contentChanged")]
		function set content(value:Object):void;
		function get content():Object;
		
		function clone():IPage;
	}
}