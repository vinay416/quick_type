import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class TakeView extends StatefulWidget {
  const TakeView({this.take, super.key});
  final TakeModel? take;
  static String get routeName => 'take';

  @override
  State<TakeView> createState() => _TakeViewState();
}

class _TakeViewState extends State<TakeView> {
  final scrollController = ScrollController();
  final textController = TextEditingController();
  double height = 100;
  late TakeModel take;
  late TakesViewModel viewModel;

  @override
  void initState() {
    scrollListener();
    initilize();
    super.initState();
  }

  void initilize() {
    viewModel = context.read<TakesViewModel>();
    take = widget.take ?? TakeModel.empty();
    textController.text = take.data;
    viewModel.setTake(take);
    viewModel.createTake(take);
  }

  @override
  void didChangeDependencies() {
    height = context.screenHeight * 0.88;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.onTapBack(take);
        return true;
      },
      child: CustomScaffold(
        enableLeadingBack: !kIsWeb,
        title: take.title.isEmpty ? 'New Take' : take.title,
        isSmallAppBar: true,
        onTapback: () {
          viewModel.onTapBack(take);
          context.pop();
        },
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: height,
          child: TextField(
            controller: textController,
            scrollController: scrollController,
            onChanged: (value) {
              viewModel.debounceFunc(
                controller: textController,
                oldTake: take,
              );
            },
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
    textController.dispose();
    super.dispose();
  }
}
