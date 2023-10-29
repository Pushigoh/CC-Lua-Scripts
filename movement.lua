-- Set up the file path for the coordinate file
local filepath = "coordinates.txt"

-- Function to read the current coordinates from the file
function readCoordinates()
  local file = fs.open(filepath, "r")
  local x, y, z = file.readLine(), file.readLine(), file.readLine()
  file.close()
  return tonumber(x), tonumber(y), tonumber(z)
end

-- Function to write the current coordinates to the file
function writeCoordinates(x, y, z)
  local file = fs.open(filepath, "w")
  file.writeLine(tostring(x))
  file.writeLine(tostring(y))
  file.writeLine(tostring(z))
  file.close()
end

-- Function to add to the X coordinate
function addToX(amount)
  local x, y, z = readCoordinates()
  writeCoordinates(x + amount, y, z)
end

-- Function to subtract from the X coordinate
function subtractFromX(amount)
  addToX(-amount)
end

-- Function to add to the Y coordinate
function addToY(amount)
  local x, y, z = readCoordinates()
  writeCoordinates(x, y + amount, z)
end

-- Function to subtract from the Y coordinate
function subtractFromY(amount)
  addToY(-amount)
end

-- Function to add to the Z coordinate
function addToZ(amount)
  local x, y, z = readCoordinates()
  writeCoordinates(x, y, z + amount)
end

-- Function to subtract from the Z coordinate
function subtractFromZ(amount)
  addToZ(-amount)
end
