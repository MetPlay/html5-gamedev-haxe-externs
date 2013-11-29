package engine.plugins;
import engine.core.Asset;

/**
 * ...
 * @author Damir Veapi
 */
@:native("engine.plugins.asset_manager")
extern class AssetManager
{	
	public static var assetCount(default, null) : Int;
	public static var assets : Array<Asset>;
	
	public static function init(cllback : Void -> Void) : Void;
}

@:native("engine.plugins.asset_manager.asset_types")
extern class AssetTypes
{
	public static var IMAGE(default, null) : Int;
	public static var ANIMATION(default, null) : Int;
	public static var SPRITE(default, null) : Int;
}