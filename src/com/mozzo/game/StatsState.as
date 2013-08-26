package com.mozzo.game {
	import org.flixel.*;
	import com.mozzo.game.*;
	import com.mozzo.game.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	public class StatsState extends FlxState {
		
		private var bg:FlxSprite;
		private var returnButton:FlxButtonPlus;
		
		private var bResOff:FlxSprite;
		private var bResOn:FlxSprite;
		private var bResArrowOff:FlxSprite;
		private var bResArrowOn:FlxSprite;
		
		private var fruitCollectedTxt:FlxText;
		private var powerCollectedTxt:FlxText;
		
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
			
			title = new FlxText(0, 60, 52, "Stats");
			title.setFormat(null, 16);
			title.x = (FlxG.width / 2) - (title.width / 2);
			add(title);
			
			fruitCollectedTxt = new FlxText(0, 80, 200, "Fruits Collected: " + Registry.save.data.fruitsTotal);
			fruitCollectedTxt.setFormat(null, 16);
			fruitCollectedTxt.x = (FlxG.width / 2) - (fruitCollectedTxt.width / 2);
			add(fruitCollectedTxt);
			
			powerCollectedTxt = new FlxText(0, 120, 270, "Power Ups Collected: " + Registry.save.data.powerTotal);
			powerCollectedTxt.setFormat(null, 16);
			powerCollectedTxt.x = (FlxG.width / 2) - (powerCollectedTxt.width / 2);
			add(powerCollectedTxt);
			
			returnButton = new FlxButtonPlus(20, 270, onClickButton, [1], "", 200, 40, 16);
			returnButton.loadGraphic(bResArrowOff, bResArrowOn);
			add(returnButton);
		}
		
		public function onClickButton(buttonNumber:int):void {
			if (buttonNumber == 1) {
				FlxG.switchState(new MenuState());
			}
		}
		
		override public function update():void {
			super.update();
		}
	}
}