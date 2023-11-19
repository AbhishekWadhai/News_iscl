class NewsArticles{
  String imgUrl;
  String newsHeadline;
  String date;
  String newsDesc;
  String newsUrl;

  NewsArticles({
    required this.imgUrl,
    required this.newsHeadline,
    required this.date,
    required this.newsDesc,
    required this.newsUrl
});

  static NewsArticles fromAPItoApp(Map<String, dynamic> myData){
    return NewsArticles(
        imgUrl: myData['imageUrl'] ?? 'https://images.unsplash.com/photo-1610513320995-1ad4bbf25e55?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        newsHeadline: myData['title'] ?? 'News yet to load',
        date: myData['date'] ?? '0 xyz',
        newsDesc: myData['content'] ?? 'Opps, Nothing more to show',
        newsUrl: myData['url'] ?? 'https://images.unsplash.com/photo-1589876981668-03e78101c97f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
  }

}