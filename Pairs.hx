import lua.Lua;
import lua.Table;

class Pairs
{
	private var table : AnyTable;
	private var index : Null<Dynamic>;

	public inline function new(table : AnyTable)
	{
		this.table = table;
		index = Lua.next(table);
	}

	public inline function next() : Dynamic
	{
		var oldIndex = index;
		index = Lua.next(table, index);
		return oldIndex;
	}

	public inline function hasNext()
	{
		return index != null;
	}
}
