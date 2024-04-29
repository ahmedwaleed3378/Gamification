import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/courses/courses_model.dart';
import 'package:gamification/domain/model/gift_gallery/all_gifts_model.dart';
import 'package:gamification/domain/model/gift_gallery/buy_gift_model.dart';
import 'package:gamification/domain/model/gift_gallery/gift_by_user_id_model.dart';
import 'package:gamification/domain/model/gift_gallery/gift_gallery_model.dart';
import 'package:gamification/domain/model/request/all_courses_model.dart';
import 'package:gamification/domain/model/request/category_subcourse_model.dart';
import 'package:gamification/domain/model/request/course_category_model.dart';
import 'package:gamification/domain/model/request/request_learning_model.dart';
import 'package:gamification/domain/model/request/request_teaching_model.dart';
import 'package:gamification/domain/model/request/success_request_model.dart';
import 'package:gamification/domain/model/streakModel/streak_model.dart';
import 'package:gamification/domain/model/subjects_of_year/student_subjects.dart';
import 'package:gamification/domain/model/user_points/user_points_model.dart';
import 'package:gamification/domain/usecase/added_course_usecase.dart';
import 'package:gamification/domain/usecase/added_request_usecase.dart';
import 'package:gamification/domain/usecase/all_courses_request_usecase.dart';
import 'package:gamification/domain/usecase/assign_gift_touser_usecase.dart';
import 'package:gamification/domain/usecase/buy_gift_usecase.dart';
import 'package:gamification/domain/usecase/category_subcourse_usecase.dart';
import 'package:gamification/domain/usecase/course_category_usecase.dart';
import 'package:gamification/domain/usecase/course_request_usecase.dart';
import 'package:gamification/domain/usecase/courses_usecase.dart';
import 'package:gamification/domain/usecase/deleted_course_usecase.dart';
import 'package:gamification/domain/usecase/deleted_request_usecase.dart';
import 'package:gamification/domain/usecase/get_all_gifts.dart';
import 'package:gamification/domain/usecase/gift_gallery_usecase.dart';
import 'package:gamification/domain/usecase/request_teaching_usecase.dart';
import 'package:gamification/domain/usecase/user_points_usecase.dart';
import 'package:gamification/presentation/base/base_view_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecase/get_all_subjects.dart';
import '../../../domain/usecase/get_gift_byuser_id_usecase.dart';
import '../../../domain/usecase/get_streak_usecase.dart';
import '../../widget/custom_home_dialoge.dart';

