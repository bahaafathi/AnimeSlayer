class News {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Articles> articles;

  News(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.articles});

  News.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String url;
  String title;
  String date;
  String authorName;
  String authorUrl;
  String forumUrl;
  String imageUrl;
  int comments;
  String intro;

  Articles(
      {this.url,
      this.title,
      this.date,
      this.authorName,
      this.authorUrl,
      this.forumUrl,
      this.imageUrl,
      this.comments,
      this.intro});

  Articles.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    date = json['date'];
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    forumUrl = json['forum_url'];
    imageUrl = json['image_url'];
    comments = json['comments'];
    intro = json['intro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['date'] = this.date;
    data['author_name'] = this.authorName;
    data['author_url'] = this.authorUrl;
    data['forum_url'] = this.forumUrl;
    data['image_url'] = this.imageUrl;
    data['comments'] = this.comments;
    data['intro'] = this.intro;
    return data;
  }
}
