import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/application/views/search/view_model/search_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final controller = Get.put(SearchHistory());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SearchField(searchController: searchController),
              if (!searchController.text.isNotEmpty)
                ListOfHistory()
              else
                ListOfProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
