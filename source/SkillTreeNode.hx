package;

import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class SkillTreeNode extends FlxButton
{
	public var rowIndex = 0;
	public var columnIndex = 0;

	public var maxPoints = 0;
	public var pointsRequired = 0;

	var pointsLabel:FlxText;

	var tooltip:Tooltip;

	public function new(row:Int, column:Int, maxPoints:Int, pointsRequired:Int, tooltip:Tooltip)
	{
		super();
		this.rowIndex = row;
		this.columnIndex = column;

		this.maxPoints = maxPoints;
		this.pointsRequired = pointsRequired;

		this.tooltip = tooltip;
		FlxG.state.add(tooltip);
		makeGraphic(32, 32, FlxColor.WHITE);

		FlxMouseEventManager.add(this, null, null, onHover, onExit);
	}

	function onHover(node:SkillTreeNode)
	{
		// Show the tooltip at the bottom right corner of the node.
		tooltip.show(Std.int(node.x + node.frameWidth), Std.int(node.y + node.frameHeight));
	}

	function onExit(node:SkillTreeNode)
	{
		tooltip.hide();
	}
}
