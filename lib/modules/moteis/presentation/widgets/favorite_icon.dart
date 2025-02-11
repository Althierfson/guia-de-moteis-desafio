import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final Function()? onTap;
  const FavoriteIcon({super.key, this.onTap});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.3, // Cresce apenas 30% (mais suave)
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      _controller.forward().then((_) => _controller.reverse());
    });
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFavorite,
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: Icon(
          Icons.favorite,
          size: 30, // Mantém tamanho adequado
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
