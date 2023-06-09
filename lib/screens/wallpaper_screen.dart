import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_api_getx/controllers/wallpaper_controller.dart';

class WallpaperScreen extends StatelessWidget {
  final WallpaperController _wallpaperController=Get.put(WallpaperController());
   WallpaperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Container(),
      appBar: AppBar(
        title: const Text("Walls"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,),),
          IconButton(onPressed: (){
            _wallpaperController.toggleGridView();
          }, icon:  const Icon(Icons.grid_view,),),
        ],
      ),
      body: Obx((){
        if(_wallpaperController.isLoading.value){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(_wallpaperController.wallpapers.isEmpty){
          return const Center(child: Text("no found wallpaper"),);
        }
        if(_wallpaperController.isGridView.value){
          print("Check Grid ${_wallpaperController.isGridView.value}");
          return GridView.builder(
            padding: const EdgeInsets.only(top: 15,left: 8,right: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.70

            ),
            itemCount: _wallpaperController.wallpapers.length,
            itemBuilder: (context,index){
              final data=_wallpaperController.wallpapers[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  
                ),
                child: CachedNetworkImage(
                  imageUrl: _wallpaperController.wallpapers[index].urls.regular,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                          const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => Image.asset('assets/images/place.png',fit: BoxFit.cover,)
                  ,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

              );

            },);
        }
        return GridView.builder(
          padding: const EdgeInsets.only(top: 15,left: 8,right: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.70

          ),
          itemCount: _wallpaperController.wallpapers.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

              ),
               child: CachedNetworkImage(
                 imageUrl: _wallpaperController.wallpapers[index].urls.full,
                 imageBuilder: (context, imageProvider) => Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         image: imageProvider,
                         fit: BoxFit.cover,
                         colorFilter:
                         const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                   ),
                 ),
                 placeholder: (context, url) => Image.asset('assets/images/place.png',fit: BoxFit.cover,)
                 ,
                 errorWidget: (context, url, error) => const Icon(Icons.error),
               ),
            );

          },);
      })


    );
  }
}
