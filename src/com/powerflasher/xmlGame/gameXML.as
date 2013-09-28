package com.powerflasher.xmlGame {
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.display.Sprite;

	public class gameXML extends Sprite {
		public function gameXML() {
			var loader:URLLoader = new URLLoader(new URLRequest("stats.xml"));
			
			loader.addEventListener(Event.COMPLETE, onComplete);
		}

		private function onComplete(e : Event) : void {
			var stats:XML = new XML(e.target.data);
			
			trace(stats);
		}
	}
}
