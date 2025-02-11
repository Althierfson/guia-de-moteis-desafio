import 'package:flutter/material.dart';

class FilterOptionTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function()? onTap;
  const FilterOptionTile({super.key, required this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffa19d9d).withAlpha(120)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                icon,
                size: 18,
                color: Color(0xffa19d9d),
              ),
            ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
