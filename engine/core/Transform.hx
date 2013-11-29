package engine.core;
import engine.core.Transform.Vector2D;
import js.html.CanvasElement;
import js.html.Event;

/**
 * ...
 * @author Damir Veapi
 */
typedef Vector2D = { x : Float, y : Float }
@:native("engine.core.transform")
extern class Transform
{
	public function new(predef : Dynamic) : Void;
	
	public var tag : Dynamic;
	public var name : String;
	
	public var position : Vector2D;
	public var center : Vector2D;
	public var scale : Vector2D;
	
	public var rotation : Float;
	
	public var active : Bool;
	public var frontChildren : Array<Transform>;
	public var backChildren : Array<Transform>;
	public var children : Array<Transform>;

	public var parent : Transform;

	public var asset : Asset;

	public function	rotateBy(angle : Float) : Void;
	public function rotateTo(angle : Float) : Void;

	public function moveBy(dx : Float, dy : Float) : Void;
	public function moveTo(x : Float, y : Float) : Void;
	
	public function scaleBy(dx : Float, dy : Float) : Void;
	public function scaleFor(dx : Float, dy : Float) : Void;
	public function scaleTo(x : Float, y : Float) : Void;
	
	public function addChild(child : Transform, ?frontOrBack : Bool) : Transform;
	public function addUpdateHook(hook : Dynamic -> Void) : Transform;
	public function addRenderHook(hook : Dynamic -> Void) : Transform;
	public function addLateRenderHook(hook : Dynamic -> Void) : Transform;

	public var render : Dynamic -> Engine.Drawing -> Void;
	public var onMouse : Dynamic -> Event -> Void;
	public var onKey : Dynamic -> Event -> Void;
}