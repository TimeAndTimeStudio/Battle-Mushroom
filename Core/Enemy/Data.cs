public static class Data_Enemy
{
    public static int[] hp = new int[] {10,5,3,100};
    public static int[] attack = new int[] {1,1,2,8};
    public static int[] speed = new int[] {200,300,400,180};
    public static int[] cooldown_attack = new int[] {2,1,5,10};

    public static int[] walk_value = new int[] {4,4,4,4};
    public static int[] attack_value = new int[] {4,4,12,12};

    public static string[] enemy_name_file = new string[] {"enemy-1","enemy-2","enemy-3","enemy-4"};

    public static float cooldown = 0;

    public static float[] enemy_size = new float[] {0,0,0,32};
    public static float[] enemy_size_w = new float[] {0,0,48,32};
    
    public static float[] enemy_size_icon = new float[] {24,24,24,48};

    public static float[] enemy_hit_box_s1 = new float[] {32,32,32,16};
    public static float[] enemy_hit_box = new float[] {3,3,3,3};
    public static float[] enemy_hit_box_size = new float[] {0,0,1.6f,0.25f};

    public static int?[][] spawnenemy = new int?[][]
    {
        new int?[] {0,0,1,0,2,0},
        new int?[] {2,0,1,2,2,0,0,1,0},
        new int?[] {0,2,1,2,2,0,0,1,0,0,0,2},
        new int?[] {2,1,1,2,0,0,0,1,0,0,2,1,0,2,2},
        new int?[] {0,1,1,2,0,0,0,1,0,0,2,1,0,2,2,0,1,1},
        //--------------------------------------------------- Level 1-5
        new int?[] {1,0,1,2,0,0,0,1,0,0,2,1,0,2,2,0,1,1,2,2,0},
        new int?[] {0,0,1,2,0,0,0,1,0,0,2,1,0,2,2,0,1,1,2,2,0,0,0,1},
        new int?[] {2,2,1,2,0,0,0,1,0,0,2,1,0,2,2,0,1,1,2,2,0,0,0,1,0,1,0},
        new int?[] {1,0,1,2,0,0,0,1,0,0,2,1,0,2,2,0,1,1,2,2,0,0,0,1,0,1,0,2,2,1},
        new int?[] {1,0,1,2,0,0,0,1,0,0,2,1,0,2,2,0,1,1,2,2,0,0,0,1,0,1,0,2,2,1,3},
        //--------------------------------------------------- Level 5-10
        new int?[] {0,0,1,0,2,0},
        new int?[] {2,0,1,2,2,0,0,1,0}
    };
    public static int?[][] spawnenemy_cooldown = new int?[][]
    {
        new int?[] {2,1,3,2,4,1},
        new int?[] {2,1,3,2,4,1,3,2,1},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2,3,1,2},
        //--------------------------------------------------- Level 1-5
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2,3,1,2,4,3,1},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2,3,1,2,4,3,1,2,3,2},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2,3,1,2,4,3,1,2,3,2,5,4,3},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2,3,1,2,4,3,1,2,3,2,5,4,3,1,3,2},
        new int?[] {2,1,3,2,4,1,3,2,1,3,2,3,5,3,2,3,1,2,4,3,1,2,3,2,5,4,3,1,3,2,5},
        //--------------------------------------------------- Level 5-10
        new int?[] {2,1,3,2,4,1},
        new int?[] {2,1,3,2,4,1,3,2,1}
    };
    public static CoreMain.EnemyMain[] enemy_load = new CoreMain.EnemyMain[50];
}