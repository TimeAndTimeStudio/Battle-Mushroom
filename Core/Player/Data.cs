public static class Data_Player
{
    public static int[] hp = new int[] {10,3,2,15};
    public static int[] attack = new int[] {1,1,1,1};
    public static int[] speed = new int[] {250,350,300,200};
    public static int[] cooldown_attack = new int[] {2,1,3,5};

    public static int[] walk_value = new int[] {4,4,4,4};
    public static int[] attack_value = new int[] {4,4,14,12};

    public static string[] player_name_file = new string[] {"player-1","player-2","player-3","player-4"};
    public static int[] player_cooldown = new int[] {5,5,7,5};
    public static int[] player_coin = new int[] {70,35,40,80};

    public static float[] player_size = new float[] {0,0,0,32};
    public static float[] player_size_icon = new float[] {24,24,24,32};
    
    public static float[] player_hit_box = new float[] {3,3,3,3};
    public static float[] player_hit_box_s1 = new float[] {32,32,32,16};
    public static float[] player_hit_box_size = new float[] {0,0,1.6f,0};
    public static bool[] player_list =  new bool[] {true,false,false,false};
    public static float[] cooldown = new float[5];

    public static CoreMain.PlayerMain[] player_load = new CoreMain.PlayerMain[50];
}