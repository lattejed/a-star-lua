A* for Lua
==========

A clean, simple implementation of the A* pathfinding algorithm for Lua.

This implementation has no dependencies and has a simple interface. It takes a table of nodes, a start and end point and a "valid neighbor" function which makes it easy to adapt the module's behavior, especially in circumstances where valid paths would frequently change.

The module automatically caches paths which saves CPU time for frequently accessed start and end nodes. Cached paths can be ignored by setting the appropriate parameter in the main function. Cached paths can be purged with the `clear_cached_paths ()` function.

## Usage example ##

	-- this function determines which neighbors are valid (e.g., within range)
	local valid_node_func = function ( node, neighbor ) 
	
		local MAX_DIST = 300
			
		-- helper function in the a-star module, returns distance between points
		if astar.distance ( node.x, node.y, neighbor.x, neighbor.y ) < MAX_DIST then
			return true
		end
		return false
	end

	local ignore = true -- ignore cached paths
	
	local path = astar.path ( start, end, all_nodes, ignore, valid_node_func )
	
	if path then
		-- do something with path (a lua table of ordered nodes from start to end)
	end
	
## Notes ##

This assumes that nodes are objects (tables) with (at least) members "x" and "y" that hold the node's coordinates.

	node = {}
	node.x = 123
	node.y = 456
	node.foo = "bar"