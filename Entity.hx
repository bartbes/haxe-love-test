interface Entity
{
	public function getPosition() : Vector;
	public function toReap() : Bool;
	public function move(dt : Float) : Void;
	public function draw() : Void;
}
