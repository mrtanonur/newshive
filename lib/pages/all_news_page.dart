import 'package:flutter/material.dart';
import 'package:newshive/providers/news_provider.dart';
import 'package:newshive/utils/constants/constants.dart';
import 'package:newshive/utils/constants/padding_constants.dart';
import 'package:newshive/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({super.key});

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsProvider>().getNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All News")),
      body: Padding(
        padding: const EdgeInsets.all(PaddingConstants.p12),
        child: Column(
          children: [
            Consumer<NewsProvider>(
              builder: (context, provider, child) {
                if (provider.state == NewsState.loading) {
                  return const CircularProgressIndicator();
                } else if (provider.state == NewsState.loaded) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: provider.news.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: SizesConstants.s12);
                      },
                      itemBuilder: (context, index) {
                        return NewsTile(newsModel: provider.news[index]);
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
