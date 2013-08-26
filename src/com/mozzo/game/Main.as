package com.mozzo.game {
	import org.flixel.*;
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass="com.mozzo.game.Preloader")]
	public class Main extends FlxGame {
		public function Main() {
			super(400, 300, MenuState, 2, 60, 60);
			
			Registry.init();
		}
	}
}