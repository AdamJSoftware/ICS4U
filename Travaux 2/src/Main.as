package
{
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.system.System;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.external.ExternalInterface;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.engine.TextBlock;
	import flash.text.TextFormatAlign;
	

	public class Main extends Sprite{
		// public var MYFORMAT:TextFormat = new TextFormat();	
		// MYFORMAT.size = 30;
		
		public function Main(){
			var myFormat:TextFormat = new TextFormat();	
			myFormat.size = 20;
			var myFormat2:TextFormat = new TextFormat();	
			myFormat2.size = 20;
			myFormat2.align = TextFormatAlign.CENTER;
			var myFormat3:TextFormat = new TextFormat();	
			myFormat3.size = 40;
			var label1:TextField = createCustomTextField(100, 0, 230, 40, "Deux types de division2");
			label1.textColor = 0xFF0000;
			label1.border = 2;
			// label1.borderColor = 0x000FF;
			label1.setTextFormat(myFormat2);
			addChild(label1);

			var Input:TextField = createCustomInputField()
			Input.y = 45;
			Input.x = 230;
			Input.defaultTextFormat = myFormat;
        	addChild(Input);

			var Input2:TextField = createCustomInputField();
			Input2.y = 95;
			Input2.x = 230;
			Input2.defaultTextFormat = myFormat;
        	addChild(Input2);

			var Text1:TextField = createCustomTextField(0, 50,220, 100, "Inscrire le premier entier");
			Text1.setTextFormat(myFormat);
			addChild(Text1)

			var Text2:TextField = createCustomTextField(0, 100, 220, 100, "Inscrire le deuxième entier");
			Text2.setTextFormat(myFormat);
			addChild(Text2);


			var Result:TextField = createCustomTextField(0, 150, 450, 200, "");
			Result.border = 2;
			Result.borderColor = 000000;
			Result.defaultTextFormat = myFormat3;
			addChild(Result);

			var myLoader:Loader = new Loader();
			myLoader.scaleX = .05;
			myLoader.scaleY = .05;
			myLoader.y= 70;
			myLoader.x = 340;
			myLoader.load(new URLRequest('files\\button.png'));
			addChild(myLoader);

			myLoader.addEventListener(MouseEvent.CLICK, function(e: Event):void{click(Input, Input2, Result)})
		}
		private function click(Input1:TextField, Input2:TextField, Result:TextField):void{
			var a:int = int(Input1.text);
			var b:int = int(Input2.text);
			trace(Input1.text);
			trace(Input2.text);
			trace(a/b);
			trace(a%b);
			trace(b/a);
			trace(b%a);
			Result.text = Input1.text + "/" + Input2.text + " = " + String(a/b) + "\n" + Input1.text + "%" + Input2.text + " = " + String(a%b) + "\n" + Input2.text + "/" + Input1.text + " = " + String(b/a) + "\n" + Input2.text + "%" + Input1.text + " = " + String(b%a);
		}
		private function createCustomTextField(x:Number, y:Number, width:Number, height:Number, text:String):TextField {
            var result:TextField = new TextField();
            result.x = x; result.y = y;
			result.text = text;
            result.width = width; 
			result.height = height;
            return result;
        }
		private function createCustomInputField():TextField {
            var result:TextField = new TextField();
            result.type = TextFieldType.INPUT;
        	result.border = true;
        	result.width = 100;
        	result.height = 40;
        	// result.backgroundColor=0xFFFF99;
        	// result.background =true;
        	result.borderColor=0x006666;
            return result;
        }
	}
}