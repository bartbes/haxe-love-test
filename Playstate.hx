class Playstate extends Gamestate
{
	private var player : Player;

	public function new()
	{
	}

	public override function load()
	{
		player = new Player(50, 50);
	}

	public override function update(dt : Float)
	{
		player.move(dt);
	}

	public override function draw()
	{
		player.draw();
	}
}
