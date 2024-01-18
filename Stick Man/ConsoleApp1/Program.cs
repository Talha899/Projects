using System;
using System.IO;
using System.Diagnostics;
using System.Reflection.Emit;
using SFML.Graphics;
using SFML.System;
using SFML.Window;
using System.Threading;

namespace SFML_Test
{
    // The main class of the program
    static class Program
    {
        // Constants defining the size of blocks and the game grid
        const int BlockWidth = 80;
        const int BlockHeight = 80;
        const int Rows = 3;
        const int Columns = 10;

        // Paths to image files
        static readonly string ExecutableDirectory = AppDomain.CurrentDomain.BaseDirectory;

        static string ManImagePath => Path.Combine(ExecutableDirectory, "images", "man.png");
        static string Trap1ImagePath => Path.Combine(ExecutableDirectory, "images", "trap1.png");
        static string Trap2ImagePath => Path.Combine(ExecutableDirectory, "images", "trap2.png");
        static string Trap3ImagePath => Path.Combine(ExecutableDirectory, "images", "trap3.png");
        static string BombImagePath => Path.Combine(ExecutableDirectory, "images", "bomb.png");
        static string SoldierImagePath => Path.Combine(ExecutableDirectory, "images", "soldier.png");
        // Path to the font file
        const string FontPath = "C:/Windows/Fonts/arial.ttf";

        // Path to the file storing high score
        static string HighScoreFilePath => Path.Combine(ExecutableDirectory, "images", "highscore.txt");

        // Variables to track the position of the man
        static int manRow = 0;
        static int manColumn = 0; // Initial position on the rightmost column

        // Clock to measure time
        static Clock timer = new Clock();
        static float totalTime = 0f; // Variable to keep track of total time
        static float totalTime1 = 0f; // Variable to keep track of total time

        // Variables for game state
        static int score = 0;
        static int lives = 3;
        static int level = 1;
        static int pause = 0;
        static int highScore = 0;
        static int startgame = 0;

        // SFML objects for graphics
        static Font font;
        static Text timerText;
        static Text scoreText;
        static Text highscoreText;
        static Text livesText;
        static Text levelText;
        static Text gameOverText;
        static Text pauseText;
        static Text StartText;

        // 2D array to store the values of each block
        static int[,] blockValues;

        // Event handler for window close
        static void OnClose(object sender, EventArgs e)
        {
            RenderWindow window = (RenderWindow)sender;
            window.Close();
        }

