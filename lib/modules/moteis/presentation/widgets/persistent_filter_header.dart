import 'package:flutter/material.dart';

class PersistentFilterHeader extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;

  final List<Widget> filterOptions;

  PersistentFilterHeader(
      {required this.minExtent, required this.maxExtent, this.filterOptions = const []});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfff2f0f0),
          border: Border(bottom: BorderSide(color: Color(0xffa19d9d).withAlpha(100), width: 1))),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              filterOptions.length,
              (index) =>
                  Padding(padding: const EdgeInsets.only(left: 10), child: filterOptions[index])),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
