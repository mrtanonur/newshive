import 'package:flutter/material.dart';
import 'package:newshive/models/news_model.dart';
import 'package:newshive/utils/constants/constants.dart';

class NewsTile extends StatelessWidget {
  final NewsModel newsModel;
  const NewsTile({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizesConstants.s12),
            child: Image.network(
              alignment: Alignment.center,
              newsModel.urlToImage,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Text("not found");
              },
            ),
          ),
        ),
        const SizedBox(
          width: SizesConstants.s12,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tech",
                style: TextStyle(color: ColorConstants.grey500),
              ),
              Text(
                newsModel.title,
                style: const TextStyle(
                    fontSize: SizesConstants.s12, fontWeight: FontWeight.w800),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(newsModel.author,
                          maxLines: 1,
                          style: TextStyle(color: Colors.grey[600]))),
                  Text(
                    newsModel.publishedAt.substring(0, 10),
                    style: TextStyle(color: ColorConstants.grey500),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
