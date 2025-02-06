import 'package:flutter/material.dart';

class ToggleMoteisNowOrOtherDay extends StatefulWidget {
  /// 0 é igual a "Ir agora" 1 é igual a "Ir outro dia"
  final Function(int)? select;
  const ToggleMoteisNowOrOtherDay({super.key, this.select});

  @override
  State<ToggleMoteisNowOrOtherDay> createState() => _ToggleMoteisNowOrOtherDayState();
}

class _ToggleMoteisNowOrOtherDayState extends State<ToggleMoteisNowOrOtherDay> {
  bool isSelected = true;
  double size = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration: BoxDecoration(
        color: Color(0xffb31013),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isSelected ? 0 : 140,
            right: isSelected ? 140 : 0,
            child: Container(
              height: size,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOption(Icons.electric_bolt, "Ir agora", true, 0),
              _buildOption(Icons.event_available, "Ir outro dia", false, 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, String text, bool selected, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = selected;
          });
          if (widget.select != null) widget.select!(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: size,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected == selected ? Color(0xffd60b0e) : Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: TextStyle(
                    color: isSelected == selected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
