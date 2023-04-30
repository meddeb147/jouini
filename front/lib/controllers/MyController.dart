


import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

import '../model/MyModel.dart';


class GetController extends GetxController{

  Category2? category ;
  var isDataLoading = false.obs;
  var headers= {'content-type' :'application/json'};


  GetData( ) async {
    try{
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse("http://192.168.1.18:3000/")!,
      );
      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        category =  Category2.fromJson(result);
        print(result.toString());

      }else{
        print("error occured");
      }
    }catch(e){
      print('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
      print(category?.categories![1].courses?.length.toString() );


    }

  }

}