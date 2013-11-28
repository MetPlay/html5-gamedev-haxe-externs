package ;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

/**
 * ...
 * @author Damir Veapi
 */
typedef Drawing = { canvas : CanvasElement, context : CanvasRenderingContext2D }

@:native("engine")
extern class Engine
{
	public static var constants : Dynamic;	
	
	public static var config : Dynamic;
	public static var drawing : Drawing;

	public static function self (cllback : Void -> Void) : Void;
}