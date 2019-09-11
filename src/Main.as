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

	public class Main extends Sprite{
		
		public function Main(){
			var myLoader:Loader = new Loader();
			myLoader.scaleX = .1;
			myLoader.scaleY = .1;
			myLoader.load(new URLRequest('files\\batman-icon.png'));
			addChild(myLoader);
			var ogx:Number = myLoader.width;
			var ogy:Number = myLoader.height;
			myLoader.addEventListener(MouseEvent.ROLL_OVER, grossit);
			myLoader.addEventListener(MouseEvent.ROLL_OUT, function(e: Event):void{rapetisse(ogx, ogy)});
            
		}
		private function grossit(event: MouseEvent):void{
			this.scaleX *= 2;
			this.scaleY *= 2;
		}
		private function rapetisse(ogx:Number, ogy:Number):void{
			this.scaleX *= 0.5;
			this.scaleY *= 0.5;
		}
	}
}