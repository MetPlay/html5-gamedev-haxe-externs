package engine.core;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.core.sprite")
extern class Sprite
{
	public function new(sprite : Dynamic, assets : Array<Asset>) : Void;
	
	public var paths : Dynamic;
	public var idle : String;
	public var path_at : String;
	
	public function update function() : Void;

	public function getResource() : Dynamic;
	
}