import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/result.dart';
import 'package:peliculas/models/now_playing_response.dart';


class MoviesProvider extends ChangeNotifier{
  String _apikey = 'cfdc79ad1aa1c135bb19ac46e98e006f';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-US';
  List<Result> onDisplayMovies = [];


  MoviesProvider(){
    print('Movies Provider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final decodedData = json.decode(response.body);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners();  
  }
}