abstract class BaseApiServices {
  Future<dynamic> getGetApiResponses(String url, Map<String, String>? headers);
  Future<dynamic> getPostApiResponses(String url, dynamic data, );
}
