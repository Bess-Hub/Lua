-- Define some variables for the game
local mapImage  -- This will hold the map image
local questions = {}  -- Library of questions
local currentQuestion  -- The current question being asked
local score = {correct = 0, total = -1}  -- Score tracking
local questionText = ""

-- http://app.bhencke.com/pixelmap.html
-- Load assets and initialize the game
function love.load()
    -- Load the map image
    map = love.graphics.newImage("map.png")

    -- Get the map’s dimensions
    local mapWidth = map:getWidth()
    local mapHeight = map:getHeight()

    -- Set the game window size to match the map size
    love.window.setMode(mapWidth, mapHeight)
        
    -- Initialize questions (location name, correct x, correct y)
    questions = {
        -- Oceans and Seas
       --  {name = "North Pacific Ocean", polygon = {{300, 600}, {500, 100}, {500, 400}, {200, 400}}, type = "polygon" },
        -- {name = "South Pacific Ocean", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "North Atlantic Ocean", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "South Atlantic Ocean", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Indian Ocean", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Artic Ocean", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Southern Ocean", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Mexico", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Guinea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Oman", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Aden", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Persian Gulf", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Carpentaria", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Bothnia", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Finland", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Riga", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Alaska", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Mannar", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Martaban", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Panama", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Suez", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Thailand", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Gabes", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of St. Lawrence", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Aqaba", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Amundsen Gulf", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Tonkin", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Kutch", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Gulf of Khambhat", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bay of Bengal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "South China Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Mediterranean Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Black Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Baltic Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Arabian Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Black Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "North Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Caspian Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Adriatic Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Sargasso Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bering Sea", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- Others
        {name = "Prime Meridian", x1 = 622, y1 = 0, x2 = 622, y2 = 796, type = "verticalline"},
        {name = "Equator Line", x1 = 0, y1 = 570, x2 = 1288, y2 = 570, type = "horizontalline"},
        {name = "Tropic of Cancer", x1 = 0, y1 = 490, x2 = 1288, y2 = 489, type = "horizontalline"},
        {name = "Tropic of Capricorn", x1 = 0, y1 = 650, x2 = 1288, y2 = 650, type = "horizontalline"},
        -- Straits
        {name = "Malacca Strait", x1 = 945, y1 = 553, x2 = 960, y2 = 569, type = "verticalline"},
        {name = "Gibraltar Strait", x = 603, y = 445, type = "point"},
        -- {name = "Palk Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Sunda Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Yucatan Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Mesina Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Otranto Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bab-el-Mandeb Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bass Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bering Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bonne-Fasio Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        {name = "Bosphorus Strait", x1 = 710, y1 = 427, x2 = 718, y2 = 424, type = "horizontalline"},
        -- {name = "Dardaneles Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Davis Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"}, 
        -- {name = "Dover Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},  
        -- {name = "Denmark Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Florida Straits", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Hormuz Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Hudson Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Magellan Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Makkassar Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Tsugaru Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Tatar Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Taiwan Strait (Formosa Strait)", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Bohai Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},  
        -- {name = "Korea Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Kerch Strait", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- -- Canals
        {name = "Panama Canal", x = 362, y = 540, type = "point"},
        {name = "Suez Canal", x1 = 728, y1 = 462, x2 = 733, y2 = 474, type = "verticalline"},
        -- {name = "Corinth Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Kiel Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Erie Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Caledonian Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Göta Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Cape Cod Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Welland Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Beijing-Hangzhou Canal (Great Canal)", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Mitteland Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Volga-Don Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Rhine-Main-Danube Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "White Sea-Baltic Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Houston  Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Khlong Canal", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Canal du Midi", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- -- Channels
        -- {name = "Mozambique Channel", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "English Channel", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        -- {name = "Jamaica Channel", polygon = {{100, 200}, {300, 200}, {300, 400}, {100, 400}}, type = "polygon"},
        --         -- Add more questions and locations here -- https://lotusarise.com/major-straits-of-the-world-upsc/ link to find them --
        -- Ports in Asia
        {name = "Port of Shanghai", x = 1024, y = 463, type = "point"},
        -- {name = "Port of Ningbo-Zhoushan", x = 200, y = 350, type = "point"},
        -- {name = "Port of Shenzhen", x = 200, y = 350, type = "point"},
        -- {name = "Port of Qingdao", x = 200, y = 350, type = "point"},
        -- {name = "Port of Tianjin", x = 200, y = 350, type = "point"},
        -- {name = "Port of Guangzhou", x = 200, y = 350, type = "point"},
        {name = "Port of Singapore", x = 966, y = 567, type = "point"},
        -- {name = "Port of Busan", x = 200, y = 350, type = "point"},
        -- {name = "Port of Dalian", x = 200, y = 350, type = "point"},
        -- {name = "Port of Hong Kong", x = 200, y = 350, type = "point"},
        -- {name = "Port of Klang", x = 200, y = 350, type = "point"},
        -- {name = "Port of Ho Chi Minh", x = 200, y = 350, type = "point"},
        -- {name = "Port of Yingkou", x = 200, y = 350, type = "point"},
        -- {name = "Port of Manila", x = 200, y = 350, type = "point"},
        -- {name = "Port of Taicang", x = 200, y = 350, type = "point"},
        -- {name = "Port of Hai Phong", x = 200, y = 350, type = "point"},
        -- {name = "Port of Mundra", x = 200, y = 350, type = "point"},
        -- {name = "Port of Tokyo", x = 200, y = 350, type = "point"},
        -- {name = "Port of Yokohama", x = 200, y = 350, type = "point"},
        -- {name = "Port of Melbourne", x = 200, y = 350, type = "point"},
        -- {name = "Port of Sydney", x = 200, y = 350, type = "point"},
        -- {name = "Port of Brisbane", x = 200, y = 350, type = "point"},
        -- {name = "Port of Adelaide", x = 200, y = 350, type = "point"},
        -- {name = "Port of Darwin", x = 200, y = 350, type = "point"},
        -- {name = "Port of Necastle, Australia", x = 200, y = 350, type = "point"},
        -- {name = "Port of Auckland", x = 200, y = 350, type = "point"},
        -- {name = "Port of Wellington", x = 200, y = 350, type = "point"},
        -- {name = "Port of Cap Mei", x = 200, y = 350, type = "point"},
        -- {name = "Port of Chennai", x = 200, y = 350, type = "point"},
        -- {name = "Port of Mumbai", x = 200, y = 350, type = "point"},
        -- {name = "Port of Kandla", x = 200, y = 350, type = "point"},
        -- {name = "Port of Cochin", x = 200, y = 350, type = "point"},
        -- {name = "Port of Alang", x = 200, y = 350, type = "point"},
        -- {name = "Port of Chittagong", x = 200, y = 350, type = "point"},
        -- {name = "Port of Vladivostok", x = 200, y = 350, type = "point"},
        -- {name = "Port of Murmanks", x = 200, y = 350, type = "point"},
        -- {name = "Port of Dudinka", x = 200, y = 350, type = "point"},
        -- {name = "Port of Novorossiysk", x = 200, y = 350, type = "point"},
        -- {name = "Port of Astrakhan", x = 200, y = 350, type = "point"},
        -- {name = "Port of Colombo", x = 200, y = 350, type = "point"},
        -- {name = "Port of Bangkok", x = 200, y = 350, type = "point"},
        -- {name = "Port of Pago Pago", x = 200, y = 350, type = "point"},
        -- {name = "Port of Laem Chabang", x = 200, y = 350, type = "point"},
        -- -- Ports in Middle East
        -- {name = "Port of Jebel Ali", x = 200, y = 350, type = "point"},
        -- {name = "Port of Neom", x = 200, y = 350, type = "point"},
        -- {name = "Port of Sohar", x = 200, y = 350, type = "point"},
        -- {name = "Port of Jeddah", x = 200, y = 350, type = "point"},
        -- {name = "Port of Hamad", x = 200, y = 350, type = "point"},
        -- {name = "Port of Aqaba", x = 200, y = 350, type = "point"},
        -- {name = "Port of Beirut", x = 200, y = 350, type = "point"},
        -- {name = "Port of Abu Dhabi (Khalifa)", x = 200, y = 350, type = "point"},
        -- {name = "Port of UMM QASAR", x = 200, y = 350, type = "point"},
        -- Ports in Africa
        {name = "Port of Abidjan", x = 604, y = 553, type = "point"},
        {name = "Port of Casablanca", x = 600, y = 451, type = "point"},
        -- {name = "Port of Djibouti", x = 200, y = 350, type = "point"},
        -- {name = "Port of Benin", x = 200, y = 350, type = "point"},
        -- {name = "Port of Cotonou", x = 200, y = 350, type = "point"},
        -- {name = "Port of Porto-Novo", x = 200, y = 350, type = "point"},
        -- {name = "Port of San Pedro", x = 200, y = 350, type = "point"},
        -- {name = "Port of Accra", x = 200, y = 350, type = "point"},
        -- {name = "Port of Tema", x = 200, y = 350, type = "point"},
        -- {name = "Port of Conakry", x = 200, y = 350, type = "point"},
        -- {name = "Port of Kamsar", x = 200, y = 350, type = "point"},
        -- {name = "Port of Buchanan", x = 200, y = 350, type = "point"},
        -- {name = "Port of Freetown", x = 200, y = 350, type = "point"},
        -- {name = "Port of Pointe Noire", x = 200, y = 350, type = "point"},
        -- {name = "Port of Walvis Bay", x = 200, y = 350, type = "point"},
        -- {name = "Port of Cape Town", x = 200, y = 350, type = "point"},
        -- {name = "Port of Durban", x = 200, y = 350, type = "point"},
        -- {name = "Port of Nacala", x = 200, y = 350, type = "point"},
        -- {name = "Port of Maputo", x = 200, y = 350, type = "point"},
        -- {name = "Port Harcourt", x = 200, y = 350, type = "point"},
        -- {name = "Port of Lagos", x = 200, y = 350, type = "point"},
        -- {name = "Port of Cabinda", x = 200, y = 350, type = "point"},
        --         -- Ports in Europe
        -- {name = "Port of Rotterdam", x = 200, y = 350, type = "point"},
        -- {name = "Port of Antwerp", x = 200, y = 350, type = "point"},
        -- {name = "Port of Hamburg", x = 200, y = 350, type = "point"},
        -- {name = "Port of Bremerhaven", x = 200, y = 350, type = "point"},
        -- {name = "Port of Algeciras", x = 200, y = 350, type = "point"},
        {name = "Port of Valencia", x = 620, y = 432, type = "point"},
        -- {name = "Port of Piraeus", x = 200, y = 350, type = "point"},
        -- {name = "Port of Felixstowe", x = 200, y = 350, type = "point"},
        -- {name = "Port of Barcelona", x = 200, y = 350, type = "point"},
        -- {name = "Port of Le Havre", x = 200, y = 350, type = "point"},
        -- {name = "Port of Lisboa", x = 200, y = 350, type = "point"},
        -- {name = "Port of Oporto", x = 200, y = 350, type = "point"},
        -- {name = "Port of Madeira", x = 200, y = 350, type = "point"},
        -- {name = "Port of Marsella", x = 200, y = 350, type = "point"},
        -- {name = "Port of Genova", x = 200, y = 350, type = "point"},
        -- {name = "Port of Dunkerque", x = 200, y = 350, type = "point"},
        -- {name = "Port of Aarhus", x = 200, y = 350, type = "point"},
        -- {name = "Port of Cagliari", x = 200, y = 350, type = "point"},
        -- {name = "Port of Southampton, UK", x = 200, y = 350, type = "point"},
        {name = "Port of Aberdeen", x = 615, y = 342, type = "point"},
        {name = "Port of Bergen", x = 639, y = 320, type = "point"},
        {name = "Port of Gibraltar", x = 603, y = 445, type = "point"},
        -- {name = "Port of Glasgow", x = 200, y = 350, type = "point"},
        -- {name = "Port of Leixoes", x = 200, y = 350, type = "point"},
        -- {name = "Port of Setubal", x = 200, y = 350, type = "point"},
        -- {name = "Port of Funchal", x = 200, y = 350, type = "point"},
        -- {name = "Port of Malaga", x = 200, y = 350, type = "point"},
        -- {name = "Port of Palmas", x = 200, y = 350, type = "point"},
        -- {name = "Port of Rosyth", x = 200, y = 350, type = "point"},
        -- {name = "Port of Ortona", x = 200, y = 350, type = "point"},
        -- {name = "Port of Koper", x = 200, y = 350, type = "point"},
        -- {name = "Port of Szczecin", x = 200, y = 350, type = "point"},
        -- {name = "Port of Sousse", x = 200, y = 350, type = "point"},
        -- {name = "Port of Liepaja", x = 200, y = 350, type = "point"},
        -- {name = "Port of Constanta", x = 200, y = 350, type = "point"},
        -- {name = "Port of Zeebrugge", x = 200, y = 350, type = "point"},
        -- {name = "Port of Alexandria", x = 200, y = 350, type = "point"},
        -- {name = "Port of Tangier", x = 200, y = 350, type = "point"},
        -- {name = "Port of Kalamaki", x = 200, y = 350, type = "point"},
        -- {name = "Port of Piraeus", x = 200, y = 350, type = "point"},
        -- {name = "Port of Lovisa", x = 200, y = 350, type = "point"},
        -- {name = "Port of Tuzla", x = 200, y = 350, type = "point"},
        -- {name = "Port of Ravenna", x = 200, y = 350, type = "point"},
        -- {name = "Port of Samsun", x = 200, y = 350, type = "point"},
        -- {name = "Port of Izmir", x = 200, y = 350, type = "point"},
        -- {name = "Port of Mersin", x = 200, y = 350, type = "point"},
        -- {name = "Port of Rouen", x = 200, y = 350, type = "point"},
        -- {name = "Port of Santander", x = 200, y = 350, type = "point"},
        -- {name = "Port of Vigo", x = 200, y = 350, type = "point"},
        {name = "Port of Catania", x = 672, y = 439, type = "point"},
        {name = "Port of Bizerte", x = 657, y = 441, type = "point"},
        {name = "Port of La Goulette", x = 656, y = 442, type = "point"},
        {name = "Port of Iskeridun", x = 741, y = 446, type = "point"},
    }
    
    -- Generate the first question
    generateQuestion()
end

-- Generate a random question from the list
function generateQuestion()
    currentQuestion = questions[math.random(1, #questions)]
    questionText = "Click on " .. currentQuestion.name
    score.total = score.total + 1
end

-- Update function (not much needed here, but necessary in LÖVE)
function love.update(dt)
end

-- Draw function to display the map, question, score, and click marker
function love.draw()
    -- Draw the map
    love.graphics.draw(map, 0, 0)

    -- Set color to black with some transparency for the top rectangle
    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 100)

    -- Reset color to white for the text
    love.graphics.setColor(1, 1, 1)

    -- Display the game title "Bess' Maritime Geography Quiz!" inside the rectangle
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.printf("Bess' Maritime Geography Quiz!", 0, 10, love.graphics.getWidth(), "center")

    -- Set font size back for the rest of the text
    love.graphics.setFont(love.graphics.newFont(14))
    love.graphics.print(questionText, 10, 50)
    love.graphics.print("Score: " .. score.correct .. " / " .. score.total, 10, 70)

    -- Draw the click marker only if the player has clicked
    if clickX and clickY then
        -- Set color for the click marker (red circle)
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("fill", clickX, clickY, 10)  -- Draw a red circle at the clicked coordinates
    end

    -- Reset color back to white
    love.graphics.setColor(1, 1, 1)
end

-- Helper function: Point-in-polygon algorithm (Ray-casting method)
function isPointInPolygon(polygon, px, py)
    local oddNodes = false
    local j = #polygon

    for i = 1, #polygon do
        local xi, yi = polygon[i][1], polygon[i][2]
        local xj, yj = polygon[j][1], polygon[j][2]
        
        if (yi < py and yj >= py or yj < py and yi >= py) and 
           (xi + (py - yi) / (yj - yi) * (xj - xi) < px) then
            oddNodes = not oddNodes
        end
        j = i
    end

    return oddNodes
end

-- Variables to store the click position
local clickX, clickY = nil, nil

-- Variables to store the click position and duration
local clickX, clickY = nil, nil
local clickDuration = 0.045  -- Duration to show the click marker in seconds
local clickTimer = 0     -- Timer to track the duration

-- Handle mouse clicks
function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then  -- Left mouse button
        local isCorrect = false

        if currentQuestion.type == "point" then
            -- Point detection logic
            local tolerance = 10
            if math.abs(x - currentQuestion.x) <= tolerance and math.abs(y - currentQuestion.y) <= tolerance then
                isCorrect = true
            end

        elseif currentQuestion.type == "polygon" then
            -- Polygon detection logic
            if isPointInPolygon(currentQuestion.polygon, x, y) then
                isCorrect = true
            end
        
        elseif currentQuestion.type == "horizontalline" then
            local linetolerance = 13
            -- Line detection with tolerance
            if x >= currentQuestion.x1 and x <= currentQuestion.x2 and
               y >= (currentQuestion.y1 - linetolerance) and y <= (currentQuestion.y1 + linetolerance) then
                isCorrect = true
            end

        elseif currentQuestion.type == "verticalline" then
            local linetolerance = 13
            -- Line detection with tolerance
            if x >= (currentQuestion.x1 - linetolerance) and x <= (currentQuestion.x1 + linetolerance) and
               y >= currentQuestion.y1 and y <= currentQuestion.y2 then
                isCorrect = true
            end
        end

        -- Store the click position
        clickX, clickY = x, y  -- Save the clicked coordinates

        -- Update score and provide feedback
        if isCorrect then
            score.correct = score.correct + 1
            -- Here you can add a notification for correct answers, but avoid changing the color directly.
        else
            -- Feedback for incorrect answers can be handled elsewhere
        end

        -- Reset click timer
        clickTimer = clickDuration

        -- Generate a new question
        generateQuestion()
    end
end

-- Update function to manage the click marker's visibility duration
function love.update(dt)
    if clickTimer > 0 then
        clickTimer = clickTimer - dt  -- Decrease timer based on the frame time
        if clickTimer <= 0 then
            clickX, clickY = nil, nil  -- Hide the marker after duration
        end
    end
end

-- Draw function to display the map, question, score, and click marker
function love.draw()
    -- Draw the map
    love.graphics.draw(map, 0, 0)

    -- Set color to black with some transparency for the top rectangle
    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 100)

    -- Reset color to white for the text
    love.graphics.setColor(1, 1, 1)

    -- Display the game title "Bess' Maritime Geography Quiz!" inside the rectangle
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.printf("Belys' Maritime Geography Quiz!", 0, 10, love.graphics.getWidth(), "center")

    -- Set font size back for the rest of the text
    love.graphics.setFont(love.graphics.newFont(14))
    love.graphics.print(questionText, 10, 50)
    love.graphics.print("Score: " .. score.correct .. " / " .. score.total, 10, 70)

    -- Draw the click marker only if the player has clicked
    if clickX and clickY then
        -- Set color for the click marker (red circle)
        love.graphics.setColor(5, 0, 0, 0.7)
        local markerSize = 10  -- Size of the click marker (increase as needed)
        love.graphics.circle("fill", clickX, clickY, markerSize)  -- Draw a larger red circle at the clicked coordinates
    end

    -- Reset color back to white
    love.graphics.setColor(1, 1, 1)
end
