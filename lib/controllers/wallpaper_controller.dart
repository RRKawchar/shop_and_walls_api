import 'package:get/get.dart';
import 'package:shop_api_getx/model/wallpaper_model.dart';
import 'package:shop_api_getx/services/api_services.dart';

class WallpaperController extends GetxController {
  var isGridView = false.obs;
  var wallpapers = <WallpaperModel>[].obs;
  var isLoading= false.obs;
  toggleGridView() {
    isGridView(!isGridView.value);
  }

  @override
  void onInit() {
    fetchWallpaper();
    super.onInit();
  }

  Future<void> fetchWallpaper() async {
    try{
      isLoading(true);
      final fetchWalls = await ApiServices.fetchWallpaper();

      wallpapers.value = fetchWalls;
      isLoading(false);
    }catch(e){
      print(e.toString());

    }

  }
}
