import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quix/src/core/app_assets.dart';
import 'package:quix/src/data/model/dashboard.dart';
import 'package:quix/src/screen/common/common_tab_animation.dart';

class DashboardButtonView extends StatelessWidget {
  final Function onTab;
  final Animation<Offset> position;
  final Dashboard dashboard;

  const DashboardButtonView({
    Key? key,
    required this.position,
    required this.onTab,
    required this.dashboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTabAnimationView(
      onTab: onTab,
      isDelayed: true,
      child: SlideTransition(
        position: position,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
                alignment: Alignment.center,
                height: 116,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      dashboard.colorTuple.item1,
                      dashboard.colorTuple.item2
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Transform(
                        transform: Matrix4.identity().scaled(5.0)
                          ..translate(0.0, -27.0),
                        child: SvgPicture.asset(
                          dashboard.icon,
                          color: Colors.white.withOpacity(dashboard.opacity),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            dashboard.icon,
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(width: 12),
                          Text(dashboard.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, 2),
                        child: SvgPicture.asset(AppAssets.icButtonShape),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