class HomeViewModel extends BaseViewModel
    implements HomeViewModelOutputs, HomeViewModelInputs {
  final StreamController bottomNavStreamController =
      StreamController<int>.broadcast();

  final StreamController coursesStreamController =
      StreamController<CoursesModel>.broadcast();

  final StreamController userPointsStreamController =
      StreamController<UserPointsModel>.broadcast();

  final StreamController giftGalleryStreamController =
      StreamController<GiftGalleryModel>.broadcast();

  final StreamController requestTeachingStreamController =
      StreamController<RequestTeachingModel>.broadcast();

  final StreamController requestDetailsStreamController =
      StreamController<String>.broadcast();

  final StreamController requestNumberOfDaysStreamController =
      StreamController<int>.broadcast();

  final StreamController requestCourseIdStreamController =
      StreamController<int>.broadcast();

  final StreamController addTeachingRequestStreamController =
      StreamController<SuccessRequestModel>.broadcast();

  final StreamController deletedTeachingRequestStreamController =
      StreamController<SuccessRequestModel>.broadcast();

  final StreamController buyGiftStreamController =
      StreamController<BuyGiftModel>.broadcast();

  final StreamController addCourseRequestStreamController =
      StreamController<SuccessRequestModel>.broadcast();

  final StreamController deleteCourseRequestStreamController =
      StreamController<SuccessRequestModel>.broadcast();

  final StreamController coursesRequestStreamController =
      StreamController<RequestLearningModel>.broadcast();

  final StreamController courseCategoryStreamController =
      StreamController<CourseCategoryModel>.broadcast();

  final StreamController allCoursesRequestStreamController =
      StreamController<AllCoursesRequestModel>.broadcast();

  final StreamController categorySubCourseStreamController =
      StreamController<List<CategorySubCourseModel>>.broadcast();
  final StreamController userStreakStreamController =
      StreamController<StreakModel>.broadcast();

  final StreamController teachingRequestDurationStreamController =
      StreamController<String>.broadcast();
  final StreamController teachingRequestDetailsStreamController =
      StreamController<String>.broadcast();
  final StreamController teachingRequestAllValidStreamController =
      StreamController<void>.broadcast();

  final StreamController learningRequestDurationStreamController =
      StreamController<String>.broadcast();
  final StreamController seeAllPressedStreamController =
      StreamController<bool>.broadcast();
  final StreamController learningRequestReasonStreamController =
      StreamController<String>.broadcast();
  final StreamController learningRequestAllValidStreamController =
      StreamController<void>.broadcast();

  final StreamController getAllGiftsStreamController =
      StreamController<AllGiftsModel>.broadcast();

  final StreamController getGiftsByUserIdStreamController =
      StreamController<List<GiftByUserIdModel>>.broadcast();
  final StreamController _studentsSubjectsStreamController =
      BehaviorSubject<StudentSubjectsModel>();

  AddTeachingRequest teachingRequest =
      AddTeachingRequest(details: '', numberOfDays: 0, courseId: 0);

  AddCourseRequest courseRequest =
      AddCourseRequest(courseId: 0, numberOfDays: 1, reasonOfRequest: '');

  final CoursesUseCase _coursesUseCase;
  final UserPointsUseCase _userPointsUseCase;
  final GiftGalleryUseCase _giftGalleryUseCase;
  final RequestTeachingUseCase _requestTeachingUseCase;
  final AddedRequestUseCase _addedRequestUseCase;
  final DeletedRequestUseCase _deletedRequestUseCase;
  final BuyGiftUseCase _buyGiftUseCase;
  final CourseRequestUseCase _courseRequestUseCase;
  final AddedCourseUseCase _addedCourseUseCase;
  final DeletedCourseUseCase _deletedCourseUseCase;
  final AllCoursesRequestUseCase _allCoursesRequestUseCase;
  final CourseCategoryUsecase _courseCategoryUsecase;
  final CategorySubCourseUsecase _categorySubCourseUsecase;
  final GetAllGiftsUseCase _getAllGiftsUseCase;
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final GetGiftByUserIdUseCase _getGiftByUserIdUseCase;
  final AssignGiftToUserUseCase _assignGiftToUserUseCase;
  final StudentSubjectsUseCase _studentSubjectsUseCase;
  final GetStreakUseCase _userStreakUseCase;

  String userImage = '';
  String userName = '';
  int userGimNum = 0;
  int userFlashNum = 0;
  int teachingRequestPage = 1;
  int? totalStreak;
  int learningRequestPage = 1;
  List<GiftByUserIdModel>? giftsByUser;

  HomeViewModel(
      this._coursesUseCase,
      this._userPointsUseCase,
      this._giftGalleryUseCase,
      this._requestTeachingUseCase,
      this._addedRequestUseCase,
      this._deletedRequestUseCase,
      this._buyGiftUseCase,
      this._courseRequestUseCase,
      this._addedCourseUseCase,
      this._deletedCourseUseCase,
      this._allCoursesRequestUseCase,
      this._courseCategoryUsecase,
      this._categorySubCourseUsecase,
      this._getAllGiftsUseCase,
      this._getGiftByUserIdUseCase,
      this._assignGiftToUserUseCase,
      this._studentSubjectsUseCase,
      this._userStreakUseCase);

  @override
  void start() {
    _loadIndex();
    getAllData();
  //  getUserStreak();
    getAllSubjects();
  }

  @override
  void dispose() {
    super.dispose();
    bottomNavStreamController.close();
    coursesStreamController.close();
    userPointsStreamController.close();
    giftGalleryStreamController.close();
    requestTeachingStreamController.close();
    buyGiftStreamController.close();
    coursesRequestStreamController.close();
    addCourseRequestStreamController.close();
    addTeachingRequestStreamController.close();
    deletedTeachingRequestStreamController.close();
    deleteCourseRequestStreamController.close();
    userStreakStreamController.close();
    allCoursesRequestStreamController.close();
    teachingRequestDetailsStreamController.close();
    teachingRequestDurationStreamController.close();
    teachingRequestAllValidStreamController.close();
    learningRequestReasonStreamController.close();
    learningRequestDurationStreamController.close();
    learningRequestAllValidStreamController.close();
    requestNumberOfDaysStreamController.close();
    requestCourseIdStreamController.close();
    requestDetailsStreamController.close();
    categorySubCourseStreamController.close();
    courseCategoryStreamController.close();
    teachingRequestPage = 1; // return to default first page
    getGiftsByUserIdStreamController.close();
    getAllGiftsStreamController.close();
    _studentsSubjectsStreamController.close();
  }

  getAllData() async {
    userName = _appPreferences.getUserArName();
    userImage = _appPreferences.getUserPicture();
    userGimNum = _appPreferences.getUserGimNum();
    userFlashNum = _appPreferences.getUserFlashNum();
    getAllSubjects();
  }

  getAllSubjects() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _studentSubjectsUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      studentSubjectsDataSink.add(data);

      inputState.add(ContentState());
    });
  }

  getGitsData() {
    getUserPoints();
    getGiftGallery();
  }

  getRequests() {
    getTeachingRequest();
    getCoursesRequest();
    getAllCoursesRequest();
    getAllCourseCategory();
  }

  getCourses() async {
    (await _coursesUseCase.execute(1)).fold((failure) {
      List<CourseContentModel> basicCourses = [];
      List<CourseContentModel> recommendedCourses = [];

      CoursesModel model = CoursesModel(basicCourses, recommendedCourses);
      inputState.add(ContentState());
      inputCourses.add(model);
    }, (courses) {
      // right -> data (success) // content
      /// merge recommended courses to basic courses list
      courses.recommendedCoursesList!.map((course) {
        // set the status of recommended course not basic
        course.isBasic = false;
        courses.basicCoursesList!.add(course);
      }).toList();

      inputState.add(ContentState());
      // save user data in local storage
      inputCourses.add(courses);
    });
  }

  getUserPoints() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );
    (await _userPointsUseCase.execute(1)).fold((failure) {
      // left -> failure --> List<StationModel> list = [];
      UserPointsModel model = UserPointsModel(0, 0, 0);
      inputState.add(ContentState());
      inputUserPoints.add(model);
    }, (points) {
      // right -> data (success) -->  content
      // inputState.add(ContentState());
      inputUserPoints.add(points);
    });
  }

  getGiftGallery() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );
    (await _giftGalleryUseCase.execute(1)).fold((failure) {
      // left -> failure
      List<GiftGalleryContentModel> giftGallery = [];

      GiftGalleryModel model = GiftGalleryModel(giftGallery, 0);

      inputState.add(ContentState());
      inputGiftGallery.add(model);
    }, (giftGallery) {
      // right -> data (success) --> content
      inputState.add(ContentState());
      // save user data in local storage
      inputGiftGallery.add(giftGallery);
    });
  }

  getTeachingRequest() async {
    // inputState.add(
    //   LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    // );
    (await _requestTeachingUseCase.execute(teachingRequestPage)).fold(
        (failure) {
      // left -> failure
      List<RequestTeachingItemsModel> requestTeaching = [];

      RequestTeachingModel model = RequestTeachingModel(0, requestTeaching);

      inputState.add(ContentState());
      inputRequestTeaching.add(model);
    }, (requestTeaching) {
      // right -> data (success) --> content
      inputState.add(ContentState());
      // save user data in local storage
      inputRequestTeaching.add(requestTeaching);
    });
  }

  addTeachingRequest() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _addedRequestUseCase.execute(teachingRequest)).fold((failure) {
      // left -> failure
      SuccessRequestModel model = SuccessRequestModel(0, '');

      inputState.add(ContentState());
      inputAddTeachingRequest.add(model);
    }, (successRequest) {
      // right -> data (success) --> content
      inputState.add(SuccessState(
          StateRendererType.popupSuccessState, successRequest.returnString));
      // isTeachingRequestAddedStreamController.add(true);
    });
  }

  deleteTeachingRequest(int requestId) async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _deletedRequestUseCase.execute(requestId)).fold((failure) {
      // left -> failure
      SuccessRequestModel model = SuccessRequestModel(0, '');

      inputState.add(ContentState());
      inputDeletedTeachingRequest.add(model);
    }, (successRequest) {
      // right -> data (success) --> content
      inputState.add(SuccessState(
          StateRendererType.popupSuccessState, successRequest.returnString));
    });
  }

  buyGift() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _buyGiftUseCase.execute(1)).fold((failure) {
      // left -> failure
      BuyGiftModel model = BuyGiftModel(0);

      inputState.add(ContentState());
      inputGiftGallery.add(model);
    }, (gift) {
      // right -> data (success) --> content
      inputState.add(ContentState());
      // save user data in local storage
      inputGiftGallery.add(gift);
    });
  }

  getCoursesRequest() async {
    (await _courseRequestUseCase.execute(learningRequestPage)).fold((failure) {
      // left -> failure
      List<RequestLearningItemsModel> coursesRequest = [];

      RequestLearningModel model = RequestLearningModel(0, coursesRequest);

      inputState.add(ContentState());
      inputCoursesRequest.add(model);
    }, (courseRequest) {
      // right -> data (success) --> content
      inputState.add(ContentState());
      // save user data in local storage
      inputCoursesRequest.add(courseRequest);
    });
  }

  addCourseRequest() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _addedCourseUseCase.execute(courseRequest)).fold((failure) {
      // left -> failure
      SuccessRequestModel model = SuccessRequestModel(0, '');

      inputState.add(ContentState());
      inputAddCourseRequest.add(model);
    }, (successRequest) {
      // right -> data (success) --> content
      inputState.add(SuccessState(
          StateRendererType.popupSuccessState, successRequest.returnString));
    });
  }

  deleteCourseRequest(int requestId) async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _deletedCourseUseCase.execute(requestId)).fold((failure) {
      // left -> failure
      SuccessRequestModel model = SuccessRequestModel(0, '');

      inputState.add(ContentState());
      inputDeleteCourseRequest.add(model);
    }, (successRequest) {
      // right -> data (success) --> content
      inputState.add(SuccessState(
          StateRendererType.popupSuccessState, successRequest.returnString));
    });
  }

  getAllCoursesRequest() async {
    (await _allCoursesRequestUseCase.execute(1)).fold((failure) {
      // left -> failure
      List<CoursesRequestItemsModel> courseItems = [];

      AllCoursesRequestModel model = AllCoursesRequestModel(0, courseItems);

      inputState.add(ContentState());
      inputAllCoursesRequest.add(model);
    }, (courses) {
      inputState.add(ContentState());
      // save user data in local storage
      inputAllCoursesRequest.add(courses);
    });
  }

  getUserStreak(BuildContext context) async {
    (await _userStreakUseCase.execute(Void)).fold((failure) {
      // left -> failure
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      // totalStreak=data.streakCounter;
      inputState.add(ContentState());
      // save user data in local storage
      if (!(_appPreferences.getUserStreaks() == data.streakCounter)) {
        showDialog(
            context: context,
            builder: (context) => CustomHomeDialoge(
                  currentIndex: 3,
                  counter: data.counter,
                  totalStreak: data.streakCounter,
                ),);
        _appPreferences.setUserStrikes(data.streakCounter);
      }
      userStreakDataSink.add(data);
    });
  }

  getAllCourseCategory() async {
    (await _courseCategoryUsecase.execute(1)).fold((failure) {
      // left -> failure
      List<CourseCategoryListModel> courseCategoryList = [];

      CourseCategoryModel model = CourseCategoryModel(0, courseCategoryList);

      inputState.add(ContentState());
      inputAllCourseCategory.add(model);
    }, (courseCategory) {
      // right -> data (success) --> content
      inputState.add(ContentState());
      // save user data in local storage
      inputAllCourseCategory.add(courseCategory);
    });
  }

  getCategorySubCourses(int categoryID) async {
    (await _categorySubCourseUsecase.execute(categoryID)).fold((failure) {
      // left -> failure
      List<CategorySubCourseModel> courseCategoryList = [];

      print(failure.message);

      inputState.add(ContentState());
      inputCategorySubCourse.add(courseCategoryList);
    }, (categorySubCourse) {
      // right -> data (success) --> content
      inputState.add(ContentState());
      // save user data in local storage
      inputCategorySubCourse.add(categorySubCourse);
    });
  }

  getAllGifts() async {
    (await _getAllGiftsUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (gifts) {
      inputAllGifts.add(gifts);
      inputState.add(ContentState());
    });
  }

  getGiftByUserId() async {
    (await _getGiftByUserIdUseCase.execute(Void)).fold((failure) {
      List<GiftByUserIdModel> model = [];
      inputUserGiftsById.add(model);
      giftsByUser = [];
    }, (gifts) {
      giftsByUser = gifts;
      inputUserGiftsById.add(gifts);
    });
  }

  assignGiftToUser(int giftId, double points, BuildContext context) async {
    (await _assignGiftToUserUseCase
            .execute(AssignGiftToUserRequest(giftId: giftId, quantity: 1)))
        .fold((failure) {
      // left -> failure
      inputState
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (gifts) async {
      // right -> data (success) --> content
      userGimNum = userGimNum - points.toInt();
      _appPreferences.setUserGimNum(userGimNum);
      inputState.add(ContentState());
      String lang = await _appPreferences.getAppLanguage();
      inputState.add(SuccessState(StateRendererType.popupSuccessState,
          lang == 'ar' ? '.تمت اضافة الهدية لك' : gifts.returnMessage));
    });
  }

  /// inputs
  @override
  Sink get inputBottomNavIndex => bottomNavStreamController.sink;

  @override
  Sink get studentSubjectsDataSink => _studentsSubjectsStreamController.sink;
  @override
  Sink get userStreakDataSink => userStreakStreamController.sink;

  @override
  Sink get inputCourses => coursesStreamController.sink;

  @override
  Sink get inputUserPoints => userPointsStreamController.sink;

  @override
  Sink get inputGiftGallery => giftGalleryStreamController.sink;

  @override
  Sink get inputRequestTeaching => requestTeachingStreamController.sink;

  @override
  Sink get inputRequestDetails => requestDetailsStreamController.sink;

  @override
  Sink get inputRequestCourseName => requestCourseIdStreamController.sink;

  @override
  Sink get inputRequestNumberOfDays => requestNumberOfDaysStreamController.sink;

  @override
  Sink get inputAddTeachingRequest => addTeachingRequestStreamController.sink;

  @override
  Sink get inputDeletedTeachingRequest =>
      deletedTeachingRequestStreamController.sink;

  @override
  Sink get inputBuyGift => buyGiftStreamController.sink;

  @override
  Sink get inputCoursesRequest => coursesRequestStreamController.sink;

  @override
  Sink get inputAddCourseRequest => addCourseRequestStreamController.sink;

  @override
  Sink get inputDeleteCourseRequest => deleteCourseRequestStreamController.sink;

  @override
  Sink get inputAllCoursesRequest => allCoursesRequestStreamController.sink;

  @override
  Sink get inputRequestCourseId => requestCourseIdStreamController.sink;

  @override
  Sink get inputAllCourseCategory => courseCategoryStreamController.sink;

  @override
  Sink get inputCategorySubCourse => categorySubCourseStreamController.sink;

  @override
  Sink get inputAllGifts => getAllGiftsStreamController.sink;

  @override
  Sink get inputUserGiftsById => getGiftsByUserIdStreamController.sink;

  @override
  Sink get seeAllPressedSink => seeAllPressedStreamController.sink;

  /// outputs
  @override
  Stream<int> get outputBottomNavIndex =>
      bottomNavStreamController.stream.map((index) => index);

  @override
  Stream<CoursesModel> get outputCourses =>
      coursesStreamController.stream.map((course) => course);

  @override
  Stream<UserPointsModel> get outputUserPoints =>
      userPointsStreamController.stream.map((point) => point);

  @override
  Stream<GiftGalleryModel> get outputGiftGallery =>
      giftGalleryStreamController.stream.map((giftGallery) => giftGallery);

  @override
  Stream<RequestTeachingModel> get outputRequestTeaching =>
      requestTeachingStreamController.stream.map((request) => request);

  @override
  Stream<SuccessRequestModel> get outputDeletedTeachingRequest =>
      deletedTeachingRequestStreamController.stream.map((request) => request);

  @override
  Stream<BuyGiftModel> get outputBuyGift =>
      buyGiftStreamController.stream.map((buyGift) => buyGift);

  @override
  Stream<RequestLearningModel> get outputLearningRequest =>
      coursesRequestStreamController.stream.map((course) => course);

  @override
  Stream<SuccessRequestModel> get outputAddCourseRequest =>
      addCourseRequestStreamController.stream
          .map((courseRequest) => courseRequest);

  @override
  Stream<SuccessRequestModel> get outputDeleteCourseRequest =>
      deleteCourseRequestStreamController.stream
          .map((courseRequest) => courseRequest);

  @override
  Stream<AllCoursesRequestModel> get outputAllCoursesRequest =>
      allCoursesRequestStreamController.stream.map((course) => course);

  @override
  Stream<bool> get outputIsTeachingAllDataValid =>
      teachingRequestAllValidStreamController.stream
          .map((_) => areAllInputsValid());

  @override
  Stream<bool> get outputIsTeachingDetailsValid =>
      teachingRequestDetailsStreamController.stream
          .map((details) => _isTeachingDetailsValid(details));

  @override
  Stream<bool> get outputIsTeachingDurationValid =>
      teachingRequestDurationStreamController.stream
          .map((duration) => _isTeachingDurationValid(duration));

  @override
  Stream<bool> get outputIsLearningAllDataValid =>
      learningRequestAllValidStreamController.stream
          .map((_) => areAllLearningInputsValid());

  @override
  Stream<bool> get outputIsLearningDurationValid =>
      learningRequestDurationStreamController.stream
          .map((duration) => _isLearningDurationValid(duration));

  @override
  Stream<bool> get outputIsLearningReasonValid =>
      learningRequestReasonStreamController.stream
          .map((reason) => _isLearningReasonValid(reason));

  @override
  Stream<bool> get outputseeAllPressed =>
      seeAllPressedStreamController.stream.map((event) => event);

  @override
  Stream<CourseCategoryModel> get outputAllCourseCategory =>
      courseCategoryStreamController.stream.map((course) => course);

  @override
  Stream<List<CategorySubCourseModel>> get outputCategorySubCourse =>
      categorySubCourseStreamController.stream.map((course) => course);

  @override
  Stream<AllGiftsModel> get outputAllGifts =>
      getAllGiftsStreamController.stream.map((gift) => gift);

  @override
  Stream<List<GiftByUserIdModel>> get outputUserGiftsById =>
      getGiftsByUserIdStreamController.stream.map((userGifts) => userGifts);

  @override
  Stream<StudentSubjectsModel> get outAllSUbjectsDataStream =>
      _studentsSubjectsStreamController.stream.map((event) => event);
  @override
  Stream<StreakModel> get outputUserStreakDataStream =>
      userStreakStreamController.stream.map((event) => event);

  @override
  changeBottomNav(int index) {
    inputBottomNavIndex.add(index);
  }

  bool press = false;

  seeAllPressing() {
    seeAllPressedSink.add(!press);
    press = !press;
  }

  _loadIndex() {
    inputBottomNavIndex.add(0);
  }

  bool _isTeachingDetailsValid(String details) {
    return details.isNotEmpty;
  }

  bool _isTeachingDurationValid(String duration) {
    return duration.isNotEmpty;
  }

  bool areAllInputsValid() {
    return _isTeachingDetailsValid(teachingRequest.details!) &&
        _isTeachingDurationValid(teachingRequest.numberOfDays!.toString());
  }

  bool _isLearningReasonValid(String reason) {
    return reason.isNotEmpty;
  }

  bool _isLearningDurationValid(String duration) {
    return duration.isNotEmpty;
  }

  bool areAllLearningInputsValid() {
    return _isLearningReasonValid(courseRequest.reasonOfRequest!) &&
        _isLearningDurationValid(courseRequest.numberOfDays!.toString());
  }

  @override
  setTeachingRequestCourseID(int id) {
    inputRequestCourseId.add(id);
  }

  @override
  setTeachingRequestDetails(String details) {
    teachingRequest.details = details;
  }

  @override
  setTeachingRequestDuration(int duration) {
    teachingRequest.numberOfDays = duration;
  }

  @override
  setLearningRequestDuration(int duration) {
    courseRequest.numberOfDays = duration;
    debugPrint(courseRequest.numberOfDays.toString());
  }

  @override
  setLearningRequestReason(String reason) {
    courseRequest.reasonOfRequest = reason;
    debugPrint(courseRequest.reasonOfRequest);
  }
}

