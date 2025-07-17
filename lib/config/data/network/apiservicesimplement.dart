


import 'dart:convert';

import 'package:clean_architecture_weather_new_app/config/data/exceptions/exceptiontypes.dart';

import 'apiimplementtype.dart';
import 'package:http/http.dart'as http;

class ApiServicesImplement extends AppImplementTypes{
  @override
  Future deleteapi(String url)async{
    final jsonresponse;
    try{

      final response = await http.delete(Uri.parse(url));
      jsonresponse = returnresponse(response);

    }catch(e){
      throw DefaultException(e.toString());
    }
    return jsonresponse;
  }

  @override
  Future getapi(String url)async{
    final jsonresponse;
    try{

      final response = await http.get(Uri.parse(url));
      jsonresponse = returnresponse(response);

    }catch(e){
      throw DefaultException(e.toString());
    }
    return jsonresponse;
  }

  @override
  Future postapi(String url, data,Map<String,String>header)async{
    final jsonresponse;
    try{

      final response = await http.post(Uri.parse(url),body: data,headers: header);
      jsonresponse = returnresponse(response);

    }catch(e){
      throw DefaultException(e.toString());
    }
    return jsonresponse;
  }

  dynamic returnresponse(http.Response response){
    switch(response.statusCode){
      case 200:
        var data = jsonDecode(response.body);
        return data;
      case 401:
        throw UnAuthrizedException("Authored Required");
      case 404:
        throw BadRequestException("Bad Request");
      case 408:
        throw ApiTimeOutException();
      case 422:
        throw DefaultException("vallidation error");
    }
  }

}