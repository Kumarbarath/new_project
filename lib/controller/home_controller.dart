import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/modal/home_screen_modal.dart';

class HomeScreenController extends GetxController {
  final count=0.obs;
  RxBool isDataLoading=true.obs;
  List<String> imageList = <String>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void increment(){
    count.value++;
  }

  Future<void> getData() async{
    print('getData calling');
    try{
       isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://dummyjson.com/products/1')!,
      );
      if(response.statusCode == 200){
        ///data successfully
        var result = jsonDecode(response.body);
        var res =  ResponseModal.fromJson(result);
        print('object');
        print(res.images?.toList());
        res.images?.forEach((element) {imageList.add(element);});

      }
      else{

      }
    }
    catch(e){

      log('Error while getting data is $e');
      print('Error while getting data is $e');
    }
    finally{

      isDataLoading(false);
    }

  }
}