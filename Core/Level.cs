using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Media;

namespace CoreMain;

public class Level : Scene
{
    private Texture2D color1 = null;
    private Texture2D color2 = null;
    private Texture2D color3 = null;
    private Texture2D color4 = null;

    private Color rgb_color1;
    private Color rgb_color2;
    private Color rgb_color3;
    private Color rgb_color4;

    private float width;
    private float height;

    private float fontheight;

    public Rectangle ui_button_close_pos;

    private Texture2D close_icon;
    private Texture2D lock_icon;

    private float x;
    private SystemCore touchsystem;

    public override void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice)
    {
        Data.level_unlock[0] = true;

        rgb_color1 = new Color(255,154,134);
        rgb_color2 = new Color(255,179,153);
        rgb_color3 = new Color(255,214,166);
        rgb_color4 = new Color(255,240,190);

        color1 = new Texture2D(graphicsDevice,1,1);
        color1.SetData(new Color[] {rgb_color1});

        color2 = new Texture2D(graphicsDevice,1,1);
        color2.SetData(new Color[] {rgb_color2});

        color3 = new Texture2D(graphicsDevice,1,1);
        color3.SetData(new Color[] {rgb_color3});

        color4 = new Texture2D(graphicsDevice,1,1);
        color4.SetData(new Color[] {rgb_color4});

        width = graphicsDevice.Viewport.Width;
        height = graphicsDevice.Viewport.Height;

        ui_button_close_pos = new Rectangle((int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));

        close_icon = _content.Load<Texture2D>("Content/Icon/close_icon");
        lock_icon = _content.Load<Texture2D>("Content/Icon/lock_icon");

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;
        touchsystem = new BattleMushroom.TouchSystem();

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        touchsystem.Update(gameTime);
        x = touchsystem.returnvalue();

        foreach (var t in Data.touch)
        {
            switch (t.State)
            {
                case TouchLocationState.Pressed:
                    for (int i = 0; i < Data.level_button_pos.Length; i++)
                    {   
                        if (!Data.level_unlock[i]) continue;
                        if (Data.level_button_pos[i].Contains(t.Position))
                        {
                            Data.sceneloaduser(new Level_Game_Main(i + 1));
                            MediaPlayer.Stop();
                            break;
                        }
                    }
                    if (ui_button_close_pos.Contains(t.Position))
                    {
                        Data.sceneloaduser(new Game());
                        break;
                    }
                    break;
            }
        }
    }
    public override void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice)
    {
        graphicsDevice.Clear(new Color(255,240,190));
        
        _spriteBatch.Begin(samplerState: SamplerState.PointClamp);
        _spriteBatch.Draw(color1,new Rectangle(0,0,(int)width,(int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)), new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,BattleMushroom.Language.TimeAndTime.Game_Name,new Vector2((int)(height / 16),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        for (int i = 0; i < Data.level_button_pos.Length; i++)
        {   
            Data.level_button_pos[i] = new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f));
            _spriteBatch.Draw(color1,new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f)), new Color(255,255,255));
            _spriteBatch.Draw(color3,new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f))),(int)(height / 3.5f),(int)(height / 3.5f)), new Color(255,255,255));


            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"ATK + " + (i / 10),new Vector2((int)x + (int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f)))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"HP + " + (i / 10 * 2),new Vector2((int)x + (int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.LEVEL_LOCK,new Vector2((int)x + (int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 2f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,Data_Level.LEVEL_LOCK[i].ToString(),new Vector2((int)x + (int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 3f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            if (!Data.level_unlock[i])
            {
                _spriteBatch.Draw(lock_icon,new Vector2((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 2f * i) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f)))), null, new Color(255,255,255),0,Vector2.Zero,(height / 3.5f) / 20f,SpriteEffects.None,0);
                continue;
            } 
            if (i + 1 < 10)
            {
                ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5, $"{i + 1}",new Vector2((int)x + (int)(height / 3.5f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,$"{i + 1}").X * (height / 12f / 96f) * 2f / 2.5f + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 2f * i) + (int)(height / 3f * i) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f + (int)(height / 3.5f / 2f) - fontheight * (height / 12f / 96f) * 2f / 1.75f / 2f - ((int)(height / 3.5f / 2f)))-(int)(fontheight * (height / 12f / 96f) * 2f / 4.5f)), new Color(255,255,255), 0, Vector2.Zero,(height / 12f / 96f) * 2f,SpriteEffects.None,0);
            } else
            {
                ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5, $"{i + 1}",new Vector2((int)x + (int)(height / 3.5f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,$"{i + 1}").X * (height / 12f / 96f) * 2f / 2.25f + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 2f * i) + (int)(height / 3f * i) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f + (int)(height / 3.5f / 2f) - fontheight * (height / 12f / 96f) * 2f / 1.75f / 2f - ((int)(height / 3.5f / 2f)))-(int)(fontheight * (height / 12f / 96f) * 2f / 4.5f)), new Color(255,255,255), 0, Vector2.Zero,(height / 12f / 96f) * 2f,SpriteEffects.None,0);
            }
            
        }

        _spriteBatch.Draw(color1,ui_button_close_pos,new Color(255,255,255));
        _spriteBatch.Draw(close_icon,new Vector2(ui_button_close_pos.X,ui_button_close_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        _spriteBatch.End();
    }
}
