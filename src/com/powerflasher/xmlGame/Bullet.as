package com.powerflasher.xmlGame {
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class Bullet extends Sprite {
		public function Bullet($color:uint, $outline:uint) {
			graphics.lineStyle(1, $outline);
			graphics.beginFill($color);
			graphics.lineTo(10, 20);
			graphics.lineTo(-10, 0);
			graphics.endFill();
		}
	}
}
