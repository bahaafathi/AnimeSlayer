class Character {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Characters> characters;
  List<Staff> staff;

  Character(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.characters,
      this.staff});

  Character.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters.add(new Characters.fromJson(v));
      });
    }
    if (json['staff'] != null) {
      staff = <Staff>[];
      json['staff'].forEach((v) {
        staff.add(new Staff.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.characters != null) {
      data['characters'] = this.characters.map((v) => v.toJson()).toList();
    }
    if (this.staff != null) {
      data['staff'] = this.staff.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Characters {
  int malId;
  String url;
  String imageUrl;
  String name;
  String role;
  List<VoiceActors> voiceActors;

  Characters(
      {this.malId,
      this.url,
      this.imageUrl,
      this.name,
      this.role,
      this.voiceActors});

  Characters.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    name = json['name'];
    role = json['role'];
    if (json['voice_actors'] != null) {
      voiceActors = <VoiceActors>[];
      json['voice_actors'].forEach((v) {
        voiceActors.add(new VoiceActors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['role'] = this.role;
    if (this.voiceActors != null) {
      data['voice_actors'] = this.voiceActors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VoiceActors {
  int malId;
  String name;
  String url;
  String imageUrl;
  String language;

  VoiceActors({this.malId, this.name, this.url, this.imageUrl, this.language});

  VoiceActors.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    name = json['name'];
    url = json['url'];
    imageUrl = json['image_url'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['language'] = this.language;
    return data;
  }
}

class Staff {
  int malId;
  String url;
  String name;
  String imageUrl;
  List<String> positions;

  Staff({this.malId, this.url, this.name, this.imageUrl, this.positions});

  Staff.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    name = json['name'];
    imageUrl = json['image_url'];
    positions = json['positions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['positions'] = this.positions;
    return data;
  }
}
