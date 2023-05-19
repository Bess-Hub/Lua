-- Time variables
local startTime = os.time()

-- Room definitions
local rooms = {
  {
    name = "Class Room",
    description = " ",
    north = 2,
    objects = { "blackboard", "clock" , "backpack", "desk", "chair", "jacket", "window", "fan"}
  }
}

-- Object definitions
local objects = {
  blackboard = {
    description = "A regular blackboard... Is that chalk?",
    examine = "Someone drew an arrow pointing up. What could be there?"
  },
  clock = {
    description = "A clock on top of the blackboard.",
    examine = "The clock is broken. But you can't see the time, keep on looking you might find a clue."
  },
  backpack = {
    description = "Your backpack",
    examine = "Here is a weird letter: 'The code of the door is the time the clock is frozen at.'"
  },
  desk = {
    description = "Your desk",
    examine = "What a mess! Babei..."
  },
  chair = {
    description = "Your compi's chair",
    examine = "Ew, there is bubblegum on it. Not touching that, nothing to see here."
  },
   fan = {
    description = "Could there be anything on the fan?",
    examine = "Shit... I cannot reach it."
  },
  jacket = {
    description = "This jacket is not yours...",
    examine = "There is something in the pocket! It is a piece of paper that reads: 'Una madre tiene EUR 30 para repartir entre sus dos hijas, ¿qué hora es?'"
  },
  window = {
    description = "Let's take a look at the window.",
    examine = "The weird woman with a hat... Ow there are my colleagues! HEY! They are laughing and pointing at their watches..."
  }
}

-- Player position
local currentRoom = 1

-- Hiding something here unsuspiciously
local doorCode = "1345"

-- Flag to track initial text display
local initialTextDisplayed = false

-- Display initial welcome text
print()
print("Welcome to our first Bely Escape Game!")
print("You must be very bored to be playing this game.")
print("Unlike your current class, this one you can actually escape.")
print()
print("Quick instructions:")
print("1. You woke up and class is over. Your colleagues have left the classroom. It seems that you are locked in there.")
print("2. You will have to explore the objects around to find clues that lead you out of that place.")
print("3. To examine an object simply type 'Examine' followed by the object name. Example: Examine backpack.")
print("4. To try opening the door and leaving your class type 'Open door'.")
print("5. Easy? Let's see how long it takes for you to complete it...")
print()

-- Game loop
while true do
  -- Display current room
  print(rooms[currentRoom].name)
  
  -- Display initial text if not displayed yet
  if not initialTextDisplayed and currentRoom == 1 then
    print("You are in the class room.")
    initialTextDisplayed = true
  else
    print(rooms[currentRoom].description)
  end
  
  -- Display objects in the room
  if #rooms[currentRoom].objects > 0 then
    print()
    print("You see the following objects:")
    for _, objectName in ipairs(rooms[currentRoom].objects) do
      print("- " .. objectName)
    end
  end
  
  -- Prompt for player input
  print()
  print("What would you like to do?")
  local input = io.read()
  
 -- Process player input
if input:lower() == "open door" then
  if currentRoom == 1 and rooms[currentRoom].north then
    print()
    print("Enter the door code:")
    local codeInput = io.read()
    if codeInput == doorCode then
      currentRoom = rooms[currentRoom].north
      local endTime = os.time()
      local elapsedTime = os.difftime(endTime, startTime)
      print()
      print("You did it! You left your class and you promise never to sleep during it again! Congratulations!")
      print("Time taken: " .. elapsedTime .. " seconds.")
      print()
      break -- Exit the game loop
    else
      print("Wrong code! The door remains locked.")
    end
  else
    print("You can't open the door here.")
  end
elseif input:lower() == "leave" and rooms[currentRoom].south then
  currentRoom = rooms[currentRoom].south
elseif input:lower() == "quit" then
  break  -- Exit the game loop
elseif input:sub(1, 7):lower() == "examine" then
  print()
  local objectName = input:sub(9)  -- Extract the object name from input
  local object = objects[objectName]
  if object then
    print(object.description)
    print(object.examine)
    print()
  else
    print("You don't see that object here.")
  end
else
  print("Invalid input!")
end

print()
end

