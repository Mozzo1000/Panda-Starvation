package com.mozzo.game {
	import org.flixel.*;
	import com.mozzo.game.Level.*;
	public class Hole extends FlxSprite {
		public function Hole(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			immovable = true;
			loadGraphic(Assets.hole, false, false, 16, 16);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.overlap(this, LevelBase.player)) {
				LevelBase.player.kill();
				FlxG.switchState(new DeathState());
			}
		}
	}
}