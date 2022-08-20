package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
	To make this skill tree reusable, you would need to create an external data source out of structs or JSON data or whatever else.
	Then you could pass that data into the skill tree constructor, and then loop over that data to create nodes and tooltips out of it.
**/
class SkillTree
{
	public static var nodes = new FlxTypedGroup<SkillTreeNode>();
	public static var tooltips = new FlxTypedGroup<Tooltip>();

	public function new()
	{
		FlxG.state.add(nodes);
		FlxG.state.add(tooltips);

		nodes.add(new SkillTreeNode(0, 0, 3, 0, new Tooltip("Improved Heroic Strike", "Reduces the cost of your Heroic Strike ability by 1 rage point.")));
		nodes.add(new SkillTreeNode(0, 1, 5, 0, new Tooltip("Deflection", "Increases your parry chance by 1%.")));
		nodes.add(new SkillTreeNode(0, 2, 3, 0, new Tooltip("Improved Rend", "Increases the bleed damage done by your Rend ability by 15%.")));

		nodes.add(new SkillTreeNode(1, 0, 2, 5, new Tooltip("Improved Charge", "Increases the amount of rage generated by your Charge ability by 3.")));
		nodes.add(new SkillTreeNode(1, 1, 5, 5, new Tooltip("Tactical Mastery", "You retain up to 5 of your rage points when you change stances.")));
		nodes.add(new SkillTreeNode(1, 3, 3, 5, new Tooltip("Improved Thunder Clap", "Reduces the rage cost of your Thunder Clap ability by 1 rage point.")));

		nodes.add(new SkillTreeNode(2, 0, 2, 10, new Tooltip("Improved Overpower", "Increases the critical strike chance of your Overpower ability by 25%.")));
		nodes.add(new SkillTreeNode(2, 1, 1, 10,
			new Tooltip("Anger Management", "Increases the time required for your rage to decay while out of combat by 30%.")));
		nodes.add(new SkillTreeNode(2, 2, 3, 10,
			new Tooltip("Deep Wounds", "Your critical strikes cause the opponent to bleed, dealing 20% of your melee weapon's average damage over 12 sec.")));

		nodes.add(new SkillTreeNode(3, 1, 5, 15,
			new Tooltip("Two-Handed Weapon Specialization", "Increases the damage you deal with two-handed weapons by 1%.")));
		nodes.add(new SkillTreeNode(3, 2, 2, 15,
			new Tooltip("Impale", "Increases the critical strike damage bonus of your abilities in Battle, Defensive, and Berserker stance by 10%.")));

		nodes.add(new SkillTreeNode(4, 0, 5, 20, new Tooltip("Axe Specialization", "Increases your chance to get a critical strike with Axes by 1%.")));
		nodes.add(new SkillTreeNode(4, 1, 1, 20, new Tooltip("Sweeping Strikes", "Your next 5 melee attacks strike an additional nearby opponent.")));
		nodes.add(new SkillTreeNode(4, 2, 5, 20, new Tooltip("Mace Specialization", "Gives you a 1% chance to stun your target for 3 sec with a Mace.")));
		nodes.add(new SkillTreeNode(4, 3, 5, 20,
			new Tooltip("Sword Specialization", "Gives you a 1% chance to get an extra attack on the same target after dealing damage with your Sword.")));

		nodes.add(new SkillTreeNode(5, 0, 5, 25,
			new Tooltip("Polearm Specialization", "Increases your chance to get a critical strike with Polearms by 1%.")));
		nodes.add(new SkillTreeNode(5, 2, 3, 25,
			new Tooltip("Improved Hamstring", "Gives your Hamstring ability a 5% chance to immobilize the target for 5 sec.")));

		nodes.add(new SkillTreeNode(6, 1, 1, 30,
			new Tooltip("Mortal Strike",
				"A vicious strike that deals weapon damage plus 85 and wounds the target, reducing the effectiveness of any healing by 50% for 10 sec.")));

		repositionNodes();
	}

	/**
		Uses the row and column indices of each node to position them in a grid.
	**/
	function repositionNodes()
	{
		for (node in nodes.members)
		{
			node.button.x = 30 + (node.columnIndex * 60);
			node.button.y = 30 + (node.rowIndex * 60);
		}
	}
}
