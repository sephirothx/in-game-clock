void Render() {
  if (ShouldHideWidget()) return;

  auto windowCond = Setting_LockPosition ? UI::Cond::Always : UI::Cond::Appearing;

  SetStyle();
  UI::SetNextWindowPos(int(Setting_Position.x), int(Setting_Position.y), windowCond);
  UI::Begin("In Game Clock", GetWindowFlags());

  if (Setting_LockPosition == false) {
    Setting_Position = UI::GetWindowPos();
  }

  RenderTime();

  UI::End();
  ResetStyle();
}

void RenderTime() {
  string t = Setting_UseUtcTime
    ? Time::FormatStringUTC(Setting_TimeFormat)
    : Time::FormatString(Setting_TimeFormat);
  UI::Text(t);
}

bool ShouldHideWidget() {
  auto playground = GetApp().CurrentPlayground;

  bool is_introsequence = playground !is null && playground.UIConfigs.Length > 0 && playground.UIConfigs[0].UISequence == CGamePlaygroundUIConfig::EUISequence::Intro;

  return Setting_HideInIntroSequence && is_introsequence ||
         Setting_HideInMainMenu && playground is null;
}

int GetWindowFlags() {
  auto ret = UI::WindowFlags::NoTitleBar |
             UI::WindowFlags::NoCollapse |
             UI::WindowFlags::AlwaysAutoResize |
             UI::WindowFlags::NoDocking;

  if (Setting_LockPosition) {
    ret |= UI::WindowFlags::NoMove;
  }

  return ret;
}

void SetStyle() {
  if (Setting_UseDefaultColors) return;

  UI::PushStyleColor(UI::Col::WindowBg, Setting_WidgetBackgroundColor);
  UI::PushStyleColor(UI::Col::Border, Setting_WidgetBorderColor);
  UI::PushStyleColor(UI::Col::Text, Setting_TextColor);
}

void ResetStyle() {
  if (Setting_UseDefaultColors) return;

  UI::PopStyleColor(3);
}
