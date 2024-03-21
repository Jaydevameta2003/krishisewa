class Article {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Article({
    this.author = "AUTHOR",
    this.title = "NEWS TITLE",
    this.description = "SOME NEWS",
    this.urlToImage = "SOME IMG URL",
    this.url = "SOME NEWS URL",
    this.publishedAt = "PUBLISHER",
    this.content = "CONTENT",
  });

  factory Article.fromMap(Map news){
    return Article(
      author: news['author'] ?? "AUTHOR",
      title: news['title'] ?? "NEWS TITLE",
      description: news['description'] ?? "SOME NEWS",
      urlToImage: news['urlToImage'] ?? "SOME IMG URL",
      url: news['url'] ?? "SOME NEWS URL",
      publishedAt: news['publishedAt'] ?? "PUBLISHER",
      content: news['content'] ?? "CONTENT",
    );
  }

}
//   Article.fromJson(Map<String, dynamic> json) {
//     author = json['author'] ?? "AUTHOR";
//     title = json['title'] ?? "NEWS TITLE";
//     description = json['description'] ?? "SOME NEWS";
//     urlToImage = json['urlToImage'] ?? "SOME IMG URL";
//     url = json['url'] ?? "SOME NEWS URL";
//     publishedAt = json['publishedAt'] ?? "PUBLISHER";
//     content = json['content'] ?? "CONTENT";
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['author'] = author;
//     data['title'] = title;
//     data['description'] = description;
//     data['url'] = url;
//     data['urlToImage'] = urlToImage;
//     data['publishedAt'] = publishedAt;
//     data['content'] = content;
//     return data;
//   }
// }
