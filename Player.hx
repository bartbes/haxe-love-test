import love.graphics.GraphicsModule as Graphics;
import love.joystick.JoystickModule;
import love.joystick.Joystick;

class Player implements LivingEntity
{
	private var position : Vector;
	private var size : Float = 10;
	private var speed : Float = 25;
	private var health : Int = 5;
	private var gamepad : Joystick;
	private var bulletSpeed : Float = 50;
	private var bulletSize : Float = 5;

	private static var deadZone = 0.10;

	public function new(x : Float, y : Float)
	{
		position = new Vector(x, y);

		for (j in new Ipairs(JoystickModule.getJoysticks()))
			if ((j : Joystick).isGamepad())
				gamepad = j;
	}

	public function toReap()
	{
		return false;
	}

	public function getHealth()
	{
		return health;
	}

	public inline function damage()
	{
		health -= 1;
	}

	public inline function getPosition()
	{
		return position.copy();
	}

	private function getGamepadDirection(x, y)
	{
		var dir = new Vector();
		dir.x = gamepad.getGamepadAxis(x);
		dir.y = gamepad.getGamepadAxis(y);

		if (Math.abs(dir.x) < deadZone)
			dir.x = 0;
		if (Math.abs(dir.y) < deadZone)
			dir.y = 0;

		return dir.normalize();
	}

	public function move(dt : Float)
	{
		var dir = getGamepadDirection(Leftx, Lefty);
		position.add(dir.mul(speed*dt));
	}

	public function act(dt : Float)
	{
		var dir = getGamepadDirection(Rightx, Righty);
		if (dir.length() == 0)
			return null;

		var bullets = new Array<Bullet>();

		var pos = dir.copy().mul(size+bulletSize).add(position);
		bullets.push(new Bullet(pos, dir.mul(bulletSpeed), bulletSize));

		return bullets;
	}

	public function draw()
	{
		Graphics.circle(Fill, position.x, position.y, size);
	}
}
