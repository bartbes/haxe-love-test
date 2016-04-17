interface EnemyBehaviour
{
	public var enemy : Enemy;

	public function think(player : LivingEntity) : Vector;
	public function act(dt : Float) : Null<Array<Bullet>>;
	public function getImage() : love.graphics.Image;
}
