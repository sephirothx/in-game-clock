void Render() {
  if (ShouldHideWidget()) return;

  auto windowCond = Setting_LockPosition ? UI::Cond::Always : UI::Cond::Appearing;
  UI::SetNextWindowPos(int(Setting_Position.x), int(Setting_Position.y), windowCond);

  int windowFlags = UI::WindowFlags::NoTitleBar |
                    UI::WindowFlags::NoCollapse |
                    UI::WindowFlags::AlwaysAutoResize |
                    UI::WindowFlags::NoDocking;
  UI::Begin("In Game Clock", windowFlags);

  if (Setting_LockPosition == false) {
    Setting_Position = UI::GetWindowPos();
  }

  UI::Text(Time::FormatString(Setting_TimeFormat));

  UI::End();
}

bool ShouldHideWidget() {
  auto app = GetApp();
  auto playground = app.CurrentPlayground;

  bool hidden_interface = playground !is null && playground.Interface !is null && Dev::GetOffsetUint32(playground.Interface, 0x1C) == 0;
  bool is_introsequence = playground !is null && playground.UIConfigs.Length > 0 && playground.UIConfigs[0].UISequence == CGamePlaygroundUIConfig::EUISequence::Intro;

  return Setting_HideWithInterface && (hidden_interface || is_introsequence) ||
         (Setting_HideInMainMenu && playground is null);
}
