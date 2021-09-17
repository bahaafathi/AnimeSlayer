class Details {
  Details({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.malId,
    this.url,
    this.imageUrl,
    this.trailerUrl,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.premiered,
    this.broadcast,
    this.related,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.openingThemes,
    this.endingThemes,
  });

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String imageUrl;
  String trailerUrl;
  String title;
  String titleEnglish;
  String titleJapanese;
  String type;
  String source;
  int episodes;
  String status;
  bool airing;
  Aired aired;
  String duration;
  String rating;
  num score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  String premiered;
  String broadcast;
  Related related;
  List<Genre> producers;
  List<Genre> licensors;
  List<Genre> studios;
  List<Genre> genres;
  List<String> openingThemes;
  List<String> endingThemes;

  Details.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    trailerUrl = json['trailer_url'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];

    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    aired = json['aired'] != null ? new Aired.fromJson(json['aired']) : null;
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'];
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    background = json['background'];
    premiered = json['premiered'];
    broadcast = json['broadcast'];
    related =
        json['related'] != null ? new Related.fromJson(json['related']) : null;
    if (json['producers'] != null) {
      producers = <Genre>[];
      json['producers'].forEach((v) {
        producers.add(new Genre.fromJson(v));
      });
    }
    if (json['licensors'] != null) {
      licensors = <Genre>[];
      json['licensors'].forEach((v) {
        licensors.add(new Genre.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      studios = <Genre>[];
      json['studios'].forEach((v) {
        studios.add(new Genre.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres.add(new Genre.fromJson(v));
      });
    }
    openingThemes = json['opening_themes'].cast<String>();
    endingThemes = json['ending_themes'].cast<String>();
  }
  bool get hasVideo => trailerUrl != null;
}

class Aired {
  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  String from;
  String to;
  Prop prop;
  String string;

  Aired.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    prop = json['prop'] != null ? new Prop.fromJson(json['prop']) : null;
    string = json['string'];
  }
}

class Prop {
  Prop({
    this.from,
    this.to,
  });

  From from;
  From to;
  Prop.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new From.fromJson(json['to']) : null;
  }
}

class From {
  From({
    this.day,
    this.month,
    this.year,
  });

  int day;
  int month;
  int year;

  From.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }
}

class Genre {
  Genre({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  int malId;
  String type;
  String name;
  String url;
  Genre.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
}

enum Type { ANIME, MANGA }

class Related {
  Related({
    this.adaptation,
    this.sideStory,
    this.summary,
  });

  List<Genre> adaptation;
  List<Genre> sideStory;
  List<Genre> summary;

  Related.fromJson(Map<String, dynamic> json) {
    if (json['Adaptation'] != null) {
      adaptation = <Genre>[];
      json['Adaptation'].forEach((v) {
        adaptation.add(new Genre.fromJson(v));
      });
    }
    if (json['Side story'] != null) {
      sideStory = <Genre>[];
      json['Side story'].forEach((v) {
        sideStory.add(new Genre.fromJson(v));
      });
    }
    if (json['Summary'] != null) {
      summary = <Genre>[];
      json['Summary'].forEach((v) {
        summary.add(new Genre.fromJson(v));
      });
    }
  }
}
