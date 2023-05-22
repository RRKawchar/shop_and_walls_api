import 'dart:convert';

import 'package:shop_api_getx/model/product_model.dart';
import 'package:http/http.dart'as http;
import 'package:shop_api_getx/model/wallpaper_model.dart';
import 'package:shop_api_getx/utils/utils.dart';
class ApiServices{



  static Future<List<ProductModel>> fetchProduct()async{
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final data=json.decode(response.body) as List<dynamic>;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    }
    throw Exception('something went wrong');
  }



  static Future<List<WallpaperModel>> fetchWallpaper()async{
     var response=await http.get(Uri.parse(wallpaperApi));
     
     if(response.statusCode==200){
       final data=json.decode(response.body) as List<dynamic>;
       
       return data.map((e) => WallpaperModel.fromJson(e)).toList();
       
     }else{
       throw Exception('Faild to fetch Wallpaper');
     }
  }


}