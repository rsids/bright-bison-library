package nl.bs10.brightlib.utils
{
	public class DateUtils
	{
		
		/**
		 * Converts a time string (23:19) to the number of milliseconds since midnight
		 * @param String value The time object
		 * @return int The number of milliseconds since midnight;
		 */
		public static function timestringToDate(input:String):Date {
			var parts:Array = input.split(":");
			var hrs:uint = parseInt(parts[0]);
			hrs = Math.min(hrs, 23);
			var mins:uint = 0;
			if(parts.length > 1) {
				mins = parseInt(parts[1]);
				mins = Math.min(mins, 59);
			}
			var d:Date = new Date();
			d.setTime(0);
			d.setUTCHours(hrs);
			d.setUTCMinutes(mins);
			return d;
		}
		
		
		/**
		 * Converts a date to a time string (23:19)
		 * @param String value The date object
		 * @return string A string formatted in HH:MM
		 */
		public static function dateToTimeString(input:Date):String {
			return String("0" + input.getHours()).substr(-2) + ":" + String("0" + input.getMinutes()).substr(-2);
		}
	}
}