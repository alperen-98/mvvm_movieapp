abstract class BaseService {
  final String baseUrl = 'https://api.themoviedb.org/3/';

  Future<dynamic> getResponse(String url);
}
