import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_final_project/widgets/product_list_item.dart';
import 'package:testing_final_project/pages/single_page.dart';
import 'package:testing_final_project/widgets/search_bar.dart' as CustomSearchBar;
import 'package:testing_final_project/models/shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:testing_final_project/models/selected_item.dart';

class ProductList extends StatefulWidget {
  final Map<String, List<Map<String, dynamic>>> itemList;

  const ProductList({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Map<String, List<Map<String, dynamic>>> originalItems;
  late Map<String, List<Map<String, dynamic>>> items;
  final TextEditingController _searchController = TextEditingController();
  late ShoppingCart shoppingCart;
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    shoppingCart = ShoppingCart(); // Initialize shoppingCart here
    _initializeItems();
  }

  void _initializeItems() {
    originalItems = Map.from(widget.itemList);
    items = Map.from(originalItems);
  }

  void filterSearchResults(String query) {
    print("Search query: $query");
    setState(() {
      items = Map.from(originalItems);
      items.forEach((category, categoryItems) {
        items[category] = categoryItems
            .where((item) =>
                item['itemName'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
      applyFilters(selectedFilters); // Apply filters along with search results
      print("Filtered items: $items");
    });
  }

  void applyFilters(List<String> filters) {
    setState(() {
      selectedFilters = filters;

      // Apply filters to the items
      items = Map.from(originalItems);
      items.forEach((category, categoryItems) {
        items[category] = categoryItems
            .where((item) =>
                selectedFilters.isEmpty ||
                selectedFilters.contains(item['itemName'].toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: ChangeNotifierProvider(
        create: (context) => SelectedItemProvider(),
        child: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 22, top: 50, left: 15),
          width: 150,
          height: 150,
          child: SvgPicture.asset(
            'assets/images/Vector.svg',
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    final shoppingCart = Provider.of<ShoppingCart>(context);
    final selectedItemProvider = Provider.of<SelectedItemProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/images/vegetable_vector.svg',
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vegetables',
                  style: TextStyle(
                    height: 41 / 34,
                    fontFamily: "SF Pro Display",
                    fontSize: 34,
                    letterSpacing: 0.41,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D0C57),
                  ),
                ),
                CustomSearchBar.SearchBar(
                  controller: _searchController,
                  onSearch: filterSearchResults,
                ),
                // Filter chips for individual item names
                Wrap(
                  spacing: 8.0,
                  children: items.values
                      .expand((categoryItems) => categoryItems
                          .map((item) => item['itemName'].toString()))
                      .toSet()
                      .toList()
                      .map((itemName) {
                    return FilterChip(
                      label: Text(itemName),
                      selected: selectedFilters.contains(itemName.toLowerCase()),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedFilters.add(itemName.toLowerCase());
                          } else {
                            selectedFilters.remove(itemName.toLowerCase());
                          }
                          applyFilters(selectedFilters);
                        });
                      },
                    );
                  }).toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index >= 0 && index < items.length) {
                        final category = items.keys.elementAt(index);
                        final categoryItems = items[category]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...categoryItems.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  selectedItemProvider.setSelectedItem(item['itemName']);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SinglePage(itemData: item),
                                    ),
                                  );
                                },
                                child: productListItem(
                                  itemName: item['itemName'],
                                  productImage: item['productImage'] ?? '',
                                  price: item['price']?.toString() ?? '',
                                  measurement: item['measurement'] ?? '',
                                  context: context,
                                  shoppingCart: shoppingCart,
                                ),
                              );
                            }).toList(),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