abstract class HomeViewModelInputs {
  changeBottomNav(int index);

  Sink get inputBottomNavIndex;

  Sink get inputCourses;

  Sink get inputUserPoints;

  Sink get inputGiftGallery;

  Sink get inputRequestTeaching;

  Sink get inputRequestDetails;

  Sink get inputRequestNumberOfDays;

  Sink get inputRequestCourseName;

  Sink get inputRequestCourseId;

  Sink get inputAddTeachingRequest;

  Sink get inputDeletedTeachingRequest;

  Sink get inputBuyGift;

  Sink get inputAddCourseRequest;

  Sink get inputDeleteCourseRequest;

  Sink get inputCoursesRequest;

  Sink get inputAllCoursesRequest;

  Sink get inputAllCourseCategory;

  Sink get inputCategorySubCourse;

  Sink get inputAllGifts;

  Sink get inputUserGiftsById;

  Sink get studentSubjectsDataSink;
  Sink get userStreakDataSink;

  Sink get seeAllPressedSink;

  setTeachingRequestDuration(int duration);

  setTeachingRequestDetails(String details);

  setLearningRequestDuration(int duration);

  setLearningRequestReason(String reason);

  setTeachingRequestCourseID(int id);
}

abstract class HomeViewModelOutputs {
  Stream<int> get outputBottomNavIndex;