        // Main entry point of the program
        static void Main()
        {
            // Create SFML window
            RenderWindow app = new RenderWindow(new VideoMode(800, 700), "Stick Game!");
            app.Closed += new EventHandler(OnClose);
            app.KeyPressed += OnKeyPressed;

            // Load font
            font = new Font(FontPath);

            // Initialize SFML Text objects
            timerText = new Text("Time: 0", font, 30)
            {
                Position = new Vector2f(10, 300),
                FillColor = Color.White
            };

            scoreText = new Text("Score: 0", font, 30)
            {
                Position = new Vector2f(10, 400),
                FillColor = Color.White
            };
            highscoreText = new Text($"Highscore: {score}", font, 30)
            {
                Position = new Vector2f(10, 300),
                FillColor = Color.White
            };

            livesText = new Text("Lives: 3", font, 30)
            {
                Position = new Vector2f(10, 500),
                FillColor = Color.White
            };

            levelText = new Text("Level: 1", font, 30)
            {
                Position = new Vector2f(10, 600),
                FillColor = Color.White
            };

            gameOverText = new Text("Game Over!", font, 60)
            {
                Position = new Vector2f(200, 250),
                FillColor = Color.Red
            };
            pauseText = new Text("Pause", font, 60)
            {
                Position = new Vector2f(200, 250),
                FillColor = Color.Red
            };
            StartText = new Text("To Start the game press Space", font, 55)
            {
                Position = new Vector2f(0, 250),
                FillColor = Color.Blue
            };

            // Initialize the array to represent the game grid
            blockValues = new int[Rows, Columns];
            InitializeBlockValues();

            // Load textures for blocks
            Texture[,] blockTextures = LoadTextures();

            // Create Sprite objects for blocks
            Sprite[,] blocks = new Sprite[Rows, Columns];
            InitializeBlocks(blocks, blockTextures, app);

            // Load textures for game objects
            Texture manTexture = new Texture(ManImagePath);
            Sprite man = new Sprite(manTexture);
            man.Scale = new Vector2f((float)BlockWidth / manTexture.Size.X * 0.7f, (float)BlockHeight / manTexture.Size.Y * 0.7f);

            Texture trap1Texture = new Texture(Trap1ImagePath);
            Sprite trap1 = new Sprite(trap1Texture);
            trap1.Scale = new Vector2f((float)BlockWidth / trap1Texture.Size.X * 0.7f, (float)BlockHeight / trap1Texture.Size.Y * 0.7f);

            Texture trap2Texture = new Texture(Trap2ImagePath);
            Sprite trap2 = new Sprite(trap2Texture);
            trap2.Scale = new Vector2f((float)BlockWidth / trap2Texture.Size.X * 0.7f, (float)BlockHeight / trap2Texture.Size.Y * 0.7f);

            Texture trap3Texture = new Texture(Trap3ImagePath);
            Sprite trap3 = new Sprite(trap3Texture);
            trap3.Scale = new Vector2f((float)BlockWidth / trap3Texture.Size.X * 0.7f, (float)BlockHeight / trap3Texture.Size.Y * 0.7f);

            Texture bombTexture = new Texture(BombImagePath);
            Sprite bomb = new Sprite(bombTexture);
            bomb.Scale = new Vector2f((float)BlockWidth / bombTexture.Size.X * 0.7f, (float)BlockHeight / bombTexture.Size.Y * 0.7f);

            Texture soldierTexture = new Texture(SoldierImagePath);
            Sprite soldier = new Sprite(soldierTexture);
            soldier.Scale = new Vector2f((float)BlockWidth / soldierTexture.Size.X * 0.7f, (float)BlockHeight / soldierTexture.Size.Y * 0.7f);

            // Main game loop
            while (app.IsOpen)
            {
                app.DispatchEvents();
                app.Clear();

                // Check if the game has started
                if (startgame == 1)
                {
                    // Check if the game is not paused
                    if (pause == 0)
                    {
                        // Check if the player has remaining lives
                        if (lives > 0)
                        {
                            // Draw the game blocks and man
                            DrawBlocks(app, blocks);
                            DrawMan(app, man);

                            // Draw obstacles based on the current level
                            if (level == 1)
                            {
                                if (blockValues[manRow, manColumn] == 1)
                                    Drawtrap1(app, trap1);
                                else if (blockValues[manRow, manColumn] == 2)
                                    Drawtrap2(app, trap2);
                                else if (blockValues[manRow, manColumn] == 3)
                                    Drawtrap3(app, trap3);

                                score = score + 1;
                            }
                            else if (level == 2)
                            {
                                Drawbomb(app, bomb);

                                score = score + 1;
                            }
                            else if (level == 3)
                            {
                                Drawsoldier(app, soldier);

                                score = score + 1;
                            }

                            // Draw game information texts
                            DrawTexts(app);

                            // Update the timer
                            float deltaTime = timer.Restart().AsSeconds();
                            totalTime += deltaTime;

                            // Update the timer display
                            totalTime1 += deltaTime;
                            UpdateTimer();

                            // Update bomb positions in Level 2 after 3 seconds
                            if (level == 2 && totalTime1 > 3.0f)
                            {
                                InitializebombValues();
                                totalTime1 = 0f;
                                if (blockValues[manRow, manColumn] == 5)
                                {
                                    lives = lives - 1;
                                }
                            }

                            // Update soldier positions in Level 3 after 3 seconds
                            if (level == 3 && totalTime1 > 3.0f)
                            {
                                InitializesoldierValues();
                                totalTime1 = 0f;
                                if (blockValues[manRow, manColumn] == 6)
                                {
                                    lives = lives - 1;
                                }
                            }

                            // Move to Level 2 when reaching the rightmost column in Level 1
                            if (manColumn == Columns - 1 && level == 1)
                            {
                                level = 2;
                                levelText.DisplayedString = $"Level: {level}";
                                manColumn = 0;
                                InitializebombValues();
                                totalTime1 = 0f;
                                lives = lives + 1;
                            }

                            // Move to Level 3 when reaching the rightmost column in Level 2
                            if (manColumn == Columns - 1 && level == 2)
                            {
                                level = 3;
                                levelText.DisplayedString = $"Level: {level}";
                                manColumn = 0;
                                InitializesoldierValues();
                                totalTime1 = 0f;
                                lives = lives + 1;
                            }
                        }
                        else
                        {
                            // Handle high score when the game is over
                            HandleHighScore(score);

                            // Display "Game Over"
                            app.Draw(gameOverText);
                        }
                    }
                    else
                    {
                        // Display "Pause"
                        app.Draw(pauseText);
                    }
                }
                else
                {
                    // Display instructions to start the game
                    app.Draw(StartText);
                }
                app.Display();
            }
        }

