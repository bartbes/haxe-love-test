import love.Love;

class Main
{
	public static function main()
	{
		Love.load = function(args)
		{
			GamestateManager.switchState(Playstate.instance);
		};
	}
}
