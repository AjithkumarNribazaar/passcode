import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:passcode/post.dart';
List<Post> parsePost(String responseBody){
  var list=json.decode(responseBody)as List<dynamic>;
  var posts =list.map((model) => Post.fromJson(model)).toList();
  return posts;
}
Future<List<Post>>fetchPost() async{
  String url='http://103.88.129.200/airport/dashboard_all_shopes_nettvalues.php?date=11.04.2021';
  final response= await http.get(url);
  if (response.statusCode ==200){
    return compute(parsePost,response.body);
  }else{
    throw Exception("Request API Error");
  }
}
