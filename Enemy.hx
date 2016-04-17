import love.graphics.GraphicsModule as Graphics;

class Enemy implements LivingEntity
{
	private var behaviour : EnemyBehaviour;
	private var position : Vector;
	private var direction : Vector;
	private var health : Int = 1;

	private var speed : Int = 25;
	private var bulletSpeed : Float = 50;
	private var bulletSize : Float = 5;

	public function new(behaviour, x, y)
	{
		this.behaviour = behaviour;
		behaviour.enemy = this;

		position = new Vector(x, y);
		direction = behaviour.think(Playstate.instance.player);
	}

	public inline function damage()
	{
		health -= 1;
	}

	public inline function getHealth()
	{
		return health;
	}

	public function toReap()
	{
		return health <= 0;
	}

	public function getPosition()
	{
		return position.copy();
	}

	public function move(dt : Float)
	{
		direction = behaviour.think(Playstate.instance.player);
		position.add(direction.copy().mul(speed*dt));
	}

	public function act(dt : Float)
	{
		return behaviour.act(dt);
	}

	public function draw()
	{
		var img = behaviour.getImage();
		var w = img.getWidth();
		var h = img.getHeight();
		Graphics.draw(img, position.x, position.y, direction.angle(), 1, 1, w/2, h/2);
	}

	public function fire() : Bullet
	{
		var pos = direction.copy().mul(bulletSize).add(position);
		var vel = direction.copy().mul(bulletSpeed);
		return new Bullet(pos, vel, bulletSize);
	}
}
