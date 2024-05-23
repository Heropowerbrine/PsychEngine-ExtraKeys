package mobile.backend;

import haxe.ds.Map;
import tjson.TJSON as Json;
import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;

class MobileData
{
	public static var actionModes:Map<String, VirtualPadButtonsData> = new Map();
	public static var dpadModes:Map<String, VirtualPadButtonsData> = new Map();
	public static var extraActions:Map<String, ExtraActions> = new Map();
	public static var virtualPadConfig:VirtualPadData = {image: 'virtualpad', alpha: ClientPrefs.data.controlsAlpha};

	public static function init()
	{
		if (FileSystem.exists(Paths.getSharedPath('mobile/DPadModes')))
		{
			for (file in FileSystem.readDirectory(Paths.getSharedPath('mobile/DPadModes')))
			{
				if (Path.extension(file) == 'json')
				{
					var str = File.getContent(Paths.getSharedPath(Path.join(['mobile/DPadModes/', Path.withoutDirectory(file)])));
					var json:VirtualPadButtonsData = cast Json.parse(str);
					dpadModes.set(Path.withoutDirectory(Path.withoutExtension(file)), json);
				}
			}
		}

		if (FileSystem.exists(Paths.getSharedPath('mobile/ActionModes')))
		{
			for (file in FileSystem.readDirectory(Paths.getSharedPath('mobile/ActionModes')))
			{
				if (Path.extension(file) == 'json')
				{
					var str = File.getContent(Paths.getSharedPath(Path.join(['mobile/ActionModes/', Path.withoutDirectory(file)])));
					var json:VirtualPadButtonsData = cast Json.parse(str);
					actionModes.set(Path.withoutDirectory(Path.withoutExtension(file)), json);
				}
			}
		}

		if (FileSystem.exists(Paths.getSharedPath('data/mobile/config.json')))
		{
			var json:VirtualPadData = cast Json.parse(File.getContent(Paths.getSharedPath('mobile/config.json')));
			if (json.image != null && json.image.length > 0)
				virtualPadConfig.image = json.image;
			if (json.alpha != null)
				virtualPadConfig.alpha = json.alpha;
		}

		for (data in ExtraActions.createAll())
			extraActions.set(data.getName(), data);
	}
}

typedef VirtualPadButtonsData =
{
	buttons:Array<ButtonsData>
}

typedef ButtonsData =
{
	button:String, // what FlxButton should be used, must be a valid FlxButton var from FlxVirtualPad as a string.
	graphic:String, // the graphic of the button, usually can be located in the VirtualPad xml .
	x:Float, // the button's X position on screen.
	y:Float, // the button's Y position on screen.
	width:Int, // the button's width, default value is 132.
	height:Int, // the button's height, default value is 127.
	color:String // the button color, default color is white.
}

typedef VirtualPadData =
{
	image:String,
	?alpha:Float
}

enum ExtraActions
{
	SINGLE;
	DOUBLE;
	NONE;
}
