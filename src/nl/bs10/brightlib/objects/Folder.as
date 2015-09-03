package nl.bs10.brightlib.objects {
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="OFolder")]
	public dynamic class Folder {
		
		public var label:String = "";
		public var path:String = "";
		
		public var numChildren:int;

	}
}