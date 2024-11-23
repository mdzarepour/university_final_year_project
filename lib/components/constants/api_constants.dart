class ApiConstants {
  static const postRegister = "${baseUrl}register/action.php";
  static const postVerifyCode = "${baseUrl}register/action.php";
  static const String newArticle =
      "${baseUrl}article/get.php?command=new&user_id=1";
  static const hostDonwload = "https://techblog.sasansafari.com/";
  static const String favoriteArticles =
      "${baseUrl}article/get.php?command=favorites&user_id=1";
  static const String publishedByMeArticles =
      "${baseUrl}article/get.php?command=published_by_me&user_id=1";
  static const String getArticleWithCatId =
      "${baseUrl}article/get.php?command=get_articles_with_cat_id&cat_id=1&user_id=1";
  static const String newPodcasts =
      "${baseUrl}podcast/get.php?command=new&user_id=1";
  static const String favoritePodcastList =
      "${baseUrl}podcast/get.php?command=favorites&user_id=1";
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const String publishedByMePodcasts =
      "${baseUrl}podcast/get.php?command=published_by_me&user_id=1";
  static const String getPodcastFiles =
      "${baseUrl}podcast/get.php?command=get_files&podcats_id=1";
  static const String getHomeItems = "${baseUrl}home/?command=index";
  static const String getInfo = "${baseUrl}user/?command=info&user_id=2";
  static const String getAppCategories =
      "${baseUrl}article/get.php?command=categories";
  static const String getTags = "${baseUrl}article/get.php?command=tags";
}
