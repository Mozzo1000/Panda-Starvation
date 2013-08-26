package com.mozzo.game {
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	public class DeathState extends FlxState {
		
		private var bg:FlxSprite;
		private var endTxt:FlxText;
		private var returnButton:FlxButtonPlus;
		
		private var bResOff:FlxSprite;
		private var bResOn:FlxSprite;
		
		private var score:FlxText;
		private var scoreQuick:FlxText;
		
		override public function create():void {
			super.create();
			
			bg = new FlxSprite(0, 0, Assets.menu2);
			add(bg);
			
			bResOff = new FlxSprite(0, 0, Assets.menuButtonBigOff);
			bResOn = new FlxSprite(0, 0, Assets.menuButtonBigOn);
			
			endTxt = new FlxText(0, 60, 176, "Game Over!");
			endTxt.setFormat(null, 24);
			endTxt.x = (FlxG.width / 2) - (endTxt.width / 2);
			add(endTxt);
			
			returnButton = new FlxButtonPlus(0, 200, onClickButton, [1], "Return to Menu", 200, 40, 16);
			returnButton.screenCenter();
			returnButton.loadGraphic(bResOff, bResOn);
			add(returnButton);
			
			score = new FlxText(0, 100, 185, "You got to level " + Registry.level);
			score.setFormat(null, 16);
			score.x = (FlxG.width / 2) - (score.width / 2);
			
			scoreQuick = new FlxText(0, 100, 215, "You collected " + Registry.fruitCountHas + " fruit");
			if (Registry.fruitCountHas > 1) {
				scoreQuick.text = "You collected " + Registry.fruitCountHas + " fruits";
			}
			scoreQuick.setFormat(null, 16);
			scoreQuick.x = (FlxG.width / 2) - (score.width / 2);
			
			if (Registry.isArcade || Registry.isQuick) {
				add(scoreQuick);
			}else {
				add(score);
			}
		}
		
		public function onClickButton(buttonNumber:int):void {
			if (buttonNumber == 1) {
				FlxG.switchState(new MenuState());
				Registry.level = 1;
			}
		}
		
		override public function update():void {
			super.update();
		}
	}
}