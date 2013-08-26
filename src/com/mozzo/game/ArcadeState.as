package com.mozzo.game {
	import com.mozzo.game.Level.*;
	import org.flixel.*;
	public class ArcadeState extends FlxState {
		
		public static var Level_Size:FlxPoint = new FlxPoint(400, 300);
		public static var Block_Size:FlxPoint = new FlxPoint(8, 8);
		
		public var LEVEL3:Level3;
		
		override public function create():void {
			super.create();
			Registry.fruitCountHas = 0;
			LEVEL3 = new Level3(this, Level_Size, Block_Size);
			add(LEVEL3);
		}
	}
}