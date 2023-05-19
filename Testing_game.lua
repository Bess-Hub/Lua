-- Room definitions
local rooms = {
  {
    name = "Living Room",
    description = "You are in a cozy living room. There is a door to the north.",
    north = 2
  },
  {
    name = "Kitchen",
    description = "You are in a bright kitchen. There is a door to the south.",
    south = 1
  }
}

-- Player position
local currentRoom = 1

-- Game loop
while true do
  -- Display current room
  print(rooms[currentRoom].name)
  print(rooms[currentRoom].description)
  
  -- Prompt for player input
  print("Where would you like to go?")
  local input = io.read()
  
  -- Process player input
  if input == "north" and rooms[currentRoom].north then
    currentRoom = rooms[currentRoom].north
  elseif input == "south" and rooms[currentRoom].south then
    currentRoom = rooms[currentRoom].south
  elseif input == "quit" then
    break  -- Exit the game loop
  else
    print("Invalid input!")
  end
end

print("Thanks for playing!")
