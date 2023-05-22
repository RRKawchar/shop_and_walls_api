import 'package:flutter/material.dart';
import 'package:shop_api_getx/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page=0;
  late PageController pageController;

  @override
  void initState() {
    pageController=PageController();
    super.initState();
  }


  @override
  void dispose() {
   pageController.dispose();
    super.dispose();
  }


  void onTapped(int page){
   pageController.jumpToPage(page);
  }

  onPageChange(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PageView(
         controller: pageController,
         onPageChanged: onPageChange,
         children: navigationItem,
       ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),label: 'product'),
          BottomNavigationBarItem(icon: Icon(Icons.wallpaper),label: 'product'),
        ],
     onTap: onTapped,
      ),
    );
  }
}
