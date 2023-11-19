
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testing_final_project/widgets/search_bar.dart' as CustomSearchBar;
import 'package:testing_final_project/widgets/categories_list.dart';
import 'package:testing_final_project/pages/product_list_page.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  late Map<String, List<Map<String, dynamic>>> originalItems;
  late Map<String, List<Map<String, dynamic>>> items;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirestore();
  }

 void _fetchDataFromFirestore() async {
  try {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('unif1ODGW4AMArVIS5qq')
        .get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      if (data != null && data.containsKey('itemList')) {
        Map<String, dynamic> itemListData =
            data['itemList'] as Map<String, dynamic>;

        Map<String, List<Map<String, dynamic>>> sortedItems =
            Map<String, List<Map<String, dynamic>>>.from(
          itemListData.map((key, value) {
            if (value is List<dynamic>) {
              List<Map<String, dynamic>> sortedList =
                  value.cast<Map<String, dynamic>>().toList();

              sortedList.sort((a, b) =>
                  (a['itemName'] as String)
                      .compareTo(b['itemName'] as String));

              return MapEntry(key, sortedList);
            }

            return MapEntry(key, []);
          }),
        );

        setState(() {
          originalItems = sortedItems;
          items = Map<String, List<Map<String, dynamic>>>.from(originalItems);
        });
      }
    }
  } catch (e) {
    print('Error fetching data from Firestore: $e');
  }
}


  void filterSearchResults(String query) {
    setState(() {
      items = Map.from(originalItems);
      items.removeWhere((category, categoryItems) {
        final categoryNameMatches =
            category.toLowerCase().contains(query.toLowerCase());
        final itemMatches = categoryItems
            .where((item) =>
                item['itemName'].toLowerCase().contains(query.toLowerCase()))
            .toList();
        return !categoryNameMatches && itemMatches.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D0C57),
              ),
            ),
            CustomSearchBar.SearchBar(
              controller: _searchController,
              onSearch: filterSearchResults,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final categoryName = items.keys.toList()[index];
                  final categoryData = items[categoryName] ?? [];
                  final imagePath = categoryData.isNotEmpty
                      ? categoryData[0]['imageName']
                      : '';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductList(
                            itemList: {categoryName: categoryData},
                          ),
                        ),
                      );
                    },
                    child: categoriesListItem(
                      itemName: categoryName,
                      itemCount: categoryData.length.toString(),
                      imagePath: imagePath,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
