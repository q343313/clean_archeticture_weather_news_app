


abstract class AppImplementTypes {

  Future<dynamic>getapi(String url);
  Future<dynamic>postapi(String url,var data,Map<String,String> header);
  Future<dynamic>deleteapi(String url);
}