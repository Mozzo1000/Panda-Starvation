package com.mozzo.game {
	import org.flixel.*;
	import com.mozzo.game.*;
	import com.mozzo.game.*;
	import org.flixel.plugin.photonstorm.*;
	public class ModeSelectState extends FlxState {
		
		private var bg:FlxSprite;
		private var classicButton:FlxButtonPlus;
		private var quickButton:FlxButtonPlus;
		private var arcadeButton:FlxButtonPlus;
		private var returnButton:FlxButtonPlus;
		
		private var bResOff:FlxSprite;
		private var bResOn:FlxSprite;
		
		private var bResArrowOff:FlxSprite;
		private var bResArrowOn:FlxSprite;
		
		private var title:FlxText;
		
		override public function create():void {
			super.create();
			FlxG.mouse.show();
			
			bResOff = new FlxSprite(0, 0, Assets.menuButtonOff);
			bResOn = new FlxSprite(0, 0, Assets.menuButtonOn);
			
			bResArrowOff = new FlxSprite(0, 0, Assets.menuButtonArrowOff);
			bResArrowOn = new FlxSprite(0, 0, Assets.menuButtonArrowOn);
			
			bg = new FlxSprite(0, 0, Assets.menu);
			add(bg);
			
			title = new FlxText(0, 60, 121, "Select Mode");
			title.setFormat(null, 16);
			title.x = (FlxG.width / 2) - (title.width / 2);
			add(title);
			
			classicButton = new FlxButtonPlus(0, 90, onClickButton, [1], "Classic", 125, 40, 24);
			classicButton.loadGraphic(bResOff, bResOn);
			classicButton.screenCenter();
			add(classicButton);
			
			quickButton = new FlxButtonPlus(0, 140, onClickButton, [2], "Quick", 125, 40, 24);
			quickButton.loadGraphic(bResOff, bResOn);
			quickButton.screenCenter();
			add(quickButton);
			
			arcadeButton = new FlxButtonPlus(0, 190, onClickButton, [4], "Arcade", 125, 40, 24);
			arcadeButton.loadGraphic(bResOff, bResOn);
			arcadeButton.screenCenter();
			add(arcadeButton);
			
			returnButton = new FlxButtonPlus(20, 270, onClickButton, [3], "", 200, 40, 16);
			returnButton.loadGraphic(bResArrowOff, bResArrowOn);
			add(returnButton);
		}
		
		public function onClickButton(buttonNumber:int):void {
			if (buttonNumber == 1) {
				FlxG.switchState(new PlayState());
			}
			if (buttonNumber == 2) {
				FlxG.switchState(new QuickMatchState());
			}
			if (buttonNumber == 3) {
				FlxG.switchState(new MenuState());
			}
			if (buttonNumber == 4) {
				FlxG.switchState(new ArcadeState());
			}
		}
		
		override public function update():void {
			super.update();
		}
	}
}