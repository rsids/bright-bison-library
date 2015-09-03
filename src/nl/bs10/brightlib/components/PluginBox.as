package nl.bs10.brightlib.components
{
	import com.adobe.serialization.json.JSON;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.events.ValidationResultEvent;
	
	import nl.bs10.brightlib.events.BrightEvent;
	import nl.bs10.brightlib.events.FileExplorerEvent;
	import nl.bs10.brightlib.interfaces.IPlugin;
	import nl.bs10.brightlib.objects.Template;

	public class PluginBox extends VBox
	{
		private var _template:Template;
		private var _templateChanged:Boolean;
		private var _valuesChanged:Boolean;
		private var _addTitle:Boolean;
		private var _plugins:Object;
		private var _lang:String;
		private var _values:Object;
		
		public function PluginBox() {
			super();
			percentWidth = 100;
			percentHeight = 100;
			styleName = "innerVBox";
			//addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage, false, 0, true);
		}
		
		[Bindable(event="templateChanged")]
		public function set template(value:Template):void {
			if(value !== _template) {
				_template = value;
				_templateChanged = true;
				dispatchEvent(new Event("templateChanged"));
				invalidateProperties();
			}
		}
		
		public function get template():Template {
			return _template;
		}
		
		/**
		 * Specifies whether a titlefield should be added to the plugins 
		 * @param value Boolean
		 */
		public function set addTitle(value:Boolean):void {
			_addTitle = value;
		}
		
		public function get addTitle():Boolean {
			return _addTitle;	
		}
		
		public function set plugins(value:Object):void {
			_plugins = value;
		}
		
		public function get plugins():Object {
			return _plugins;
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			var ch:Array;
			var plugin:IPlugin;
			if(_templateChanged) {
				_templateChanged = false;
				if(!_plugins)
					throw new Error("Cannot create templates if plugins aren't present");
					
				if(numChildren > 0) {
					dispose();
				}
				plugin = null;
				
				if(addTitle) {
					plugin = plugins["string"].create();
					plugin.label = "title";
					plugin.displaylabel = "Title";
					addChild(plugin as DisplayObject);
				}
				
				
				if(template) {
					for each(var field:Object in template.fields) {
						if(!field.type || !field.label) {
							if(field.label) {
								Alert.show(field.label + ' has no type set. Please alter the template and set the field type', 'Field type missing');
							} else {
								Alert.show('One of the field is missing a label and / or type. Please alter the template and fill the missing fields.', 'Incomplete template');
							}
						} else {
							plugin = plugins[field.type].create();
							plugin.addEventListener(FileExplorerEvent.OPENFILEEXPLOREREVENT, _openFileExplorer, false, 0, true);
							plugin.addEventListener(BrightEvent.DATAEVENT, _pluginDataEvent, false, 0, true);
							plugin.label = field.label;
							plugin.displaylabel = field.displaylabel;
							
							var dataobj:Object = {};
							// Set additional properties
							if(field.hasOwnProperty("data") && field.data != "" && field.data != null) {
								dataobj = JSON.decode(field.data);
							}
							plugin.data = dataobj;
							addChild(plugin as DisplayObject);
						}
					}
					plugin = null;
				}
			}
			
			if(_valuesChanged) {
				_valuesChanged = false;
				
				if(_values && numChildren > 0) {
					ch = getChildren();
					for each(plugin in ch) {
						
						if(_values.hasOwnProperty(plugin.label)) {
							
							if(_lang) {
							
								if(_values[plugin.label].hasOwnProperty(_lang))
									plugin.value =  _values[plugin.label][_lang];
							
							} else {
								plugin.value = _values[plugin.label];
							}
						}
					}
					plugin = null;
				}
			}
		}
		
		/**
		 * Processes all the plugins in this box 
		 * @param content The object to store the results in. This way, you can store different languages in 1 object
		 * @param error The array with errors
		 * @return The array with errors
		 * 
		 */		
		public function validate(content:Object, error:Array = null):Array {
			if(!error)
				error = new Array();
				
			var c:Array = getChildren();
			for each(var plugin:IPlugin in c) {
				var valObj:Object = plugin.validate();
				if(valObj.valid == true) {
					var value:* = plugin.value;
					if(value !== null && value !== "") {
				
						if(!content[plugin.label])
							content[plugin.label] = {};
						
						if(_lang) {	
							content[plugin.label][_lang] = value;
						
						} else {
							content[plugin.label] = value;
						}
					}
				} else {
					for each(var reason:ValidationResultEvent in valObj.reason) {
						error.push(reason.message);
					}
				}
			}
			
			return error;
		}
		
		public function dispose():PluginBox {
			var ch:Array = getChildren();
			for each(var pl:IPlugin in ch) {
				pl.removeEventListener(FileExplorerEvent.OPENFILEEXPLOREREVENT, _openFileExplorer);
				pl.removeEventListener(BrightEvent.DATAEVENT, _pluginDataEvent);
				pl.destroy();
				removeChild(pl as DisplayObject);
			}
			return this;
		}
		
		/**
		 * Fills the plugins with their values 
		 * @param values An object holding the values 
		 * @param lang The language of this box (leave null when used inside a plugin)
		 */		
		public function setValues(values:Object, lang:String = null):void {
			_values = values;
			_lang = lang;
			_valuesChanged = true;
			invalidateProperties();
		}
		
		private function _openFileExplorer(event:FileExplorerEvent):void {
			dispatchEvent(new FileExplorerEvent(event.type, event.callback, event.multiple, event.filter, event.foldersOnly, event.bubbles, event.cancelable));
		}
		
		private function _pluginDataEvent(event:BrightEvent):void {
			dispatchEvent(new BrightEvent(event.type, event.data, event.bubbles, event.cancelable));
		}
		
	}
}