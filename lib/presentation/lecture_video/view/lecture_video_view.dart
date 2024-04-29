import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/lecture_parts/lecture_parts_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/home/components/request/request_shimmer.dart';
import 'package:gamification/presentation/lecture_video/viewmodel/lecture_video_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

import '../../widget/refresh_indicator_widget.dart';

class LectureVideoView extends StatefulWidget {
  final int lessonId;

  const LectureVideoView({super.key, required this.lessonId});

  @override
  State<LectureVideoView> createState() => _LectureVideoViewState();
}

class _LectureVideoViewState extends State<LectureVideoView> {
  final LectureVideoViewModel _lectureVideoViewModel =
      instance<LectureVideoViewModel>();

  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;
  String? partName;
  int? materialId;
  int? partId;

  _bind() {
    _lectureVideoViewModel.start();
    _lectureVideoViewModel.getLectureParts(widget.lessonId);
  }

  @override
  void initState() {
    _bind();
    initializePlayer(videoPath);

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  String videoPath =
      "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4";

  Future<void> initializePlayer(String path) async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(path),
    );

    await Future.wait([
      _videoPlayerController.initialize(),
    ]);

    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
      hideControlsTimer: const Duration(seconds: 1),
      allowFullScreen: true,
    );

    // if (_videoPlayerController.value.isPlaying) {
    //   _lectureVideoViewModel.createViewRow(materialId!, partId!);
    // }

    // bool isInit = true;
    // _chewieController?.addListener(() {
    //   var isFullScreen = _chewieController?.isFullScreen;
    //   if (isFullScreen! && isInit) {
    //     _chewieController?.exitFullScreen();
    //     setState(() {
    //       isInit = false;
    //     });
    //   } else {
    //     _chewieController?.enterFullScreen();
    //     isInit = true;
    //   }
    // });
  }

  Future<void> toggleVideo(String playIndex) async {
    await _videoPlayerController.pause();

    videoPath = playIndex;

    await initializePlayer(videoPath);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _lectureVideoViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data
                ?.getScreenWidget(context, _getContentWidget(), () {}) ??
            _getContentWidget();
      },
    );
  }

  Future loadContent() async {
    _lectureVideoViewModel.getAllData();
  }

    Future loadList() async {
      _lectureVideoViewModel.start();
    _lectureVideoViewModel.getLectureParts(widget.lessonId);
  }
  Widget _getContentWidget() {
    return  RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: SizedBox(
                  height: AppSize.s4.h,
                  width: AppSize.s4.h,
                  child: SvgPicture.asset(ImageAssets.arrowIc),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              Expanded(
                flex: 2,
                child: _chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(controller: _chewieController!)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          SizedBox(height: AppSize.s2.h),
                          const Text('Loading'),
                        ],
                      ),
              ),
              Expanded(
                flex: 3,
                child: StreamBuilder<LecturePartsModel>(
                  stream: _lectureVideoViewModel.outputLectureParts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: AppSize.s2.h),
                            Text(
                              snapshot.data!.model!.material!.materialName,
                              style: getBoldOxygenStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s18.sp,
                              ),
                            ),
                            SizedBox(height: AppSize.s2.h),
                            Text(
                              partName ?? snapshot.data!.model!.parts![0].name,
                              style: getBoldOxygenStyle(
                                color: ColorManager.gray43,
                                fontSize: AppSize.s16.sp,
                              ),
                            ),
                            SizedBox(height: AppSize.s10.h),
                            Card(
                              color: ColorManager.gray900,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s15),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppPadding.p3.h,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p2.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.model!.material!
                                            .materialName,
                                        style: getBoldOxygenStyle(
                                          color: ColorManager.black,
                                          fontSize: AppSize.s15.sp,
                                        ),
                                      ),
                                      SizedBox(height: AppSize.s2.h),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount:
                                            snapshot.data!.model!.parts!.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              toggleVideo(snapshot.data!.model!
                                                  .parts![index].path);

                                              setState(() {
                                                partName = snapshot.data!.model!
                                                    .parts![index].name;

                                                materialId = snapshot
                                                    .data!.model!.material!.id;

                                                partId = snapshot.data!.model!
                                                    .parts![index].id;
                                              });

                                              // if(index == 0) {
                                              //   toggleVideo(snapshot.data!.model!
                                              //       .parts![index].path);
                                              //
                                              //   setState(() {
                                              //     partName = snapshot.data!.model!
                                              //         .parts![index].name;
                                              //
                                              //     materialId = snapshot
                                              //         .data!.model!.material!.id;
                                              //
                                              //     partId = snapshot.data!.model!
                                              //         .parts![index].id;
                                              //   });
                                              //
                                              // } else if(snapshot.data!.model!.parts![index - 1].isComplete == false){
                                              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              //     content: Text('You need to complete previous modules first'),
                                              //   ));
                                              //
                                              // } else {
                                              //   toggleVideo(snapshot.data!.model!
                                              //       .parts![index].path);
                                              //
                                              //   setState(() {
                                              //     partName = snapshot.data!.model!
                                              //         .parts![index].name;
                                              //
                                              //     materialId = snapshot
                                              //         .data!.model!.material!.id;
                                              //
                                              //     partId = snapshot.data!.model!
                                              //         .parts![index].id;
                                              //   });
                                              // }
                                            },
                                            child: Card(
                                              color: ColorManager.white,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(AppSize.s15),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: AppPadding.p5.w,
                                                  vertical: AppPadding.p2.h,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SvgPicture.asset(
                                                      ImageAssets.videoIcon,
                                                      height: AppSize.s4.h,
                                                    ),
                                                    SizedBox(
                                                        width: AppSize.s2.w),
                                                    Flexible(
                                                      child: Text(
                                                        snapshot.data!.model!
                                                            .parts![index].name,
                                                        style:
                                                            getBoldOxygenStyle(
                                                          color: ColorManager
                                                              .gray34,
                                                          fontSize:
                                                              AppSize.s16.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (index, context) =>
                                            SizedBox(
                                          height: AppSize.s1.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const RequestShimmer();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
