using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace CoreMain;

public class GameLoading : Scene
{
    private Texture2D loadingpng;
    private int loading = 0;
    private bool loadingend;
    private float gametime;
    public override void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice)
    {
        loadingpng = _content.Load<Texture2D>("Content/Png/loading");

        Data.checksceneload = true;
    }
    public void LoadingEnd()
    {
        if (loading <= 0)
        {
            Data.sceneloaduser(new Game());

            gametime = 0;
        } else
        {
            loading -= 5;
        }
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        gametime += (float)gameTime.ElapsedGameTime.TotalSeconds;

        if (gametime >= 0.05f)
        {
            if (gametime >= 5f && loadingend)
            {
                LoadingEnd();
            }
            if (loading >= 255 && !loadingend)
            {
                gametime -= 0.05f;
                loadingend = true;
            } else if (!loadingend)
            {
                gametime -= 0.05f;
                loading += 5;
            }
            
        }
    }
    public override void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice)
    {
        graphicsDevice.Clear(new Color(255,240,190));
        
       _spriteBatch.Begin(samplerState: SamplerState.PointClamp, blendState: BlendState.NonPremultiplied);

        _spriteBatch.Draw(loadingpng,new Vector2(graphicsDevice.Viewport.Width / 60f * -1,graphicsDevice.Viewport.Height / 2 - graphicsDevice.Viewport.Width / 60f * 20 / 2),null,new Color(255,255,255,loading),0f,Vector2.Zero,graphicsDevice.Viewport.Width / 60f,SpriteEffects.None,0);

       _spriteBatch.End();
    }
}
