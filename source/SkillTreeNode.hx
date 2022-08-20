package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class SkillTreeNode extends FlxGroup
{
	public var rowIndex = 0;
	public var columnIndex = 0;

	public var maxPoints = 0;
	public var pointsRequired = 0;

	public var button:FlxButton;
	public var tooltip:Tooltip;

	var pointsLabel:FlxText;

	public function new(row:Int, column:Int, maxPoints:Int, pointsRequired:Int, tooltip:Tooltip)
	{
		super();

		button = new FlxButton();
		button.makeGraphic(32, 32, FlxColor.WHITE);
		add(button);

		this.rowIndex = row;
		this.columnIndex = column;

		this.maxPoints = maxPoints;
		this.pointsRequired = pointsRequired;

		this.tooltip = tooltip;
		SkillTree.tooltips.add(tooltip);

		FlxMouseEventManager.add(button, null, null, onHover, onExit);
	}

	function onHover(_)
	{
		// Show the tooltip at the bottom right corner of the node.
		tooltip.show(Std.int(button.x + button.frameWidth), Std.int(button.y + button.frameHeight));
	}

	function onExit(_)
	{
		tooltip.hide();
	}
}
