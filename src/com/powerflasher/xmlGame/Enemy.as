package com.powerflasher.xmlGame {
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class Enemy extends Sprite {
		public function Enemy($color:uint = 0XF00000, $outline:uint = 0X00F000) {
			draw($color, $outline);
			
			addEventListener(Event.ENTER_FRAME, move);
		}

		private function move(e : Event) : void {
			this.y += 5;
			
			if (this.y > stage.stageHeight) {
				dispatchEvent(new Event("destruct"));
			}
		}

		private function draw($color:uint, $outline:uint) : void {
			graphics.lineStyle(1, $outline);
			graphics.beginFill($color);
			graphics.lineTo(10, 0);
			graphics.lineTo(10, 10);
			graphics.lineTo(-5, 10);
			graphics.lineTo(-10, -10);
			graphics.lineTo(10, -10);
			graphics.endFill();
		}
	}
}
