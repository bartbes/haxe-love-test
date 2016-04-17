package enemies;

class Dumb implements EnemyBehaviour
{
	public static var img : Null<love.graphics.Image>;
	public var enemy : Enemy;
	private var oldAngle : Float = 0;
	private var angularVelocity : Float = 0.025;
	private var close : Bool = false;

	public function new()
	{
		if (img == null)
			img = love.graphics.GraphicsModule.newImage("gfx/dumb.png");
	}

	public function think(player : LivingEntity) : Vector
	{
		var targetAngle = player.getPosition().copy().sub(enemy.getPosition()).angle();
		var diff = targetAngle-oldAngle;
		if (Math.abs(diff) > Math.PI)
			diff = oldAngle-targetAngle;

		var sign = diff < 0 ? -1 : 1;
		if (Math.abs(diff) > angularVelocity)
		{
			targetAngle = oldAngle + angularVelocity*sign;
			close = false;
		}
		else
			close = true;

		oldAngle = targetAngle;
		if (oldAngle < -Math.PI)
			oldAngle += 2*Math.PI;
		else if (oldAngle > Math.PI)
			oldAngle -= 2*Math.PI;

		return Vector.fromAngle(targetAngle);
	}

	public function act(dt : Float)
	{
		if (!close)
			return null;

		var bullets = new Array<Bullet>();
		bullets.push(enemy.fire());
		return bullets;
	}

	public function getImage()
	{
		return img;
	}
}
