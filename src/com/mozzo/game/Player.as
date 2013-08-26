package com.mozzo.game {
	import org.flixel.*;
	public class Player extends FlxSprite {
		
		public var speed:Number;
		
		public function Player(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			
			loadGraphic(Assets.player, true, false, 10, 13);
			
			speed = 1;
			
			createAnimation();
		}
		
		public function createAnimation():void {
			addAnimation("walk_down", [0, 1], 12);
			addAnimation("walk_up", [4, 5], 12);
			addAnimation("walk_right", [8, 9, 10, 11], 12);
			addAnimation("walk_left", [12, 13, 14, 15], 12);
			
			addAnimation("idle_right", [8]);
			addAnimation("idle_left", [12]);
			addAnimation("idle_down", [0]);
			addAnimation("idle_up", [4]);
		}
		
		override public function update():void {
			super.update();
			
			move();
			
			if (this.x < 0) {
				this.x = 0;
			}else if ((this.x + this.width) > FlxG.width) {
				this.x = (FlxG.width - this.width);
			}
			if (this.y < 0) {
				this.y = 0;
			}else if ((this.y + this.height) > FlxG.height) {
				this.y = (FlxG.height - this.height);
			}
		}
		
		public function move():void {
			if (FlxG.keys.W || FlxG.keys.UP) {
				y -= speed;
				facing = FlxObject.UP;
				play("walk_up");
			}else if (facing == FlxObject.UP) {
				play("idle_up");
			}
			if (FlxG.keys.DOWN || FlxG.keys.S) {
				y += speed;
				facing = FlxObject.DOWN;
				play("walk_down");
			}else if (facing == FlxObject.DOWN) {
				play("idle_down");
			}
			
			if(FlxG.keys.LEFT || FlxG.keys.A){
				x -= speed;
				facing = FlxObject.LEFT;
				play("walk_left");
			}else if (facing == FlxObject.LEFT) {
				play("idle_left");
			}
			if(FlxG.keys.RIGHT || FlxG.keys.D){
				x += speed;
				facing = FlxObject.RIGHT;
				play("walk_right");
			}else if (facing == FlxObject.RIGHT) {
				play("idle_right");
			}
		}
	}
}