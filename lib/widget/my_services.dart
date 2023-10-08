import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/AppColors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/app_assets.dart';
import 'package:portfolio/app_button.dart';
import 'package:portfolio/constants.dart';
import '../helper/helper_class.dart';
import '../text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isGraphic = false, isDataAnalyst = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'App Development',
              asset: AppAssets.code,
              hover: isApp,
              detail: 'In the field of App Development, I have created application using Flutter, Java {XML}, I am also familiar with DBMS I have used SQL, firebase.',
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isGraphic = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Graphic Designing',
              asset: AppAssets.brush,
              hover: isGraphic,
              detail: 'In the field of graphics designing I am beginner, I have build various graphics using Canva and Adobe XD',
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isDataAnalyst = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Web Development',
              asset: AppAssets.analyst,
              hover: isDataAnalyst,
              detail: 'I can build websites using HTML, CSS, Javascript and Flutter, I have build various project click for more',
            ),
          )
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  asset: AppAssets.code,
                  hover: isApp,
                  detail: 'In the field of App Development, I have created application using Flutter, Java {XML}, I am also familiar with DBMS I have used SQL, firebase.',
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isGraphic = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Graphic Designing',
                  asset: AppAssets.brush,
                  hover: isGraphic,
                  detail: 'In the field of graphics designing I am beginner, I have build various graphics using Canva and Adobe XD',
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isDataAnalyst = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Web Development',
              asset: AppAssets.analyst,
              hover: isDataAnalyst,
              width: 725.0,
              hoverWidth: 735.0,
              detail: 'I can build websites using HTML, CSS, Javascript and Flutter, I have build various project click for more',
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  asset: AppAssets.code,
                  hover: isApp,
                  detail: 'In the field of App Development, I have created application using Flutter, Java {XML}, I am also familiar with DBMS I have used SQL, firebase.',
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isGraphic = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Graphic Designing',
                  asset: AppAssets.brush,
                  hover: isGraphic,
                  detail: 'In the field of graphics designing I am beginner, I have build various graphics using Canva and Adobe XD',
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isDataAnalyst = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Web Development',
                  asset: AppAssets.analyst,
                  hover: isDataAnalyst,
                  detail: 'I can build websites using HTML, CSS, Javascript and Flutter, I have build various project click for more',
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool hover,
    required String detail,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
        hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            detail,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 20.0),
          AppButtons.buildMaterialButton(buttonName: 'Read More', onTap: () {
            launchUrl(
                Uri.parse("https://github.com/iamarastu?tab=repositories"),
                mode: LaunchMode.inAppWebView
            );
          })
        ],
      ),
    );
  }
}