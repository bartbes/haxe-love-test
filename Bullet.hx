import love.graphics.GraphicsModule as Graphics;

class Bullet implements Entity
{
	private var position : Vector;
	private var velocity : Vector;
	private var size : Float;
	private var hasHit : Bool;

	public function new(position : Vector, velocity : Vector, size : Float)
	{
		this.position = position.copy();
		this.velocity = velocity.copy();
		this.size = size;
		hasHit = false;
	}

	public function toReap()
	{
		var width = Graphics.getWidth();
		var height = Graphics.getHeight();

		if (position.x < -size || position.y < -size || position.x > width+size
				|| position.y > height+size)
			return true;

		return hasHit;
	}

	public inline function hit()
	{
		hasHit = true;
	}

	public inline function getPosition()
	{
		return position.copy();
	}

	public inline function getSize()
	{
		return size;
	}

	public function move(dt : Float)
	{
		position.add(velocity.copy().mul(dt));
	}

	public function draw()
	{
		Graphics.circle(Fill, position.x, position.y, size);
	}
}
