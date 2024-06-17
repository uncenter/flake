{
  home.file = let
    common = "Library/Application Support/Vencord/settings/";
  in {
    "${common}settings.json".source = ./settings.json;
    "${common}quickCss.css".source = ./quickCss.css;
  };
}
