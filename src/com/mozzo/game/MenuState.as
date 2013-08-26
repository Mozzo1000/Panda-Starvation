package com.mozzo.game {
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.desktop.NativeApplication;
		
	public class MenuState extends FlxState {
		
		private var bg:FlxSprite;
		private var title:FlxText;
		private var playButton:FlxButtonPlus;
		private var optionsButton:FlxButtonPlus;
		private var exitButton:FlxButtonPlus;
		
		private var twitterButton:FlxButtonPlus;
		private var websiteButton:FlxButtonPlus;
		private var youtubeButton:FlxButtonPlus;
		private var statsButton:FlxButtonPlus;
		
		private var bResOff:FlxSprite;
		private var bResOn:FlxSprite;
		
		private var bResTW:FlxSprite;
		private var bResWB:FlxSprite;
		private var bResYT:FlxSprite;
		private var bResST:FlxSprite;
		
		override public function create():void {
			super.create();
			FlxG.mouse.show();
			
			

			bResOff = new FlxSprite(0, 0, Assets.menuButtonOff);
			bResOn = new FlxSprite(0, 0, Assets.menuButtonOn);
			
			bResTW = new FlxSprite(0, 0, Assets.twButton);
			bResWB = new FlxSprite(0, 0, Assets.wbButton);
			bResYT = new FlxSprite(0, 0, Assets.ytButton);
			bResST = new FlxSprite(0, 0, Assets.stButton);
			
			//buttonNormal.x = (FlxG.width / 2) - (width / 2);
			bg = new FlxSprite(0, 0, Assets.menu);
			add(bg);
			
			title = new FlxText(0, 60, 173, "Panda Starvation");
			title.setFormat(null, 16);
			title.x = (FlxG.width / 2) - (title.width / 2);
			add(title);
			
			playButton = new FlxButtonPlus(0, 90, onClickButton, [1], "Play", 125, 40, 24);
			playButton.loadGraphic(bResOff, bResOn);
			playButton.screenCenter();
			add(playButton);
			
			optionsButton = new FlxButtonPlus(0, 140, onClickButton, [2], "Options", 125, 40, 24);
			optionsButton.loadGraphic(bResOff, bResOn);
			optionsButton.screenCenter();
			add(optionsButton);
			
			exitButton = new FlxButtonPlus(0, 190, onClickButton, [3], "Exit", 125, 40, 24);
			exitButton.loadGraphic(bResOff, bResOn);
			exitButton.screenCenter();
			add(exitButton);
			
			statsButton = new FlxButtonPlus(300, 280, onClickButton, [7], "");
			statsButton.loadGraphic(bResST, bResST);
			statsButton.setMouseOverCallback(onHoverButton, [7]);
			statsButton.setMouseOutCallback(onOutButton, [7]);
			
			add(statsButton);
			
			twitterButton = new FlxButtonPlus(325, 280, onClickButton, [4], "");
			twitterButton.loadGraphic(bResTW, bResTW);
			twitterButton.setMouseOverCallback(onHoverButton, [4]);
			twitterButton.setMouseOutCallback(onOutButton, [4]);
			
			add(twitterButton);
			
			websiteButton = new FlxButtonPlus(350, 280, onClickButton, [5], "");
			websiteButton.loadGraphic(bResWB, bResWB);
			websiteButton.setMouseOverCallback(onHoverButton, [5]);
			websiteButton.setMouseOutCallback(onOutButton, [5]);
			
			add(websiteButton);
			
			youtubeButton = new FlxButtonPlus(375, 280, onClickButton, [6], "");
			youtubeButton.loadGraphic(bResYT, bResYT);
			youtubeButton.setMouseOverCallback(onHoverButton, [6]);
			youtubeButton.setMouseOutCallback(onOutButton, [6]);
			add(youtubeButton);
		}
		
		public function onClickButton(buttonNumber:int):void {
			if (buttonNumber == 1) {
				FlxG.switchState(new ModeSelectState());
			}
			if (buttonNumber == 2) {
				FlxG.switchState(new OptionsState());
			}
			if (buttonNumber == 3) {
				NativeApplication.nativeApplication.exit();
			}
			if (buttonNumber == 4) {
				FlxU.openURL("http://www.twitter.com/Mozzo__");
			}
			if (buttonNumber == 5) {
				FlxU.openURL("http://www.mozzo.host56.com");
			}
			if (buttonNumber == 6) {
				FlxU.openURL("http://www.youtube.com/user/MrAdde12");
			}
			if (buttonNumber == 7) {
				FlxG.switchState(new StatsState());
			}
		}
		
		public function onHoverButton(buttonNumber:int):void {
			if (buttonNumber == 4) {
				twitterButton.y -= 2;
				trace("Twitter Hover!!");
			}
			if (buttonNumber == 5) {
				websiteButton.y -= 2;
			}
			if (buttonNumber == 6) {
				youtubeButton.y -= 2;
			}
			if (buttonNumber == 7) {
				statsButton.y -= 2;
			}
		}
		
		public function onOutButton(buttonNumber:int):void {
			if (buttonNumber == 4) {
				twitterButton.y = 280;
			}
			if (buttonNumber == 5) {
				websiteButton.y = 280;
			}
			if (buttonNumber == 6) {
				youtubeButton.y = 280;
			}
			if (buttonNumber == 7) {
				statsButton.y = 280;
			}
		}
		
		override public function update():void {
			super.update();			
		}
	}
}