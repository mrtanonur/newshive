import 'package:flutter/material.dart';
import 'package:newshive/models/news_model.dart';
import 'package:newshive/providers/news_provider.dart';
import 'package:newshive/utils/constants/constants.dart';
import 'package:provider/provider.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsProvider provider = context.read<NewsProvider>();
    NewsModel news = provider.news[provider.newsIndex!];

    return Scaffold(
        body: Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: const ColorFilter.mode(
                ColorConstants.black54,
                BlendMode.darken,
              ),
              image: NetworkImage(news.urlToImage),
              fit: BoxFit.cover)),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            const Spacer(),
            header(news),
            const SizedBox(
              height: SizesConstants.s20,
            ),
            card(news),
          ],
        ),
      ),
    ));
  }

  Widget appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: ColorConstants.white,
            )),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
              color: ColorConstants.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: ColorConstants.white,
            )),
      ],
    );
  }

  Widget header(NewsModel news) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(PaddingConstants.p8),
            decoration: BoxDecoration(
                color: ColorConstants.accent,
                borderRadius: BorderRadius.circular(16)),
            child: const Text(
              "Tech",
              style: TextStyle(color: ColorConstants.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: SizesConstants.s12),
          Text(news.title,
              style: const TextStyle(
                  color: ColorConstants.white, fontWeight: FontWeight.w800)),
          const SizedBox(height: SizesConstants.s12),
          Row(
            children: [
              const Text("Trending",
                  style: TextStyle(color: ColorConstants.white)),
              const Text("   *   ",
                  style: TextStyle(color: ColorConstants.white)),
              Text(news.publishedAt.substring(0, 10),
                  style: const TextStyle(color: ColorConstants.white))
            ],
          ),
        ],
      ),
    );
  }

  Widget card(NewsModel news) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(PaddingConstants.p16),
        decoration: const BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizesConstants.s12),
                topRight: Radius.circular(SizesConstants.s12))),
        child: ListView(
          children: [
            Text(
              news.author,
              style: const TextStyle(
                  fontSize: SizesConstants.s24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: SizesConstants.s16,
            ),
            Text(news.content,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: SizesConstants.s16,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
