import 'package:flutter/material.dart';
import 'package:weatherapp/view/home-view.dart';
import 'package:weatherapp/view/search-view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const HomeView(),
  'SearchView': (context) => const SearchView(),
};
