package nl.bs10.brightlib.controllers {
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.core.Application;
	import mx.core.ClassFactory;
	
	import nl.bs10.brightlib.components.renderers.ColorRenderer;
	import nl.bs10.brightlib.components.renderers.DGCheckboxRenderer;
	import nl.bs10.brightlib.components.renderers.IconRenderer;
	import nl.bs10.brightlib.utils.Formatter;

	public class DatagridController {
		
		public static function setDataGridColumns(dg:DataGrid, fields:Array):void {
			var cols:Array = [];
			
			for each(var col:String in fields) {
				
				var column:DataGridColumn = new DataGridColumn(col);
				// Add special features to certain columns
				switch(col) {
					case 'coloredlabel':
					case 'icon':
						column.headerText = '';
						column.dataField = col == 'icon' ? "itemType" : 'coloredlabel';
						column.itemRenderer = new ClassFactory(IconRenderer);
						column.width = 16;
						break;
					case 'color':
						column.headerText = '';
						column.dataField = 'color';
						column.itemRenderer = new ClassFactory(ColorRenderer);
						column.width = 16;
						
						break;
				
					case 'pageId':
					case 'calendarId':
					case 'userId':
					case 'elementId':
					case 'markerId':
						column.width = 50;
					
						break;
					case 'activated':
					case 'approved':
					case 'confirmed':
					case 'deleted':
					case 'enabled':
					case 'allwayspublished':
					case 'showinnavigation':
						column.itemRenderer = new ClassFactory(DGCheckboxRenderer);
						column.editable = false;
						column.setStyle("textAlign", "center");
						break;
					
					case 'layer':
						column.dataField = 'layer';
						break;
					case 'publicationdate':
					case 'modificationdate':
					case 'creationdate':
					case 'expirationdate':
					case 'registrationdate':
						column.dataField = 'fl' + col;
						column.labelFunction = Formatter.formatDate;
						break;
					case 'createdby':
					case 'modifiedby':
						column.labelFunction = Application.application.getAdministrator;
						break;
				}
				cols.push(column);
			}
			dg.columns = cols;
		}
	}
}