_: {
  programs.newsboat = {
    enable = true;
    # catppuccin.enable = true;

    browser = "open %u";
    urls = builtins.map (x: {"url" = x;}) [
      "https://uncenter.dev/feed.xml"
      "https://ryanccn.dev/feed/rss.xml"
      "https://shivjm.blog/feed.xml"
      "https://coryd.dev/feed.xml"
      "https://sandroroth.com/feeds/blog.xml"
      "https://binyam.in/feeds/blog.xml"
      "https://tonsky.me/blog/atom.xml"
      "https://tty1.blog/feed/"
      "https://sindresorhus.com/rss.xml"
      "https://bower.sh/rss"
      "https://fasterthanli.me/index.xml"
      "https://antfu.me/feed.xml"
      "https://tylersticka.com/journal/feed.xml"
      "https://andy-bell.co.uk/feed.xml"
      "https://zackoverflow.dev/rss.xml"
      "https://andadinosaur.com/home.rss"
      "https://blog.jim-nielsen.com/feed.xml"
      "https://humanwhocodes.com/feeds/blog.xml"
      "https://mitchellh.com/feed.xml"
      "https://chrisdone.com/rss.xml"
      "https://www.hoeser.dev/feed.xml"
      "https://daverupert.com/atom.xml"
      "https://blog.orhun.dev/rss.xml"
      "https://evanhahn.com/blog/index.xml"
      "https://www.11ty.dev/blog/feed.xml"
      "https://thorstenball.com/atom.xml"
      "https://registerspill.thorstenball.com/feed"
      "https://isabelroses.com/rss.xml"
      "https://boehs.org/in/blog.xml"
      "https://huonw.github.io/blog/atom.xml"
    ];
  };
}
