-- ======================================================================
-- Copyright (c) 2012 RapidFire Studio Limited 
-- All Rights Reserved. 
-- http://www.rapidfirestudio.com

-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:

-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-- ======================================================================

require "a-star"

local graph = {}
graph [ 1 ] = {}
graph [ 1 ].id = 1
graph [ 1 ].x = 0
graph [ 1 ].y = 0
graph [ 1 ].player_id = 1

graph [ 2 ] = {}
graph [ 2 ].id = 2
graph [ 2 ].x = 200
graph [ 2 ].y = 200
graph [ 2 ].player_id = 1

graph [ 3 ] = {}
graph [ 3 ].id = 3
graph [ 3 ].x = -200
graph [ 3 ].y = 200
graph [ 3 ].player_id = 1

graph [ 4 ] = {}
graph [ 4 ].id = 4
graph [ 4 ].x = 200
graph [ 4 ].y = -200
graph [ 4 ].player_id = 2

graph [ 5 ] = {}
graph [ 5 ].id = 5
graph [ 5 ].x = -200
graph [ 5 ].y = -200
graph [ 5 ].player_id = 2

local valid_node_func = function ( node, neighbor ) 
	
	local MAX_DIST = 300
		
	if 	neighbor.player_id == node.player_id and 
		astar.distance ( node.x, node.y, neighbor.x, neighbor.y ) < MAX_DIST then
		return true
	end
	return false
end

local path = astar.path ( graph [ 2 ], graph [ 3 ], graph, true, valid_node_func )

if not path then
	print ( "No valid path found" )
else
	for i, node in ipairs ( path ) do
		print ( "Step " .. i .. " >> " .. node.id )
	end
end