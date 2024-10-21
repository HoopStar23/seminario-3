import 'dart:convert';

class ActorResponse {
    bool adult;
    List<String> alsoKnownAs;
    String biography;
    DateTime birthday;
    String? deathday;
    int gender;
    String? homepage;
    int id;
    String imdbId;
    String knownForDepartment;
    String name;
    String placeOfBirth;
    double popularity;
    String profilePath;
    String? uniqueId;


    ActorResponse({
        required this.adult,
        required this.alsoKnownAs,
        required this.biography,
        required this.birthday,
        this.deathday,
        required this.gender,
        this.homepage,
        required this.id,
        required this.imdbId,
        required this.knownForDepartment,
        required this.name,
        required this.placeOfBirth,
        required this.popularity,
        required this.profilePath,
        this.uniqueId,
    });

      get fullActorImg {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500' + profilePath!;
    } else {
      // Devuelve una imagen placeholder si no hay posterPath
      return 'https://via.placeholder.com/500x750';
    }
  }

    factory ActorResponse.fromJson(String str) => ActorResponse.fromMap(json.decode(str));

    factory ActorResponse.fromMap(Map<String, dynamic> json) => ActorResponse(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
    );
}
