using CoreMain;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input.Touch;

namespace BattleMushroom;

public class TouchSystem : SystemCore
{
    private bool checkrun = false;

    private float touchx;
    private float oldtouchx;
    public float x;

    private int touchid = -1;
    private float touch_time;
    private float touch_time_click;

    private bool checklevel = false;
    private float levelwidth;

    private bool checkmove = false;

    public override float returnvalue()
    {
        return x;
    }
    public TouchSystem(bool level = false,float levelw = 0)
    {
        levelwidth = levelw;
        checklevel = level;
    }
    public override void Update(GameTime gameTime)
    {
        foreach (var t in Data.touch)
        {
            if (touchid == -1)
            {
                if (t.State == TouchLocationState.Pressed)
                {
                    if (touchid == -1) 
                    {
                        touch_time_click = 0;
                        touchid = t.Id; 
                    }
                }
            }

            if (t.Id != touchid)
                continue;

            switch (t.State)
            {
                case TouchLocationState.Moved:
                    touch_time_click += (float)gameTime.ElapsedGameTime.TotalSeconds;
                    if (touch_time_click <= 0.05f) break;
                    if (!checkmove)
                    {
                        checkmove = true;
                        touchx = t.Position.X;
                        oldtouchx = touchx;
                    }
                    if (!checkrun)
                    {
                        checkrun = true;
                        touchx = t.Position.X;
                        oldtouchx = touchx;
                    }
                    if (touchx == oldtouchx)
                    {
                        touch_time += (float)gameTime.ElapsedGameTime.TotalSeconds;
                        if (touch_time >= 3)
                        {
                            checkmove = false;
                            touch_time = 0;
                            touchid = -1;
                            touchx = 0;
                            oldtouchx = 0;
                            break;
                        }
                    } else
                    {
                        touch_time = 0;
                    }
                    touchx = t.Position.X;
                    x += touchx - oldtouchx;
                    if (checklevel)
                    {
                        if (x <= levelwidth)
                        {
                            x = levelwidth;
                        } else if (x >= 0)
                        {
                            x = 0;
                        }
                    }
                    oldtouchx = touchx;
                    break;
                case TouchLocationState.Released:
                    touchid = -1;
                    touchx = 0;
                    oldtouchx = 0;
                    checkmove = false;
                    break;
            }
        }
    }
}
