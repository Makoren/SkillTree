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
	public var pointsRequired = 0;
	public var prerequisiteNode = "";

	var pointsSpent(default, set) = 0;

	public var button:FlxButton;
	public var pointsLabel:FlxText;
	public var tooltip:Tooltip;

	public function new(row:Int, column:Int, maxPoints:Int, pointsRequired:Int, prerequisiteNode:String = "", imagePath:String = "", tooltip:Tooltip)
	{
		super();

		button = new FlxButton(0, 0, null, spendPoint);

		if (imagePath != "")
			button.loadGraphic(imagePath);
		else
			button.makeGraphic(32, 32, FlxColor.WHITE);

		add(button);

		pointsLabel = new FlxText(button.x, button.y + button.frameHeight, 200, '0/$maxPoints');
		add(pointsLabel);

		this.rowIndex = row;
		this.columnIndex = column;

		this.maxPoints = maxPoints;
		this.pointsRequired = pointsRequired;
		this.prerequisiteNode = prerequisiteNode;

		this.tooltip = tooltip;
		SkillTree.tooltips.add(tooltip);

		// TODO: When custom icons are added, this should saturate the image (or load a saturated image).
		// Look into the Flixel demo for blend modes, and see if the OpenFL version of blend modes works the same way.
		if (checkIfLocked())
			button.color = 0x333333;

		FlxMouseEventManager.add(button, null, null, onHover, onExit);
	}

	function set_pointsSpent(value)
	{
		pointsSpent = value;
		pointsLabel.text = '$pointsSpent/$maxPoints';
		return value;
	}

	public function checkIfLocked():Bool
	{
		if (SkillTree.totalPointsSpent < pointsRequired)
			return true;

		// check if the prerequisite node's pointsSpent is equal or greater than its maxPoints
		var node = SkillTree.nodeMap[prerequisiteNode];
		if (node != null && node.pointsSpent < node.maxPoints)
			return true;

		return false;
	}

	function updateButtonColours()
	{
		for (node in SkillTree.nodes.members)
		{
			if (node.checkIfLocked())
				node.button.color = 0x333333;
			else
				node.button.color = FlxColor.WHITE;
		}
	}

	function spendPoint()
	{
		if (checkIfLocked())
			return;

		if (pointsSpent + 1 > maxPoints)
			return;

		if (SkillTree.availablePoints <= 0)
			return;

		pointsSpent++;
		SkillTree.availablePoints--;

		updateButtonColours();
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
