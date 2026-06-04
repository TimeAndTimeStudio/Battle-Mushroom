using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using System.Collections.Generic;

public static class ThaiTextRenderer
{
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

    private static readonly HashSet<char> BelowChars = new HashSet<char>
    {
        '\u0E38', // ุ
        '\u0E39', // ู
        '\u0E3A', // ฺ
    };

    private static readonly HashSet<char> LeadingChars = new HashSet<char>
    {
        '\u0E40', // เ
        '\u0E41', // แ
        '\u0E42', // โ
        '\u0E43', // ใ
        '\u0E44', // ไ
    };

    private static readonly HashSet<char> TrailingChars = new HashSet<char>
    {
        '\u0E33', // ำ
    };

    private static readonly HashSet<char> ToneMarks = new HashSet<char>
    {
        '\u0E48', // ่  mai ek
        '\u0E49', // ้  mai tho
        '\u0E4A', // ๊  mai tri
        '\u0E4B', // ๋  mai jattawa
    };

    private static readonly HashSet<char> ShortAboveVowels = new HashSet<char>
    {
        '\u0E31', // ั
        '\u0E47', // ็
    };

    // ─────────────────────────────────────────────
    //  ค่าปรับตำแหน่ง
    // ─────────────────────────────────────────────

    public static float AboveOffsetY                =    0f;
    public static float AboveOffsetX                =    0f;

    public static float ToneMarkOffsetX             =   16f;
    public static float ToneMarkOffsetY             =  -40f;  // มีสระบนสูง เช่น กิ่
    public static float ToneMarkOffsetYShortAbove   =  -30f;  // มีสระบนสั้น เช่น กั่
    public static float ToneMarkOffsetYNoAbove      =  -10f;  // ไม่มีสระบน เช่น ก่

    public static float BelowOffsetY                = -145f;
    public static float BelowOffsetX                =   16f;

    public static float LeadingOffsetX              =    4f;
    public static float TrailingOffsetX             =   -40f;  // ลบ = ชิดซ้าย (ชิดตัวหน้า)

    public static float ThaiSpacing                 =    0f;
    public static float LineSpacingExtra            =   60f;  // บวกเพิ่มจาก font.LineSpacing

    // ─────────────────────────────────────────────

    private static bool IsThai(char c) => c >= '\u0E00' && c <= '\u0E7F';

    private struct ThaiCluster
    {
        public char   Base;
        public string AboveVowels;   // non-tone above chars
        public string ToneGlyphs;    // tone marks only
        public string BelowGlyphs;
        public char   LeadingChar;
        public char   TrailingChar;
        public bool   HasLeading     => LeadingChar  != '\0';
        public bool   HasTrailing    => TrailingChar != '\0';
        public bool   HasAboveVowel  => AboveVowels.Length > 0;

        public bool HasOnlyShortAbove
        {
            get
            {
                if (AboveVowels.Length == 0) return false;
                foreach (char c in AboveVowels)
                    if (!ShortAboveVowels.Contains(c)) return false;
                return true;
            }
        }
    }

    private struct Segment
    {
        public string Text;
        public bool   IsThai;
    }

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

    private static List<ThaiCluster> ParseClusters(string text)
    {
        var clusters = new List<ThaiCluster>();
        int i = 0;

        while (i < text.Length)
        {
            char c = text[i];

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
                Base         = c,
                LeadingChar  = leading,
                TrailingChar = '\0',
                AboveVowels  = "",
                ToneGlyphs   = "",
                BelowGlyphs  = ""
            };
            i++;

            while (i < text.Length)
            {
                char next = text[i];
                if (AboveChars.Contains(next))
                {
                    if (ToneMarks.Contains(next))
                        cluster.ToneGlyphs  += next;
                    else
                        cluster.AboveVowels += next;
                    i++;
                }
                else if (BelowChars.Contains(next))    { cluster.BelowGlyphs   = next.ToString(); i++; }
                else if (TrailingChars.Contains(next)) { cluster.TrailingChar  = next;            i++; }
                else break;
            }

            clusters.Add(cluster);
        }

