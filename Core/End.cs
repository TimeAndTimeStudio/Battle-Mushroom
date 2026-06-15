using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

namespace CoreMain;

public class ENDGAME : Scene
{
    private Texture2D color1 = null;
    private Texture2D color2 = null;
    private Texture2D color3 = null;
    private Texture2D color4 = null;

    private Texture2D coin_icon;

    private Color rgb_color1;
    private Color rgb_color2;
    private Color rgb_color3;
    private Color rgb_color4;

    private float width;
    private float height;

    private float fontheight;

    private Texture2D close_icon;
    public Rectangle ui_button_close_pos;
    private Texture2D background;

    private Texture2D[] icon_load = new Texture2D[Data_Player.player_list.Length];
    private Texture2D[] icon_inventory_load = new Texture2D[5];

    private string fileload;
    private int coin;

    public ENDGAME(bool end,int c)
    {
        if (end)
        {
            fileload = "Content/Png/Win/1";
        } else
        {
            fileload = "Content/Png/Lose/1";
        }

        coin = c;
    }

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

        for (int i = 0; i < Data.inventory_player.Length; i++)
        {
            if (Data.inventory_player[i] == null) continue;
            icon_inventory_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[Data.inventory_player[i].Value]}/player-1-icon");
        }

        ui_button_close_pos = new Rectangle((int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));

        close_icon = _content.Load<Texture2D>("Content/Icon/close_icon");
        coin_icon = _content.Load<Texture2D>("Content/Icon/coin_game_icon");

        Data.ui_button_player_1_pos = new Rectangle((int)(width) - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f / 2f) + (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_2_pos = new Rectangle((int)(width) - (int)(height / 6f * 2f) - (int)(height / 16f / 2f) - (int)(height / 16f),(int)(height / 6f / 2f) + (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_3_pos = new Rectangle((int)(width) - (int)(height / 6f * 3f) - (int)(height / 16f / 2f * 2f) - (int)(height / 16f),(int)(height / 6f / 2f) + (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_4_pos = new Rectangle((int)(width) - (int)(height / 6f * 4f) - (int)(height / 16f / 2f * 3f) - (int)(height / 16f),(int)(height / 6f / 2f) + (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_5_pos = new Rectangle((int)(width) - (int)(height / 6f * 5f) - (int)(height / 16f / 2f * 4f) - (int)(height / 16f),(int)(height / 6f / 2f) + (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));

        background = _content.Load<Texture2D>(fileload);

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        foreach (var t in Data.touch)
        {
            switch (t.State)
            {
                case TouchLocationState.Pressed:
                    if (ui_button_close_pos.Contains(t.Position))
                    {
                        Data.sceneloaduser(new Level());
                    }
                    break;
            }
        }
        
    }
    public override void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice)
    {
        graphicsDevice.Clear(new Color(255,240,190));
        
        _spriteBatch.Begin(samplerState: SamplerState.PointClamp);
        _spriteBatch.Draw(background,new Vector2(width / 2f - (100 * MathHelper.Max(height / 45f,width / 100f) / 2f),0),null,new Color(255,255,255),0,Vector2.Zero,MathHelper.Max(height / 45f,width / 100f),SpriteEffects.None,0);
        _spriteBatch.Draw(color1,new Rectangle(0,0,(int)width,(int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)), new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,BattleMushroom.Language.TimeAndTime.Game_Name,new Vector2((int)(height / 16),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(coin_icon,new Vector2(width - (int)(height / 6f) - (int)(height / 16) - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) - (Data.Tiny5.MeasureString("  000000").X * (height / 12f / 96f) / 1.5f),((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 2), null, new Color(255,255,255),0,Vector2.Zero,(((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 20f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,$"{Data.coin - coin} + {coin}",new Vector2(width - (int)(height / 6f) - (int)(height / 16) - (Data.Tiny5.MeasureString("000000").X * (height / 12f / 96f) / 1.5f),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);


        _spriteBatch.Draw(color1,ui_button_close_pos,new Color(255,255,255));
        _spriteBatch.Draw(close_icon,new Vector2(ui_button_close_pos.X,ui_button_close_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,Data.ui_button_player_1_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[0] != null)
        {
            if (coin > 0)
            {
                ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"Level + 1",new Vector2((int)(width) - (int)(height / 6f) - (int)(height / 16f) + (int)(height / 6f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,"Level + 1").X * (height / 12f / 96f) / 3.5f / 2f,(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 3.5f,SpriteEffects.None,0);
            }
            
            _spriteBatch.Draw(icon_inventory_load[0],new Vector2((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / Data_Player.player_size_icon[Data.inventory_player[0].Value],SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_2_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[1] != null)
        {
            if (coin > 0)
            {
                ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"Level + 1",new Vector2((int)(width) - (int)(height / 6f * 2f) - (int)(height / 16f / 2f) - (int)(height / 16f) + (int)(height / 6f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,"Level + 1").X * (height / 12f / 96f) / 3.5f / 2f,(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 3.5f,SpriteEffects.None,0);
            }
            
            _spriteBatch.Draw(icon_inventory_load[1],new Vector2((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / Data_Player.player_size_icon[Data.inventory_player[1].Value],SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_3_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[2] != null)
        {
            if (coin > 0)
            {
                ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"Level + 1",new Vector2((int)(width) - (int)(height / 6f * 3f) - (int)(height / 16f / 2f * 2f) - (int)(height / 16f) + (int)(height / 6f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,"Level + 1").X * (height / 12f / 96f) / 3.5f / 2f,(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 3.5f,SpriteEffects.None,0);
            }

            _spriteBatch.Draw(icon_inventory_load[2],new Vector2((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / Data_Player.player_size_icon[Data.inventory_player[2].Value],SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_4_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[3] != null)
        {
            if (coin > 0)
            {
                ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"Level + 1",new Vector2((int)(width) - (int)(height / 6f * 4f) - (int)(height / 16f / 2f * 3f) - (int)(height / 16f) + (int)(height / 6f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,"Level + 1").X * (height / 12f / 96f) / 3.5f / 2f,(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 3.5f,SpriteEffects.None,0);
            }
            
            _spriteBatch.Draw(icon_inventory_load[3],new Vector2((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / Data_Player.player_size_icon[Data.inventory_player[3].Value],SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_5_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[4] != null)
        {
            if (coin > 0)
            {
                ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"Level + 1",new Vector2((int)(width) - (int)(height / 6f * 5f) - (int)(height / 16f / 2f * 4f) - (int)(height / 16f) + (int)(height / 6f / 2f) - ThaiTextRenderer.MeasureString(Data.Tiny5,"Level + 1").X * (height / 12f / 96f) / 3.5f / 2f,(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 3.5f,SpriteEffects.None,0);
            }
            
            _spriteBatch.Draw(icon_inventory_load[4],new Vector2((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)(height / 6f / 2f) + (int)(height / 16f) + (int)(height / 6f / 2f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / Data_Player.player_size_icon[Data.inventory_player[4].Value],SpriteEffects.None,0);
        }
        _spriteBatch.End();
    }
}
