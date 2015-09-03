package nl.bs10.brightlib.interfaces
{
	public interface IMarker extends IPage
	{
		
		[Bindable(event="searchChanged")]
		function set search(value:String):void;
		function get search():String;
		
		[Bindable(event="layerChanged")]
		function set layer(value:int):void;
		function get layer():int;
		
		[Bindable(event="colorChanged")]
		function set color(value:uint):void;
		function get color():uint;
	}
}