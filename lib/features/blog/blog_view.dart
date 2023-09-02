import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'blog_viewmodel.dart';

class BlogView extends StackedView<BlogViewModel> {
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BlogViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Text(
            "Blog",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ));
  }

  @override
  BlogViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BlogViewModel();
}
