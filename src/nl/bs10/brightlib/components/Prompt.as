package nl.bs10.brightlib.components
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import mx.containers.TitleWindow;
	import mx.controls.Button;
	import mx.controls.Text;
	import mx.controls.TextInput;
	import mx.core.Application;
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;
	
	import nl.bs10.brightlib.events.BrightEvent;

	public class Prompt extends TitleWindow
	{
		
		private var _question:String;
		private var _closeHandler:Function;
		
		private var _ok_btn:Button;
		private var _cancel_btn:Button;
		
		private var _answer_txt:TextInput;
		private var _question_txt:Text;
		
		private var _restrict:String;
		
		private var _questionChanged:Boolean;
		private var _measureRequired:Boolean;
		private var _restrictChanged:Boolean;
		
		public function Prompt()
		{
			super();
			width = 500;
			layout = "absolute";
			horizontalScrollPolicy = "off";
			verticalScrollPolicy = "off";
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			_answer_txt = new TextInput();
			_answer_txt.x = 10;
			_answer_txt.width = width - 40;
			_answer_txt.addEventListener(KeyboardEvent.KEY_UP, _keyboardHandler, false, 0, true);
			
			_question_txt = new Text();
			_question_txt.width = width - 40;
			_question_txt.y = 10;
			_question_txt.x = 10;
			_question_txt.height = 20;
			
			_ok_btn = new Button();
			_ok_btn.label = "OK";
			
			_cancel_btn = new Button();
			_cancel_btn.label = "Cancel";
			
			_cancel_btn.width = 100;
			_ok_btn.width = 100;
				
			_cancel_btn.x = width - 130;
			_ok_btn.x = width - 240;
			
			addChild(_question_txt);
			addChild(_answer_txt);
			addChild(_ok_btn);
			addChild(_cancel_btn);
			
			_answer_txt.setFocus();
			_cancel_btn.addEventListener(MouseEvent.CLICK, _cancelHandler);
			_ok_btn.addEventListener(MouseEvent.CLICK, _okHandler);
			invalidateProperties();
		}
		
		public static function show(question:String, title:String, closeHandler:Function, restrict:String = null):Prompt {
			var p:Prompt = new Prompt();
			p.promptquestion = question;
			p.restrict = restrict;
			p.title = title;
			p.closeHandler = closeHandler;
			
			PopUpManager.addPopUp(p as IFlexDisplayObject, Application.application as DisplayObject, true);
			PopUpManager.centerPopUp(p);
			return p;
		}
		
		public function set promptquestion(value:String):void {
			if(_question !== value) {
				_question = value;
				_questionChanged = true;
				invalidateProperties();
			}
		}
		
		public function get promptquestion():String {
			return _question;
		}
		
		public function set closeHandler(value:Function):void {
			_closeHandler = value;
		}
		
		public function get closeHandler():Function {
			return _closeHandler;
		}
		
		public function get restrict():String {
			return _restrict;
		}
		
		public function set restrict(value:String):void	{
			if(value !== _restrict) {
				_restrict = value;
				_restrictChanged = true;
				invalidateProperties();
			}
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if(_questionChanged) {
				_questionChanged = false;
				_question_txt.text = promptquestion;
				_measureRequired = true;
				invalidateDisplayList();
				
			}
			
			if(_restrictChanged) {
				_restrictChanged = false;
				_answer_txt.restrict = restrict;
			}
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			if(_measureRequired) {
				_measureRequired = false;
				
				_question_txt.height = _question_txt.textHeight;
				_answer_txt.y = _question_txt.height + 10;
				_ok_btn.y = _answer_txt.y + 30;
				_cancel_btn.y = _answer_txt.y + 30;
				unscaledHeight = _cancel_btn.y + _cancel_btn.height + 20;			
			}
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
		
		private function _okHandler(event:Event):void {
			closeHandler(new BrightEvent(BrightEvent.DATAEVENT, _answer_txt.text));
			_cancelHandler(event);
		}
		
		private function _cancelHandler(event:Event):void {
			PopUpManager.removePopUp(this);
			_question_txt.removeEventListener(KeyboardEvent.KEY_UP, _keyboardHandler);	
		}
		
		private function _keyboardHandler(event:KeyboardEvent):void {
			if(event.charCode == 13)
				_okHandler(event);
		}

	}
}