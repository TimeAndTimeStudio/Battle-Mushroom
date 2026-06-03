using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

namespace CoreMain;

public class Game : Scene
{
    private Texture2D color1 = null;
    private Texture2D color2 = null;
    private Texture2D color3 = null;
    private Texture2D color4 = null;

    private Texture2D coin_icon;

    private Texture2D[] background = new Texture2D[8];
    private int background_load = 0;
    private float background_load_time = 0;

    private Color rgb_color1;
    private Color rgb_color2;
    private Color rgb_color3;
    private Color rgb_color4;

    private Texture2D shop_icon;

    private float width;
    private float height;

    private float fontheight;

    public override void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice)
    {
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

        shop_icon = _content.Load<Texture2D>("Content/Icon/shop_icon");
        coin_icon = _content.Load<Texture2D>("Content/Icon/coin_game_icon");

        width = graphicsDevice.Viewport.Width;
        height = graphicsDevice.Viewport.Height;

        for (int i = 0; i < Data.backgroundfilename.Length; i++)
        {
            background[i] = _content.Load<Texture2D>($"Content/Background/{Data.backgroundfilename[i]}");
        }

        Data.ui_button_exit_pos = new Rectangle((int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 2f),(int)(height / 8f));
        Data.ui_button_inventory_pos = new Rectangle((int)(height / 16f),(int)height - (int)(height / 8f * 2) - (int)(height / 24f * 2f),(int)(height / 2f),(int)(height / 8f));
        Data.ui_button_play_pos = new Rectangle((int)(height / 16f),(int)height - (int)(height / 8f * 3) - (int)(height / 24f * 2.5f),(int)(height / 2f),(int)(height / 8f));
        Data.ui_button_shop_pos = new Rectangle((int)(width) - (int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        background_load_time += (float)gameTime.ElapsedGameTime.TotalSeconds;

        if (background_load_time >= 0.1f)
        {
            background_load_time -= 0.1f;
            background_load += 1;

            if (background_load > 7)
            {
                background_load = 0;
            }
        }

        foreach (var t in Data.touch)
        {
            switch (t.State)
            {
                case TouchLocationState.Pressed:
                    if (Data.ui_button_exit_pos.Contains(t.Position))
                    {
                        Data.exit = true;
                        break;
                    }
                    if (Data.ui_button_inventory_pos.Contains(t.Position))
                    {
                        Data.sceneloaduser(new Inventory());
                        break;
                    }
                    if (Data.ui_button_play_pos.Contains(t.Position))
                    {
                        Data.sceneloaduser(new Level());
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
        _spriteBatch.Draw(background[background_load],Vector2.Zero,null,new Color(255,255,255),0,Vector2.Zero,MathHelper.Max(height / 45f,width / 100f),SpriteEffects.None,0);
    
        _spriteBatch.Draw(color1,new Rectangle(0,0,(int)width,(int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)), new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,BattleMushroom.Language.TimeAndTime.Game_Name,new Vector2((int)(height / 16),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(coin_icon,new Vector2(width - (int)(height / 16) - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) - (Data.Tiny5.MeasureString("  0000").X * (height / 12f / 96f) / 1.5f),((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 2), null, new Color(255,255,255),0,Vector2.Zero,(((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 20f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,Data.coin.ToString(),new Vector2(width - (int)(height / 16) - (Data.Tiny5.MeasureString("0000").X * (height / 12f / 96f) / 1.5f),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);

        _spriteBatch.Draw(color1,Data.ui_button_exit_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.Exit,new Vector2((int)(height / 16f) + (int)(height / 2f / 2f) - (ThaiTextRenderer.MeasureString(Data.Tiny5, BattleMushroom.Language.TimeAndTime.Exit).X * (height / 12f / 96f) / 1.5f / 2f),(int)height - (int)(height / 8f / 2f) - (int)(height / 16f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 2f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,Data.ui_button_inventory_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.Inventory,new Vector2((int)(height / 16f) + (int)(height / 2f / 2f) - (ThaiTextRenderer.MeasureString(Data.Tiny5, BattleMushroom.Language.TimeAndTime.Inventory).X * (height / 12f / 96f) / 1.5f / 2f),(int)height - (int)(height / 8f / 2f) - (int)(height / 8f) - (int)(height / 24f * 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 2f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,Data.ui_button_play_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.Play,new Vector2((int)(height / 16f) + (int)(height / 2f / 2f) - (ThaiTextRenderer.MeasureString(Data.Tiny5, BattleMushroom.Language.TimeAndTime.Play).X * (height / 12f / 96f) / 1.5f / 2f),(int)height - (int)(height / 8f / 2f) - (int)(height / 8f * 2) - (int)(height / 24f * 2.5f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 2f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,Data.ui_button_shop_pos,new Color(255,255,255));
        _spriteBatch.Draw(shop_icon,new Vector2(Data.ui_button_shop_pos.X,Data.ui_button_shop_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        _spriteBatch.End();
    }
}
