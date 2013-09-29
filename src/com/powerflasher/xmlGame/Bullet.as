package com.powerflasher.xmlGame {
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class Bullet extends Sprite {
		public function Bullet($color:uint, $outline:uint) {
			graphics.lineStyle(1, $outline);
			graphics.beginFill($color);
			graphics.lineTo(5, 0);
			graphics.lineTo(0, -20);
			graphics.lineTo(-5, 0);
			graphics.endFill();
		}
	}
}
