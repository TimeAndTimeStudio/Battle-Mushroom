using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using System.Collections.Generic;

public static class ThaiTextRenderer
{
    // สระบน / วรรณยุกต์ (ซ้อนเหนือตัวอักษรหลัก)
    private static readonly HashSet<char> AboveChars = new HashSet<char>
    {
        '\u0E31', // ั
        '\u0E34', // ิ
        '\u0E35', // ี
        '\u0E36', // ึ
        '\u0E37', // ื
        '\u0E47', // ็
        '\u0E48', // ่
        '\u0E49', // ้
        '\u0E4A', // ๊
        '\u0E4B', // ๋
        '\u0E4C', // ์
        '\u0E4D', // ํ
        '\u0E4E', // ๎
    };

    // สระล่าง (ห้อยใต้ตัวอักษรหลัก)
    private static readonly HashSet<char> BelowChars = new HashSet<char>
    {
        '\u0E38', // ุ
        '\u0E39', // ู
        '\u0E3A', // ฺ
    };

    // สระหน้า (วาดก่อนตัวอักษรหลัก)
    private static readonly HashSet<char> LeadingChars = new HashSet<char>
    {
        '\u0E40', // เ
        '\u0E41', // แ
        '\u0E42', // โ
        '\u0E43', // ใ
        '\u0E44', // ไ
    };

    // วรรณยุกต์ที่ต้องการ offset แยกจากสระบนทั่วไป
    private static readonly HashSet<char> ToneMarks = new HashSet<char>
    {
        '\u0E48', // ่  mai ek
        '\u0E49', // ้  mai tho
        '\u0E4A', // ๊  mai tri
        '\u0E4B', // ๋  mai jattawa
    };

    // ─────────────────────────────────────────────
    //  ค่าปรับตำแหน่ง — แก้ตรงนี้ให้พอดีกับ font
    // ─────────────────────────────────────────────

    // สระบนทั่วไป เช่น ิ ี ึ ื ็ ์ ํ
    public static float AboveOffsetY    = -10f; // ลบ = ขึ้น, บวก = ลง
    public static float AboveOffsetX    =   0f; // ลบ = ซ้าย, บวก = ขวา

    // วรรณยุกต์ ่ ้ ๊ ๋ (บวกเพิ่มจาก AboveOffset)
    public static float ToneMarkOffsetX =   16f; // ลบ = ซ้าย, บวก = ขวา (เลื่อนไปปลายตัวอักษร)
    public static float ToneMarkOffsetY =   -4f; // ลบ = ขึ้น, บวก = ลง

    // สระล่าง เช่น ุ ู
    public static float BelowOffsetY    =   4f; // ลบ = ขึ้น, บวก = ลง

    // สระหน้า เช่น เ แ โ ใ ไ
    public static float LeadingOffsetX  =  4f; // ลบ = ซ้าย, บวก = ขวา (ชิดตัวอักษรหลัก)

    // ระยะห่างระหว่างตัวอักษรไทย บวกเพิ่มจาก font.Spacing
    // 0f = เท่ากับ font.Spacing, ลบ = ชิดกว่า, บวก = ห่างกว่า
    public static float ThaiSpacing     =   0f;

    // ─────────────────────────────────────────────

    // ตรวจว่าเป็นอักขระในบล็อก Thai Unicode หรือไม่
    private static bool IsThai(char c) => c >= '\u0E00' && c <= '\u0E7F';

    private struct ThaiCluster
    {
        public char   Base;
        public string AboveGlyphs;
        public string BelowGlyphs;
        public char   LeadingChar;
        public bool   HasLeading => LeadingChar != '\0';
    }

    // segment = ช่วง Thai หรือ non-Thai ที่ติดกัน
    private struct Segment
    {
        public string Text;
        public bool   IsThai;
    }

    // แบ่ง string เป็น segment Thai / non-Thai
    private static List<Segment> SplitSegments(string text)
    {
        var  segs  = new List<Segment>();
        if (string.IsNullOrEmpty(text)) return segs;

        int  i     = 0;
        bool thai  = IsThai(text[0]);
        int  start = 0;

        while (++i <= text.Length)
        {
            bool cur = i < text.Length && IsThai(text[i]);
            if (i == text.Length || cur != thai)
            {
                segs.Add(new Segment { Text = text.Substring(start, i - start), IsThai = thai });
                start = i;
                if (i < text.Length) thai = cur;
            }
        }

        return segs;
    }

    // แยก string ภาษาไทยเป็น cluster (ตัวหลัก + diacritics ที่ตามมา)
    private static List<ThaiCluster> ParseClusters(string text)
    {
        var clusters = new List<ThaiCluster>();
        int i = 0;

        while (i < text.Length)
        {
            char c = text[i];

            // ดักสระหน้าก่อนตัวหลัก
            char leading = '\0';
            if (LeadingChars.Contains(c))
            {
                leading = c;
                i++;
                if (i >= text.Length) break;
                c = text[i];
            }

            var cluster = new ThaiCluster
            {
                Base        = c,
                LeadingChar = leading,
                AboveGlyphs = "",
                BelowGlyphs = ""
            };
            i++;

            // เก็บ diacritics ที่ตามหลังตัวหลัก
            while (i < text.Length)
            {
                char next = text[i];
                if      (AboveChars.Contains(next)) { cluster.AboveGlyphs += next; i++; }
                else if (BelowChars.Contains(next)) { cluster.BelowGlyphs += next; i++; }
                else break;
            }

            clusters.Add(cluster);
        }

        return clusters;
    }

