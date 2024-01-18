#include <SFML/Graphics.hpp>
#include <iostream>
#include <cstdlib>
#include <ctime>

const int gridSize = 8;
const float cellSize = 100.f;

struct Cell : sf::Sprite
{
    int id;
};

void swaper(Cell grid[gridSize][gridSize], sf::Texture textures[6])
{
    for (int k = 0; k < gridSize; ++k)
    {
        for (int i = 0; i < gridSize; ++i)
        {
            for (int j = 0; j < gridSize; ++j)
            {
                if (grid[i][j].id == -1 && i != 0 && grid[i - 1][j].id != -1)
                {
                    grid[i][j].id = grid[i - 1][j].id;
                    grid[i][j].setTexture(textures[grid[i - 1][j].id]);
                    grid[i - 1][j].id = -1;
                }
            }
        }
    }
}

void placer(Cell grid[gridSize][gridSize], sf::Texture textures[6])
{
    for (int i = 0; i < gridSize; ++i)
    {
        for (int j = 0; j < gridSize; ++j)
        {
            if (grid[i][j].id == -1)
            {
                int randomValue = std::rand() % 6;
                grid[i][j].setTexture(textures[randomValue]);
                grid[i][j].id = randomValue;
            }
        }
    }
}

void eliminateMatches(Cell grid[gridSize][gridSize], sf::Texture textures[6])
{
    // Check for matches in rows
    for (int i = 0; i < gridSize; ++i)
    {
        for (int j = 0; j < gridSize - 2; ++j)
        {
            if (grid[i][j].id == grid[i][j + 1].id && grid[i][j].id == grid[i][j + 2].id)
            {
                std::cout << " Swaped ";

                grid[i][j].id = -1;
                grid[i][j + 1].id = -1;
                grid[i][j + 2].id = -1;
            }
        }
    }

    // Check for matches in columns
    for (int i = 0; i < gridSize - 2; ++i)
    {
        for (int j = 0; j < gridSize; ++j)
        {
            if (grid[i][j].id == grid[i + 1][j].id && grid[i][j].id == grid[i + 2][j].id)
            {
                std::cout << " Swaped ";

                grid[i][j].id = -1;
                grid[i + 1][j].id = -1;
                grid[i + 2][j].id = -1;
            }
        }
    }

    swaper(grid, textures);
    placer(grid, textures);
}

