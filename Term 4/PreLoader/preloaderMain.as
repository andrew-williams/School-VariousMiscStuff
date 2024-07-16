package  {
	
	import flash.display.MovieClip;
	import fl.display.ProLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class preloaderMain extends MovieClip {
		public var loadingBar:LoadingBar;
 		public var gameLoader:ProLoader;

		
		public function preloaderMain() {
			// constructor code
			trace("Created Main Function");
			loadingBar = new LoadingBar();
			addChild(loadingBar);
			
			gameLoader = new ProLoader();
			//gameLoader.load(new URLRequest("W10_FinalGame.swf"));
			gameLoader.load(new URLRequest("game.swf"));
			gameLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			gameLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			//addChild(gameLoader);
		}
		
		private function onProgress(e:ProgressEvent){
			var totalLoaded:Number = e.bytesLoaded / e.bytesTotal;
			
			loadingBar.percent_txt.text = "Percent " + String(Math.floor(totalLoaded*100));
			
			trace(Math.ceil(totalLoaded*100).toString() + " Loaded: " + e.bytesLoaded + " Total: " + e.bytesTotal);
			loadingBar.loadingBar_mc.scaleX = totalLoaded;
		}
		
		private function onComplete(e:Event){
			trace("REACHED");
			addChild(gameLoader);
			removeChild(loadingBar);
			gameLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			gameLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			
			//gameLoader = null;
		}
		
	}
	
}
