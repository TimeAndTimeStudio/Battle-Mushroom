using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace CoreMain;

public abstract class Scene
{
    public abstract void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice);
    public abstract void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content);
    public abstract void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice);
}

public abstract class Enemy
{
    public abstract void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice);
    public abstract void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content, CoreMain.Level_Game_Main main);
    public abstract void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice, float x);
}

public abstract class Player
{
    public abstract void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice);
    public abstract void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content, CoreMain.Level_Game_Main main);
    public abstract void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice, float x);
}