package;

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

	var pointsSpent(default, set) = 0;

	public var pointsRequired = 0;

	public var button:FlxButton;
	public var pointsLabel:FlxText;
	public var tooltip:Tooltip;

	public function new(row:Int, column:Int, maxPoints:Int, pointsRequired:Int, tooltip:Tooltip)
	{
		super();

		button = new FlxButton(0, 0, null, spendPoint);
		button.makeGraphic(32, 32, FlxColor.WHITE);
		add(button);

		pointsLabel = new FlxText(button.x, button.y + button.frameHeight, 200, '0/$maxPoints');
		add(pointsLabel);

		this.rowIndex = row;
		this.columnIndex = column;

		this.maxPoints = maxPoints;
		this.pointsRequired = pointsRequired;

		this.tooltip = tooltip;
		SkillTree.tooltips.add(tooltip);

		FlxMouseEventManager.add(button, null, null, onHover, onExit);
	}

	function set_pointsSpent(value)
	{
		pointsSpent = value;
		pointsLabel.text = '$pointsSpent/$maxPoints';
		return value;
	}

	function spendPoint()
	{
		if (pointsSpent + 1 > maxPoints)
			return;

		pointsSpent++;
		SkillTree.availablePoints--;
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
