package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseEventManager;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		FlxG.camera.antialiasing = true;
		FlxG.plugins.add(new FlxMouseEventManager());

		var _ = new SkillTree();
	}
}
