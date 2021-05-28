import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'total_post.dart';

List<Post> parsePost(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var posts = list.map((model) => Post.fromJson(model)).toList();
  return posts;
}
Future<List<Post>> fetchPost() async{

  final response = await http.get('http://103.88.129.200/airport/dashboard_allshopes_total_netvalue.php?date=22.05.2021');
  if (response.statusCode == 200){
    return compute(parsePost,response.body);
  }else{
    throw Exception("Request API Error");
  }
}