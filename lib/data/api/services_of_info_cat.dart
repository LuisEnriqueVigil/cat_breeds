
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_aplication/domain/models/cat_model.dart';

class ServicesOfInfoCat with ChangeNotifier{
  

    Future<List<CatModel>> getInfoAllCats () async{

    try {
       String apiKey =  "bda53789-d59e-46cd-9bc4-2936630fde39";
       final url = Uri.https( "api.thecatapi.com", "/v1/breeds");
    
       final resp = await http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            "api-key": apiKey
          },
       ).timeout(
          const Duration(seconds: 8),
          onTimeout: (){
           return http.Response("Error",408);
          }
        ); 
       
       debugPrint("response: ${resp.body}");
       if (resp.statusCode == 200) {
          List<CatModel> list = List<CatModel>.from( jsonDecode(resp.body).map((x) => CatModel.fromJson(x)));
          for (CatModel cat in list) {
            cat.urlImage = "https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg";
          }
          debugPrint(list.length.toString());
          return list;
       }
       else{
        return[];
       }
     } 
    catch (e) {
      return[];
    }
    
  }
 }