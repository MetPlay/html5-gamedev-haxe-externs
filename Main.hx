package ;

import engine.core.Animation;
import engine.core.Transform;
import engine.plugins.AssetManager;
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
		Engine.config = 
		{
			debug : true,
			assets : {
				/* <drvo> */
				drvo1 : { 
					path : "assets/drvo.png", 
					type : AssetTypes.IMAGE
				},
				drvo_idle : { 
					frames : [ "drvo1" ], 
					type : AssetTypes.ANIMATION,
					repeat : RepeatTypes.LOOP 
				},
				drvo : {
					paths : { 
						idle : "drvo_idle" 
					},
					type : AssetTypes.SPRITE
				}
			}
		}
		Browser.window.onload = function(e) {
			AssetManager.init(function() { Engine.self(init); } );
		}
	}
	
	static private function init() 
	{
		Scene.stage.render = function(self, drawing) {
			drawing.context.fillStyle = "green";
			drawing.context.fillRect(0, 0, drawing.canvas.width, drawing.canvas.height);
		}
		
		Scene.stage.addChild(new Transform({name : "Drvo",
					asset : "drvo",
					position : { 
						x : 100, 
						y : 150 
					}
		}));
	}
	
}