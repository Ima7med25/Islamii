import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/core/service/shared_prefs_service.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:rxdart/subjects.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial()) {
    scrollController.addListener(_onScroll);
  }
  ScrollController scrollController = ScrollController();
  Timer? timer;
  bool isVisiblBottomSheet = true;

  // change font sized
  BehaviorSubject<double> fontSize = BehaviorSubject<double>.seeded(22);

  void changeFontSized(double fontSized) async {
    fontSize.add(fontSized);
    await SharedPrefsService.setData(AppConst.kfontSized, fontSized);
    emit(ChangeFontSize(fontSize: fontSized));
    log('fontSize: $fontSize');
  }

  void startAnimatioScroll(int numberPages) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: numberPages * 43),
      curve: Curves.linear,
    );
  }

  void _onScroll() {
    if (isVisiblBottomSheet) {
      isVisiblBottomSheet = false;
      emit(AutomaticAnimationState(isAutomaticAnimation: false));
    }
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 200), () {
      isVisiblBottomSheet = true;
      emit(AutomaticAnimationState(isAutomaticAnimation: true));
    });
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