  Stream<CoursesModel> get outputCourses;

  Stream<UserPointsModel> get outputUserPoints;

  Stream<GiftGalleryModel> get outputGiftGallery;

  Stream<RequestTeachingModel> get outputRequestTeaching;

  Stream<SuccessRequestModel> get outputDeletedTeachingRequest;

  Stream<BuyGiftModel> get outputBuyGift;

  Stream<RequestLearningModel> get outputLearningRequest;

  Stream<SuccessRequestModel> get outputAddCourseRequest;

  Stream<SuccessRequestModel> get outputDeleteCourseRequest;

  Stream<AllCoursesRequestModel> get outputAllCoursesRequest;

  Stream<CourseCategoryModel> get outputAllCourseCategory;

  Stream<List<CategorySubCourseModel>> get outputCategorySubCourse;

  Stream<bool> get outputIsTeachingDurationValid;

  Stream<bool> get outputIsTeachingDetailsValid;

  Stream<bool> get outputIsTeachingAllDataValid;

  Stream<bool> get outputIsLearningDurationValid;

  Stream<bool> get outputIsLearningReasonValid;

  Stream<bool> get outputIsLearningAllDataValid;

  Stream<bool> get outputseeAllPressed;

  Stream<AllGiftsModel> get outputAllGifts;

  Stream<List<GiftByUserIdModel>> get outputUserGiftsById;

  Stream<StudentSubjectsModel> get outAllSUbjectsDataStream;
  Stream<StreakModel> get outputUserStreakDataStream;
}
