{
  erb-formatter = {
    dependencies = ["syntax_tree"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hr6q367ngnjjlclhjx8gma98dndmk04bj1pap5p5sqarn8ic01x";
      type = "gem";
    };
    version = "0.4.3";
  };
  prettier_print = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ybgks9862zmlx71zd4j20ky86fsrp6j6m0az4hzzb1zyaskha57";
      type = "gem";
    };
    version = "1.2.1";
  };
  syntax_tree = {
    dependencies = ["prettier_print"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g9l9acknjr2yz8ynfxbcrwx2ws3wh96pfzdb31g66k08v1022m5";
      type = "gem";
    };
    version = "6.2.0";
  };
}
