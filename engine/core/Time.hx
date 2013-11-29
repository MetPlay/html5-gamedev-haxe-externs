package engine.core;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.core.time")
extern class Time
{
	public static function measure() : Void;
	public static function delta(?scale : Float) : Float;	
}

@:native("engine.core.time.moment")
extern class Moment
{
	public static var now(default, null) : Float;
	public static var then(default, null) : Float;
	public static var delta(default, null) : Float;
}

@:native("engine.core.time.scale")
extern class TimeScale
{
	public static var __const(default, null) : Float;
	public static var view : Float;
}