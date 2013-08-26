package com.mozzo.game.PowerUps {
	import org.flixel.*;
	import com.mozzo.game.Level.*;
	import com.mozzo.game.*;
	public class Speed extends FlxSprite {
		
		public function Speed(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			immovable = true;
			loadGraphic(Assets.speedUp, false, false, 8, 8);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.overlap(this, LevelBase.player)) {
				this.kill();
				LevelBase.player.speed = 1.5;
				Registry.save.data.powerTotal += 1;
			}
		}
	}
}