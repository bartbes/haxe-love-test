interface Entity
{
	public function toReap() : Bool;
	public function move(dt : Float) : Void;
	public function draw() : Void;
}
