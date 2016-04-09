class Playstate extends Gamestate
{
	private var player : Player;
	private var nonlivingEntities : Array<Entity>;
	private var livingEntities : Array<LivingEntity>;

	public function new()
	{
	}

	public override function load()
	{
		player = new Player(50, 50);

		nonlivingEntities = new Array<Entity>();
		livingEntities = new Array<LivingEntity>();
		livingEntities.push(player);
	}

	public override function update(dt : Float)
	{
		for (entity in nonlivingEntities)
			entity.move(dt);

		var newBullets : Null<Array<Bullet>> = null;
		for (entity in livingEntities)
		{
			entity.move(dt);

			var b = entity.act(dt);
			if (b != null)
				newBullets = (newBullets == null) ? b : newBullets.concat(b);
		}

		if (newBullets != null)
			for (bullet in newBullets)
				nonlivingEntities.push(bullet);
	}

	public override function draw()
	{
		for (entity in nonlivingEntities)
			entity.draw();

		for (entity in livingEntities)
			entity.draw();
	}
}
