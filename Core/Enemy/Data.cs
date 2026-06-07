public static class Data_Enemy
{
    public static int[] hp = new int[] {10,5};
    public static int[] attack = new int[] {1,1};
    public static int[] speed = new int[] {200,300};
    public static int[] cooldown_attack = new int[] {2,1};

    public static int[] walk_value = new int[] {4,4};
    public static int[] attack_value = new int[] {4,4};

    public static string[] enemy_name_file = new string[] {"enemy-1","enemy-2"};

    public static float cooldown = 0;

    public static float[] enemy_hit_box = new float[] {3,3};
    public static float[] enemy_hit_box_size = new float[] {0,0};

    public static int?[][] spawnenemy = new int?[][]
    {
        new int?[] {0,0,0,0,0,0},
        new int?[] {1,0,1,0,1,0,0,1,0},
        new int?[] {1,0,1,0,1,0,0,1,0,0,0,1,1,1,1,1},
        new int?[] {1,0,1,0,1,0,0,1,0,0,0,1,1,1,1,1,0,1,0},
        new int?[] {1,0,1,0,1,0,0,1,0,0,0,1,1,1,1,1,0,1,0,1,1,0}
    };
    public static int?[][] spawnenemy_cooldown = new int?[][]
    {
        new int?[] {5,5,5,4,5,2},
        new int?[] {3,5,4,5,5,4,3,4,5},
        new int?[] {3,5,4,5,5,4,3,4,5,9,7,5,4,2,5,4},
        new int?[] {3,5,4,5,5,4,3,4,5,9,7,5,4,2,5,4,8,9,4},
        new int?[] {3,5,4,5,5,4,3,4,5,9,7,5,4,2,5,4,8,9,4,7,6,5}
    };

    public static CoreMain.EnemyMain[] enemy_load = new CoreMain.EnemyMain[50];
}