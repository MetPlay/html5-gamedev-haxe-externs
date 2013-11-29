package ;

import engine.core.Animation;
import engine.core.Time;
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
				},
				
				damir1 : { path : "assets/damir1.png", type : AssetTypes.IMAGE },				
				damir2 : { path : "assets/damir2.png", type : AssetTypes.IMAGE },				
				damir3 : { path : "assets/damir3.png", type : AssetTypes.IMAGE },				
				damir4 : { path : "assets/damir4.png", type : AssetTypes.IMAGE },				
				damir_idle : { 
					frames : [ "damir1", "damir2", "damir3", "damir4" ], 
					type : AssetTypes.ANIMATION,
					repeat : RepeatTypes.LOOP,
				},

				// slike i druga animacija
				damir11 : { path : "assets/damir11.png", type : AssetTypes.IMAGE },				
				damir22 : { path : "assets/damir22.png", type : AssetTypes.IMAGE },				
				damir33 : { path : "assets/damir33.png", type : AssetTypes.IMAGE },				
				damir44 : { path : "assets/damir44.png", type : AssetTypes.IMAGE },				
				damir_attack : { 
					frames : [ "damir11", "damir22", "damir33", "damir44" ], 
					type : AssetTypes.ANIMATION,
					repeat : RepeatTypes.STOP_AT_END,
					speed: 0.1
				},

				// sprite
				damir : { 
					paths : { 
						idle : "damir_idle", 
						attack : "damir_attack" 
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
		
		var treex = -100.0;
		var treey = 0.0;

		for (i in 1...40) 
		{
			treey += Math.random() * 5;
			
			Scene.stage.addChild(new Transform({
				name : "Drvo" + i,
				asset : "drvo",
				position : { 
					x : Math.random() * Engine.drawing.canvas.width, 
					y : treey - 150 
				}
			}));
		}
			
		treey += 40;
		
		for (i in 1...15) 
		{
			treex += 100 + Math.random() * 5;
			treey += Math.random() * 5;
		
			Scene.stage.addChild(new Transform({
				name : "Drvo" + i,
				asset : "drvo",
				position : { 
					x : treex, 
					y : treey - 150 
				}
			}));
		}
		
		Scene.stage.addChild(new Transform({				
				name : "Damir",
				asset : "damir",

				position : { 
					x : Engine.drawing.canvas.width / 2,
					y : Engine.drawing.canvas.height / 2
				},

				tag : {
					target : { 
						x : Engine.drawing.canvas.width / 2,
						y : Engine.drawing.canvas.height / 2
					},
				},
				
				onKey : function(self, event) {	

				},

				onMouse : function(self, event) {
					if(event.state) {
						if(Scene.hitUnderMouse() != null) {
							self.scaleTo(1.1, 1.1);
						} else {
							self.tag.target.x = event.x;
							self.tag.target.y = event.y;
						}
					} else self.scaleTo(1, 1);
				}
			}))
			.addUpdateHook(function(self : Transform) {
				if(self.position.x == self.tag.target.x &&
					self.position.y == self.tag.target.y) {
					// stigli na odrediste i nista vise
				} else {		
					var a = self.position;
					var b = self.tag.target;
					// { x : 10, y : 12 } - { x : 9, y : 6 }
					// posto ne mozemo da oduzimamo objekte,
					// moramo oduzimati komponente x, y posebno
					var dx = b.x - a.x;
					var dy = b.y - a.y;
					// vremenska delta izmedju dva frejma
					var delta = Time.delta();
					// mrdamo damira za deo puta koji moze da
					// stane u delta-vremenu
					self.moveBy(dx * delta, dy * delta);
					self.scaleFor(dy * delta * 0.001, dy * delta * 0.001);
				}
			});
	}
	
}