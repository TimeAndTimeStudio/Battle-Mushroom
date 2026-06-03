using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using AndroidX.Core.View;
using Microsoft.Xna.Framework;
//using System.Runtime.Versioning;

namespace BattleMushroom
{
    [Activity(
        Label = "@string/app_name",
        MainLauncher = true,
        Icon = "@drawable/icon",
        AlwaysRetainTaskState = true,
        LaunchMode = LaunchMode.SingleInstance,
        ScreenOrientation = ScreenOrientation.Landscape,
        ConfigurationChanges = ConfigChanges.KeyboardHidden,
        Theme = "@style/AppTheme"
    )]
    public class Main : AndroidGameActivity
    {
        private GameMain _game;
        private View _view;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            EnableFullscreen(); // เปิด fullscreen
            
            _game = new GameMain();
            _view = _game.Services.GetService(typeof(View)) as View;

            SetContentView(_view);
            _game.Run();
        }

        void EnableFullscreen()
        {
            WindowCompat.SetDecorFitsSystemWindows(Window, false);

            var controller = WindowCompat.GetInsetsController(Window, Window.DecorView);

            if (controller != null)
            {
                controller.Hide(WindowInsetsCompat.Type.SystemBars());
                controller.SystemBarsBehavior =
                    (int)WindowInsetsControllerCompat.BehaviorShowTransientBarsBySwipe;
            }

            Window.Attributes.LayoutInDisplayCutoutMode =
                    LayoutInDisplayCutoutMode.ShortEdges;
        }
    }
}