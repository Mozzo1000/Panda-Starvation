package com.mozzo.game {
	public class Assets {
		
		[Embed(source = "../../../../res/Player.png")] public static var player:Class;
		[Embed(source = "../../../../res/Fruit1.png")] public static var fruit1:Class;
		[Embed(source = "../../../../res/Hole.png")] public static var hole:Class;
		[Embed(source = "../../../../res/SpeedUp.png")] public static var speedUp:Class;
		[Embed(source = "../../../../res/TimeUp.png")] public static var timeUp:Class;
		
		
		[Embed(source = "../../../../res/Menu.png")] public static var menu:Class;
		[Embed(source = "../../../../res/MenuDead.png")] public static var menu2:Class;
		[Embed(source = "../../../../res/ButtonOff.png")] public static var menuButtonOff:Class;
		[Embed(source = "../../../../res/ButtonOn.png")] public static var menuButtonOn:Class;
		
		[Embed(source = "../../../../res/ButtonBigOff.png")] public static var menuButtonBigOff:Class;
		[Embed(source = "../../../../res/ButtonBigOn.png")] public static var menuButtonBigOn:Class;
		
		[Embed(source = "../../../../res/BackArrowOff.png")] public static var menuButtonArrowOff:Class;
		[Embed(source = "../../../../res/BackArrowOn.png")] public static var menuButtonArrowOn:Class;
		
		[Embed(source = "../../../../res/TwitterButton.png")] public static var twButton:Class;
		[Embed(source = "../../../../res/WebsiteButton.png")] public static var wbButton:Class;
		[Embed(source = "../../../../res/YoutubeButton.png")] public static var ytButton:Class;
		[Embed(source = "../../../../res/StatsButton.png")] public static var stButton:Class;
		
		[Embed(source = "../../../../res/BACK_MAP.txt", mimeType = "application/octet-stream")] public static var BACKMap:Class;
		[Embed(source = "../../../../res/FRONT_MAP.txt", mimeType = "application/octet-stream")] public static var FORMap:Class;
		[Embed(source = "../../../../res/Back_Tile.png")] public static var BKTile:Class;
		[Embed(source = "../../../../res/Front_Tile.png")] public static var FRTile:Class;
		
		public function Assets() {
			
		}
	}
}