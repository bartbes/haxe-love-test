import love.Love;
import love.graphics.Graphics;
import love.keyboard.Keyboard;

class HelloWorld extends Gamestate
{
	public static function main()
	{
		Love.load = function(args)
		{
			GamestateManager.switchState(new HelloWorld());
		};
	}

	public function new()
	{
	}

	private var ball : Null<love.graphics.Image>;
	private var x : Float = 50;
	private var y : Float = 50;
	private static var speed : Float = 25;

	public override function load()
	{
		ball = Graphics.newImage("ball.png");
	}

	public override function update(dt : Float)
	{
		if (Keyboard.isDown("up"))
			y -= speed*dt;
		if (Keyboard.isDown("down"))
			y += speed*dt;
		if (Keyboard.isDown("left"))
			x -= speed*dt;
		if (Keyboard.isDown("right"))
			x += speed*dt;
	}

	public override function draw()
	{
		Graphics.draw(ball, x, y);
	}
}
