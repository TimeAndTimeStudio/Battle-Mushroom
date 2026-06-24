using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace CoreMain;

public class PlayerMain : Player
{
    public bool checkrun = false;
    public bool checkload = false;
    private Texture2D[] walk_load;
    private Texture2D[] attack_load;

    public Vector2 pos;

    private float height;

    private float playtime;
    private int walk_play;
    private int attack_play;
    private float attack_cooldown;

    public CoreMain.EnemyMain attack = null;
    public int player_value;
    public bool attack_check = false;
    public bool attack_check_cooldown = false;
    public int hp_player;
    public bool towercheck;

    public PlayerMain(int player,Vector2 pos_player)
    {
        player_value = player;
        pos = pos_player;
    }

    public override void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice)
    {
        walk_load = new Texture2D[Data_Player.walk_value[player_value]];
        for (int i = 0; i < Data_Player.walk_value[player_value]; i++)
        {
            walk_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_value]}/player-{i + 1}");
        }

        attack_load = new Texture2D[Data_Player.attack_value[player_value]];
        for (int i = 0; i < Data_Player.attack_value[player_value]; i++)
        {
            attack_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Player.player_name_file[player_value]}/player-attack-{i + 1}");
        }

        height = graphicsDevice.Viewport.Height;
        hp_player = Data_Player.hp[player_value];

        checkload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content,CoreMain.Level_Game_Main main)
    {
        playtime += (float)gameTime.ElapsedGameTime.TotalSeconds;
        pos.X += (height / 75f) * Data_Player.speed[player_value] * (float)gameTime.ElapsedGameTime.TotalSeconds;

        if (attack_check_cooldown)
        {
            attack_cooldown += (float)gameTime.ElapsedGameTime.TotalSeconds;
            if (attack_cooldown >= Data_Player.cooldown_attack[player_value])
            {
                attack_cooldown = 0;
                attack_check_cooldown = false;
            }
        }

        if (playtime >= 0.1f && !attack_check && !attack_check_cooldown)
        {
            while (playtime >= 0.1f)
            {
                playtime -= 0.1f;
                attack_play = 0;
                attack_cooldown = 0;
                
                walk_play += 1;
                

                if (walk_play > Data_Player.walk_value[player_value] - 1)
                {
                    walk_play = 0;
                }
            }
        } else if (playtime >= 0.2f && attack_check && !attack_check_cooldown)
        {
            while (playtime >= 0.2f)
            {
                playtime -= 0.2f;
                walk_play = 0;
                attack_play += 1;
                if (attack_play > Data_Player.attack_value[player_value] - 1)
                {
                    attack_play = 0;
                    attack_check_cooldown = true;
                    if (attack != null)
                    {
                        towercheck = false;
                    }
                    if (attack != null)
                    {
                        attack.hp_enemy -= Data_Player.attack[player_value];
                    } else if (towercheck && attack == null)
                    {
                        main.towerhp_enemy -= Data_Player.attack[player_value];
                        towercheck = false;
                    }
                    
                    if (Data_Player.attackmode[player_value] == 1)
                    {
                        hp_player = 0;
                    }
                }
            } 
        } else if (attack_check_cooldown)
        {
            playtime = 0;
            walk_play = 0;
            attack_play = 0;
        }

        if (!attack_check)
        {
            attack_play = 0;
        }
    }
    public override void Draw(SpriteBatch _spriteBatch, GraphicsDevice graphicsDevice, float x)
    {
        if (attack_check)
        {
            _spriteBatch.Draw(attack_load[attack_play],new Vector2(x + pos.X,pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 2.5f / 32f,SpriteEffects.None,0);
        } else
        {
            _spriteBatch.Draw(walk_load[walk_play],new Vector2(x + pos.X,pos.Y),null,new Color(255,255,255),0,Vector2.Zero,height / 2.5f / 32f,SpriteEffects.None,0);
        }
    }
}
