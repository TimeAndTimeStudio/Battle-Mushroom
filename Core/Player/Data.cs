public static class Data_Player
{
    public static int[] hp = new int[] {10,6};
    public static int[] attack = new int[] {2,1};
    public static int[] speed = new int[] {250,350};
    public static int[] cooldown_attack = new int[] {2,1};

    public static int[] walk_value = new int[] {4,4};
    public static int[] attack_value = new int[] {4,4};

    public static string[] player_name_file = new string[] {"player-1","player-2"};
    public static int[] player_cooldown = new int[] {5,3};
    public static int[] player_coin = new int[] {50,35};
    
    public static bool[] player_list =  new bool[] {true,false};
    public static float[] cooldown = new float[5];

    public static CoreMain.PlayerMain[] player_load = new CoreMain.PlayerMain[20];
}