package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class Tooltip extends FlxGroup
{
	public var name = "";
	public var description = "";

	var footer = "Click to learn";

	var panel:FlxSprite;
	var titleText:FlxText;
	var descriptionText:FlxText;
	var footerText:FlxText;

	final fieldWidth = 200;

	public function new(name:String, description:String)
	{
		super();
		this.name = name;
		this.description = description;

		panel = new FlxSprite();
		panel.alpha = 0.9;
		panel.x = 32;
		panel.y = 32;
		add(panel);

		titleText = new FlxText(panel.x + 10, panel.y + 10, fieldWidth, name, 20);
		titleText.font = "Roboto";
		add(titleText);

		descriptionText = new FlxText(panel.x + 10, titleText.y + titleText.frameHeight + 10, fieldWidth, description, 16);
		descriptionText.font = "Roboto";
		add(descriptionText);

		footerText = new FlxText(panel.x + 10, descriptionText.y + descriptionText.frameHeight - 10, fieldWidth, footer, 16);
		footerText.font = "Roboto";
		footerText.color = 0x00FF1E;
		add(footerText);

		hide();
	}

	public function show(newX:Int, newY:Int)
	{
		panel.visible = true;
		panel.x = newX;
		panel.y = newY;
		titleText.visible = true;
		descriptionText.visible = true;
		footerText.visible = true;
		repositionContent();
	}

	public function hide()
	{
		panel.visible = false;
		titleText.visible = false;
		descriptionText.visible = false;
		footerText.visible = false;
	}

	function repositionContent()
	{
		titleText.x = panel.x + 10;
		titleText.y = panel.y + 10;
		descriptionText.x = panel.x + 10;
		descriptionText.y = titleText.y + titleText.height + 10;
		footerText.x = panel.x + 10;
		footerText.y = descriptionText.y + descriptionText.height + 10;
		panel.makeGraphic(fieldWidth + 15, Std.int((footerText.y + footerText.height) - panel.y + 5), FlxColor.GRAY);
	}
}
