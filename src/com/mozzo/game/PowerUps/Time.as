package com.mozzo.game.PowerUps {
	import org.flixel.*;
	import com.mozzo.game.Level.*;
	import com.mozzo.game.*;
	public class Time extends FlxSprite {
		
		public function Time(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			immovable = true;
			loadGraphic(Assets.timeUp, false, false, 8, 8);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.overlap(this, LevelBase.player)) {
				this.kill();
				Registry.time += 5;
				LevelBase.player.speed = 1;
				Registry.save.data.powerTotal += 1;
			}
		}
	}
}