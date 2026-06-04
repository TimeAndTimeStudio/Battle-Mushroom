using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

namespace CoreMain;

public class Docs : Scene
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

    private Rectangle ui_button_close_pos;
    private Rectangle ui_button_p_pos;
    private Rectangle ui_button_e_pos;
    private Rectangle ui_button_m_pos;

    private float fontheight;

    private string page = "m";

    private Texture2D close_icon;

    private Texture2D[] icon_load = new Texture2D[Data_Player.player_list.Length];
    private Rectangle[] player_list_button_pos =  new Rectangle[Data_Player.player_list.Length];

    private bool checkrun = false;
    private float touchx;
    private float oldtouchx;
    private float x;
    private int? player_select;
    private bool checkui = false;

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

        close_icon = _content.Load<Texture2D>("Content/Icon/close_icon");
        coin_icon = _content.Load<Texture2D>("Content/Icon/coin_game_icon");

        ui_button_m_pos = new Rectangle((int)(width) - (int)(height / 8f * 3) - (int)(height / 16f) - (int)(height / 16f / 4f * 2f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));
        ui_button_p_pos = new Rectangle((int)(width) - (int)(height / 8f * 2) - (int)(height / 16f) - (int)(height / 16f / 4f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));
        ui_button_e_pos = new Rectangle((int)(width) - (int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;

        x = 0;
        touchx = 0;
        oldtouchx = 0;

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        if (page == "p")
        {
            for (int i = 0; i < Data_Player.player_list.Length; i++)
            {
                if ((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) > -500)
                {
                    icon_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[i]}/player-1-icon");
                } else
                {
                    icon_load[i] = null;
                }
            }
        } else if (page == "e")
        {
            for (int i = 0; i < Data_Enemy.enemy_name_file.Length; i++)
            {
                if ((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i) > -500)
                {
                    icon_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Enemy.enemy_name_file[i]}/enemy-icon");
                } else
                {
                    icon_load[i] = null;
                }
            }
        }
        
        foreach (var t in Data.touch)
        {
            switch (t.State)
            {
                case TouchLocationState.Pressed:
                    if (player_select == null) 
                    {
                        touchx = t.Position.X;
                        oldtouchx = touchx;
                    }
                    if (ui_button_m_pos.Contains(t.Position))
                    {
                        checkui = true;
                        page = "m";
                        player_select = null;
                        x = 0;
                        touchx = 0;
                        oldtouchx = 0;
                        break;
                    }
                    if (ui_button_e_pos.Contains(t.Position))
                    {
                        checkui = true;
                        page = "e";
                        player_select = null;
                        x = 0;
                        touchx = 0;
                        oldtouchx = 0;
                        break;
                    }
                    if (ui_button_p_pos.Contains(t.Position))
                    {
                        checkui = true;
                        page = "p";
                        player_select = null;
                        x = 0;
                        touchx = 0;
                        oldtouchx = 0;
                        break;
                    }
                    if (ui_button_close_pos.Contains(t.Position))
                    {
                        if (player_select != null)
                        {
                            player_select = null;
                            x = 0;
                            touchx = 0;
                            oldtouchx = 0;
                            break;
                        } 
                        Data.sceneloaduser(new Game());
                        break;
                    }
                    for (int i = 0; i < Data_Player.player_list.Length; i++)
                    {
                        if (player_select != null) break;
                        if (player_list_button_pos[i].Contains(t.Position))
                        {
                            player_select = i;
                            checkui = true;
                            x = 0;
                            touchx = 0;
                            oldtouchx = 0;
                            break;
                        }
                    }
                    
                    break;
                case TouchLocationState.Moved:
                    if (!checkrun)
                    {
                        checkrun = true;
                        touchx = t.Position.X;
                        oldtouchx = touchx;
                    }
                    if (player_select == null && !checkui)
                    {
                        touchx = t.Position.X;
                        x += touchx - oldtouchx;
                        oldtouchx = touchx;
                    }
                    break;
                case TouchLocationState.Released:
                    if (player_select == null)
                    {
                        checkui = false;
                        touchx = 0;
                        oldtouchx = 0;
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
        
        _spriteBatch.Draw(coin_icon,new Vector2(width - (int)(height / 16) - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) - (Data.Tiny5.MeasureString("  0000").X * (height / 12f / 96f) / 1.5f),((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 2), null, new Color(255,255,255),0,Vector2.Zero,(((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 20f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,Data.coin.ToString(),new Vector2(width - (int)(height / 16) - (Data.Tiny5.MeasureString("0000").X * (height / 12f / 96f) / 1.5f),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        if (page == "m")
        {
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.Story,new Vector2((int)(height / 16f),(int)(height / 2.5f - ((int)(height / 3f / 2f)))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.GameStory,new Vector2((int)(height / 16f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 1.5f)),rgb_color2,0,Vector2.Zero,(height / 12f / 96f) / 2f,SpriteEffects.None,0);
        }

        if (page == "e" && player_select != null)
        {
            _spriteBatch.Draw(color1,new Rectangle((int)(height / 16f) ,(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f)), new Color(255,255,255));
            _spriteBatch.Draw(color3,new Rectangle((int)(height / 16f) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f))),(int)(height / 3.5f),(int)(height / 3.5f)), new Color(255,255,255));
            _spriteBatch.Draw(icon_load[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f)))), null, new Color(255,255,255), 0, Vector2.Zero,(height / 3.5f) / 24f,SpriteEffects.None,0);

            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.ATK + Data_Enemy.attack[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f)))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.HP + Data_Enemy.hp[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.SPD + Data_Enemy.speed[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 2f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.CD + Data_Enemy.cooldown_attack[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 3f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        } else if (page == "e")
        {
            for (int i = 0; i < Data_Enemy.enemy_name_file.Length; i++)
            {
                player_list_button_pos[i] = new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f));
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
        }

        if (page == "p" && player_select != null)
        {
            _spriteBatch.Draw(color1,new Rectangle((int)(height / 16f) ,(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f)), new Color(255,255,255));
            _spriteBatch.Draw(color3,new Rectangle((int)(height / 16f) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f))),(int)(height / 3.5f),(int)(height / 3.5f)), new Color(255,255,255));
            _spriteBatch.Draw(icon_load[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f / 2f) - (int)(height / 3.5f / 2f),(int)(height / 2.5f - ((int)(height / 3.5f / 2f)))), null, new Color(255,255,255), 0, Vector2.Zero,(height / 3.5f) / 24f,SpriteEffects.None,0);

            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.ATK + Data_Player.attack[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f)))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.HP + Data_Player.hp[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.SPD + Data_Player.speed[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 2f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.CD + Data_Player.cooldown_attack[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f) * 3f)),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.Coin + Data_Player.player_coin[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 16f * 8) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f)))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
            ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,BattleMushroom.Language.TimeAndTime.CDBUY + Data_Player.player_cooldown[player_select.Value],new Vector2((int)(height / 16f) + (int)(height / 16f * 8) + (int)(height / 3f) + (int)(height / 16f / 4f),(int)(height / 2.5f - ((int)(height / 3f / 2f))) + (int)(fontheight * (height / 12f / 96f / 1.5f))),rgb_color1,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        } else if (page == "p")
        {
            for (int i = 0; i < Data_Player.player_list.Length; i++)
            {
                player_list_button_pos[i] = new Rectangle((int)x + (int)(height / 16f) + (int)(height / 16f / 2f * i) + (int)(height / 3f * i),(int)(height / 2.5f - ((int)(height / 3f / 2f))),(int)(height / 3f),(int)(height / 3f));
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
        }

        _spriteBatch.Draw(color1,ui_button_m_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"M",new Vector2(ui_button_m_pos.X + ui_button_m_pos.Width / 2f - (ThaiTextRenderer.MeasureString(Data.Tiny5,"M").X * (height / 12f / 96f) / 1.5f / 2f),ui_button_m_pos.Y -(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + (int)(height / 8f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)),rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,ui_button_p_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"P",new Vector2(ui_button_p_pos.X + ui_button_p_pos.Width / 2f - (ThaiTextRenderer.MeasureString(Data.Tiny5,"P").X * (height / 12f / 96f) / 1.5f / 2f),ui_button_p_pos.Y -(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + (int)(height / 8f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)),rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);

        _spriteBatch.Draw(color1,ui_button_e_pos,new Color(255,255,255));
        ThaiTextRenderer.DrawString(_spriteBatch,Data.Tiny5,"E",new Vector2(ui_button_e_pos.X + ui_button_e_pos.Width / 2f - (ThaiTextRenderer.MeasureString(Data.Tiny5,"E").X * (height / 12f / 96f) / 1.5f / 2f),ui_button_e_pos.Y -(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + (int)(height / 8f / 2f) - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)),rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);

        _spriteBatch.Draw(color1,ui_button_close_pos,new Color(255,255,255));
        _spriteBatch.Draw(close_icon,new Vector2(ui_button_close_pos.X,ui_button_close_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        _spriteBatch.End();
    }
}
