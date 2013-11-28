package engine.plugins;
import engine.core.Transform;
import js.html.Event;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.plugins.scene")
extern class Scene
{
	public static var stage : Transform;
	public static var buckets: Dynamic;
	public static var inverse_buckets : Dynamic;
	
	public static function bucketHash(x : Float, y : Float) : Array<Float>;
	
	public static function clearFromBuckets(obj : Dynamic) : Void;
	public static function addToBuckets(obj : Dynamic, x : Float, y : Float) : Void;
	public static function addToBucketsHashed(obj : Dynamic, x : Float, y : Float) : Void;
	
	public static function updateBuckets(obj : Dynamic) : Void;
	
	public static function hit(x : Float, y : Float) : Dynamic;

	public static function hitUnderMouse() : Dynamic;

	private static function render() : Void;
	private static function update() : Void;
	
	public static function mouse(event : Event) : Void;
	public static function key(event : Event) : Void;
	
}