    // วัดขนาดข้อความ (ใช้แทน font.MeasureString สำหรับข้อความที่มีภาษาไทย)
    public static Vector2 MeasureString(SpriteFont font, string text, float scale = 1f)
    {
        var   segs   = SplitSegments(text);
        float totalW = 0f;
        float maxH   = 0f;

        foreach (var seg in segs)
        {
            if (!seg.IsThai)
            {
                // non-Thai: MeasureString ปกติ รวม kerning ของ font
                Vector2 sz = font.MeasureString(seg.Text) * scale;
                totalW += sz.X;
                if (sz.Y > maxH) maxH = sz.Y;
            }
            else
            {
                // Thai: วัดทีละ cluster และบวก spacing เอง
                float spacing = (font.Spacing + ThaiSpacing) * scale;
                foreach (var cl in ParseClusters(seg.Text))
                {
                    if (cl.HasLeading)
                        totalW += font.MeasureString(cl.LeadingChar.ToString()).X * scale + spacing;

                    totalW += font.MeasureString(cl.Base.ToString()).X * scale + spacing;
                    float h = font.MeasureString(cl.Base.ToString()).Y * scale;
                    if (h > maxH) maxH = h;
                }
            }
        }

        return new Vector2(totalW, maxH);
    }

    // วาดข้อความ (ใช้แทน spriteBatch.DrawString สำหรับข้อความที่มีภาษาไทย)
    public static void DrawString(
        SpriteBatch   spriteBatch,
        SpriteFont    font,
        string        text,
        Vector2       position,
        Color         color,
        float         rotation      = 0f,
        Vector2       origin        = default,
        float         scale         = 1f,
        SpriteEffects spriteEffects = SpriteEffects.None,
        float         layerDepth    = 0f)
    {
        if (string.IsNullOrEmpty(text)) return;

        var   segs    = SplitSegments(text);
        float cursorX = position.X;

        foreach (var seg in segs)
        {
            if (!seg.IsThai)
            {
                // non-Thai: DrawString ทั้ง segment เพื่อให้ kerning ทำงาน
                spriteBatch.DrawString(
                    font, seg.Text,
                    new Vector2(cursorX, position.Y),
                    color, rotation, origin, scale,
                    spriteEffects, layerDepth);

                cursorX += font.MeasureString(seg.Text).X * scale;
            }
            else
            {
                // Thai: วาดทีละ cluster แยก layer บน/ล่าง
                float spacing = (font.Spacing + ThaiSpacing) * scale;

                foreach (var cl in ParseClusters(seg.Text))
                {
                    // [1] สระหน้า เช่น เ แ โ ใ ไ
                    //     วาดก่อนตัวหลัก แล้วเลื่อน cursor
                    if (cl.HasLeading)
                    {
                        string leadStr = cl.LeadingChar.ToString();
                        spriteBatch.DrawString(
                            font, leadStr,
                            new Vector2(cursorX + LeadingOffsetX, position.Y),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);

                        cursorX += font.MeasureString(leadStr).X * scale + spacing;
                    }

                    // [2] ตัวอักษรหลัก
                    //     วาดที่ cursorX, Y ปัจจุบัน
                    string baseStr = cl.Base.ToString();
                    float  baseW   = font.MeasureString(baseStr).X * scale;
                    float  baseH   = font.MeasureString(baseStr).Y * scale;

                    spriteBatch.DrawString(
                        font, baseStr,
                        new Vector2(cursorX, position.Y),
                        color, rotation, origin, scale,
                        spriteEffects, layerDepth);

                    // [3] วรรณยุกต์ / สระบน เช่น ิ ี ็ ์ ่ ้
                    //     วาดซ้อนเหนือตัวหลัก โดยจัดกึ่งกลางแนวนอน
                    //     วรรณยุกต์ ่ ้ ๊ ๋ จะได้ ToneMarkOffset เพิ่มด้วย
                    foreach (char ag in cl.AboveGlyphs)
                    {
                        string agStr   = ag.ToString();
                        float  agW     = font.MeasureString(agStr).X * scale;
                        float  centerX = (baseW - agW) / 2f;          // จัดกึ่งกลางบนตัวหลัก
                        bool   isTone  = ToneMarks.Contains(ag);
                        float  extraX  = isTone ? ToneMarkOffsetX * scale : 0f;
                        float  extraY  = isTone ? ToneMarkOffsetY * scale : 0f;
                        float  posX    = cursorX + centerX + AboveOffsetX * scale + extraX;
                        float  posY    = position.Y + AboveOffsetY * scale + extraY;

                        spriteBatch.DrawString(
                            font, agStr,
                            new Vector2(posX, posY),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);
                    }

                    // [4] สระล่าง เช่น ุ ู
                    //     วาดซ้อนใต้ตัวหลัก โดยจัดกึ่งกลางแนวนอน
                    foreach (char bg in cl.BelowGlyphs)
                    {
                        string bgStr   = bg.ToString();
                        float  bgW     = font.MeasureString(bgStr).X * scale;
                        float  centerX = (baseW - bgW) / 2f;          // จัดกึ่งกลางใต้ตัวหลัก
                        float  posX    = cursorX + centerX;
                        float  posY    = position.Y + baseH + BelowOffsetY * scale;

                        spriteBatch.DrawString(
                            font, bgStr,
                            new Vector2(posX, posY),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);
                    }

                    // เลื่อน cursor ไปตัวถัดไป
                    cursorX += baseW + spacing;
                }
            }
        }
    }
}