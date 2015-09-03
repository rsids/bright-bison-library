package nl.bs10.brightlib.objects{
	import flash.events.EventDispatcher;
	
	
	[Bindable]
	[RemoteClass(alias="OTreeNode")]
	public dynamic class TreeNode extends EventDispatcher {
		
		public var treeId:int;
		public var parentId:int;
		public var index:int;
		public var numChildren:int;
		public var page:Page;
		public var path:String;
		public var locked:Boolean;
		public var loginrequired:Boolean;
		public var shortcut:Number = 0;
	}
}