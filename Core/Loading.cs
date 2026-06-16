using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace CoreMain;

public class GameLoading : Scene
{
    private Texture2D[] loadingpng = new Texture2D[20];
    private int loading = 0;
    private bool loadingend;
    private float gametime;
    private int play = 0;
    public override void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice)
    {
        for (int i = 0; i < 20; i++)
        {
            loadingpng[i] = _content.Load<Texture2D>($"Content/Png/Loading/{i + 1}");
        }
        

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
            if (gametime >= 2f && loadingend)
            {
                LoadingEnd();
            }
            if (play > 18 && !loadingend)
            {
                gametime -= 0.05f;
                loadingend = true;
            } else if (!loadingend && gametime >= 0.2f && play < 19)
            {
                loading = 255;
                gametime -= 0.2f;
                play += 1;
            }
            
        }
    }
    public override void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice)
    {
        graphicsDevice.Clear(new Color(0,0,0));
        
       _spriteBatch.Begin(samplerState: SamplerState.PointClamp, blendState: BlendState.NonPremultiplied);

        float scale = graphicsDevice.Viewport.Width / 400f / 1.5f;

        float width = 400f * scale;
        float height = 180f * scale;

        Vector2 pos = new Vector2(
            (graphicsDevice.Viewport.Width - width) / 2f,
            (graphicsDevice.Viewport.Height - height) / 2f
        );

        _spriteBatch.Draw(
            loadingpng[play],
            pos,
            null,
            new Color(255, 255, 255, loading),
            0f,
            Vector2.Zero,
            scale,
            SpriteEffects.None,
            0f
        );

       _spriteBatch.End();
    }
}
