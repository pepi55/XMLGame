package com.powerflasher.xmlGame {
	import flash.ui.Mouse;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.display.Sprite;

	public class gameXML extends Sprite {
		//char
		private var player:Char;
		
		//bullets
		private var bullets:Array = [];
		
		//xmlAdding
		var stats:XML;
		var loader:URLLoader = new URLLoader();
		var request:URLRequest = new URLRequest("stats.xml");
		
		public function gameXML() {
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, onComplete);
		}

		private function onComplete(e : Event) : void {
			//variables
			var loader:URLLoader = e.target as URLLoader;
			
			//define stuffs
			stats = new XML(loader.data);
			player = new Char(stats.player.color, stats.player.outline);
			
			//positioning and addchild
			player.x = stage.stageWidth / 2 - player.width / 2;
			player.y = stage.stageHeight / 2 - player.height / 2;
			addChild(player);
			
			//Events
			player.addEventListener(Event.ENTER_FRAME, loop);
			
			//hide maus
			Mouse.hide();
		}

		private function loop(event : Event) : void {
			player.x = mouseX - player.width / 2;
			player.y = mouseY - player.width / 2;
		}
	}
}
