[Setting category="General" name="Lock widget position"]
bool Setting_LockPosition = false;

[Setting category="General" name="Widget position"]
vec2 Setting_Position = vec2(0, 24);

[Setting category="General" name="Hide during intro sequence"]
bool Setting_HideInIntroSequence = true;

[Setting category="General" name="Hide in main menu"]
bool Setting_HideInMainMenu = false;



[Setting category="Appearence" name="Font size" min=16 max=72]
int Setting_FontSize = 16;

[Setting category="Appearence" name="Use default colors" description="Disable to use the colors chosen below"]
bool Setting_UseDefaultColors = true;

[Setting category="Appearence" name="Widget color" color]
vec4 Setting_WidgetBackgroundColor = vec4(0, 0, 0, 0.7f);

[Setting category="Appearence" name="Widget border color" color]
vec4 Setting_WidgetBorderColor = vec4(0, 0, 0, 0.7f);

[Setting category="Appearence" name="Text color" color]
vec4 Setting_TextColor = vec4(1, 1, 1, 1);



[Setting category="Time Format" name="Use UTC time"]
bool Setting_UseUtcTime = false;

[Setting category="Time Format" name="Format" description="All time format specifications here: https://www.php.net/manual/en/function.strftime.php"]
string Setting_TimeFormat = "%T";
