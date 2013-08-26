package com.mozzo.game {
	import org.flixel.*;
	import com.mozzo.game.Level.*;
	public class Fruit extends FlxSprite {
		
		[Embed(source = "../../../../res/Sounds/Eating.mp3")] public static var eatingMP3:Class;
		public static var eating:FlxSound = new FlxSound();
		
		public function Fruit(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			immovable = true;
			loadGraphic(Assets.fruit1, false, false, 8, 8);
			this.randomFrame();
			eating.stop();
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.overlap(this, LevelBase.player)) {
				
				Registry.save.data.fruitsTotal += 1;
				
				if(Registry.sound){
					eating = FlxG.play(eatingMP3, 1.0, false, false);
				}
				trace("asdsd");
				this.kill();
				Registry.fruitCountHas += 1;
				if (Registry.isQuick) {
					Level2.fruit -= 1;
				}
				if (Registry.isArcade) {
					Level3.fruit -= 1;
				}
			}
		}
	}
}