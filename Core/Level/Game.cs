using System;
using Android.Media.Audiofx;
using Android.Print;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Media;

namespace CoreMain;

public class Level_Game_Main : Scene
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

    public Rectangle ui_button_close_pos;

    private Texture2D close_icon;

    private Texture2D[] icon_inventory_load = new Texture2D[5];
    private float touchx;
    private float oldtouchx;
    private float x;

    private bool checkrun = false;

    private int coin_game = 0;
    public static Texture2D ground;
    public static Texture2D biggrass;
    public static Texture2D background_obj;
    public static Texture2D background;
    public static Texture2D tower_player;
    public static Texture2D tower_enemy;
    private static Texture2D cooldown_icon;

    private bool checkspawn = true;

    private int spawnenemy = 0;

    public int towerhp = 0;
    public int towerhp_enemy = 0;

    private Song music_background;

    public int level_value;
    public float time_coin;

    public Level_Game_Main(int level)
    {
        level_value = level;
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

        towerhp = Data.towerhp;
        towerhp_enemy = Data_Level.towerhp[level_value - 1];

        for (int i = 0; i < Data.inventory_player.Length; i++)
        {
            if (Data.inventory_player[i] == null) continue;
            icon_inventory_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[Data.inventory_player[i].Value]}/player-1-icon");
        }

        ground = _content.Load<Texture2D>(Data_Level.ground[level_value - 1]);
        biggrass = _content.Load<Texture2D>(Data_Level.biggrass[level_value - 1]);
        background_obj = _content.Load<Texture2D>(Data_Level.background_obj[level_value - 1]);
        background = _content.Load<Texture2D>(Data_Level.background[level_value - 1]);
        tower_enemy = _content.Load<Texture2D>(Data_Level.tower_enemy[level_value - 1]);
        tower_player = _content.Load<Texture2D>(Data_Level.tower_player[level_value - 1]);

        ui_button_close_pos = new Rectangle((int)(height / 8f) - (int)(height / 16f),(int)height - (int)(height / 8f) - (int)(height / 16f),(int)(height / 8f),(int)(height / 8f));
        Data.ui_button_player_1_pos = new Rectangle((int)(width) - (int)(height / 6f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_2_pos = new Rectangle((int)(width) - (int)(height / 6f * 2f) - (int)(height / 16f / 2f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_3_pos = new Rectangle((int)(width) - (int)(height / 6f * 3f) - (int)(height / 16f / 2f * 2f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_4_pos = new Rectangle((int)(width) - (int)(height / 6f * 4f) - (int)(height / 16f / 2f * 3f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));
        Data.ui_button_player_5_pos = new Rectangle((int)(width) - (int)(height / 6f * 5f) - (int)(height / 16f / 2f * 4f) - (int)(height / 16f),(int)height - (int)(height / 6f) - (int)(height / 16f),(int)(height / 6f),(int)(height / 6f));

        close_icon = _content.Load<Texture2D>("Content/Icon/close_icon");
        coin_icon = _content.Load<Texture2D>("Content/Icon/coin_icon");
        cooldown_icon = _content.Load<Texture2D>("Content/Icon/cooldown-icon");

        fontheight = Data.Tiny5.MeasureString(BattleMushroom.Language.TimeAndTime.Game_Name).Y;

        x = 0;
        touchx = 0;
        oldtouchx = 0;

        Data_Enemy.cooldown = 0;
        Data_Enemy.enemy_load = new CoreMain.EnemyMain[20];
        Data_Player.player_load = new CoreMain.PlayerMain[20];
        Data_Player.cooldown[0] = 0;
        Data_Player.cooldown[1] = 0;
        Data_Player.cooldown[2] = 0;
        Data_Player.cooldown[3] = 0;
        Data_Player.cooldown[4] = 0;

        music_background = _content.Load<Song>("Content/Music/music-1");
        MediaPlayer.Play(music_background);
        MediaPlayer.IsRepeating = true;

        Data.checksceneload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content)
    {
        if (towerhp <= 0)
        {
            Data.sceneloaduser(new CoreMain.Game());
            MediaPlayer.Stop();
        }
        if (towerhp_enemy <= 0)
        {
            Data.sceneloaduser(new CoreMain.Game());
            MediaPlayer.Stop();
            Data.coin += Data_Level.coinwin[level_value - 1];

            if (level_value < 10)
            {
                Data.level_unlock[level_value] = true;
            }
            Data.save();
        }

        time_coin += (float)gameTime.ElapsedGameTime.TotalSeconds;
        Data_Enemy.cooldown += (float)gameTime.ElapsedGameTime.TotalSeconds;

        for (int i = 0; i < Data_Player.cooldown.Length; i++)
        {
            Data_Player.cooldown[i] += (float)gameTime.ElapsedGameTime.TotalSeconds;
        }

        while (time_coin >= 0.1f)
        {
            time_coin -= 0.1f;
            coin_game += 1;
        }

        if (checkspawn)
        {
            if (Data_Enemy.cooldown >= (float)Data_Enemy.spawnenemy_cooldown[level_value - 1][spawnenemy])
            {
                Data_Enemy.cooldown -= (float)Data_Enemy.spawnenemy_cooldown[level_value - 1][spawnenemy];
                for (int i = 0; i < Data_Enemy.enemy_load.Length; i++)
                {
                    if (Data_Enemy.enemy_load[i] != null) continue;
                    Data_Enemy.enemy_load[i] = new CoreMain.EnemyMain(Data_Enemy.spawnenemy[level_value - 1][spawnenemy].Value,new Vector2(((height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1]) - (height / 2f / 32f * 32f)) - height / 16f - (height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Enemy.spawnenemy[level_value - 1][spawnenemy].Value]),(int)(height - (height / 4f / 16f * 16f + (height / 2.5f / 32f * 32f / 1.3f) + (height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Enemy.spawnenemy[level_value - 1][spawnenemy].Value])))));
                    spawnenemy += 1;
                    if (spawnenemy > Data_Enemy.spawnenemy[level_value - 1].Length - 1)
                    {
                        checkspawn = false;
                    }
                    break;
                }
            }
        }
        

        for (int i = 0; i < Data_Enemy.enemy_load.Length; i++)
        {
            if (Data_Enemy.enemy_load[i] == null) continue;
            if (Data_Enemy.enemy_load[i].checkrun == true) continue;
            Data_Enemy.enemy_load[i].checkrun = true;
            Data_Enemy.enemy_load[i].ContentLoad(_content,graphicsDevice);
        }
        for (int i = 0; i < Data_Enemy.enemy_load.Length; i++)
        {
            if (Data_Enemy.enemy_load[i] == null) continue;
            if (Data_Enemy.enemy_load[i].checkload == false) continue;
            Data_Enemy.enemy_load[i].Update(graphicsDevice,gameTime,_content,this);
            if (Data_Enemy.enemy_load[i].hp_enemy <= 0)
            {
                Data_Enemy.enemy_load[i].attack = null;
                Data_Enemy.enemy_load[i] = null;
                continue;
            }
         
            if (Data_Enemy.enemy_load[i].attack == null)
            {
                Data_Enemy.enemy_load[i].attack_check = false;
            }
            else if (Data_Enemy.enemy_load[i].attack.hp_player <= 0)
            {
                Data_Enemy.enemy_load[i].attack_check = false;
                Data_Enemy.enemy_load[i].attack = null;
            }
        
            if (Data_Enemy.enemy_load[i].attack == null)
            {
                if (new Rectangle((int)x + (int)Data_Enemy.enemy_load[i].pos.X + (int)(height / 2.5f / 32f * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value]) - (int)(height / 2.5f / 32f * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value]) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Enemy.enemy_load[i].enemy_value]),(int)Data_Enemy.enemy_load[i].pos.Y,(int)(height / 2.5f / 32f * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value] + ((int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value]))),(int)(height / 2.5f / 32f * 32f) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Enemy.enemy_load[i].enemy_value])).Intersects(new Rectangle((int)(x + height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f / 1.05f))),(int)(height / 2f / 32f * 32f),(int)(height / 2f / 32f * 32f))))
                {
                    if (!Data_Enemy.enemy_load[i].attack_check_cooldown)
                    {
                        Data_Enemy.enemy_load[i].attack_check = true;
                    }
                }
                for (int e = 0; e < Data_Player.player_load.Length; e++)
                {
                    if (Data_Player.player_load[e] == null) continue;
                    if (Data_Player.player_load[e].checkload == false) continue;
                    if (new Rectangle((int)x + (int)Data_Enemy.enemy_load[i].pos.X + (int)(height / 2.5f / 32f * (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[i].enemy_value] / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value]) - (int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value]) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Enemy.enemy_load[i].enemy_value]),(int)Data_Enemy.enemy_load[i].pos.Y,(int)(height / 2.5f / (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[i].enemy_value] * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value] + ((int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value]))),(int)(height / 2.5f / 32f * 32f) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Enemy.enemy_load[i].enemy_value])).Intersects(new Rectangle((int)x + (int)Data_Player.player_load[e].pos.X + (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[e].player_value]),(int)Data_Player.player_load[e].pos.Y,(int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[e].player_value]),(int)(height / 2.5f / 32f * 32f))))
                    {
                        if (!Data_Enemy.enemy_load[i].attack_check_cooldown)
                        {
                            Data_Enemy.enemy_load[i].attack = Data_Player.player_load[e];
                            Data_Enemy.enemy_load[i].attack_check = true;
                        }
                    } 
                }
            } else
            {
                if (!new Rectangle((int)x + (int)Data_Enemy.enemy_load[i].pos.X + (int)(height / 2.5f / 32f * (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[i].enemy_value] / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value]) - (int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value]) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Enemy.enemy_load[i].enemy_value]),(int)Data_Enemy.enemy_load[i].pos.Y,(int)(height / 2.5f / (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[i].enemy_value] * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value] + ((int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value]))),(int)(height / 2.5f / 32f * 32f) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Enemy.enemy_load[i].enemy_value])).Intersects(new Rectangle((int)x + (int)Data_Enemy.enemy_load[i].attack.pos.X + (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Enemy.enemy_load[i].attack.player_value]),(int)Data_Enemy.enemy_load[i].attack.pos.Y,(int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Enemy.enemy_load[i].attack.player_value]),(int)(height / 2.5f / 32f * 32f))))
                {
                    Data_Enemy.enemy_load[i].attack_check = false;
                    Data_Enemy.enemy_load[i].attack = null;
                }  else
                {
                    if (!Data_Enemy.enemy_load[i].attack_check_cooldown)
                    {
                        Data_Enemy.enemy_load[i].attack_check = true;
                    }
                }
            }
        }

        for (int i = 0; i < Data_Player.player_load.Length; i++)
        {
            if (Data_Player.player_load[i] == null) continue;
            if (Data_Player.player_load[i].checkrun == true) continue;
            Data_Player.player_load[i].checkrun = true;
            Data_Player.player_load[i].ContentLoad(_content,graphicsDevice);
        }
        for (int i = 0; i < Data_Player.player_load.Length; i++)
        {
            if (Data_Player.player_load[i] == null) continue;
            if (Data_Player.player_load[i].checkload == false) continue;
            Data_Player.player_load[i].Update(graphicsDevice,gameTime,_content,this);
            if (Data_Player.player_load[i].hp_player <= 0)
            {
                Data_Player.player_load[i].attack = null;
                Data_Player.player_load[i] = null;
                continue;
            }
          
            if (Data_Player.player_load[i].attack == null) 
            { 
                Data_Player.player_load[i].attack_check = false;
            } else if (Data_Player.player_load[i].attack.hp_enemy <= 0)
            {
                Data_Player.player_load[i].attack_check = false;
                Data_Player.player_load[i].attack = null;
            }
      
            if (Data_Player.player_load[i].attack == null)
            {
                if (new Rectangle((int)x + (int)Data_Player.player_load[i].pos.X + (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value]),(int)Data_Player.player_load[i].pos.Y,(int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value] + ((int)(height / 2.5f / 32f * 32f * Data_Player.player_hit_box_size[Data_Player.player_load[i].player_value]))),(int)(height / 2.5f / 32f * 32f)).Intersects(new Rectangle((int)(x + (((height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1]) - (height / 2f / 32f * 32f)) - height / 16f)),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f / 1.05f))),(int)(height / 2f / 32f * 32f),(int)(height / 2f / 32f * 32f))))
                {
                    if (!Data_Player.player_load[i].attack_check_cooldown)
                    {
                        Data_Player.player_load[i].attack_check = true;
                    }
                }
                for (int e = 0; e < Data_Enemy.enemy_load.Length; e++)
                {
                    if (Data_Enemy.enemy_load[e] == null) continue;
                    if (Data_Enemy.enemy_load[e].checkload == false) continue;
                    if (new Rectangle((int)x + (int)Data_Player.player_load[i].pos.X + (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value]),(int)Data_Player.player_load[i].pos.Y,(int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value] + ((int)(height / 2.5f / 32f * 32f * Data_Player.player_hit_box_size[Data_Player.player_load[i].player_value]))),(int)(height / 2.5f / 32f * 32f)).Intersects(new Rectangle((int)x + (int)Data_Enemy.enemy_load[e].pos.X + (int)(height / 2.5f / 32f * (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[e].enemy_value] / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[e].enemy_value]) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Enemy.enemy_load[e].enemy_value]),(int)Data_Enemy.enemy_load[e].pos.Y,(int)(height / 2.5f / (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[e].enemy_value] * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[e].enemy_value]),(int)(height / 2.5f / 32f * 32f) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Enemy.enemy_load[e].enemy_value]))))
                    {
                        if (!Data_Player.player_load[i].attack_check_cooldown)
                        {
                            Data_Player.player_load[i].attack = Data_Enemy.enemy_load[e];
                            Data_Player.player_load[i].attack_check = true;
                        }
                    } 
                }
            } else
            {
                if (!new Rectangle((int)x + (int)Data_Player.player_load[i].pos.X + (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value]),(int)Data_Player.player_load[i].pos.Y,(int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value] + ((int)(height / 2.5f / 32f * 32f * Data_Player.player_hit_box_size[Data_Player.player_load[i].player_value]))),(int)(height / 2.5f / 32f * 32f)).Intersects(new Rectangle((int)x + (int)Data_Player.player_load[i].attack.pos.X + (int)(height / 2.5f / 32f * (float)Data_Enemy.enemy_hit_box_s1[Data_Player.player_load[i].attack.enemy_value] / Data_Enemy.enemy_hit_box[Data_Player.player_load[i].attack.enemy_value]) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Player.player_load[i].attack.enemy_value]),(int)Data_Player.player_load[i].attack.pos.Y,(int)(height / 2.5f / (float)Data_Enemy.enemy_hit_box_s1[Data_Player.player_load[i].attack.enemy_value] * 32f / Data_Enemy.enemy_hit_box[Data_Player.player_load[i].attack.enemy_value]),(int)(height / 2.5f / 32f * 32f) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Player.player_load[i].attack.enemy_value]))))
                {
                    Data_Player.player_load[i].attack_check = false;
                    Data_Player.player_load[i].attack = null;
                }
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
                        MediaPlayer.Stop();
                        break;
                    }
                    if (Data.ui_button_player_1_pos.Contains(t.Position))
                    {
                        if (Data.inventory_player[0] != null)
                        {
                            if (Data_Player.cooldown[0] >= Data_Player.player_cooldown[Data.inventory_player[0].Value] && coin_game >= Data_Player.player_coin[Data.inventory_player[0].Value])
                            {
                                Data_Player.cooldown[0] = 0;
                                coin_game -= Data_Player.player_coin[Data.inventory_player[0].Value];

                                for (int i = 0; i < Data_Player.player_load.Length; i++)
                                {
                                    if (Data_Player.player_load[i] != null) continue;
                                    Data_Player.player_load[i] = new CoreMain.PlayerMain(Data.inventory_player[0].Value,new Vector2((int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f / 1.05f)))));
                                    break;
                                }
                            }
                        }
                    } else if (Data.ui_button_player_2_pos.Contains(t.Position))
                    {
                        if (Data.inventory_player[1] != null)
                        {
                            if (Data_Player.cooldown[1] >= Data_Player.player_cooldown[Data.inventory_player[1].Value] && coin_game >= Data_Player.player_coin[Data.inventory_player[1].Value])
                            {
                                Data_Player.cooldown[1] = 0;
                                coin_game -= Data_Player.player_coin[Data.inventory_player[1].Value];

                                for (int i = 0; i < Data_Player.player_load.Length; i++)
                                {
                                    if (Data_Player.player_load[i] != null) continue;
                                    Data_Player.player_load[i] = new CoreMain.PlayerMain(Data.inventory_player[1].Value,new Vector2((int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2.5f / 32f * 32f / 1.3f)))));
                                    break;
                                }
                            }
                        }
                    } else if (Data.ui_button_player_3_pos.Contains(t.Position))
                    {
                        if (Data.inventory_player[2] != null)
                        {
                            if (Data_Player.cooldown[2] >= Data_Player.player_cooldown[Data.inventory_player[2].Value] && coin_game >= Data_Player.player_coin[Data.inventory_player[2].Value])
                            {
                                Data_Player.cooldown[2] = 0;
                                coin_game -= Data_Player.player_coin[Data.inventory_player[2].Value];

                                for (int i = 0; i < Data_Player.player_load.Length; i++)
                                {
                                    if (Data_Player.player_load[i] != null) continue;
                                    Data_Player.player_load[i] = new CoreMain.PlayerMain(Data.inventory_player[2].Value,new Vector2((int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2.5f / 32f * 32f / 1.3f)))));
                                    break;
                                }
                            }
                        }
                    } else if (Data.ui_button_player_4_pos.Contains(t.Position))
                    {
                        if (Data.inventory_player[3] != null)
                        {
                            if (Data_Player.cooldown[3] >= Data_Player.player_cooldown[Data.inventory_player[3].Value] && coin_game >= Data_Player.player_coin[Data.inventory_player[3].Value])
                            {
                                Data_Player.cooldown[3] = 0;
                                coin_game -= Data_Player.player_coin[Data.inventory_player[3].Value];

                                for (int i = 0; i < Data_Player.player_load.Length; i++)
                                {
                                    if (Data_Player.player_load[i] != null) continue;
                                    Data_Player.player_load[i] = new CoreMain.PlayerMain(Data.inventory_player[3].Value,new Vector2((int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2.5f / 32f * 32f / 1.3f)))));
                                    break;
                                }
                            }
                        }
                    } else if (Data.ui_button_player_5_pos.Contains(t.Position))
                    {
                        if (Data.inventory_player[4] != null)
                        {
                            if (Data_Player.cooldown[4] >= Data_Player.player_cooldown[Data.inventory_player[4].Value] && coin_game >= Data_Player.player_coin[Data.inventory_player[4].Value])
                            {
                                Data_Player.cooldown[4] = 0;
                                coin_game -= Data_Player.player_coin[Data.inventory_player[4].Value];

                                for (int i = 0; i < Data_Player.player_load.Length; i++)
                                {
                                    if (Data_Player.player_load[i] != null) continue;
                                    Data_Player.player_load[i] = new CoreMain.PlayerMain(Data.inventory_player[4].Value,new Vector2((int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2.5f / 32f * 32f / 1.3f)))));
                                    break;
                                }
                            }
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
                    if (x <= -(height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1] - width))
                    {
                        x = -(height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1] - width);
                    } else if (x >= 0)
                    {
                        x = 0;
                    }
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
        _spriteBatch.Draw(background,new Vector2(0,(int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)),null,new Color(255,255,255),0,Vector2.Zero,MathHelper.Max((height - ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f))) / 45f,width / 100f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,BattleMushroom.Language.TimeAndTime.Game_Name,new Vector2((int)(height / 16),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(coin_icon,new Vector2(width - (int)(height / 16) - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) - (Data.Tiny5.MeasureString("  0000").X * (height / 12f / 96f) / 1.5f),((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - ((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 2), null, new Color(255,255,255),0,Vector2.Zero,(((height / 12f / 96f) / 1.5f * 96f + (height / 8f / 2f / 1.3f)) / 20f),SpriteEffects.None,0);
        ThaiTextRenderer.DrawString(_spriteBatch, Data.Tiny5,coin_game.ToString(),new Vector2(width - (int)(height / 16) - (Data.Tiny5.MeasureString("0000").X * (height / 12f / 96f) / 1.5f),-(int)(fontheight * (height / 12f / 96f) / 1.5f / 4.5f) + ((int)((height / 12f / 96f) / 1.5f * 96f) + (int)(height / 8f / 2f)) / 2 - (int)(fontheight * (height / 12f / 96f) / 1.5f / 1.75f / 2f)), rgb_color4,0,Vector2.Zero,(height / 12f / 96f) / 1.5f,SpriteEffects.None,0);

        for (int i = 0; i < Data_Level.sizemap[level_value - 1]; i++)
        {
            _spriteBatch.Draw(ground,new Vector2(x + height / 4f / 16f * 16f * i,height - (height / 4f / 16f * 16f)),null,new Color(255,255,255),0,Vector2.Zero,height / 4f / 16f,SpriteEffects.None,0);
        }

        for (int i = 0; i < Data_Level.sizemap[level_value - 1] * (height / 4f / 16f * 16f) / (height / 2f / 48f * 48f); i++)
        {
            _spriteBatch.Draw(background_obj,new Vector2(x + height / 2f / 48f * 48f * i,(int)(height - (height / 4f / 16f * 16f + (height / 2f / 48f * 48f)))),null,new Color(255,255,255),0,Vector2.Zero,height / 2f / 48f,SpriteEffects.None,0);
        }

        for (int i = 0; i < Data_Level.biggrasspos[level_value - 1].Length; i++)
        {
            if (Data_Level.biggrasspos[level_value - 1][i] == 0) continue;
            _spriteBatch.Draw(biggrass,new Vector2(x + height / 4f / 16f * 16f * i,(int)(height - (height / 4f / 16f * 16f * 1.95f))),null,new Color(255,255,255),0,Vector2.Zero,height / 4f / 16f,SpriteEffects.None,0);
        }

        _spriteBatch.Draw(tower_player,new Vector2((int)(x + height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f / 1.05f)))),null,new Color(255,255,255),0,Vector2.Zero,height / 2f / 32f,SpriteEffects.None,0);
        _spriteBatch.Draw(tower_enemy,new Vector2((int)(x + (((height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1]) - (height / 2f / 32f * 32f)) - height / 16f)),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f / 1.05f)))),null,new Color(255,255,255),0,Vector2.Zero,height / 2f / 32f,SpriteEffects.None,0);
        
        for (int i = 0; i < Data_Enemy.enemy_load.Length; i++)
        {
            if (Data_Enemy.enemy_load[i] == null) continue;
            if (Data_Enemy.enemy_load[i].checkload == false) continue;
            Data_Enemy.enemy_load[i].Draw(_spriteBatch,graphicsDevice,x);
        }

        for (int i = 0; i < Data_Player.player_load.Length; i++)
        {
            if (Data_Player.player_load[i] == null) continue;
            if (Data_Player.player_load[i].checkload == false) continue;
            Data_Player.player_load[i].Draw(_spriteBatch,graphicsDevice,x);
        }

        // // Debug - แสดง hitbox Player (attacker range)
        // for (int i = 0; i < Data_Player.player_load.Length; i++)
        // {
        //     if (Data_Player.player_load[i] == null) continue;
        //     if (Data_Player.player_load[i].checkload == false) continue;

        //     // Attacker rectangle (มี hit_box_size)
        //     // แก้ Player attacker rectangle ✅
        //     Rectangle playerAttackBox = new Rectangle(
        //         (int)x + (int)Data_Player.player_load[i].pos.X 
        //             + (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value]),
        //         (int)Data_Player.player_load[i].pos.Y,
        //         (int)(height / 2.5f / 32f * 32f / Data_Player.player_hit_box[Data_Player.player_load[i].player_value] 
        //             + (int)(height / 2.5f / 32f * 32f * Data_Player.player_hit_box_size[Data_Player.player_load[i].player_value])),
        //         (int)(height / 2.5f / 32f * 32f));
        //     _spriteBatch.Draw(color1, playerAttackBox, Color.Red * 0.4f);
        // }

        // // Debug - แสดง hitbox Enemy (attacker range)
        // for (int i = 0; i < Data_Enemy.enemy_load.Length; i++)
        // {
        //     if (Data_Enemy.enemy_load[i] == null) continue;
        //     if (Data_Enemy.enemy_load[i].checkload == false) continue;

        //     // Attacker rectangle (มี hit_box_size)
        //     Rectangle enemyAttackBox = new Rectangle(
        //         (int)x + (int)Data_Enemy.enemy_load[i].pos.X 
        //             + (int)(height / 2.5f / 32f * (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[i].enemy_value] / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value]) - (int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value]) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size_w[Data_Enemy.enemy_load[i].enemy_value]),
        //         (int)Data_Enemy.enemy_load[i].pos.Y,
        //         (int)(height / 2.5f / (float)Data_Enemy.enemy_hit_box_s1[Data_Enemy.enemy_load[i].enemy_value] * 32f / Data_Enemy.enemy_hit_box[Data_Enemy.enemy_load[i].enemy_value] 
        //             + (int)(height / 2.5f / 32f * 32f * Data_Enemy.enemy_hit_box_size[Data_Enemy.enemy_load[i].enemy_value])),
        //         (int)(height / 2.5f / 32f * 32f) + (int)(height / 2.5f / 32f * Data_Enemy.enemy_size[Data_Enemy.enemy_load[i].enemy_value]));

        //     _spriteBatch.Draw(color1, enemyAttackBox, Color.Blue * 0.4f);
        // }



        _spriteBatch.Draw(color3,new Rectangle((int)x + (int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f) + height / 16f)),(int)(height / 2f / 32f * 32f),(int)(height / 16f)),new Color(255,255,255));
        _spriteBatch.Draw(color1,new Rectangle((int)x + (int)(height / 16f),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f) + height / 16f)),(int)((height / 2f / 32f * 32f) * ((float)towerhp / (float)Data.towerhp)),(int)(height / 16f)),new Color(255,255,255));

        _spriteBatch.Draw(color3,new Rectangle((int)(x + (((height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1]) - (height / 2f / 32f * 32f)) - height / 16f)),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f) + height / 16f)),(int)(height / 2f / 32f * 32f),(int)(height / 16f)),new Color(255,255,255));
        _spriteBatch.Draw(color1,new Rectangle((int)(x + (((height / 4f / 16f * 16f * Data_Level.sizemap[level_value - 1]) - (height / 2f / 32f * 32f)) - height / 16f)),(int)(height - (height / 4f / 16f * 16f + (height / 2f / 32f * 32f) + height / 16f)),(int)((height / 2f / 32f * 32f) * ((float)towerhp_enemy / (float)Data_Level.towerhp[level_value - 1] )),(int)(height / 16f)),new Color(255,255,255));

        _spriteBatch.Draw(color1,ui_button_close_pos,new Color(255,255,255));
        _spriteBatch.Draw(close_icon,new Vector2(ui_button_close_pos.X,ui_button_close_pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 8f / 20f,SpriteEffects.None,0);
        
        _spriteBatch.Draw(color1,Data.ui_button_player_1_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[0] != null)
        {
            if (Data_Player.cooldown[0] >= Data_Player.player_cooldown[Data.inventory_player[0].Value])
            {
                _spriteBatch.Draw(icon_inventory_load[0],new Vector2((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
            } else
            {
                _spriteBatch.Draw(cooldown_icon,new Vector2((int)(width) - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 20f,SpriteEffects.None,0);
            }
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_2_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[1] != null)
        {
            if (Data_Player.cooldown[2] >= Data_Player.player_cooldown[Data.inventory_player[2].Value])
            {
                _spriteBatch.Draw(icon_inventory_load[1],new Vector2((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
            } else
            {
                _spriteBatch.Draw(cooldown_icon,new Vector2((int)(width) - (int)(height / 6f * 2f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 20f,SpriteEffects.None,0);
            }
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_3_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[2] != null)
        {
            if (Data_Player.cooldown[2] >= Data_Player.player_cooldown[Data.inventory_player[2].Value])
            {
                _spriteBatch.Draw(icon_inventory_load[2],new Vector2((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
            } else
            {
                _spriteBatch.Draw(cooldown_icon,new Vector2((int)(width) - (int)(height / 6f * 3f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 2f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 20f,SpriteEffects.None,0);
            }
            
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_4_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[3] != null)
        {
            if (Data_Player.cooldown[3] >= Data_Player.player_cooldown[Data.inventory_player[3].Value])
            {
                _spriteBatch.Draw(icon_inventory_load[3],new Vector2((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
            } else
            {
                _spriteBatch.Draw(cooldown_icon,new Vector2((int)(width) - (int)(height / 6f * 4f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 3f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 20f,SpriteEffects.None,0);
            }
        }
        _spriteBatch.Draw(color1,Data.ui_button_player_5_pos,new Color(255,255,255));
        _spriteBatch.Draw(color2,new Rectangle((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f),(int)(height / 7f),(int)(height / 7f)),new Color(255,255,255));
        if (Data.inventory_player[4] != null)
        {
            if (Data_Player.cooldown[4] >= Data_Player.player_cooldown[Data.inventory_player[4].Value])
            {
                _spriteBatch.Draw(icon_inventory_load[4],new Vector2((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 24f,SpriteEffects.None,0);
            } else
            {
                _spriteBatch.Draw(cooldown_icon,new Vector2((int)(width) - (int)(height / 6f * 5f) + (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 16f / 2f * 4f) - (int)(height / 7f / 2f),(int)height - (int)(height / 6f / 2f) - (int)(height / 16f) - (int)(height / 7f / 2f)), null,new Color(255,255,255),0,Vector2.Zero,(height / 7f) / 20f,SpriteEffects.None,0);
            }
        }
        _spriteBatch.End();
    }
}