        // Handle updating and checking the high score
        static void HandleHighScore(int currentScore)
        {
            LoadHighScore();

            if (currentScore > highScore)
            {
                // Update the high score if the current score is greater
                UpdateHighScore(currentScore);
            }
        }

        // Load the high score from the file
        static void LoadHighScore()
        {
            if (File.Exists(HighScoreFilePath))
            {
                // Read the high score from the file
                string content = File.ReadAllText(HighScoreFilePath);
                if (int.TryParse(content, out highScore))
                {
                    // Successfully loaded high score
                }
            }
        }

        // Update the high score in the file
        static void UpdateHighScore(int newHighScore)
        {
            File.WriteAllText(HighScoreFilePath, newHighScore.ToString());
            highScore = newHighScore;
        }

        // Handle key press events (e.g., arrow keys and space bar)
        static void OnKeyPressed(object sender, KeyEventArgs e)
        {
            switch (e.Code)
            {
                case Keyboard.Key.Left:
                    if (manColumn > 0 && pause == 0)
                        manColumn--;
                    break;
                case Keyboard.Key.Right:
                    if (manColumn < Columns - 1 && pause == 0)
                        manColumn++;
                    break;
                case Keyboard.Key.Up:
                    if (manRow > 0 && pause == 0)
                        manRow--;
                    break;
                case Keyboard.Key.Down:
                    if (manRow < Rows - 1 && pause == 0)
                        manRow++;
                    break;
                case Keyboard.Key.P:
                    // Toggle pause state
                    pause = (pause == 0) ? 1 : 0;
                    break;

                case Keyboard.Key.Space:
                    if (startgame == 0)
                    {
                        startgame = 1;
                    }
                    break;
            }

            // Check if the man is on a position where value is 1, 2, 3, or 5
            int blockValue = blockValues[manRow, manColumn];
            if ((level == 1 && blockValue >= 1 && blockValue <= 3) || (level == 2 && blockValue == 5) || (level == 3 && blockValue == 6))
            {
                lives--;

                if (lives <= 0)
                {
                    lives = 0;
                }
            }
        }

        // Initialize values of game blocks to represent traps
        static void InitializeBlockValues()
        {
            Random random = new Random();

            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    blockValues[i, j] = 4;
                }
            }

