import love.Love;

class GamestateManager
{
	public static function switchState(targetState : Gamestate)
	{
		Love.directorydropped = targetState.directorydropped.bind();
		Love.draw = targetState.draw.bind();
		//Love.errhand = targetState.errhand.bind();
		Love.filedropped = targetState.filedropped.bind();
		Love.focus = targetState.focus.bind();
		Love.gamepadaxis = targetState.gamepadaxis.bind();
		Love.gamepadpressed = targetState.gamepadpressed.bind();
		Love.gamepadreleased = targetState.gamepadreleased.bind();
		Love.joystickadded = targetState.joystickadded.bind();
		Love.joystickaxis = targetState.joystickaxis.bind();
		Love.joystickhat = targetState.joystickhat.bind();
		//Love.joystickpressed = targetState.joystickpressed.bind();
		//Love.joystickreleased = targetState.joystickreleased.bind();
		Love.joystickremoved = targetState.joystickremoved.bind();
		Love.keypressed = targetState.keypressed.bind();
		Love.keyreleased = targetState.keyreleased.bind();
		Love.lowmemory = targetState.lowmemory.bind();
		Love.mousefocus = targetState.mousefocus.bind();
		Love.mousemoved = targetState.mousemoved.bind();
		Love.mousepressed = targetState.mousepressed.bind();
		Love.mousereleased = targetState.mousereleased.bind();
		Love.quit = targetState.quit.bind();
		Love.resize = targetState.resize.bind();
		Love.textedited = targetState.textedited.bind();
		Love.textinput = targetState.textinput.bind();
		Love.threaderror = targetState.threaderror.bind();
		Love.touchmoved = targetState.touchmoved.bind();
		Love.touchpressed = targetState.touchpressed.bind();
		Love.touchreleased = targetState.touchreleased.bind();
		Love.update = targetState.update.bind();
		Love.visible = targetState.visible.bind();
		Love.wheelmoved = targetState.wheelmoved.bind();

		targetState.load();
	}
}
