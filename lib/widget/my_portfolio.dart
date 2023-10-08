import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../AppColors.dart';
import '../app_assets.dart';
import '../constants.dart';
import '../helper/helper_class.dart';
import '../text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
  ];

  var hoveredIndex;
  String title = "";
  String description = "";
  String url="";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var image = images[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {
              //navigation to projects
              if(index==0)
                {
                  url="https://github.com/iamarastu/Adiction-Review";
                }
              if(index==1)
              {
                url="https://github.com/iamarastu/Portfolio-App";
              }
              if(index==2)
              {
                url="";
              }
              if(index==3)
              {
                url="https://github.com/iamarastu/Dashboard-UI";
              }
              if(index==4)
              {
                url="";
              }
              if(index==5)
              {
                url="https://github.com/iamarastu/Rive_Animation_teddy";
              }

                launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.inAppWebView
                );
            },
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
              if (index == 0) {
                title = "Adiction Review";
                description =
                    "This is a movie review app, in which the admin can post his reviews. It is a flutter application in which I have used REST API TMDB, firebase and many more intresting libraries.";
              } else if (index == 1) {
                title = "Portfolio App";
                description =
                    "This is a android portfolio app in which I have used Java as backend and for frontend I have used XML. IN this app I have also used firebase for recving messages";
              } else if (index == 2) {
                title = "Radio App";
                description =
                    "This is a Radio App in which user can listen different radiop stations. In this I have used flutter and some intresting libraries.";
              } else if (index == 3) {
                title = "Android Dashboard";
                description =
                    "In this I have developed a frontend dashboard in which the developer can show mostly thing in the same screen";
              } else if (index == 4) {
                title = "Portfolio Website";
                description =
                    "This is the responsive portfolio website which is build using flutter, the user can open this website in any device i.e. desktop, tablet, mobile";
              } else if (index == 5) {
                title = "Resposive Sign In Page ";
                description =
                    "An attractive reponsive sign in page in which a animal action will according to the user's reaction.";
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.themeColor.withOpacity(1.0),
                            AppColors.themeColor.withOpacity(0.9),
                            AppColors.themeColor.withOpacity(0.8),
                            AppColors.themeColor.withOpacity(0.6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.montserratStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          description,
                          style:
                              AppTextStyles.normalStyle(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 30.0),
                        CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            AppAssets.share,
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}
