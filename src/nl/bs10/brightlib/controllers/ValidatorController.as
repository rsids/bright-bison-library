package nl.bs10.brightlib.controllers {
	import mx.validators.EmailValidator;
	import mx.validators.NumberValidator;
	import mx.validators.RegExpValidator;
	import mx.validators.StringValidator;
	
	public class ValidatorController {
		
		private static function getReqError(source:Object):String {
			return (source.hasOwnProperty("fieldname") && source.fieldname && source.fieldname != "") ? "The field '" + source.fieldname + "' is required" : "This field is required";
		}
		
		private static function getLengthError(source:Object, minmax:String, len:String):String {
			var str:String = "The " + minmax + " length of ";
			str += (source.hasOwnProperty("fieldname") && source.fieldname && source.fieldname != "") ? source.fieldname : "this field";
			str += " is " + len.toString();
			return str;
		}
		
		public static function createStringValidator(source:Object, property:String, required:Boolean = true, minLength:Number = -1, maxLength:Number = -1):StringValidator {
			if(source == null)
				return null;
				
			var strv:StringValidator = new StringValidator();
			strv.required = required;
			if(maxLength != -1)
				strv.maxLength = maxLength;
			if(minLength != -1)
				strv.minLength = minLength;
				
			
			strv.requiredFieldError = getReqError(source);
			strv.tooShortError = getLengthError(source, "minimum", strv.minLength.toString());
			strv.tooLongError = getLengthError(source, "maximum", strv.maxLength.toString());
			strv.source = source;
			strv.property = property;
			return strv;
		}
		
		public static function createPasswordValidator(source:Object, property:String, secondarysource:Object, secondaryproperty:String, required:Boolean = true, minLength:Number = -1, maxLength:Number = -1):StringValidator {
			
			var strv:PasswordValidator = new PasswordValidator();
			strv.required = required;
			if(maxLength != -1)
				strv.maxLength = maxLength;
			if(minLength != -1)
				strv.minLength = minLength;
				
			strv.requiredFieldError = getReqError(source);
			strv.tooShortError = getLengthError(source, "minimum", strv.minLength.toString());
			strv.tooLongError = getLengthError(source, "maximum", strv.maxLength.toString());
			strv.inequalpasswordsError = "The entered passwords do not match";
			strv.source = source;
			strv.property = property;
			strv.secondarysource = secondarysource;
			strv.secondaryproperty = secondaryproperty;
			return strv;
		}
		
		public static function createEmailValidator(source:Object, property:String, required:Boolean = true):EmailValidator {
			var mailv:EmailValidator = new EmailValidator();
			mailv.required = required;
			var field:String = (source.hasOwnProperty("fieldname") && source.fieldname && source.fieldname != "") ? source.fieldname : "this email address";
			mailv.invalidCharError = "There are invalid characters in " + field;
			mailv.invalidDomainError = "The domain in " + field + " is invalid";
			mailv.invalidIPDomainError = "The IP-address of " + field + " is invalid";
			mailv.invalidPeriodsInDomainError = "The domain in " + field + " is invalid";
			mailv.missingAtSignError = field + " is invalid without the @ sign";
			mailv.missingPeriodInDomainError = "The domain in " + field + " is invalid";
			mailv.missingUsernameError = field + " cannot start with an @";
			mailv.requiredFieldError = getReqError(source);
			mailv.tooManyAtSignsError = field + " can only have one @ sign";
			mailv.source = source;
			mailv.property = property;
			
			return mailv;
		}
		
		public static function createNumberValidator(source:Object, property:String, required:Boolean = true):NumberValidator {
			var numberv:NumberValidator = new NumberValidator();
			numberv.required = required;
			var field:String = (source.hasOwnProperty("fieldname") && source.fieldname && source.fieldname != "") ? source.fieldname : "this number";
			
			numberv.invalidCharError = "There are invalid characters in " + field;
			numberv.requiredFieldError = getReqError(source);
			numberv.lowerThanMinError = "The value of " + field + " is lower than the minimum value";
			numberv.exceedsMaxError = "The value of " + field + " is higher than the maximum value";
			
			numberv.source = source;
			numberv.property = property;
			
			return numberv;
		}
		
		public static function createLinkValidator(source:Object, property:String, required:Boolean = true):RegExpValidator {
			var regv:RegExpValidator = new RegExpValidator();
			var field:String = (source.hasOwnProperty("fieldname") && source.fieldname && source.fieldname != "") ? source.fieldname : "this field";
			regv.expression = "(http|ftp|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:\\/~\\+#]*[\\w\\-\\@?^=%&amp;\\/~\\+#])?";
			regv.flags = "i";
			regv.required = required;
			regv.noMatchError = "The entered link in " + field + " is incorrect";
			regv.noExpressionError = "The expression  " + field + "  is not valid";
			regv.requiredFieldError = getReqError(source);
			regv.source = source;
			regv.property = property;
			
			return regv;
		}
		
		public static function createRegExpValidator(source:Object, property:String, regExp:String, required:Boolean = true):RegExpValidator {
			var regv:RegExpValidator = new RegExpValidator();
			var field:String = (source.hasOwnProperty("fieldname") && source.fieldname && source.fieldname != "") ? source.fieldname : "this field";
			regv.expression = regExp;
			regv.flags = "i";
			regv.required = required;
			regv.noMatchError = "The entered link in " + field + " is incorrect";
			regv.noExpressionError = "The expression in " + field + " is not valid";
			regv.requiredFieldError = getReqError(source);
			regv.source = source;
			regv.property = property;
			
			return regv;
		}
	}
	
}