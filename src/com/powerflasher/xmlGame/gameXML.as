package com.powerflasher.xmlGame {
	import flashx.textLayout.formats.VerticalAlign;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.display.Sprite;

	public class gameXML extends Sprite {
		//char
		private var player:Char;
		
		// enemies
		private var enemy:Enemy;
		private var enemies:Array;
		
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
			
			//define status
			stats = new XML(loader.data);
			//define player
			player = new Char(stats.player.color, stats.player.outline);
			//define enemies
			enemy = new Enemy(stats.enemy.color, stats.enemy.outline);
			enemies = [];
			
			//positioning and addchild
			player.x = stage.stageWidth / 2 - player.width / 2;
			player.y = stage.stageHeight / 2 - player.height / 2;
			addChild(player);
			
			//Events
			addEventListener(MouseEvent.MOUSE_DOWN, shoot);
			player.addEventListener(Event.ENTER_FRAME, loop);
			enemy.addEventListener("destruct", destroyEnemy);
			
			//hide maus
			Mouse.hide();
		}

		private function destroyEnemy(event : Event) : void {
			var cube:Enemy = event.target as Enemy;
		}

		private function shoot(event : MouseEvent) : void {
			bullets.push(new Bullet(stats.bullet.color, stats.bullet.outline));
			
			bullets[bullets.length - 1].x = player.x + player.width / 2;
			bullets[bullets.length - 1].y = player.y;
			
			addChild(bullets[bullets.length - 1]);
			
			addEventListener(Event.ENTER_FRAME, firingBullets);
		}

		private function firingBullets(event : Event) : void {
			var l:int = bullets.length - 1;
			var bulA:Bullet;
			
			for (var i : int = l; i >= 0; i--) {
				bulA = bullets[i];
				bulA.y -= stats.bullet.speed;
				
				if(bulA.y < 0) {
					removeChild(bulA);
					bullets.splice(i, 1);
				}
			}
		}

		private function loop(event : Event) : void {
			player.x = mouseX - player.width / 2;
			player.y = mouseY - player.width / 2;
			
			if (player.y < stage.stageHeight / 3) {
				player.y = stage.stageHeight / 3;
			}
		}
	}
}
