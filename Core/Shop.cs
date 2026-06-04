using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

namespace CoreMain;

public class Shop : Scene
{
    private Texture2D color1 = null;
    private Texture2D color2 = null;
    private Texture2D color3 = null;
    private Texture2D color4 = null;

    private Texture2D coin_icon;
    private Texture2D background;

    private Color rgb_color1;
    private Color rgb_color2;
    private Color rgb_color3;
    private Color rgb_color4;

    private float width;
    private float height;

    public Rectangle ui_button_close_pos;
    public Rectangle ui_button_random_pos;

    private float fontheight;

    private Texture2D close_icon;

    private float time;
    private bool checkrandom = false;

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

        width = graphicsDevice.Viewport.Width;
        height = graphicsDevice.Viewport.Height;

        ui_button_close_pos = new Rectangle((int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));
        ui_button_random_pos = new Rectangle((int)(width / 2f) - (int)(height / 2f / 2f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 2f),(int)(height / 8f));

        close_icon = _content.Load<Texture2D>("Content/Icon/close_icon");
        coin_icon = _content.Load<Texture2D>("Content/Icon/coin_game_icon");
        background = _content.Load<Texture2D>("Content/Shop/1/shop-1");

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        if (checkrandom)
        {
            time += (float)gameTime.ElapsedGameTime.TotalSeconds;
            if (time >= 5)
            {
                checkrandom = false;
                time = 0;
                background = _content.Load<Texture2D>("Content/Shop/1/shop-1");
            }
        }
        foreach (var t in Data.touch)
        {
            switch (t.State)
            {
                case TouchLocationState.Pressed:
                    if (ui_button_close_pos.Contains(t.Position))
                    {
                        Data.sceneloaduser(new Game());
                        break;
                    }
                    if (ui_button_random_pos.Contains(t.Position))
                    {
                        if (Data.coin >= 100)
                        {
                            Data.coin -= 100;
                            int random = random_player();

                            background = _content.Load<Texture2D>("Content/Shop/1/shop-1-random-2");


                            if (random == 0)
                            {
                                background = _content.Load<Texture2D>("Content/Shop/1/shop-1-random-1");
                                Data_Player.player_list[Data.shop_random[0][0]] = true;
                            }
                            // if (random == 1)
                            // {
                            //     Data_Player.player_list[Data.shop_random[0][1]] = true;
                            // }
                            // if (random == 2)
                            // {
                            //     Data_Player.player_list[Data.shop_random[0][2]] = true;
                            // }
                            // if (random == 3)
                            // {
                            //     Data_Player.player_list[Data.shop_random[0][3]] = true;
                            // }
                            // if (random == 4)
                            // {
                            //     Data_Player.player_list[Data.shop_random[0][4]] = true;
                            // }
                            checkrandom = true;
                            time = 0;
                            Data.save();
                        }
                        break;
                    }
                    break;
            }
        }
        
    }
    public int random_player()
    {
        Random random = new Random();
        int value = random.Next(0,100);

        if (value < 40) return 0;
        if (value < 70) return 1;
        if (value < 85) return 2;
        if (value < 95) return 3;
        return 4;
    }
    public override void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice)
    {
        graphicsDevice.Clear(new Color(255,240,190));
        
        _spriteBatch.Begin(samplerState: SamplerState.PointClamp);
        _spriteBatch.Draw(background,new Vector2(width / 2f - (100 * MathHelper.Max(height / 45f,width / 100f) / 2f),0),null,new Color(255,255,255),0,Vector2.Zero,MathHelper.Max(height / 45f,width / 100f),SpriteEffects.None,0);
        _spriteBatch.Draw(color1,new Rectangle(0,0,(int)width,(int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)), new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,BattleMushroom.Language.TimeAndTime.Game_Name,new Vector2((int)(height / 16),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(coin_icon,new Vector2(width - (int)(height / 16) - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) - (Data.Tiny5.MeasureString("  0000").X * (height / 12f / 96f) / 1.5f),((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 2), null, new Color(255,255,255),0,Vector2.Zero,(((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 20f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,Data.coin.ToString(),new Vector2(width - (int)(height / 16) - (Data.Tiny5.MeasureString("0000").X * (height / 12f / 96f) / 1.5f),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        _spriteBatch.Draw(color1,ui_button_random_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.Random,new Vector2((int)(width / 2f) - (ThaiTextRenderer.MeasureString(Data.Tiny5, BattleMushroom.Language.TimeAndTime.Random).X * (height / 12f / 96f) / 1.5f / 2f),(int)height - (int)(height / 8f / 2f) - (int)(height / 16f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 2f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,ui_button_close_pos,new Color(255,255,255));
        _spriteBatch.Draw(close_icon,new Vector2(ui_button_close_pos.X,ui_button_close_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        _spriteBatch.End();
    }
}
