import lua.Table;
import lua.UserData;
import love.filesystem.File;
import love.joystick.Joystick;
import love.joystick.GamepadAxis;
import love.joystick.GamepadButton;
import love.joystick.JoystickHat;
import love.thread.Thread;

class Gamestate
{
	public function load() : Void {}

	public function directorydropped(dir : String) : Void {}
	public function draw() : Void {}
	//public function errhand(error : String) : Void {}
	public function filedropped(file : File) : Void {}
	public function focus(focused : Bool) : Void {}
	public function gamepadaxis(joystick : Joystick, axis : GamepadAxis) : Void {}
	public function gamepadpressed(joystick : Joystick, button : GamepadButton) : Void {}
	public function gamepadreleased(joystick : Joystick, button : GamepadButton) : Void {}
	public function joystickadded(joystick : Joystick) : Void {}
	public function joystickaxis(joystick : Joystick, axis : Float, value : Float) : Void {}
	public function joystickhat(joystick : Joystick, hat : Float, value : JoystickHat) : Void {}
	//public function joystickpressed : Float->Float->Void;
	//public function joystickreleased : Float->Float->Void;
	public function joystickremoved(joystick : Joystick) : Void {}
	public function keypressed(keycode : String, scancode : String, repeat : Bool) : Void {}
	public function keyreleased(keycode : String) : Void {} // TODO : scancode?
	public function lowmemory() : Void {}
	public function mousefocus(focused : Bool) : Void {}
	public function mousemoved(x : Float, y : Float, dx : Float, dy : Float) : Void {}
	public function mousepressed(x : Float, y : Float, button : Float, istouch : Bool) : Void {}
	public function mousereleased(x : Float, y : Float, button : Float, istouch : Bool) : Void {}
	public function quit() : Bool { return false; }
	public function resize(width : Float, height : Float) : Void {}
	public function textedited(text : String, start : Float, length : Float) : Void {}
	public function textinput(text : String) : Void {}
	public function threaderror(thread : Thread, error : String) : Void {}
	public function touchmoved(id : UserData, x : Float, y : Float, dx : Float, dy : Float, pressure : Float) : Void {}
	public function touchpressed(id : UserData, x : Float, y : Float, dx : Float, dy : Float, pressure : Float) : Void {}
	public function touchreleased(id : UserData, x : Float, y : Float, dx : Float, dy : Float, pressure : Float) : Void {}
	public function update(dt : Float) : Void {}
	public function visible(visible : Bool) : Void {}
	public function wheelmoved(dx : Float, dy : Float) : Void {}
}
