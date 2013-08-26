package com.mozzo.game.Level{
	import flash.media.Camera;
	import org.flixel.*;
	import com.mozzo.game.*;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;

	public class LevelBase extends FlxGroup{
		/**
		 * Map
		 */
		public var state:FlxState; //State displaying the level
		public var levelSize:FlxPoint; //The level size, width and height
		public var tileSize:FlxPoint; //Size of objects in the level
		public var numTiles:FlxPoint; //How many objects are in the level
		public var backGroup:FlxGroup; //Floor, rendered first in the back
		public var forGroup:FlxGroup; //All level objects with collision
		public var decalGroup:FlxGroup; //Decorative object, no collision
		public static var guiGroup:FlxGroup; //GUI
		public var bgGroup:FlxGroup;
		
		private var updatingCamera:Boolean;
		
		/**
		 * Player
		 */
		public static var player:Player;
		public var playerStart:FlxPoint = new FlxPoint(FlxG.width / 2 - 5, 0); //Where the player starts at
		
		/**
		 * Constructor
		 * @param	state		State displaying the level
		 * @param	levelSize	The level size, width and height
		 * @param	tileSize	Size of objects in the level
		 */
		public function LevelBase(state:FlxState, levelSize:FlxPoint, tileSize:FlxPoint):void{
			super();
			this.state = state;
			this.levelSize = levelSize;
			this.tileSize = tileSize;
			if (levelSize && tileSize){
				this.numTiles = new FlxPoint(Math.floor(levelSize.x / tileSize.x), Math.floor(levelSize.y / tileSize.y));
			}
			
			//Setting up groups
			this.backGroup = new FlxGroup();
			this.forGroup = new FlxGroup();
			this.decalGroup = new FlxGroup();
			guiGroup = new FlxGroup();
			this.bgGroup = new FlxGroup();
			
			updatingCamera = false;
			
			// create the level
			this.create();
		}
		
		/**
		 * Create the whole level, including all sprites, maps, blocks, etc
		 */
		public function create():void{
			createMap();
			createPlayer();
			createGUI();
			addGroups();
			createCamera();
		}
		
		/**
		 * Create the map (walls, decals, etc)
		 */
		protected function createMap():void {

		}
		
		/**
		 * Create the player, bullets, etc
		 */
		protected function createPlayer():void {
			player = new Player(playerStart.x, playerStart.y);
		}
		
		/**
		 * Create the GUI, text, buttons, indicators, etc
		 */
		protected function createGUI():void {			
			var name:FlxText = new FlxText(0, 0, 50, "LD#27");
			name.alignment = "left";
			name.color = 0x000000;
			//guiGroup.add(name);
		}
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		protected function addGroups():void{
			add(backGroup);
			add(bgGroup);
			add(forGroup);
			add(decalGroup);
			add(player);
			add(guiGroup);
		}
		
		/**
		 * Create the default camera to follow the player
		 */
		protected function createCamera():void {
			FlxG.worldBounds = new FlxRect(0, 0, levelSize.x, levelSize.y); //Defines camera limit in way of map size
			FlxG.camera.setBounds(0, 0, levelSize.x, levelSize.y, true); //Setting camera limit in way of map size
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN); //Which object to follow and how it is displayed
		}
		
		/**
		 * Update
		 */
		override public function update():void {
			super.update();
			
			FlxG.collide(forGroup, player); //Creating collision between walls and the player
		}
	}
}
