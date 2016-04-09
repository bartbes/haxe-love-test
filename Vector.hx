class Vector
{
	public var x : Float = 0;
	public var y : Float = 0;

	public function new(?x : Float, ?y : Float)
	{
		if (x != null)
			this.x = x;
		if (y != null)
			this.y = y;
	}

	public function copy() : Vector
	{
		return new Vector(x, y);
	}

	public function add(other : Vector) : Vector
	{
		x += other.x;
		y += other.y;
		return this;
	}

	public function mul(f : Float) : Vector
	{
		x *= f;
		y *= f;
		return this;
	}

	public function dot(other : Vector) : Float
	{
		return x * other.x + y * other.y;
	}

	public function length() : Float
	{
		return Math.sqrt(dot(this));
	}

	public function normalize() : Vector
	{
		var len = length();
		// Prevent division by zero, though it's not great
		if (len == 0)
			return this;
		return mul(1/len);
	}
}
