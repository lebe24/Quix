import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quix/models/ModelProvider.dart';
import 'package:quix/src/core/app_assets.dart';
import 'package:quix/src/core/color_scheme.dart';
import 'package:quix/src/core/index.dart';
import 'package:quix/src/screen/app/theme_provider.dart';
import 'package:quix/src/screen/dashboard/dashboard_button.dart';
import 'package:quix/src/screen/dashboard/dashboard_provider.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetLeftEnter;
  late Animation<Offset> _offsetRightEnter;
  late bool isHomePageOpen;

  late User user ;

  @override
  void initState() {
    super.initState();
    isHomePageOpen = false;
    _controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetLeftEnter = Tween<Offset>(
      begin: Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);

    _offsetRightEnter = Tween<Offset>(
      begin: Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .infoDialogBgColor,
                              borderRadius: BorderRadius.circular(18)),
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.icTrophy,
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 5),
                              Consumer<DashboardProvider>(
                                builder: (context, model, child) => Text(
                                    model.overallScore.toString(),
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.read<ThemeProvider>().changeTheme();
                      },
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.blue,
                              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, KeyUtil.profile, ModalRoute.withName(KeyUtil.dashboard)), 
                              icon: const Icon(Icons.person)),
                            SvgPicture.asset(
                              Theme.of(context).brightness == Brightness.light
                                  ? AppAssets.icDarkMode
                                  : AppAssets.icLightMode,
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 36),
                        Text(
                          "Quix",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Train Your Brain, Improve Your Problem sloving Skill",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 36),
                        DashboardButtonView(
                          dashboard: KeyUtil.dashboardItems[0],
                          position: _offsetLeftEnter,
                          onTab: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              KeyUtil.home,
                              ModalRoute.withName(KeyUtil.dashboard),
                              arguments: Tuple2(KeyUtil.dashboardItems[0],
                                  MediaQuery.of(context).padding.top),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        DashboardButtonView(
                          dashboard: KeyUtil.dashboardItems[1],
                          position: _offsetRightEnter,
                          onTab: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              KeyUtil.home,
                              ModalRoute.withName(KeyUtil.dashboard),
                              arguments: Tuple2(KeyUtil.dashboardItems[1],
                                  MediaQuery.of(context).padding.top),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        DashboardButtonView(
                          dashboard: KeyUtil.dashboardItems[2],
                          position: _offsetRightEnter,
                          onTab: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              KeyUtil.home,
                              ModalRoute.withName(KeyUtil.dashboard),
                              arguments: Tuple2(KeyUtil.dashboardItems[2],
                                  MediaQuery.of(context).padding.top),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
