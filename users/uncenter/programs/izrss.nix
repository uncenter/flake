{inputs, ...}: {
  imports = [inputs.beapkgs.homeManagerModules.default];

  config.programs.izrss = {
    enable = true;

    settings = {
      dateformat = "2006/01/02";

      reader = {
        read_threshold = 0.5;
      };

      urls = [
        "https://uncenter.dev/feed.xml"
        "https://ryanccn.dev/feed/rss.xml"
        "https://shivjm.blog/feed.xml"
        "https://sandroroth.com/feeds/blog.xml"
        "https://binyam.in/feeds/blog.xml"
        "https://tonsky.me/blog/atom.xml"
        "https://tty1.blog/feed/"
        "https://sindresorhus.com/rss.xml"
        "https://bower.sh/rss"
        "https://fasterthanli.me/index.xml"
        "https://antfu.me/feed.xml"
        "https://zackoverflow.dev/rss.xml"
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
        "https://nixpkgs.news/rss.xml"
        "https://maia.crimew.gay/feed.xml"
        "https://rbluethl.com/rss"
        "https://lucumr.pocoo.org/feed.atom"
        "https://yorickpeterse.com/feed.xml"
        "https://ardislu.dev/atom.xml"
        "https://kettanaito.com/blog/rss.xml"
        "https://kilo.bytesize.xyz/feed/"
        "https://bytesize.xyz/feed/"
        "https://piccalil.li/feed.xml"
        "https://zed.dev/blog.rss"
        "https://www.sophiajt.com/atom.xml"
        "https://robinmalfait.com/feed.xml"
        "https://this-week-in-rust.org/atom.xml"
        "https://twobithistory.org/feed.xml"
        "https://ruudvanasseldonk.com/feed.xml"
      ];
    };
  };
}
