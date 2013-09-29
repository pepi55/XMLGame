package com.powerflasher.xmlGame {
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class Char extends Sprite {
		public function Char($color:uint, $outline:uint) {
			//draw dis badguy
			graphics.lineStyle(1, $outline);
			graphics.beginFill($color);
			graphics.lineTo(50, 0);
			graphics.lineTo(50, 50);
			graphics.lineTo(0, 50);
			graphics.endFill();
		}
	}
}
