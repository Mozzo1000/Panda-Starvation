package com.mozzo.game {
	import org.flixel.*;
	import com.mozzo.game.*;
	import com.mozzo.game.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	public class OptionsState extends FlxState {
		
		private var bg:FlxSprite;
		private var fullscreenButton:FlxButtonPlus;
		private var muteMusic:FlxButtonPlus;
		private var muteSound:FlxButtonPlus;
		private var returnButton:FlxButtonPlus;
		
		private var bResOff:FlxSprite;
		private var bResOn:FlxSprite;
		private var bResArrowOff:FlxSprite;
		private var bResArrowOn:FlxSprite;
		
		private var title:FlxText;
		
		override public function create():void {
			super.create();
			FlxG.mouse.show();
			
			bResOff = new FlxSprite(0, 0, Assets.menuButtonBigOff);
			bResOn = new FlxSprite(0, 0, Assets.menuButtonBigOn);
			
			bResArrowOff = new FlxSprite(0, 0, Assets.menuButtonArrowOff);
			bResArrowOn = new FlxSprite(0, 0, Assets.menuButtonArrowOn);
			
			bg = new FlxSprite(0, 0, Assets.menu);
			add(bg);
			
			title = new FlxText(0, 60, 78, "Options");
			title.setFormat(null, 16);
			title.x = (FlxG.width / 2) - (title.width / 2);
			add(title);
			
			fullscreenButton = new FlxButtonPlus(0, 90, onClickButton, [1], "Fullscreen ", 200, 40, 16);
			fullscreenButton.loadGraphic(bResOff, bResOn);
			fullscreenButton.screenCenter();
			add(fullscreenButton);
			
			muteMusic = new FlxButtonPlus(0, 150, onClickButton, [3], "Music ", 200, 40, 16);
			muteMusic.loadGraphic(bResOff, bResOn);
			muteMusic.screenCenter();
			add(muteMusic);
			
			muteSound = new FlxButtonPlus(0, 210, onClickButton, [4], "Sound ", 200, 40, 16);
			muteSound.loadGraphic(bResOff, bResOn);
			muteSound.screenCenter();
			add(muteSound);
			
			returnButton = new FlxButtonPlus(20, 270, onClickButton, [2], "", 200, 40, 16);
			returnButton.loadGraphic(bResArrowOff, bResArrowOn);
			add(returnButton);
		}
		
		public function onClickButton(buttonNumber:int):void {
			if (buttonNumber == 1) {
				Registry.fullscreen = !Registry.fullscreen;
				if (Registry.fullscreen == true) {
					fullscreenButton.text = "Fullscreen ON";
					Registry.goFullscreen();
					Registry.goFullscreen();
				}else {
					fullscreenButton.text = "Fullscreen OFF";
					FlxG.stage.displayState = StageDisplayState.NORMAL;
				}
			}
			
			if (buttonNumber == 2) {
				FlxG.switchState(new MenuState());
			}
			
			if (buttonNumber == 3) {
				Registry.music = !Registry.music;
				if (Registry.music == true) {
					muteMusic.text = "Music ON";
					Registry.music = true;
				}else {
					muteMusic.text = "Music OFF";
					Registry.music = false;
				}
			}
			
			if (buttonNumber == 4) {
				Registry.sound = !Registry.sound;
				if (Registry.sound == true) {
					muteSound.text = "Sound ON";
					Registry.music = true;
				}else {
					muteSound.text = "Sound OFF";
					Registry.sound = false;
				}
			}
		}
		
		override public function update():void {
			super.update();
			
			if (Registry.fullscreen) {
				fullscreenButton.text = "Fullscreen ON";
			}else {
				fullscreenButton.text = "Fullscreen OFF";
			}
			
			if (Registry.music) {
				muteMusic.text = "Music ON";
			}else {
				muteMusic.text = "Music OFF";
			}
			
			if (Registry.sound) {
				muteSound.text = "Sound ON";
			}else {
				muteSound.text = "Sound OFF";
			}
		}
	}
}