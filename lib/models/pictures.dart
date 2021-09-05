class AnimePictures {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Pictures> pictures;

  AnimePictures(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.pictures});

  AnimePictures.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures.add(new Pictures.fromJson(v));
      });
    }
  }
}

class Pictures {
  String large;
  String small;

  Pictures({this.large, this.small});

  Pictures.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    small = json['small'];
  }
}
