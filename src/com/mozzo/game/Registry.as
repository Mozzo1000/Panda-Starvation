package com.mozzo.game { 
      
    import org.flixel.*; 
    import flash.display.StageDisplayState; 
    import flash.display.StageScaleMode; 
      
    public class Registry { 
        public static var save:FlxSave;
        public static var level:Number = 1; 
        public static var time:Number; 
        public static var fruitCountHas:Number; 
        public static var fruitCountNeeds:Number; 
        public static var fullscreen:Boolean;
		public static var music:Boolean = true;
		public static var sound:Boolean = true;
          
        public static var isQuick:Boolean;
		public static var isArcade:Boolean;
          
        public static function goFullscreen():void { 
            FlxG.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE; 
            fullscreen = true; 
              
            FlxG.width = FlxG.stage.stageWidth / FlxCamera.defaultZoom; 
            FlxG.height = FlxG.stage.stageHeight / FlxCamera.defaultZoom; 
            FlxG.resetCameras(new FlxCamera(0, 0, FlxG.width, FlxG.height)); 
            FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT; 
        }
		
		static public function init():void {
			save = new FlxSave();
			save.bind("save");
			//fruitsCollectedTotal = save.data.fruitsTotal;
			save.data.fruitsTotal;
			save.data.powerTotal;
			if (save.data.fruitsTotal == null) {
				save.data.fruitsTotal = 0;
			}
			if (save.data.powerTotal == null) {
				save.data.powerTotal = 0;
			}
			save.flush();
		}
          
        public function Registry() { 
              
        } 
    } 
}