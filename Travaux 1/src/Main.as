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

	public class Main extends Sprite{
		
		public function Main(){

			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 20;

			var label1:TextField = createCustomTextField(0, 20, 230, 30);
			label1.defaultTextFormat = myFormat;
            label1.text = "Salut, je m'appele Adam.";
			label1.textColor = 0xFF0000;
			label1.border = 2;
			label1.borderColor = 0x000FF;

			var label2:TextField = createCustomTextField(0, 20, 230, 30);
			label2.defaultTextFormat = myFormat;
            label2.text = "Comment appelez vous?";
			label2.textColor = 0xFF0000;
			label2.border = 2;
			label2.x = 200;
			label2.y = 80;
			label2.borderColor = 0x000FF;
			label2.visible = false;
			
			
			addChild(label1);
			var myLoader:Loader = new Loader();
			myLoader.scaleX = .1;
			myLoader.scaleY = .1;
			myLoader.y= 50;
			myLoader.load(new URLRequest('files\\batman-icon.png'));
			addChild(myLoader);
			var ogx:Number = myLoader.width;
			var ogy:Number = myLoader.height;
			myLoader.addEventListener(MouseEvent.CLICK, function(e: Event):void{click(label2)})
			myLoader.addEventListener(MouseEvent.ROLL_OVER, function(e: Event):void{grossit(myLoader)});
			myLoader.addEventListener(MouseEvent.ROLL_OUT, function(e: Event):void{rapetisse(myLoader, ogx, ogy)});
			
            
		}
		private function click(label2:TextField):void{
			if (label2.visible == true){
				label2.visible = false;
			}
			else{
				label2.visible = true;
			}
		}
		private function grossit(myLoader:Loader):void{
			myLoader.scaleX *= 2;
			myLoader.scaleY *= 2;
		}
		private function rapetisse(myLoader:Loader,ogx:Number, ogy:Number):void{
			myLoader.scaleX *= 0.5;
			myLoader.scaleY *= 0.5;
		}
		private function createCustomTextField(x:Number, y:Number, width:Number, height:Number):TextField {
            var result:TextField = new TextField();
            result.x = x; result.y = y;
            result.width = width; result.height = height;
            addChild(result);
            return result;
        }
	}
}