import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srikanthkoti/features/about/about_viewmodel.dart';
import 'package:srikanthkoti/ui/atoms/custom_icon.dart';
import 'package:srikanthkoti/ui/atoms/translate_on_hover.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:stacked/stacked.dart';

import '../home/widgets/bottom_clipped_blob.dart';

class AboutDesktop extends ViewModelWidget<AboutViewModel> {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context, AboutViewModel viewModel) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: const BottomClipInspirationExample(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, I am",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Srikanth',
                                  speed: Duration(milliseconds: 100),
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.visible,
                                      ),
                                ),
                              ],
                              totalRepeatCount: 1,
                              // pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Koti',
                                  speed: Duration(milliseconds: 350),
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.visible,
                                      ),
                                ),
                              ],
                              totalRepeatCount: 1,
                              // pause: const Duration(milliseconds: 2000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                            ),
                            Row(
                              children: [
                                TranslateOnHover(
                                  child: CustomIcon(
                                    iconData: FontAwesomeIcons.github,
                                  ),
                                ),
                                TranslateOnHover(
                                  child: CustomIcon(
                                    iconData: FontAwesomeIcons.linkedinIn,
                                  ),
                                ),
                                TranslateOnHover(
                                  child: CustomIcon(
                                    iconData: FontAwesomeIcons.filePdf,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     AnimatedTextKit(
                        //       onNext: (p0, p1) {
                        //         if (p0 == 1) {
                        //           viewModel.setText("Engineer");
                        //         } else {
                        //           viewModel.setText("Developer");
                        //         }
                        //       },
                        //       repeatForever: true,
                        //       animatedTexts: [
                        //         TypewriterAnimatedText(
                        //           'Web',
                        //           speed: Duration(milliseconds: 200),
                        //           textStyle: Theme.of(context)
                        //               .textTheme
                        //               .displayLarge!
                        //               .copyWith(
                        //                   fontWeight: FontWeight.bold,
                        //                   color:
                        //                       Theme.of(context).primaryColor),
                        //         ),
                        //         TypewriterAnimatedText(
                        //           'Flutter',
                        //           speed: Duration(milliseconds: 200),
                        //           textStyle: Theme.of(context)
                        //               .textTheme
                        //               .displayLarge!
                        //               .copyWith(
                        //                   fontWeight: FontWeight.bold,
                        //                   color:
                        //                       Theme.of(context).primaryColor),
                        //         ),
                        //         TypewriterAnimatedText(
                        //           'IoT',
                        //           speed: Duration(milliseconds: 200),
                        //           textStyle: Theme.of(context)
                        //               .textTheme
                        //               .displayLarge!
                        //               .copyWith(
                        //                   fontWeight: FontWeight.bold,
                        //                   color:
                        //                       Theme.of(context).primaryColor),
                        //         ),
                        //         TypewriterAnimatedText(
                        //           'Cloud',
                        //           speed: Duration(milliseconds: 200),
                        //           textStyle: Theme.of(context)
                        //               .textTheme
                        //               .displayLarge!
                        //               .copyWith(
                        //                   fontWeight: FontWeight.bold,
                        //                   color:
                        //                       Theme.of(context).primaryColor),
                        //         ),
                        //       ],
                        //       totalRepeatCount: 4,
                        //       pause: const Duration(milliseconds: 500),
                        //       displayFullTextOnTap: true,
                        //       // stopPauseOnTap: true,
                        //     ),
                        //     Text(
                        //       viewModel.text,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .displayLarge!
                        //           .copyWith(
                        //             overflow: TextOverflow.visible,
                        //           ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // Container(
                  //   width: 800.w,
                  //   child: Text(
                  //     "Passionate and skilled Web Designer and Developer with a creative flair for creating visually stunning and user-friendly websites. I'm a skilled front-end and back-end developer who creates seamless digital experiences that capture the distinct visions of my clients. I am excellent at creating and managing responsive websites that provide a pleasant user experience. My specialty is developing clean, optimized code using the most up-to-date development tools and methodologies, and creating dynamic, engaging interfaces Let's collaborate and take your online presence to new heights.",
                  //     overflow: TextOverflow.ellipsis,
                  //     softWrap: false,
                  //     maxLines: 10,
                  //     style: Theme.of(context).textTheme.bodyLarge,
                  //   ),
                  // ),
                  Container(
                    width: 800.w,
                    child: RichText(
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Oh my goodness, hello! I am a Front-End developer based in Toronto, Canada. I love long walks on the beach, writing clean code, and pushing my skills to the limit. My interests include joining an exciting team of passionate people, personal growth, and making silly faces.",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text:
                                "\n\nI used to coordinate public events in this city. Some people might be nervous to leave the exciting on-the-job learning and fulfilling teamwork dynamic behind. Personally, I'm excited to join the boring, simple, and rarely-evolving world of tech.",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text:
                                "\n\nOther than coding, I love complimenting my Animal Crossing villagers, baking cookies, and making people laugh.",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
