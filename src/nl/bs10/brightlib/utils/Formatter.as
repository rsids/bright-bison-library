package nl.bs10.brightlib.utils {
	import mx.formatters.DateFormatter;

	public class Formatter {
		
		public static var dateFormat:String =  "DD-MM-YYYY";
		public static var dateTimeFormat:String = "DD-MM-YYYY J:NN";
		
		/**
		 * Formats a date for a datagrid 
		 * @param data
		 * @param column
		 * @return 
		 * 
		 */		
		public static function formatDate(data:Object, column:Object):String {
			return realFormatDate(data[column.dataField], dateFormat);
		}
		
		/**
		 * Formats a date for a datagrid 
		 * @param data
		 * @param column
		 * @return 
		 * 
		 */		
		public static function formatDateTime(data:Object, column:Object):String {
			return realFormatDate(data[column.dataField], dateTimeFormat);
		}
		
		/**
		 * Formats a date to the specified format 
		 * @param date The date to format
		 * @param format The format string
		 * @return string The formatted string
		 * 
		 */		
		public static function realFormatDate(date:Date, format:String):String {
			var f:DateFormatter = new DateFormatter();
			f.formatString = format;
			return f.format(date);
		}
	}
}