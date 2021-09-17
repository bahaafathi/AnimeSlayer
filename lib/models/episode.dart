class Episode {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int episodesLastPage;
  List<Episodes> episodes;

  Episode(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.episodesLastPage,
      this.episodes});

  Episode.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    episodesLastPage = json['episodes_last_page'];
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    data['episodes_last_page'] = this.episodesLastPage;
    if (this.episodes != null) {
      data['episodes'] = this.episodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Episodes {
  int episodeId;
  String title;
  String titleJapanese;
  String titleRomanji;
  String aired;
  bool filler;
  bool recap;
  String videoUrl;
  String forumUrl;

  Episodes(
      {this.episodeId,
      this.title,
      this.titleJapanese,
      this.titleRomanji,
      this.aired,
      this.filler,
      this.recap,
      this.videoUrl,
      this.forumUrl});

  Episodes.fromJson(Map<String, dynamic> json) {
    episodeId = json['episode_id'];
    title = json['title'];
    titleJapanese = json['title_japanese'];
    titleRomanji = json['title_romanji'];
    aired = json['aired'];
    filler = json['filler'];
    recap = json['recap'];
    videoUrl = json['video_url'];
    forumUrl = json['forum_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episode_id'] = this.episodeId;
    data['title'] = this.title;
    data['title_japanese'] = this.titleJapanese;
    data['title_romanji'] = this.titleRomanji;
    data['aired'] = this.aired;
    data['filler'] = this.filler;
    data['recap'] = this.recap;
    data['video_url'] = this.videoUrl;
    data['forum_url'] = this.forumUrl;
    return data;
  }
}
