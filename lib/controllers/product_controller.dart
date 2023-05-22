import 'package:get/get.dart';
import 'package:shop_api_getx/model/product_model.dart';
import 'package:shop_api_getx/services/api_services.dart';

class ProductController extends GetxController{


  var isGridView=false.obs;
  var product=<ProductModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct()async{
    try{
      final fetchProduct=await ApiServices.fetchProduct();
      product.value=fetchProduct;
    }catch(error){
      print(error.toString());
    }
  }

  toggleGrid(){
    isGridView(!isGridView.value);
  }
}