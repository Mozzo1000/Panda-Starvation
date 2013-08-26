package com.mozzo.game.Level{
	import com.mozzo.game.PowerUps.*;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import org.flixel.*;
	import com.mozzo.game.*;
	import org.flixel.plugin.*;
	import mx.core.ByteArrayAsset;
	import org.flixel.plugin.photonstorm.*;
	
	public class Level3 extends LevelBase {
		
		/**
		 * Custom groups
		 */
		protected var objectGroup:FlxGroup; //Objects with collision
		
		/**
		 * Local Variables
		 */
		public static var tiles:FlxTilemap;
		public var timeTxt:FlxText;
		public var fruitCountTxt:FlxText;
		
		public static var fruit:Number;
		public static var powerTime:Number;
		public static var powerAmount:Number;
		
		[Embed(source="../../../../../res/Sounds/Panda RUN!.mp3")] public static var pandaRunMP3:Class;
		public static var pandaRUN:FlxSound = new FlxSound();
		
		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	The level size, width and height
		 * @param	tileSize	Size of objects in the level
		 */
		public function Level3(state:FlxState, levelSize:FlxPoint, blockSize:FlxPoint):void{
			super(state, levelSize, blockSize);
		}
		
		/**
		 * Create the map (walls, decals, etc)
		 */
		override protected function createMap():void {
			super.createMap();	

			
			//Add the background
			tiles = new FlxTilemap();
			tiles.loadMap(new Assets.BACKMap, Assets.BKTile, tileSize.x, tileSize.y, 0, 0, 0, uint.MAX_VALUE);
			backGroup.add(tiles);
			
			
			//Add the forground
			tiles = new FlxTilemap();
			tiles.loadMap(new Assets.FORMap, Assets.FRTile, 0, 0);
			forGroup.add(tiles);
			
			playerStart.x = FlxG.random() * 390;
			playerStart.y = FlxG.random() * 290;
			
			fruit = 10;
			powerTime = 225;
			powerAmount = 0;
			Registry.isArcade = true;
			
			Registry.time = 11; //Default- 11
			Registry.fruitCountHas = 0;
			
			pandaRUN.stop();
			if(Registry.music){
				pandaRUN = FlxG.play(pandaRunMP3, 1.0, true, false);
			}
			
			createObjects(); //Creating the other objects in a diffrent function
		}
		
		/**
		 * Add all the objects, obstacles, etc to the level
		 */
		protected function createObjects():void {
			//Initialize the custom groups
			var sprite:FlxSprite;
			objectGroup = new FlxGroup();
			
			for (var i:int = 0; i < fruit; i++) {
				trace(i);
				decalGroup.add(new Fruit(FlxG.random() * 390, FlxG.random() * 290));
			}
			for (var i2:int = 0; i2 < FlxG.random() * 55; i2++) {
				decalGroup.add(new Hole(FlxG.random() * 390, FlxG.random() * 290));
			}
			var rand:Number = FlxMath.rand(1, 2);
			if(rand == 1){
				decalGroup.add(new Speed(FlxG.random() * 390, FlxG.random() * 290));
			}else if (rand == 2) {
				decalGroup.add(new Time(FlxG.random() * 390, FlxG.random() * 290));
			}
		}
		
		/**
		 * Create the player
		 */
		override protected function createPlayer():void {
			super.createPlayer();
		}
		
		/**
		 * Create the GUI, text, buttons, indicators, etc
		 */
		override protected function createGUI():void {
			super.createGUI();
			
			timeTxt = new FlxText(20, 5, 100, "" + Registry.time);
			fruitCountTxt = new FlxText(55, 5, 100, "" + Registry.fruitCountHas + "/" + Registry.fruitCountNeeds);
			guiGroup.add(timeTxt);
			guiGroup.add(fruitCountTxt);
			
		}
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		override protected function addGroups():void {
			add(backGroup);
			add(bgGroup);
			add(forGroup);
			add(decalGroup);
			add(objectGroup);
			add(player);
			add(guiGroup);
		}
		
		public function endGame():void {
			FlxG.switchState(new DeathState());
		}
		
		/**
		 * Update
		 */
		override public function update():void {
			super.update();
			
			FlxG.collide(objectGroup, player);
			
			powerTime--;
			
			timeTxt.text = "" + FlxU.formatTime(Registry.time);
			fruitCountTxt.text = "Fruit: " + Registry.fruitCountHas;
			Registry.time -= FlxG.elapsed;
			//trace(Registry.time);
			
			if (Registry.time <= 0) {
				endGame();
			}
			/*
			for (var i2:int = 0; i2 < FlxG.random() * 55; i2++) {
				decalGroup.add(new Speed(FlxG.random() * 390, FlxG.random() * 290));
			}
			*/
			if (fruit <= 1) {
				fruit = 10;
				for (var i:int = 0; i < fruit; i++) {
					trace(i);
					decalGroup.add(new Fruit(FlxG.random() * 390, FlxG.random() * 290));
				}
			}
			
			if (powerTime <= 1) {
				powerTime = 225;
				if (powerAmount <= 10) {
					var random:Number = FlxMath.rand(0, 3);
					trace(random);
					if(random == 0 || random == 1){
						for (var i3:int = 0; i3 < FlxMath.rand(1, 2); i3++) {
							powerAmount += i3;
							decalGroup.add(new Speed(FlxG.random() * 390, FlxG.random() * 290));
						}
					}else if(random == 2 || random == 3){
						for (var i4:int = 0; i3 < FlxMath.rand(1, 2); i3++) {
							powerAmount += i3;
							decalGroup.add(new Time(FlxG.random() * 390, FlxG.random() * 290));
						}
					}
				}
			}
		}
	}
}