        return clusters;
    }

    private static string[] SplitLines(string text)
        => text.Split(new[] { "\r\n", "\n" }, System.StringSplitOptions.None);

    private static float GetLineHeight(SpriteFont font, float scale)
        => (font.LineSpacing + LineSpacingExtra) * scale;

    // ─────────────────────────────────────────────
    //  MeasureString
    // ─────────────────────────────────────────────

    public static Vector2 MeasureString(SpriteFont font, string text, float scale = 1f)
    {
        string[] lines      = SplitLines(text);
        float    lineHeight = GetLineHeight(font, scale);
        float    maxW       = 0f;

        foreach (string line in lines)
        {
            float lineW = MeasureSingleLine(font, line, scale);
            if (lineW > maxW) maxW = lineW;
        }

        return new Vector2(maxW, lineHeight * lines.Length);
    }

    private static float MeasureSingleLine(SpriteFont font, string text, float scale)
    {
        if (string.IsNullOrEmpty(text)) return 0f;

        var   segs   = SplitSegments(text);
        float totalW = 0f;

        foreach (var seg in segs)
        {
            if (!seg.IsThai)
            {
                totalW += font.MeasureString(seg.Text).X * scale;
            }
            else
            {
                float spacing = (font.Spacing + ThaiSpacing) * scale;
                foreach (var cl in ParseClusters(seg.Text))
                {
                    if (cl.HasLeading)
                        totalW += font.MeasureString(cl.LeadingChar.ToString()).X * scale + spacing;

                    totalW += font.MeasureString(cl.Base.ToString()).X * scale + spacing;

                    if (cl.HasTrailing)
                        totalW += font.MeasureString(cl.TrailingChar.ToString()).X * scale
                                  + TrailingOffsetX * scale;
                }
            }
        }

        return totalW - 16f;
    }

    // ─────────────────────────────────────────────
    //  DrawString
    // ─────────────────────────────────────────────

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

        string[] lines      = SplitLines(text);
        float    lineHeight = GetLineHeight(font, scale);

        for (int i = 0; i < lines.Length; i++)
        {
            Vector2 linePos = new Vector2(position.X, position.Y + i * lineHeight);
            DrawSingleLine(spriteBatch, font, lines[i], linePos,
                           color, rotation, origin, scale, spriteEffects, layerDepth);
        }
    }

    private static void DrawSingleLine(
        SpriteBatch   spriteBatch,
        SpriteFont    font,
        string        text,
        Vector2       position,
        Color         color,
        float         rotation,
        Vector2       origin,
        float         scale,
        SpriteEffects spriteEffects,
        float         layerDepth)
    {
        if (string.IsNullOrEmpty(text)) return;

        var   segs    = SplitSegments(text);
        float cursorX = position.X;

        foreach (var seg in segs)
        {
            if (!seg.IsThai)
            {
                spriteBatch.DrawString(
                    font, seg.Text,
                    new Vector2(cursorX, position.Y),
                    color, rotation, origin, scale,
                    spriteEffects, layerDepth);

                cursorX += font.MeasureString(seg.Text).X * scale;
            }
            else
            {
                float spacing = (font.Spacing + ThaiSpacing) * scale;

                foreach (var cl in ParseClusters(seg.Text))
                {
                    // [1] สระหน้า
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
                    string baseStr = cl.Base.ToString();
                    float  baseW   = font.MeasureString(baseStr).X * scale;
                    float  baseH   = font.MeasureString(baseStr).Y * scale;

                    spriteBatch.DrawString(
                        font, baseStr,
                        new Vector2(cursorX, position.Y),
                        color, rotation, origin, scale,
                        spriteEffects, layerDepth);

                    // [3] สระบน (non-tone)
                    foreach (char av in cl.AboveVowels)
                    {
                        string avStr   = av.ToString();
                        float  avW     = font.MeasureString(avStr).X * scale;
                        float  centerX = (baseW - avW) / 2f;

                        spriteBatch.DrawString(
                            font, avStr,
                            new Vector2(
                                cursorX + centerX + AboveOffsetX * scale,
                                position.Y + AboveOffsetY * scale),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);
                    }

                    // [4] วรรณยุกต์
                    foreach (char tg in cl.ToneGlyphs)
                    {
                        string tgStr   = tg.ToString();
                        float  tgW     = font.MeasureString(tgStr).X * scale;
                        float  centerX = (baseW - tgW) / 2f;

                        float posY;
                        if (!cl.HasAboveVowel)
                            posY = position.Y + ToneMarkOffsetYNoAbove    * scale;
                        else if (cl.HasOnlyShortAbove)
                            posY = position.Y + ToneMarkOffsetYShortAbove * scale;
                        else
                            posY = position.Y + AboveOffsetY * scale + ToneMarkOffsetY * scale;

                        spriteBatch.DrawString(
                            font, tgStr,
                            new Vector2(
                                cursorX + centerX + AboveOffsetX * scale + ToneMarkOffsetX * scale,
                                posY),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);
                    }

                    // [5] สระล่าง
                    foreach (char bg in cl.BelowGlyphs)
                    {
                        string bgStr   = bg.ToString();
                        float  bgW     = font.MeasureString(bgStr).X * scale;
                        float  centerX = (baseW - bgW) / 2f;

                        spriteBatch.DrawString(
                            font, bgStr,
                            new Vector2(
                                cursorX + centerX + BelowOffsetX * scale,
                                position.Y + baseH + BelowOffsetY * scale),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);
                    }

                    // [6] สระตาม เช่น ำ ๅ
                    if (cl.HasTrailing)
                    {
                        string trStr = cl.TrailingChar.ToString();
                        float  trW   = font.MeasureString(trStr).X * scale;

                        spriteBatch.DrawString(
                            font, trStr,
                            new Vector2(cursorX + baseW + TrailingOffsetX * scale, position.Y),
                            color, rotation, origin, scale,
                            spriteEffects, layerDepth);

                        cursorX += trW + TrailingOffsetX * scale;
                    }

                    cursorX += baseW + spacing;
                }
            }
        }
    }
}