int main()
{
    std::srand(static_cast<unsigned>(std::time(nullptr)));

    sf::RenderWindow window(sf::VideoMode(800, 800), "Candy Crush");

    sf::Texture textures[6];
    for (int i = 0; i < 6; ++i)
    {
        if (!textures[i].loadFromFile("images/" + std::to_string(i + 1) + ".png"))
        {
            std::cout << "Image Error for " << i + 1 << std::endl;
            return 1;
        }
    }

    Cell grid[gridSize][gridSize];
    // Handle arrow key presses
    int col1 = 0;
    int row1 = 0;


    // Initialize grid with random numbers and corresponding textures
    for (int i = 0; i < gridSize; ++i)
    {
        for (int j = 0; j < gridSize; ++j)
        {
            int randomValue = std::rand() % 6;
            grid[i][j].setTexture(textures[randomValue]);
            grid[i][j].id = randomValue;
            grid[i][j].setScale(sf::Vector2f(0.2, 0.2));
            grid[i][j].setPosition(sf::Vector2f(j * cellSize, i * cellSize));
        }
    }

    sf::Vector2i selectedCell(-1, -1);
    sf::Vector2i cursorPosition(0, 0); // Initial cursor position

    while (window.isOpen())
    {
        eliminateMatches(grid, textures);
        sf::Event event;
        while (window.pollEvent(event))
        {
       
            if (event.type == sf::Event::Closed)
                window.close();

            else if (event.type == sf::Event::MouseButtonPressed)
            {
                // Check if the mouse is pressed within the grid
                sf::Vector2i mousePos = sf::Mouse::getPosition(window);
                int col = mousePos.x / cellSize;
                int row = mousePos.y / cellSize;

                if (col >= 0 && col < gridSize && row >= 0 && row < gridSize)
                {
                    selectedCell = sf::Vector2i(col, row);
                }
            }
            else if (event.type == sf::Event::MouseButtonReleased && selectedCell.x != -1)
            {
                // Check if the mouse is released within the grid
                sf::Vector2i mousePos = sf::Mouse::getPosition(window);
                int col = mousePos.x / cellSize;
                int row = mousePos.y / cellSize;

                if (col >= 0 && col < gridSize && row >= 0 && row < gridSize)
                {
                    // Swap the positions

                    int temps = 0;
                    sf::Vector2f tempPosition = grid[selectedCell.y][selectedCell.x].getPosition();

                    temps = grid[selectedCell.y][selectedCell.x].id;


                    grid[selectedCell.y][selectedCell.x].setTexture(textures[grid[row][col].id]);
                    grid[selectedCell.y][selectedCell.x].id = grid[row][col].id;

                    grid[row][col].setTexture(textures[temps]);
                    grid[row][col].id = temps;

                }

                // Reset selected cell
                selectedCell = sf::Vector2i(-1, -1);
            }



            else if (event.type == sf::Event::KeyPressed)
            {
           
                if (event.key.code == sf::Keyboard::Return)
            {
               
                selectedCell = cursorPosition;
                std::cout << "Enter is pressed " << selectedCell.y << " , " << selectedCell.x << "   |   " << row1 << " , " << col1 << std::endl;
              
            }
            
              if (event.key.code == sf::Keyboard::Up && cursorPosition.y > 0)
                {
                    --cursorPosition.y;
                    std::cout << "Up is pressed " << std::endl;
                    row1 = selectedCell.y - 1;
                    col1 = selectedCell.x;
                    if (col1 >= 0 && col1 < gridSize && row1 >= 0 && row1 < gridSize)
                    {
                        // Swap the positions
                        int tempId = grid[selectedCell.y][selectedCell.x].id;
                        grid[selectedCell.y][selectedCell.x].setTexture(textures[grid[row1][col1].id]);
                        grid[selectedCell.y][selectedCell.x].id = grid[row1][col1].id;
                        grid[row1][col1].setTexture(textures[tempId]);
                        grid[row1][col1].id = tempId;
                        selectedCell = sf::Vector2i(-1, -1);

                    }
                }
                else if (event.key.code == sf::Keyboard::Down && cursorPosition.y < gridSize - 1)
                {
                    ++cursorPosition.y;
                    std::cout << "Down is pressed " << std::endl;
                    row1 = selectedCell.y + 1;
                    col1 = selectedCell.x;
                    if (col1 >= 0 && col1 < gridSize && row1 >= 0 && row1 < gridSize)
                    {
                        // Swap the positions
                        int tempId = grid[selectedCell.y][selectedCell.x].id;
                        grid[selectedCell.y][selectedCell.x].setTexture(textures[grid[row1][col1].id]);
                        grid[selectedCell.y][selectedCell.x].id = grid[row1][col1].id;
                        grid[row1][col1].setTexture(textures[tempId]);
                        grid[row1][col1].id = tempId;
                        selectedCell = sf::Vector2i(-1, -1);

                    }
                }
                else if (event.key.code == sf::Keyboard::Left && cursorPosition.x > 0)
                {
                    --cursorPosition.x;
                    std::cout << "Left is pressed " << std::endl;

                    row1 = selectedCell.y;
                    col1 = selectedCell.x - 1;
                    if (col1 >= 0 && col1 < gridSize && row1 >= 0 && row1 < gridSize)
                    {
                        // Swap the positions
                        int tempId = grid[selectedCell.y][selectedCell.x].id;
                        grid[selectedCell.y][selectedCell.x].setTexture(textures[grid[row1][col1].id]);
                        grid[selectedCell.y][selectedCell.x].id = grid[row1][col1].id;
                        grid[row1][col1].setTexture(textures[tempId]);
                        grid[row1][col1].id = tempId;
                        selectedCell = sf::Vector2i(-1, -1);

                    }
                }
                else if (event.key.code == sf::Keyboard::Right && cursorPosition.x < gridSize - 1)
                {
                    ++cursorPosition.x;
                    std::cout << "Right is pressed " << std::endl;
                    row1 = selectedCell.y;
                    col1 = selectedCell.x + 1;
                    if (col1 >= 0 && col1 < gridSize && row1 >= 0 && row1 < gridSize)
                    {
                        // Swap the positions
                        int tempId = grid[selectedCell.y][selectedCell.x].id;
                        grid[selectedCell.y][selectedCell.x].setTexture(textures[grid[row1][col1].id]);
                        grid[selectedCell.y][selectedCell.x].id = grid[row1][col1].id;
                        grid[row1][col1].setTexture(textures[tempId]);
                        grid[row1][col1].id = tempId;
                        selectedCell = sf::Vector2i(-1, -1);

                    }
                }

            }
        }

        window.clear();

        // Draw the grid
        for (int i = 0; i < gridSize; ++i)
        {
            for (int j = 0; j < gridSize; ++j)
            {
                window.draw(grid[i][j]);
            }
        }

        // Draw box around the cell pointed by the cursor
        sf::RectangleShape cursorHighlight(sf::Vector2f(cellSize, cellSize));
        cursorHighlight.setFillColor(sf::Color::Transparent);
        cursorHighlight.setOutlineThickness(2.f);
        cursorHighlight.setOutlineColor(sf::Color::Blue);
        cursorHighlight.setPosition(sf::Vector2f(cursorPosition.x * cellSize, cursorPosition.y * cellSize));
        window.draw(cursorHighlight);

        window.display();
    }

    return 0;
}
