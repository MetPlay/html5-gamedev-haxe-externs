package ;

import engine.plugins.Scene;
import js.Browser;
import js.Lib;


/**
 * ...
 * @author Damir Veapi
 */

class Main 
{
	static function main() 
	{
		Browser.window.onload = function(e) {
			Engine.self(init);
		}
	}
	
	static private function init() 
	{
		Scene.stage.render = function(self, drawing) {
			drawing.context.fillStyle = "green";
			drawing.context.fillRect(0, 0, drawing.canvas.width, drawing.canvas.height);
		}
	}
	
}