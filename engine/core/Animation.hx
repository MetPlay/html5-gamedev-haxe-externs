package engine.core;
import engine.core.Animation.RepeatTypes;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.core.animation")
extern class Animation
{
	public function new(animation : Dynamic, assets : Array<Asset>) : Void;
	
	public var repeat : RepeatTypes;
	public var frames : Array<Asset>;
	
	public var speed : Float;
	public var time_scale : Float;
	
	public var change_in : Float;

	public var frame_at : Int;

	public function nextfunction() : Bool;

	public function update() : Bool;

	public function getResource() : Dynamic;

	public function reset() : Void;
}

@:native("engine.constants.repeat_types")
extern class RepeatTypes
{
	public static var STOP_AT_END(default, null) : Int;
	public static var LOOP(default, null) : Int;
}