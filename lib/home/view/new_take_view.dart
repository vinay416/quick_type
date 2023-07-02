import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';

class NewTakeView extends StatefulWidget {
  const NewTakeView({super.key});

  static String get routeName => 'new';

  @override
  State<NewTakeView> createState() => _NewTakeViewState();
}

class _NewTakeViewState extends State<NewTakeView> {
  final scrollController = ScrollController();
  final textController = TextEditingController();
  double height = 100;

  @override
  void initState() {
    scrollListener();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    height = context.screenHeight * 0.88;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableLeadingBack: true,
      title: 'Add Take',
      isSmallAppBar: true,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        child: TextField(
          controller: textController,
          scrollController: scrollController,
          expands: true,
          autofocus: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            isDense: false,
          ),
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }

  void scrollListener() {
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;

      final position = scrollController.position;
      if (position.pixels >= position.maxScrollExtent) {
        height = context.screenHeight * 0.70;
      } else {
        height = context.screenHeight * 0.88;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