            // Set values for random trap positions
            for (int i = 0; i < 5; i++)
            {
                blockValues[random.Next(0, 3), random.Next(0, 10)] = random.Next(1, 4);
            }
        }
        static void InitializebombValues()
        {
            Random random = new Random();

            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    blockValues[i, j] = 4; // Assign 5 for Level 2
                }
            }
            int bombsToPlace = 5;
            while (bombsToPlace > 0)
            {
                int l = random.Next(0, 3);
                int k = random.Next(0, 10);

                // Check if the position is empty (4)
                if (blockValues[l, k] == 4)
                {
                    blockValues[l, k] = 5; // Assign 5 on random positions for Level 2
                    bombsToPlace--;
                    Console.WriteLine($"Position [{l}, {k}]  {blockValues[l, k]}");

                }
            }
        }

        static void InitializesoldierValues()
        {
            Random random = new Random();

            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    blockValues[i, j] = 4; // Assign 5 for Level 2
                }
            }
            int soldierToPlace = 5;
            while (soldierToPlace > 0)
            {
                int l = random.Next(0, 3);
                int k = random.Next(0, 10);

                // Check if the position is empty (4)
                if (blockValues[l, k] == 4)
                {
                    blockValues[l, k] = 6; // Assign 6 on random positions for Level 2
                    soldierToPlace--;
                    Console.WriteLine($"Soldier Position [{l}, {k}]  {blockValues[l, k]}");
                }
            }
        }
        static Texture[,] LoadTextures()
        {
            Texture[,] textures = new Texture[Rows, Columns];

            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    textures[i, j] = new Texture($"C:/Users/talha/source/repos/ConsoleApp1/ConsoleApp1/images/1.png");
                }
            }

            return textures;
        }

        static void InitializeBlocks(Sprite[,] blocks, Texture[,] blockTextures, RenderWindow window)
        {
            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    blocks[i, j] = new Sprite(blockTextures[i, j])
                    {
                        Position = new Vector2f(j * BlockWidth, i * BlockHeight),
                        Origin = new Vector2f(BlockWidth / 2, BlockHeight / 2),
                        Scale = new Vector2f((float)BlockWidth / blockTextures[i, j].Size.X, (float)BlockHeight / blockTextures[i, j].Size.Y)
                    };
                }
            }
        }

        static void DrawBlocks(RenderWindow window, Sprite[,] blocks)
        {
            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    window.Draw(blocks[i, j]);
                }
            }
        }

        static void DrawMan(RenderWindow window, Sprite man)
        {
            man.Position = new Vector2f(manColumn * BlockWidth, manRow * BlockHeight);
            window.Draw(man);
        }

        static void Drawtrap1(RenderWindow window, Sprite trap1)
        {
            trap1.Position = new Vector2f(manColumn * BlockWidth, manRow * BlockHeight);
            window.Draw(trap1);
            if (score > 0)
                score = 0;
        }

        static void Drawtrap2(RenderWindow window, Sprite trap2)
        {
            trap2.Position = new Vector2f(manColumn * BlockWidth, manRow * BlockHeight);
            window.Draw(trap2);
            if (score > 0)
                score = 0;
        }

        static void Drawtrap3(RenderWindow window, Sprite trap3)
        {
            trap3.Position = new Vector2f(manColumn * BlockWidth, manRow * BlockHeight);
            window.Draw(trap3);
            if (score > 0)
                score = 0;
        }

        static void Drawbomb(RenderWindow window, Sprite bomb)
        {
            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    if (blockValues[i, j] == 5)
                    {
                        bomb.Position = new Vector2f(j * BlockWidth, i * BlockHeight);
                        window.Draw(bomb);
                    }
                }
            }

        }

        static void Drawsoldier(RenderWindow window, Sprite soldier)
        {

            for (int i = 0; i < Rows; i++)
            {
                for (int j = 0; j < Columns; j++)
                {
                    if (blockValues[i, j] == 6)
                    {
                        soldier.Position = new Vector2f(j * BlockWidth, i * BlockHeight);
                        window.Draw(soldier);
                    }
                }
            }
        }

        static void DrawTexts(RenderWindow window)
        {
            window.Draw(timerText);
            window.Draw(scoreText);
            window.Draw(livesText);
            window.Draw(levelText);
        }

        static void UpdateTimer()
        {
            // Update the timer text based on the total elapsed time
            timerText.DisplayedString = $"Time: {Math.Floor(totalTime)}";
            scoreText.DisplayedString = $"Score: {score}";
            livesText.DisplayedString = $"Lives: {lives}";
            levelText.DisplayedString = $"Level: {level}";
        }
    }
}
