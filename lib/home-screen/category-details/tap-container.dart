import 'package:app_news/home-screen/news/news_widget.dart';
import 'package:app_news/model/sourcesResponse.dart';
import 'package:app_news/home-screen/category-details/tap-item.dart';
import 'package:flutter/material.dart';

class TapContainer extends StatefulWidget {
  List<Source> sources;
  TapContainer({required this.sources});

  @override
  State<TapContainer> createState() => _TapContainerState();
}

class _TapContainerState extends State<TapContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => TapItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sources.indexOf(source)))
                  .toList(),
            ),
            Expanded(
              child: NewsWidget(source: widget.sources[selectedIndex]),
            )
          ],
        ),
      ),
    );
  }
}
