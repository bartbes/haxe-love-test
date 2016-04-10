import lua.Table;

class Ipairs
{
	private var table : AnyTable;
	private var i : Int = 1;
	private var n : Int;

	public inline function new(table : AnyTable)
	{
		this.table = table;
		n = untyped __lua__("#table");
	}

	public inline function next() : Dynamic
	{
		return table[i++];
	}

	public inline function hasNext()
	{
		return i <= n;
	}
}
