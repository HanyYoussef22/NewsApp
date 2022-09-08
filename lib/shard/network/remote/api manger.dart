import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/Models/NewsResponse.dart';
import 'package:news/Models/SourcesResponse.dart';
import 'package:news/shard/components/constant.dart';

class ApiManger{

  //Step one to call api
static Future<SourcesResponse> getSources(String CategoryId)
async{
  Map<String,dynamic> queryParams=
  {
    'apiKey':Constant.APIKEY,
    'category':CategoryId,
  };
   //
   var uri=Uri.https(Constant.BASEURL,Constant.ENDPOINTSOURSES,queryParams);
   try{
     var response=await http.get(uri);
     var ResponseBody = response.body;
     var json=jsonDecode(ResponseBody);
     var sourcesResponse=SourcesResponse.fromJson(json);
     return sourcesResponse;
   }
   catch(e){
     throw e;
   }

 }



static Future<NewsResponse> getNewsBySources ({String? sourceId,String? quary})
async {

  Map<String,dynamic> queryParams=
  {
    'apiKey':Constant.APIKEY,
    'sources':sourceId,
    'q':quary,
  };


  var uri=Uri.https(Constant.BASEURL,Constant.ENDPOINTEVERYTHING,queryParams);

try{
  var response=await http.get(uri);
  var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
  // if(response.statusCode == 200)
  // {
  //   return newsResponse;
  // }
  return newsResponse;
 // var ResponseBody=response.body;
  // var json=jsonDecode(ResponseBody);
  //var newsResponse=NewsResponse().fromJson(json);
  //return newsResponse;
}catch(e){
  throw e;
}
 }
}