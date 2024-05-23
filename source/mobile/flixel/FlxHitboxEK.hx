package mobile.flixel;

import mobile.flixel.input.FlxMobileInputManager;
import openfl.display.BitmapData;
import mobile.flixel.FlxButton;
import openfl.display.Shape;

/**
 * A zone with 4 hint's (A hitbox).
 * It's really easy to customize the layout.
 *
 * @author: Mihai Alexandru, Karim Akra & Lily (mcagabe19)
 * LOL IT'S NO LONGER JUST 4 HINTS, EXTRA KEYS IS HERE -Heropowerbrine
 */
class FlxHitboxEK extends FlxMobileInputManager
{
	final offsetFir:Int = (ClientPrefs.data.hitbox2 ? Std.int(FlxG.height / 4) * 3 : 0);
	final offsetSec:Int = (ClientPrefs.data.hitbox2 ? 0 : Std.int(FlxG.height / 4));

	public var buttonLeft:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.hitboxLEFT, FlxMobileInputID.noteLEFT]);
	public var buttonDown:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.hitboxDOWN, FlxMobileInputID.noteDOWN]);
	public var buttonUp:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.hitboxUP, FlxMobileInputID.noteUP]);
	public var buttonRight:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.hitboxRIGHT, FlxMobileInputID.noteRIGHT]);
	public var button5:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.note5]);
	public var button6:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.note6]);
	public var button7:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.note7]);
	public var button8:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.note8]);
	public var button9:FlxButton = new FlxButton(0, 0, [FlxMobileInputID.note9]);

	var storedButtonsIDs:Map<String, Array<FlxMobileInputID>> = new Map<String, Array<FlxMobileInputID>>();

	/**
	 * Create the zone.
	 */
	public function new(type:HitboxType)
	{
		super();

		for (button in Reflect.fields(this))
		{
			if (Std.isOfType(Reflect.field(this, button), FlxButton))
				storedButtonsIDs.set(button, Reflect.getProperty(Reflect.field(this, button), 'IDs'));
		}

		switch (type)
		{
			case FOUR:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(FlxG.width / 4, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFF00FFFF));
				add(buttonUp = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, Std.int(FlxG.width / 4), FlxG.height, 0xFFF9393F));
			case ONE:
				add(buttonUp = createHint(0, 0, Std.int(FlxG.width), FlxG.height, 0xFFC24B99));
			case TWO:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 2), FlxG.height, 0xFFC24B99));
				add(buttonRight = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 2), FlxG.height, 0xFF00FFFF));
			case THREE:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 3), FlxG.height, 0xFFC24B99));
				add(buttonUp = createHint(426, 0, Std.int(FlxG.width / 3), FlxG.height, 0xFF00FFFF));
				add(buttonRight = createHint(852, 0, Std.int(FlxG.width / 3), FlxG.height, 0xFF12FA05));
			case FIVE:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 5), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(FlxG.width / 5, 0, Std.int(FlxG.width / 5), FlxG.height, 0xFF00FFFF));
				add(button5 = createHint(FlxG.width / 2.5, 0, Std.int(FlxG.width / 5), FlxG.height, 0xFFC24B99));
				add(buttonUp = createHint(768, 0, Std.int(FlxG.width / 5), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint(1024, 0, Std.int(FlxG.width / 5), FlxG.height, 0xFFF9393F));
			case SIX:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 6), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(213, 0, Std.int(FlxG.width / 6), FlxG.height, 0xFF00FFFF));
				add(button5 = createHint(426, 0, Std.int(FlxG.width / 6), FlxG.height, 0xFFC24B99));
				add(button6 = createHint(639, 0, Std.int(FlxG.width / 6), FlxG.height, 0xFF00FFFF));
				add(buttonUp = createHint(852, 0, Std.int(FlxG.width / 6), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint(1065, 0, Std.int(FlxG.width / 6), FlxG.height, 0xFFF9393F));
			case SEVEN:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(182, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFF00FFFF));
				add(button5 = createHint(364, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFFC24B99));
				add(button6 = createHint(546, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFF00FFFF));
				add(button7 = createHint(728, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFF12FA05));
				add(buttonUp = createHint(910, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint(1092, 0, Std.int(FlxG.width / 7), FlxG.height, 0xFFF9393F));
			case EIGHT:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(160, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFF00FFFF));
				add(button5 = createHint(320, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFFC24B99));
				add(button6 = createHint(480, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFF00FFFF));
				add(button7 = createHint(640, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFF12FA05));
				add(button8 = createHint(800, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFFF9393F));
				add(buttonUp = createHint(960, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint(1120, 0, Std.int(FlxG.width / 8), FlxG.height, 0xFFF9393F));
			case NINE:
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(142, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFF00FFFF));
				add(button5 = createHint(284, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFFC24B99));
				add(button6 = createHint(426, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFF00FFFF));
				add(button7 = createHint(568, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFF12FA05));
				add(button8 = createHint(710, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFFF9393F));
				add(button9 = createHint(852, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFF12FA05));
				add(buttonUp = createHint(994, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint(1136, 0, Std.int(FlxG.width / 9), FlxG.height, 0xFFF9393F));
		}

		for (button in Reflect.fields(this))
		{
			if (Std.isOfType(Reflect.field(this, button), FlxButton))
				Reflect.setProperty(Reflect.getProperty(this, button), 'IDs', storedButtonsIDs.get(button));
		}
		scrollFactor.set();
		updateTrackedButtons();
	}

	/**
	 * Clean up memory.
	 */
	override function destroy()
	{
		super.destroy();

		buttonLeft = FlxDestroyUtil.destroy(buttonLeft);
		buttonDown = FlxDestroyUtil.destroy(buttonDown);
		buttonUp = FlxDestroyUtil.destroy(buttonUp);
		buttonRight = FlxDestroyUtil.destroy(buttonRight);
		buttonExtra = FlxDestroyUtil.destroy(buttonExtra);
		buttonExtra2 = FlxDestroyUtil.destroy(buttonExtra2);
		button5 = FlxDestroyUtil.destroy(button5);
		button6 = FlxDestroyUtil.destroy(button6);
                button7 = FlxDestroyUtil.destroy(button7);
                button8 = FlxDestroyUtil.destroy(button8);
                button9 = FlxDestroyUtil.destroy(button9);



	}

	private function createHint(X:Float, Y:Float, Width:Int, Height:Int, Color:Int = 0xFFFFFF):FlxButton
	{
		var hintTween:FlxTween = null;
		var hint = new FlxButton(X, Y);
		hint.loadGraphic(createHintGraphic(Width, Height));
		hint.color = Color;
		hint.solid = false;
		hint.immovable = true;
		hint.multiTouch = true;
		hint.moves = false;
		hint.scrollFactor.set();
		hint.alpha = 0.00001;
		hint.antialiasing = ClientPrefs.data.antialiasing;
		if (!ClientPrefs.data.hideHitboxHints)
		{
			hint.onDown.callback = function()
			{
				if (hintTween != null)
					hintTween.cancel();

				hintTween = FlxTween.tween(hint, {alpha: ClientPrefs.data.controlsAlpha}, ClientPrefs.data.controlsAlpha / 100, {
					ease: FlxEase.circInOut,
					onComplete: function(twn:FlxTween)
					{
						hintTween = null;
					}
				});
			}
			hint.onUp.callback = function()
			{
				if (hintTween != null)
					hintTween.cancel();

				hintTween = FlxTween.tween(hint, {alpha: 0.00001}, ClientPrefs.data.controlsAlpha / 10, {
					ease: FlxEase.circInOut,
					onComplete: function(twn:FlxTween)
					{
						hintTween = null;
					}
				});
			}
			hint.onOut.callback = function()
			{
				if (hintTween != null)
					hintTween.cancel();

				hintTween = FlxTween.tween(hint, {alpha: 0.00001}, ClientPrefs.data.controlsAlpha / 10, {
					ease: FlxEase.circInOut,
					onComplete: function(twn:FlxTween)
					{
						hintTween = null;
					}
				});
			}
		}
		#if FLX_DEBUG
		hint.ignoreDrawDebug = true;
		#end
		return hint;
	}

	function createHintGraphic(Width:Int, Height:Int):BitmapData
	{
		var guh = ClientPrefs.data.controlsAlpha;
		if (guh >= 0.9)
			guh = ClientPrefs.data.controlsAlpha - 0.07;
		var shape:Shape = new Shape();
		shape.graphics.beginFill(0xFFFFFF);
		shape.graphics.lineStyle(3, 0xFFFFFF, 1);
		shape.graphics.drawRect(0, 0, Width, Height);
		shape.graphics.lineStyle(0, 0, 0);
		shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
		shape.graphics.endFill();
		shape.graphics.beginGradientFill(RADIAL, [0xFFFFFF, FlxColor.TRANSPARENT], [guh, 0], [0, 255], null, null, null, 0.5);
		shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
		shape.graphics.endFill();
		var bitmap:BitmapData = new BitmapData(Width, Height, true, 0);
		bitmap.draw(shape);
		return bitmap;
	}
    }
enum HitboxType {
    ONE;
    TWO;
    THREE;
    FOUR;
    FIVE;
    SIX;
    SEVEN;
    EIGHT;
    NINE;
}
