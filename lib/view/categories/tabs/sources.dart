import 'package:flutter/material.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/view/categories/tabs/tab_item.dart';
import 'package:news/view/news/news_list.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> source;

  const SourcesTabs({super.key, required this.source});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.source.length,
          child: TabBar(
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.source
                .map(
                  (source) => TabItem(
                    name: source.name ?? '',
                    isSelected: widget.source.indexOf(source) == currentIndex,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(
            widget.source[currentIndex].id!,
          ),
        ),
      ],
    );
  }
}
