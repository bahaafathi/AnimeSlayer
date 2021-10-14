class Manga {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Top> top;

  Manga(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.top});

  Manga.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['top'] != null) {
      top = new List<Top>();
      json['top'].forEach((v) {
        top.add(new Top.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.top != null) {
      data['top'] = this.top.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Top {
  int malId;
  int rank;
  String title;
  String url;
  String type;
  int volumes;
  String startDate;
  String endDate;
  int members;
  double score;
  String imageUrl;

  Top(
      {this.malId,
      this.rank,
      this.title,
      this.url,
      this.type,
      this.volumes,
      this.startDate,
      this.endDate,
      this.members,
      this.score,
      this.imageUrl});

  Top.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    rank = json['rank'];
    title = json['title'];
    url = json['url'];
    type = json['type'];
    volumes = json['volumes'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    members = json['members'];
    score = json['score'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['url'] = this.url;
    data['type'] = this.type;
    data['volumes'] = this.volumes;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['members'] = this.members;
    data['score'] = this.score;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
