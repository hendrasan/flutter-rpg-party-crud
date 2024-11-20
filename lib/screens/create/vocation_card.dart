import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class VocationCard extends StatefulWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  _VocationCardState createState() => _VocationCardState();
}

class _VocationCardState extends State<VocationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColors.secondaryColor,
    ).animate(_controller);
    if (widget.selected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(VocationCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      if (widget.selected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.vocation);
      },
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Card(
            color: _colorAnimation.value,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/vocations/${widget.vocation.image}',
                    width: 100,
                    colorBlendMode: BlendMode.color,
                    color: !widget.selected
                        ? Colors.transparent.withOpacity(0.8)
                        : Colors.transparent,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeadline(widget.vocation.title),
                        StyledText(widget.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
