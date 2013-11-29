package engine.core;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.core.asset")
extern class Asset
{
	public function new(resource : Dynamic) : Void;
	
	public var resource(default, null) : Dynamic;
}