
import 'package:flutter/material.dart';

class BlogBox extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String tag;
  final String description;
  final bool isDesktop;
  final String urlId;
  const BlogBox(
      {Key? key,
      required this.urlId,
      required this.image,
      required this.content,
      required this.description,
      required this.tag,
      required this.isDesktop,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/blogs/$urlId',
        );
      },
      child: Ink(
        width:
            isDesktop ? 0.4166666667 * MediaQuery.sizeOf(context).width : 600,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Ink(
                    height: isDesktop
                        ? 0.4872107186 * MediaQuery.sizeOf(context).height
                        : 400,
                    width: isDesktop
                        ? 0.4166666667 * MediaQuery.sizeOf(context).width
                        : 600,
                    color: Colors.transparent,
                    child: Image.network(
                      image,
                      fit: BoxFit.contain,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tag,
                style: const TextStyle(fontSize: 12, color: Colors.amber),
                softWrap: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
