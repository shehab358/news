import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/view/widgets/tab_item.dart';
import 'package:news/news/view/widgets/news_list.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> source;

  const SourcesTabs( this.source,{super.key});

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
