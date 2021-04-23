-- Utility functions --

function TableSize(t)
    local size = 0
    for k,v in pairs(t) do
        size = size + 1
    end
    return size
end

function TableContainsValue( t, value )
    for k, v in pairs( t ) do
        if v == value then
            return k
        end
    end

    return nil
end

function ShuffledList( orig_list )
  local list = shallowcopy( orig_list )
  local result = {}
  local count = #list
  for i = 1, count do
    local pick = RandomInt( 1, #list )
    result[ #result + 1 ] = list[ pick ]
    table.remove( list, pick )
  end
  return result
end

function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end


function PrintTable(t, indent, done)
	if type(t) ~= "table" then return end

	done = done or {}
	done[t] = true
	indent = indent or 0

	local l = {}
	for k, v in pairs(t) do
		table.insert(l, k)
	end

	table.sort(l)
	for k, v in ipairs(l) do
	-- Ignore FDesc
    	if v ~= 'FDesc' then
      		local value = t[v]

      		if type(value) == "table" and not done[value] then
        		done [value] = true
        		print(string.rep ("\t", indent)..tostring(v)..":")
        		PrintTable (value, indent + 2, done)
      		elseif type(value) == "userdata" and not done[value] then
        		done [value] = true
        		print(string.rep ("\t", indent)..tostring(v)..": "..tostring(value))
        		PrintTable ((getmetatable(value) and getmetatable(value).__index) or getmetatable(value), indent + 2, done)
      		else
        		if t.FDesc and t.FDesc[v] then
          			print(string.rep ("\t", indent)..tostring(t.FDesc[v]))
        		else
          			print(string.rep ("\t", indent)..tostring(v)..": "..tostring(value))
        		end
      		end
    	end
	end
  print("`````````````````````````````````````````````````````````````````````````````````````````")
end