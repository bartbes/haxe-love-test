import love.graphics.GraphicsModule as Graphics;

class Playstate extends Gamestate
{
	private static var debug = true;

	public static var instance(get, null) : Playstate;
	private static var _instance : Null<Playstate>;

	public var player : Player;
	private var nonlivingEntities : Array<Entity>;
	private var livingEntities : Array<LivingEntity>;

	private function new()
	{
	}

	public static function get_instance()
	{
		if (_instance == null)
			_instance = new Playstate();
		return _instance;
	}

	public override function load()
	{
		player = new Player(50, 50);

		nonlivingEntities = new Array<Entity>();
		livingEntities = new Array<LivingEntity>();
		livingEntities.push(player);
		livingEntities.push(new Enemy(new enemies.Dumb(), 100, 100));
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

		doCollisions();

		reap(livingEntities);
		reap(nonlivingEntities);

		if (player.getHealth() <= 0)
			GamestateManager.switchState(new DeathState());
	}

	private function reap<T:Entity>(list : Array<T>)
	{
		var i = list.length;
		while (--i >= 0)
			if (list[i].toReap())
				list.splice(i, 1);
	}

	private function doCollisions()
	{
		for (entity in livingEntities)
		{
			var entPos = entity.getPosition();

			for (nonliving in nonlivingEntities)
			{
				if (!Std.is(nonliving, Bullet))
					continue;

				var bullet : Bullet = cast nonliving;
				var pos = bullet.getPosition();
				var size = bullet.getSize();

				if (pos.sub(entPos).length() > size)
					continue;

				bullet.hit();
				entity.damage();
			}
		}
	}

	public override function draw()
	{
		for (entity in nonlivingEntities)
			entity.draw();

		for (entity in livingEntities)
			entity.draw();

		if (debug)
		{
			var text = new StringBuf();

			text.add("Living entities: ");
			text.add(livingEntities.length);
			text.add("\n");

			text.add("Nonliving entities: ");
			text.add(nonlivingEntities.length);
			text.add("\n");

			text.add("Player health: ");
			text.add(player.getHealth());
			text.add("\n");

			Graphics.print(text.toString(), 10, 10);
		}
	}
}
