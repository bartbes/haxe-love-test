import love.Love;

class Main extends Gamestate
{
	public static function main()
	{
		Love.load = function(args)
		{
			GamestateManager.switchState(new Playstate());
		};
	}
}
