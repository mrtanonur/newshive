import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newshive/models/news_model.dart';
import 'package:newshive/pages/all_news_page.dart';
import 'package:newshive/pages/news_detail_page.dart';
import 'package:newshive/providers/news_provider.dart';
import 'package:newshive/utils/constants/constants.dart';
import 'package:newshive/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsProvider>().getNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingConstants.p16),
        child: Column(
          children: [
            header(context, "Breaking News"),
            breakingNews(context),
            header(context, "Recommendation"),
            recommendation(context),
          ],
        ),
      ),
    ));
  }
}

Widget header(BuildContext context, String header) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        header,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const AllNewsPage()));
          },
          child: const Text(
            "View All",
            style: TextStyle(
              color: ColorConstants.accent,
            ),
          ))
    ],
  );
}

Widget breakingNews(BuildContext context) {
  return Consumer<NewsProvider>(
    builder: (context, provider, child) {
      if (provider.state == NewsState.loading) {
        return const CircularProgressIndicator();
      } else if (provider.state == NewsState.loaded) {
        return CarouselSlider(
            items: provider.news.map((news) => carousel(news)).toList(),
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ));
      } else {
        return const Text("Error");
      }
    },
  );
}

Widget carousel(NewsModel newsModel) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        colorFilter: const ColorFilter.mode(
          ColorConstants.grey500,
          BlendMode.darken,
        ),
        image: NetworkImage(newsModel.urlToImage),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.all(PaddingConstants.p10),
            padding: const EdgeInsets.symmetric(
                vertical: PaddingConstants.p5,
                horizontal: PaddingConstants.p10),
            decoration: BoxDecoration(
                color: ColorConstants.accent,
                borderRadius: BorderRadius.circular(SizesConstants.s16)),
            child: const Text(
              "Tech",
              style: TextStyle(color: ColorConstants.white),
            )),
        Container(
          margin: const EdgeInsets.all(PaddingConstants.p10),
          padding: const EdgeInsets.symmetric(
              vertical: PaddingConstants.p5, horizontal: PaddingConstants.p10),
          child: Text(
            newsModel.title,
            style: const TextStyle(
                color: ColorConstants.white, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    ),
  );
}

Widget recommendation(BuildContext context) {
  return Consumer<NewsProvider>(
    builder: (context, provider, child) {
      if (provider.state == NewsState.loading) {
        return const CircularProgressIndicator();
      } else if (provider.state == NewsState.loaded) {
        return Expanded(
          child: ListView.separated(
            itemCount: provider.news.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    provider.newsIndex = index;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NewsDetailPage(),
                    ));
                  },
                  child: NewsTile(newsModel: provider.news[index]));
            },
          ),
        );
      } else {
        return const Text("Error");
      }
    },
  );
}
