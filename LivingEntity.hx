interface LivingEntity extends Entity
{
	public function act(dt : Float) : Null<Array<Bullet>>;
	public function getHealth() : Int;
	public function damage() : Void;
}
