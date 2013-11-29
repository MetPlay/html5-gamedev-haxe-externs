package engine.plugins;
import engine.core.Transform.Vector2D;
import js.html.Event;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.plugins.input")
extern class Input
{
	public static var keys : Dynamic;
	public static var buttons : Dynamic;

	public static var mouse_position : Vector2D;

	public static onMouseMove(event : event : Event);

	public static onMouseDown (event : Event) : Void;

	public static onMouseUp (event : Event) : Void;

	public static onKeyPress (event : Event) : Void;

	public static onKeyRelease (event : Event) : Void;

	public static isKeyDown (key) : Dynamic;

	public static isMouseButtpubliconDown (button) : Dynamic
	
	@:("engine.core.getMousePosition")
	public static getMousePosition(?e : Event) : Vector2D;
	
	@:("engine.core.createInputEvent")
	public static createInputEvent(event : Event, pressOrRelease : Bool) : Vector2D;
}