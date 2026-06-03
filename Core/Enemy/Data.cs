public static class Data_Enemy
{
    public static int[] hp = new int[] {10};
    public static int[] attack = new int[] {1};
    public static int[] speed = new int[] {200};
    public static int[] cooldown_attack = new int[] {2};

    public static int[] walk_value = new int[] {4};
    public static int[] attack_value = new int[] {4};

    public static string[] enemy_name_file = new string[] {"enemy-1"};

    public static float cooldown = 0;

    public static int?[][] spawnenemy = new int?[][]
    {
        new int?[] {0,0,0,0,0,0}
    };
    public static int?[][] spawnenemy_cooldown = new int?[][]
    {
        new int?[] {5,5,5,4,5,2}
    };

    public static CoreMain.EnemyMain[] enemy_load = new CoreMain.EnemyMain[20];
}