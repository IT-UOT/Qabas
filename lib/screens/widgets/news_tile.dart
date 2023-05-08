import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itmentor/models/news.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../utilities/consts.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool _showFullText = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
     // elevation: 0,

      margin: const EdgeInsets.symmetric(horizontal: Consts.paddingMedium, vertical: Consts.paddingSmall),
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd()
                    .format(DateTime.parse(widget.newsModel.publishedAt)),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                widget.newsModel.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              InkWell(
                onTap: (){
                  setState(() {
                    _showFullText = !_showFullText;
                  });
                },
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: _showFullText
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: Text(
                    '${widget.newsModel.content.substring(0, 100)}...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  secondChild: Text(
                    widget.newsModel.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (widget.newsModel.imageUrl != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: PhotoView(
                        initialScale: PhotoViewComputedScale.covered,
                        imageProvider: NetworkImage(widget.newsModel.imageUrl!),
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Text("حدث خطأ أثناء تحميل الصورة"));
                        },
                        backgroundDecoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 8),
              //const Divider(),

              // Row(
              //   children: [
              //     FilledButton(
              //         onPressed: () {
              //
              //         },
              //         child:
              //             Text(_showFullText ? "خلاص عرفت" : "تبي تعرف أكثر؟")),
              //     const SizedBox(width: 8),
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(Icons.share),
              //     ),
              //     const SizedBox(width: 8),
              //     AnimatedSwitcher(
              //       duration:const Duration(milliseconds: 300),
              //       transitionBuilder: (Widget child, Animation<double> animation) {
              //         return ScaleTransition(
              //           scale: animation,
              //           child: child,
              //         );
              //       },
              //       child: IconButton(
              //         key: ValueKey<bool>(_isFavorite),
              //         icon: Icon(
              //           _isFavorite ? Icons.favorite : Icons.favorite_border,
              //       //    color: _isFavorite ? Colors.red : null,
              //         ),
              //         onPressed: () {
              //           setState(() {
              //             _isFavorite = !_isFavorite;
              //           });
              //         },
              //       ),
              //     )
              //
              //   ],
              // )
              // Text(
              //   newsModel.content,
              //   style: const TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 12,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          )),
    );
  }
}
