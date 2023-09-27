import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/ui/atoms/custom_text_field.dart';
import 'package:srikanthkoti/ui/atoms/undraw_svg.dart';
import 'package:srikanthkoti/ui/dialogs/contact_me/contact_me_dialog_model.dart';
import 'package:srikanthkoti/utils/app_images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/ui_helpers.dart';

class ContactMeMobile extends ViewModelWidget<ContactMeDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ContactMeMobile({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context, ContactMeDialogModel viewModel) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      child: SizedBox(
        width: 1000.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Send me a message!🚀",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            // GestureDetector(
                            //   onTap: () => completer(DialogResponse(
                            //     confirmed: false,
                            //   )),
                            //   child: Container(
                            //     width: _graphicSize,
                            //     height: _graphicSize,
                            //     decoration: const BoxDecoration(
                            //       // color: Color(0xffF6E7B0),
                            //       borderRadius: BorderRadius.all(
                            //         Radius.circular(_graphicSize / 2),
                            //       ),
                            //     ),
                            //     alignment: Alignment.center,
                            //     child: Icon(
                            //       Icons.close_rounded,
                            //       size: 30.sp,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CustomTextWidget(
                                  label: "Full Name",
                                  keyboardType: TextInputType.name,
                                ),
                                verticalSpaceMedium,
                                const CustomTextWidget(
                                  label: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                verticalSpaceMedium,
                                const CustomTextWidget(
                                    label: "Message",
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "Type your message here"),
                                verticalSpaceLarge,
                                SizedBox(
                                  width: 300.w,
                                  child: GestureDetector(
                                    onTap: () => completer(DialogResponse(
                                      confirmed: true,
                                    )),
                                    child: Container(
                                      height: 50.h,
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: FilledButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Send message',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            UnDraw(
                              svgPath: AppImages.undrawMailTwo,
                              color: Theme.of(context).primaryColor,
                              height: 300.h,
                              width: 300.w,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
