package com.mozzo.game {
	import com.mozzo.game.Level.Level1;
	import org.flixel.*;
	public class PlayState extends FlxState {
		
		public static var Level_Size:FlxPoint = new FlxPoint(400, 300);
		public static var Block_Size:FlxPoint = new FlxPoint(8, 8);		
		
		public var LEVEL1:Level1;
		
		override public function create():void {
			super.create();
			trace("Created...");
			Registry.fruitCountHas = 0;
			LEVEL1 = new Level1(this, Level_Size, Block_Size);
			add(LEVEL1);
		}
	}
}