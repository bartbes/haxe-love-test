import love.graphics.GraphicsModule as Graphics;

class DeathState extends Gamestate
{
	public function new()
	{
	}

	public override function draw()
	{
		Graphics.print("You died!", 50, 50);
	}
}
