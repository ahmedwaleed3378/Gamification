import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/presentation/exam/view/question_choice.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../resources/values_manager.dart';

class DragDropQuestionWidget extends StatefulWidget {
  final QuestionsModel question;
  final ExamViewModel examViewModel;
  final NumberPaginatorController paginatorController;
  final int numberOfPages;
  final int index;
  final ItemScrollController scrollController;

  const DragDropQuestionWidget(
      {Key? key,
      required this.question,
      required this.examViewModel,
      required this.paginatorController,
      required this.numberOfPages,
      required this.scrollController,
      required this.index})
      : super(key: key);

  @override
  State<DragDropQuestionWidget> createState() => _DragDropQuestionWidgetState();
}

class _DragDropQuestionWidgetState extends State<DragDropQuestionWidget> {
  final _unselectedListKey = GlobalKey<AnimatedGridState>();
  final _selectedListKey = GlobalKey<AnimatedGridState>();
  final List<String> _unselected = ['Study', 'Science', 'I', 'Space'];
  final List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final List<String> choicesText =
        widget.question.mcq!.map((choice) => choice.mcqText).toList();

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s4.h)
            .copyWith(top: AppSize.s3.h),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    height: AppSize.s180,
                    width: AppSize.s180,
                    child: RiveAnimation.asset(
                      RiveAssets.celebrateRobot,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const BubbleSpecialThree(
                        text: 'I study space science',
                        color: Color(0xFF1B97F3),
                        tail: true,
                        isSender: false,
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: AppSize.s2.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          height: AppSize.s20.h,
                          width: size.width * 0.6,
                          decoration: BoxDecoration(
                              color: ColorManager.babyBlue.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(AppSize.s30)),
                          child: AnimatedGrid(
                            key: _selectedListKey,
                            initialItemCount: _selected.length,
                            itemBuilder: (context, index, animation) {
                              return InkWell(
                                onTap: () => _moveItem(
                                  fromIndex: index,
                                  fromList: _selected,
                                  fromKey: _selectedListKey,
                                  toList: _unselected,
                                  toKey: _unselectedListKey,
                                ),
                                child: Item(text: _selected[index]),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100.0,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            widget.question.questionDetails!.questionAttach.isNotEmpty
                // true
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    child: Image.network(
                      Constants.baseUrl +
                          widget.question.questionDetails!.questionAttach,
                      // 'https://images.freeimages.com/images/previews/ac9/railway-hdr-1361893.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset(
                        ImageAssets.empty,
                        width: AppSize.s14.h,
                        height: AppSize.s14.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      SizedBox(
        height: AppSize.s4.h,
      ),
      Container(
        margin: const EdgeInsets.symmetric(
            vertical: AppMargin.m10, horizontal: AppMargin.m30),
        height: AppSize.s8.h,
        child: Stack(
          children: [
            AnimatedGrid(
              key: GlobalKey(),
              initialItemCount: _unselected.length,
              itemBuilder: (context, index, animation) {
                return InkWell(
                  onTap: () {},
                  child: ItemShadow(text: _unselected[index]),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2,
                crossAxisSpacing: 10.0,
              ),
            ),
            AnimatedGrid(
              key: _unselectedListKey,
              initialItemCount: _unselected.length,
              itemBuilder: (context, index, animation) {
                return InkWell(
                  onTap: () => _moveItem(
                    fromIndex: index,
                    fromList: _unselected,
                    fromKey: _unselectedListKey,
                    toList: _selected,
                    toKey: _selectedListKey,
                  ),
                  child: Item(text: _unselected[index]),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2,
                crossAxisSpacing: 10.0,
              ),
            ),
          ],
        ),
      ),
      QuestionChoices(
          choicesText: choicesText,
          examViewModel: widget.examViewModel,
          question: widget.question,
          paginatorController: widget.paginatorController,
          numberOfPages: widget.numberOfPages,
          index: widget.index,
          scrollController: widget.scrollController,
          showButtonGroup: false),
    ]);
  }

  int _flyingCount = 0;

  _moveItem({
    required int fromIndex,
    required List fromList,
    required GlobalKey<AnimatedGridState> fromKey,
    required List toList,
    required GlobalKey<AnimatedGridState> toKey,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final globalKey = GlobalKey();
    final item = fromList.removeAt(fromIndex);
    fromKey.currentState!.removeItem(
      fromIndex,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Opacity(
            key: globalKey,
            opacity: 0.0,
            child: Item(text: item),
          ),
        );
      },
      duration: duration,
    );
    _flyingCount++;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      // Find the starting position of the moving item, which is exactly the
      // gap its leaving behind, in the original list.
      final box1 = globalKey.currentContext!.findRenderObject() as RenderBox;
      final pos1 = box1.localToGlobal(Offset.zero);
      // Find the destination position of the moving item, which is at the
      // end of the destination list.
      final box2 = toKey.currentContext!.findRenderObject() as RenderBox;
      final box2height = box1.size.height * (toList.length + _flyingCount - 1);
      final pos2 = box2.localToGlobal(Offset(0, box2height));
      // Insert an overlay to "fly over" the item between two lists.
      final entry = OverlayEntry(builder: (BuildContext context) {
        return TweenAnimationBuilder(
          tween: Tween<Offset>(begin: pos1, end: pos2),
          duration: duration,
          builder: (_, Offset value, child) {
            return Positioned(
              left: value.dx,
              top: value.dy,
              child: Item(text: item),
            );
          },
        );
      });

      Overlay.of(context)!.insert(entry);
      await Future.delayed(duration);
      entry.remove();
      toList.add(item);
      toKey.currentState!.insertItem(toList.length - 1);
      _flyingCount--;
    });
  }
}

class Item extends StatelessWidget {
  final String text;

  const Item({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s22)),
      child: Center(
        child: Text(
          text,
          style: getRegularInterStyle(
              color: ColorManager.black, fontSize: AppSize.s16.sp),
        ),
      ),
    );
  }
}

class ItemShadow extends StatelessWidget {
  final String text;

  const ItemShadow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.gray,
          borderRadius: BorderRadius.circular(AppSize.s22)),
      child: Center(
        child: Visibility(
          visible: false,
          child: Text(
            text,
            style: getRegularInterStyle(
                color: ColorManager.black, fontSize: AppSize.s16.sp),
          ),
        ),
      ),
    );
  }
}
