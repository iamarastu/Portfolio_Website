import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/AppColors.dart';
import 'package:portfolio/app_assets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/constants.dart';
import '../app_button.dart';
import '../helper/helper_class.dart';
import '../text_style.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAssets.pro,
        height: 450,
        width: 400,
      ),
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Flutter Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Container(
            height: 400,
            width: 850,
            child: SingleChildScrollView(
              child: Text(
                'I am a passionate software engineer with a strong love for both design and coding. '
                'My journey in the world of software development has been an exciting blend of creativity'
                ' and technical expertise. With proficiency in Java, Flutter, HTML, CSS, JavaScript,'
                ' and SQL, I bring a versatile skill set to the table.'
                'My coding journey began with Java, where I honed my problem-solving skills and developed'
                ' a strong foundation in object-oriented programming. This experience has been invaluable '
                'in crafting robust, efficient, and scalable software solutions.'
                'My love for creating visually appealing and user-friendly interfaces led me to Flutter,'
                ' where I have designed and developed cross-platform mobile applications that provide'
                'a seamless user experience. My projects showcase a keen eye for design,'
                ' ensuring that every pixel is in its right place.'
                'I am also well-versed in web development, utilizing HTML, CSS, and JavaScript to build responsive,'
                ' modern websites. My web applications are not only aesthetically pleasing but also optimized'
               ' for performance and accessibility.To manage and organize data effectively, I employ SQL,'
                'using relational databases to store and retrieve information efficiently.'
                'My data management skills are crucial for building robust backend systems.'
                'As a software engineer, I am committed to staying current with industry trends and emerging technologies.'
                ' I thrive in collaborative environments, solving complex problems, and turning innovative ideas into reality.'
                ' Whether it is creating a beautiful mobile app, crafting an elegant web solution, or optimizing database performance,'
                'I am passionate about delivering high-quality software that exceeds expectations. Explore my portfolio to see my dedication'
                ' to design and coding in action.',
                style: AppTextStyles.normalStyle(),
              ),
            ),
          ),
        ),
        Constants.sizedBox(height: 15.0),
         FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {}, buttonName: 'Read More'),
        )
      ],
    );
  }
}

