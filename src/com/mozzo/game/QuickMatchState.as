package com.mozzo.game {
	import com.mozzo.game.Level.*;
	import org.flixel.*;
	public class QuickMatchState extends FlxState {
		
		public static var Level_Size:FlxPoint = new FlxPoint(400, 300);
		public static var Block_Size:FlxPoint = new FlxPoint(8, 8);
		
		public var LEVEL2:Level2;
		
		override public function create():void {
			super.create();
			Registry.fruitCountHas = 0;
			LEVEL2 = new Level2(this, Level_Size, Block_Size);
			add(LEVEL2);
		}
	}
}