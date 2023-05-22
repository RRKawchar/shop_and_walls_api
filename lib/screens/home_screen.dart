import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_api_getx/controllers/product_controller.dart';
import 'package:shop_api_getx/model/categoryModel.dart';
import 'package:shop_api_getx/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {


  final ProductController _productController=ProductController();



  @override
  Widget build(BuildContext context) {
    _productController.fetchProduct();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Shop-X",
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      drawer: Container(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            _buildCategor(),
            _buildSearchAndGrid(),

            Expanded(
              child: Obx((){
                if(_productController.isGridView.value){
                  print("icCheck ${_productController.isGridView.value}");
                  return GridView.builder(
                      padding: const EdgeInsets.only(top: 16,),
                      itemCount: 20,
                      itemBuilder: (context,index){
                        final data=_productController.product[index];
                        return Card(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: const BoxDecoration(
                            ),
                            height: 150,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  child: Image.network(_productController.product[index].image.toString(),fit: BoxFit.cover,),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data.title.toString(),style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                        Text('${data.description}',maxLines: 3,),
                                        Text('\$${data.price}',style: const TextStyle(color:Colors.amber),),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),),
                        );

                      }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5
                  ),);
                }
                return ListView.builder(
                    padding: const EdgeInsets.only(top: 16,),
                    itemCount: _productController.product.length,
                    itemBuilder: (context,index){
                      final data=_productController.product[index];
                      return Card(

                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: const BoxDecoration(
                          ),
                          height: 150,
                          child: Row(
                            children: [
                              Container(
                                padding:const EdgeInsets.all(8.0),
                                width: 150,
                                child: Image.network(data.image.toString(),fit: BoxFit.cover,),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('${data.title}',maxLines: 2,overflow: TextOverflow.ellipsis,style:const TextStyle(fontWeight: FontWeight.bold),),
                                    Text('${data.description}',maxLines: 3,overflow: TextOverflow.ellipsis,),
                                    Text('\$${data.price}',style: const TextStyle(color: Colors.amber),),
                                  ],
                                ),
                              )

                            ],
                          ),),
                      );

                    });
              })
            )
          ],
        ),
      ),
    );
  }

  Row _buildSearchAndGrid() {
    return Row(
            children: [
              const Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search)
                ),
              ),),
              const SizedBox(width: 10,),
              IconButton(onPressed: (){
                _productController.toggleGrid();
              }, icon: const Icon(Icons.grid_view,),)
            ],
          );
  }

  Container _buildCategor() {
    return Container(
          height: 35,
          margin: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final data = categoryList[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    color: index == 0 ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data,
                    style: TextStyle(
                      color: index == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }),
        );
  }
}
