import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/credit_response.dart';
import 'package:peliculas/models/result.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/models/popular_response.dart';



class MoviesProvider extends ChangeNotifier{
  String _apikey = 'cfdc79ad1aa1c135bb19ac46e98e006f';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-US';
  List<Result> onDisplayMovies = [];
  List<Result> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};
  int _popularPage = 0;



  MoviesProvider(){
    print('Movies Provider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apikey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  Future<List<Cast>> getMoviesCast(int movieId) async{
    print('Pidiendo info al server');
    
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  getOnDisplayMovies() async{
    final jsonData = await _getJsonData('3/movie/now_playing', 1);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners();  
  }

  getPopularMovies() async{
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    
    notifyListeners(); 
  }
}