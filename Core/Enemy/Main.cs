using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace CoreMain;

public class EnemyMain : Enemy
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
    public CoreMain.PlayerMain attack = null;
    public int hp_enemy;

    public int enemy_value;
    public bool attack_check = false;
    public bool attack_check_cooldown = false;
    private int level;

    public EnemyMain(int enemy,Vector2 pos_enemy,int level_game)
    {
        enemy_value = enemy;
        pos = pos_enemy;
        level = level_game;
    }

    public override void ContentLoad(ContentManager _content, GraphicsDevice graphicsDevice)
    {
        walk_load = new Texture2D[Data_Enemy.walk_value[enemy_value]];
        for (int i = 0; i < Data_Enemy.walk_value[enemy_value]; i++)
        {
            walk_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Enemy.enemy_name_file[enemy_value]}/enemy-{i + 1}");
        }

        attack_load = new Texture2D[Data_Enemy.attack_value[enemy_value]];
        for (int i = 0; i < Data_Enemy.attack_value[enemy_value]; i++)
        {
            attack_load[i] = _content.Load<Texture2D>($"Content/Png/{Data_Enemy.enemy_name_file[enemy_value]}/enemy-attack{i + 1}");
        }

        height = graphicsDevice.Viewport.Height;
        hp_enemy = Data_Enemy.hp[enemy_value] + ((level - 1) / 10 * 2);

        checkload = true;
    }
    public override void Update(GraphicsDevice graphicsDevice, GameTime gameTime, ContentManager _content,CoreMain.Level_Game_Main main)
    {
        playtime += (float)gameTime.ElapsedGameTime.TotalSeconds;

        if (attack_check_cooldown)
        {
            attack_cooldown += (float)gameTime.ElapsedGameTime.TotalSeconds;
            if (attack_cooldown >= Data_Enemy.cooldown_attack[enemy_value])
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
                pos.X -= Data_Enemy.speed[enemy_value] * (float)gameTime.ElapsedGameTime.TotalSeconds;
                walk_play += 1;
                

                if (walk_play > Data_Enemy.walk_value[enemy_value] - 1)
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
                if (attack_play > Data_Enemy.attack_value[enemy_value] - 1)
                {
                    attack_play = 0;
                    attack_check_cooldown = true;
                    
                    if (attack != null)
                    {
                        attack.hp_player -= Data_Enemy.attack[enemy_value] + ((level - 1) / 10);
                    } else
                    {
                        main.towerhp -= Data_Enemy.attack[enemy_value] + ((level - 1) / 10);
                    }
                }
            } 
        } else if (attack_check_cooldown)
        {
            playtime = 0;
            walk_play = 0;
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
