import love.graphics.GraphicsModule as Graphics;
import love.keyboard.KeyboardModule as Keyboard;

class Playstate extends Gamestate
{
	public function new()
	{
	}

	private var ballPos = new Vector(50, 50);
	private static var speed : Float = 25;

	public override function load()
	{
	}

	public override function update(dt : Float)
	{
		var dir = new Vector();
		if (Keyboard.isDown("up"))
			dir.y -= 1;
		if (Keyboard.isDown("down"))
			dir.y += 1;
		if (Keyboard.isDown("left"))
			dir.x -= 1;
		if (Keyboard.isDown("right"))
			dir.x += 1;

		ballPos.add(dir.normalize().mul(speed*dt));
	}

	public override function draw()
	{
		Graphics.circle(Fill, ballPos.x, ballPos.y, 10);
	}
}
