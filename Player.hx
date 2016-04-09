import love.graphics.GraphicsModule as Graphics;
import love.keyboard.KeyboardModule as Keyboard;

class Player
{
	private var position : Vector;
	private var size : Float = 10;
	private var speed : Float = 25;

	public function new(x : Float, y : Float)
	{
		position = new Vector(x, y);
	}

	public function move(dt : Float)
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

		position.add(dir.normalize().mul(speed*dt));
	}

	public function draw()
	{
		Graphics.circle(Fill, position.x, position.y, size);
	}
}
