using System;
using System.Globalization;
using System.IO;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input.Touch;

namespace BattleMushroom;

public class GameMain : Game
{
    private GraphicsDeviceManager _graphics;
    private SpriteBatch _spriteBatch;

    private bool check_run = false;

    public GameMain()
    {
        _graphics = new GraphicsDeviceManager(this);
        Content.RootDirectory = "Content";

        IsFixedTimeStep = true;                               
        TargetElapsedTime = TimeSpan.FromSeconds(1.0 / 30.0);
    }

    protected override void Initialize()
    {
        // TODO: Add your initialization logic here

        base.Initialize();
    }

    protected override void LoadContent()
    {
        Console.WriteLine(Android.App.Application.Context.GetExternalFilesDir(null)!.AbsolutePath);
        _spriteBatch = new SpriteBatch(GraphicsDevice);

        Data.Tiny5 = Content.Load<SpriteFont>("Font/Tiny5");

        if (Directory.Exists(Path.Combine(Android.App.Application.Context.GetExternalFilesDir(null).AbsolutePath, "data")))
        {
            if (File.Exists(Path.Combine(Android.App.Application.Context.GetExternalFilesDir(null).AbsolutePath, "data", "game.bin")))
            {
                Data.load();
                Data.updatehptower();
            }
            if (File.Exists(Path.Combine(Android.App.Application.Context.GetExternalFilesDir(null).AbsolutePath, "data", "gamedata.bin")))
            {
                Data.loaddata();
            }
        }

        CultureInfo.CurrentUICulture = new CultureInfo(Data.Language);
    }

    protected override void Update(GameTime gameTime)
    {
        Data.touch = TouchPanel.GetState();

        if (!check_run)
        {
            check_run = true;
            Data.sceneload = new CoreMain.GameLoading();
        }

        if (Data.exit) 
        {
            Android.OS.Process.KillProcess(Android.OS.Process.MyPid());
        }
        if (!Data.checksceneload && Data.sceneload != null)
        {
            Data.sceneload.ContentLoad(Content,GraphicsDevice);
        }

        if (Data.sceneload != null && Data.checksceneload)
        {
            Data.sceneload.Update(GraphicsDevice,gameTime,Content);
        }

        base.Update(gameTime);
    }

    protected override void Draw(GameTime gameTime)
    {
        if (Data.sceneload != null && Data.checksceneload)
        {
            Data.sceneload.Draw(_spriteBatch,GraphicsDevice);
        }
        
        base.Draw(gameTime);
    }
}
