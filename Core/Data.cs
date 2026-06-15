using System;
using System.IO;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

public static class Data
{
    public static bool exit = false;
    public static int towerhp = 100;
    public static string Language = "en-US";
    public static int coin = 0;
    public static SpriteFont Tiny5;
    public static CoreMain.Scene sceneload = null;
    public static bool checksceneload = false;

    public static Rectangle ui_button_player_1_pos;
    public static Rectangle ui_button_player_2_pos;
    public static Rectangle ui_button_player_3_pos;
    public static Rectangle ui_button_player_4_pos;
    public static Rectangle ui_button_player_5_pos;

    public static Rectangle[] level_button_pos = new Rectangle[20];
    public static bool[] level_unlock = new bool[20];

    public static int?[] inventory_player = new int?[] {null,null,null,null,null};
    public static string[] backgroundfilename = new string[] {"Background1","Background2","Background3","Background4","Background5","Background6","Background7","Background8"};

    public static TouchCollection touch;

    public static int[][] shop_random = new int[][]
    {
        new int[] {1,2,3,4,5}
    };

    public static void sceneloaduser(CoreMain.Scene scene)
    {
        sceneload = null;
        checksceneload = false;
        sceneload = scene;
    }

    public static void savedata()
    {
        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom"));

        FileStream fs = new FileStream(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom", "gamedata.bin"), FileMode.Create);
        BinaryWriter w  = new BinaryWriter(fs);

        w.Write(Data_Player.hp.Length);
        for (int i = 0; i < Data_Player.hp.Length; i++)
        {
            w.Write(Data_Player.hp[i]);
        }

        w.Write(Data_Player.attack.Length);
        for (int i = 0; i < Data_Player.attack.Length; i++)
        {
            w.Write(Data_Player.attack[i]);
        }

        w.Write(Data_Player.level_player.Length);
        for (int i = 0; i < Data_Player.level_player.Length; i++)
        {
            w.Write(Data_Player.level_player[i]);
        }

        w.Close();
        fs.Close();
    }

    public static void updatedata()
    {
        for (int i = 0; i < Data_Player.level_player.Length; i++)
        {
            Data_Player.hp[i] = Data_Player.hpd[i] + (Data_Player.level_player[i] / 10);
            Data_Player.attack[i] = Data_Player.attackd[i] + (Data_Player.level_player[i] / 20);
        }
       savedata();
    }

    public static void loaddata()
    {
        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom"));
        
        FileStream fs = new FileStream(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom", "gamedata.bin"), FileMode.Open);
        BinaryReader r  = new BinaryReader(fs);

        int hpload = r.ReadInt32();
        for (int i = 0; i < hpload; i++)
        {
            int value = r.ReadInt32();
            Data_Player.hp[i] = value;
        }

        int attackload = r.ReadInt32();
        for (int i = 0; i < attackload; i++)
        {
            int value = r.ReadInt32();
            Data_Player.attack[i] = value;
        }

        int levelload = r.ReadInt32();
        for (int i = 0; i < levelload; i++)
        {
            int value = r.ReadInt32();
            Data_Player.level_player[i] = value;
        }

        r.Close();
        fs.Close();
    }

    public static void save()
    {
        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom"));

        FileStream fs = new FileStream(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom", "game.bin"), FileMode.Create);
        BinaryWriter w  = new BinaryWriter(fs);

        w.Write(Language);
        
        for (int i = 0; i < inventory_player.Length; i++)
        {
            if (inventory_player[i] == null)
            {
                w.Write((int)9999);
            } else
            {
                w.Write((int)inventory_player[i].Value);
            }
        }
        w.Write(coin);

        for (int i = 0; i < level_unlock.Length; i++)
        {
            w.Write(level_unlock[i]);
        }
        for (int i = 0; i < Data_Player.player_list.Length; i++)
        {
            w.Write(Data_Player.player_list[i]);
        }

        w.Close();
        fs.Close();
    }
    public static void load()
    {
        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom"));
        
        FileStream fs = new FileStream(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Battle Mushroom", "game.bin"), FileMode.Open);
        BinaryReader r  = new BinaryReader(fs);
        
        Language = r.ReadString();

        for (int i = 0; i < inventory_player.Length; i++)
        {
            int value = r.ReadInt32();
            if (value == 9999)
            {
                inventory_player[i] = null;
            } else
            {
                inventory_player[i] = value;
            }
        }

        coin = r.ReadInt32();
        
        for (int i = 0; i < level_unlock.Length; i++)
        {
            if (r.BaseStream.Position >= r.BaseStream.Length) return;
            level_unlock[i] = r.ReadBoolean();
        }
        for (int i = 0; i < Data_Player.player_list.Length; i++)
        {
            if (r.BaseStream.Position >= r.BaseStream.Length) return;
            Data_Player.player_list[i] = r.ReadBoolean();
        }

        r.Close();
        fs.Close();
    }
}