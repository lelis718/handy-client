enum Pages{
  Intro,
  HelpSelector,
  HelpList,
  HelpDetail,
  Chat,
  NeedHelp,
  MyHelpRequests,
}

abstract class HandyPageRoute{
  static final routes = {
    Pages.Intro:"/intro",
    Pages.HelpSelector:"/help-selector",
    Pages.HelpList:"/help-list",
    Pages.HelpDetail:"/help-detail",
    Pages.Chat:"/chat",
    Pages.NeedHelp:"/need-help",
    Pages.MyHelpRequests:"/my-requests",
  };

  static String mapTo(Pages page){
    return HandyPageRoute.routes[page];
  }
}