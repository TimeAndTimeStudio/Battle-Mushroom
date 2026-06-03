using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

namespace CoreMain;

public class Inventory : Scene
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

    private Texture2D[] icon_load = new Texture2D[Data_Player.player_list.Length];
    private Texture2D[] icon_inventory_load = new Texture2D[5];
    private float touchx;
    private float oldtouchx;
    private float x;

    private int? player_select = null;
    private bool checkrun = false;

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

        for (int i = 0; i < Data_Player.player_list.Length; i++)
        {
            if (!Data_Player.player_list[i]) continue;
            icon_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[i]}/player-1-icon");
        }

        for (int i = 0; i < Data.inventory_player.Length; i++)
        {
            if (Data.inventory_player[i] == null) continue;
            icon_inventory_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[Data.inventory_player[i].Value]}/player-1-icon");
        }

        Data.ui_button_close_pos = new Rectangle((int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));
        Data.ui_button_player_1_pos = new Rectangle((int)(width) - (int)(height / 6f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_2_pos = new Rectangle((int)(width) - (int)(height / 6f * 2f) - (int)(height / 16f / 2f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_3_pos = new Rectangle((int)(width) - (int)(height / 6f * 3f) - (int)(height / 16f / 2f * 2f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_4_pos = new Rectangle((int)(width) - (int)(height / 6f * 4f) - (int)(height / 16f / 2f * 3f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_5_pos = new Rectangle((int)(width) - (int)(height / 6f * 5f) - (int)(height / 16f / 2f * 4f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));

        close_icon = _content.Load<Texture2D>("Content/Icon/close_icon");
        coin_icon = _content.Load<Texture2D>("Content/Icon/coin_game_icon");

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;

        x = 0;
        touchx = 0;
        oldtouchx = 0;

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        for (int i = 0; i < Data_Player.player_list.Length; i++)
        {
            if (!Data_Player.player_list[i]) continue;
            if ((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) > -500)
            {
                icon_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[i]}/player-1-icon");
            }
        }
        foreach (var t in Data.touch)
        {
            switch (t.State)
            {
                case TouchLocationState.Pressed:
                    if (Data.ui_button_close_pos.Contains(t.Position))
                    {
                        Data.sceneloaduser(new Game());
                    }
                    if (Data.ui_button_player_1_pos.Contains(t.Position))
                    {
                        bool check = false;
                        for (int i = 0; i < Data.inventory_player.Length; i++)
                        {
                            if (Data.inventory_player[i] == player_select)
                            {
                                if (Data.inventory_player[0] == player_select)
                                {
                                    Data.inventory_player[0] = null;
                                    Data.save();
                                }
                                check = true;
                                break;
                            }
                            continue;
                        }
                        if (player_select != null && check == false)
                        {
                            Data.inventory_player[0] = player_select;
                            icon_inventory_load[0] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_select.Value]}/player-1-icon");
                            Data.save();
                        }
                    } else if (Data.ui_button_player_2_pos.Contains(t.Position))
                    {
                        bool check = false;
                        for (int i = 0; i < Data.inventory_player.Length; i++)
                        {
                            if (Data.inventory_player[i] == player_select)
                            {
                                if (Data.inventory_player[1] == player_select)
                                {
                                    Data.inventory_player[1] = null;
                                    Data.save();
                                }
                                check = true;
                                break;
                            }
                            continue;
                        }
                        if (player_select != null && check == false)
                        {
                            Data.inventory_player[1] = player_select;
                            icon_inventory_load[1] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_select.Value]}/player-1-icon");
                            Data.save();
                        }
                    } else if (Data.ui_button_player_3_pos.Contains(t.Position))
                    {
                        bool check = false;
                        for (int i = 0; i < Data.inventory_player.Length; i++)
                        {
                            if (Data.inventory_player[i] == player_select)
                            {
                                if (Data.inventory_player[2] == player_select)
                                {
                                    Data.inventory_player[2] = null;
                                    Data.save();
                                }
                                check = true;
                                break;
                            }
                            continue;
                        }
                        if (player_select != null && check == false)
                        {
                            Data.inventory_player[2] = player_select;
                            icon_inventory_load[2] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_select.Value]}/player-1-icon");
                            Data.save();
                        }
                    } else if (Data.ui_button_player_4_pos.Contains(t.Position))
                    {
                        bool check = false;
                        for (int i = 0; i < Data.inventory_player.Length; i++)
                        {
                            if (Data.inventory_player[i] == player_select)
                            {
                                if (Data.inventory_player[3] == player_select)
                                {
                                    Data.inventory_player[3] = null;
                                    Data.save();
                                }
                                check = true;
                                break;
                            }
                            continue;
                        }
                        if (player_select != null && check == false)
                        {
                            Data.inventory_player[3] = player_select;
                            icon_inventory_load[3] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_select.Value]}/player-1-icon");
                            Data.save();
                        }
                    } else if (Data.ui_button_player_5_pos.Contains(t.Position))
                    {
                        bool check = false;
                        for (int i = 0; i < Data.inventory_player.Length; i++)
                        {
                            if (Data.inventory_player[i] == player_select)
                            {
                                if (Data.inventory_player[4] == player_select)
                                {
                                    Data.inventory_player[4] = null;
                                    Data.save();
                                }
                                check = true;
                                break;
                            }
                            continue;
                        }
                        if (player_select != null && check == false)
                        {
                            Data.inventory_player[4] = player_select;
                            icon_inventory_load[4] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_select.Value]}/player-1-icon");
                            Data.save();
                        }
                    }
                    for (int i = 0; i < Data_Player.player_list.Length; i++)
                    {
                        if (!Data_Player.player_list[i]) continue;
                        if (Data.player_list_button_pos[i].Contains(t.Position))
                        {
                            player_select = i;
                        }
                    }
                    touchx = t.Position.X;
                    oldtouchx = touchx;
                    break;
                case TouchLocationState.Moved:
                    if (!checkrun)
                    {
                        checkrun = true;
                        touchx = t.Position.X;
                        oldtouchx = touchx;
                    }
                    touchx = t.Position.X;
                    x += touchx - oldtouchx;
                    oldtouchx = touchx;
                    break;
                case TouchLocationState.Released:
                    touchx = 0;
                    oldtouchx = 0;
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
        
        _spriteBatch.Draw(coin_icon,new Vector2(width - (int)(height / 16) - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) - (Data.Tiny5.MeasureString("  0000").X * (height / 12f / 96f) / 1.5f),((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 2), null, new Color(255,255,255),0,Vector2.Zero,(((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 20f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,Data.coin.ToString(),new Vector2(width - (int)(height / 16) - (Data.Tiny5.MeasureString("0000").X * (height / 12f / 96f) / 1.5f),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);

        for (int i = 0; i < Data_Player.player_list.Length; i++)
        {
            if (!Data_Player.player_list[i]) continue;
            Data.player_list_button_pos[i] = new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f));
            _spriteBatch.Draw(color1,new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f)), new Color(255,255,255));
            _spriteBatch.Draw(color3,new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f))),(int)(height / 3.5f),(int)(height / 3.5f)), new Color(255,255,255));
            if ((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) < -500)
            {
                icon_load[i] = null;
            }
            if (icon_load[i] != null)
            {
                _spriteBatch.Draw(icon_load[i],new Vector2((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f)))), null, new Color(255,255,255), 0, Vector2.Zero,(height / 3.5f) / 24f,SpriteEffects.None,0);
            }
        }

        _spriteBatch.Draw(color1,Data.ui_button_close_pos,new Color(255,255,255));
        _spriteBatch.Draw(close_icon,new Vector2(Data.ui_button_close_pos.X,Data.ui_button_close_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,Data.ui_button_player_1_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[0] != null)
        {
            _spriteBatch.Draw(icon_inventory_load[0],new Vector2((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_2_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[1] != null)
        {
            _spriteBatch.Draw(icon_inventory_load[1],new Vector2((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_3_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[2] != null)
        {
            _spriteBatch.Draw(icon_inventory_load[2],new Vector2((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_4_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[3] != null)
        {
            _spriteBatch.Draw(icon_inventory_load[3],new Vector2((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_5_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[4] != null)
        {
            _spriteBatch.Draw(icon_inventory_load[4],new Vector2((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
        }
        _spriteBatch.End();
    }
}
