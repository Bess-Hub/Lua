-- Room definitions
local rooms = {
  {
    name = "Living Room",
    description = "You are in a cozy living room. There is a door to the north.",
    north = 2,
    objects = { "painting" }
  },
  {
    name = "Kitchen",
    description = "You are in a bright kitchen. There is a door to the south.",
    south = 1,
    objects = { "knife" }
  }
}

-- Object definitions
local objects = {
  painting = {
    description = "A beautiful landscape painting.",
    examine = "You notice a small safe behind the painting."
  },
  knife = {
    description = "A sharp kitchen knife.",
    examine = "It looks like it hasn't been used in a while."
  }
}

-- Player position
local currentRoom = 1

-- Game loop
while true do
  -- Display current room
  print(rooms[currentRoom].name)
  print(rooms[currentRoom].description)
  
  -- Display objects in the room
  if #rooms[currentRoom].objects > 0 then
    print("You see the following objects:")
    for _, objectName in ipairs(rooms[currentRoom].objects) do
      print("- " .. objectName)
    end
  end
  
  -- Prompt for player input
  print("What would you like to do?")
  local input = io.read()
  
  -- Process player input
  if input == "north" and rooms[currentRoom].north then
    currentRoom = rooms[currentRoom].north
  elseif input == "south" and rooms[currentRoom].south then
    currentRoom = rooms[currentRoom].south
  elseif input == "quit" then
    break  -- Exit the game loop
  elseif input:sub(1, 7) == "examine" then
    local objectName = input:sub(9)  -- Extract the object name from input
    local object = objects[objectName]
    if object then
      print(object.description)
    else
      print("You don't see that object here.")
    end
  else
    print("Invalid input!")
  end
end

print("Thanks for playing!")

