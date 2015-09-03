package nl.bs10.brightlib.utils
{
	public class ArrayUtil
	{
		public static function hashmap2array(hashmap:Array):Array {
			var arr:Array = new Array();
			for each(var co:* in hashmap) {
				arr.push(co);
			}
			return arr;
		}
	}
}