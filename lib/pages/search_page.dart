import 'package:flutter/material.dart';
import 'package:newshive/providers/news_provider.dart';
import 'package:newshive/utils/constants/constants.dart';
import 'package:newshive/utils/enums/filter_enum.dart';
import 'package:newshive/utils/extensions/string/string_extension.dart';
import 'package:newshive/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FilterItems selectedItem = FilterItems.all;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingConstants.p16),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.labelMedium,
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstants.grey100,
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(SizesConstants.s24)),
                  prefixIconColor: ColorConstants.grey500,
                  suffixIconColor: ColorConstants.grey500,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon:
                      context.watch<NewsProvider>().searchText.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                context.read<NewsProvider>().reset();
                                controller.clear();
                              },
                              icon: const Icon(Icons.close))
                          : null),
              onChanged: (value) {
                context.read<NewsProvider>().filterNews(value);
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: PaddingConstants.p16),
              child: SizedBox(
                height: SizesConstants.s40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: FilterItems.values.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: SizesConstants.s8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ChoiceChip(
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                      showCheckmark: false,
                      backgroundColor: ColorConstants.grey100,
                      onSelected: (isSelected) {
                        if (isSelected) {
                          setState(() {
                            selectedItem = FilterItems.values[index];
                          });
                        }
                      },
                      selected: selectedItem == FilterItems.values[index],
                      selectedColor: selectedItem == FilterItems.values[index]
                          ? selectedItem.backgroundColor()
                          : ColorConstants.grey100,
                      label: Text(
                        FilterItems.values[index].name.captalizeFirstLetter(),
                        style: TextStyle(
                            color: selectedItem == FilterItems.values[index]
                                ? ColorConstants.white
                                : ColorConstants.grey500),
                      ),
                    );
                  },
                ),
              ),
            ),
            Consumer<NewsProvider>(
              builder: (context, provider, child) {
                if (provider.state == NewsState.loading) {
                  return const CircularProgressIndicator();
                } else if (provider.state == NewsState.loaded) {
                  final news = provider.searchText == ""
                      ? provider.news
                      : provider.filteredNews;

                  return Expanded(
                    child: ListView.separated(
                      itemCount: news.length, //provider.news.length
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: SizesConstants.s10);
                      },
                      itemBuilder: (context, index) {
                        return NewsTile(
                            newsModel: news[index]); // provider.news[index]
                      },
                    ),
                  );
                } else {
                  return const Text("Error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
