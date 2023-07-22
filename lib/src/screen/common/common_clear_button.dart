import 'package:flutter/material.dart';
import 'package:quix/src/screen/common/common_tab_animation.dart';

class CommonClearButton extends StatelessWidget {
  final Function onTab;
  final double height;
  final String text;
  final double fontSize;

  const CommonClearButton({
    Key? key,
    required this.onTab,
    required this.text,
    this.height = 112,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTabAnimationView(
      onTab: onTab,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            alignment: Alignment.center,
            
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: fontSize,
                    
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
