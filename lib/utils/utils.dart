 import 'package:flutter/material.dart';
import 'package:shop_api_getx/screens/home_screen.dart';
import 'package:shop_api_getx/screens/wallpaper_screen.dart';

const url="https://fakestoreapi.com/products";
const wallpaperApi="https://api.unsplash.com/photos/?client_id=X3li755KBA-0rNH7GqMSde04r16daoHo8rrrHa3Ou18";

  List<Widget> navigationItem=[
     HomeScreen(),
    WallpaperScreen(),
  ];