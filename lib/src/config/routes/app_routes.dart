import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow1872/src/presentation/views/calendar_page/calendar_page.dart';
import 'package:rainbow1872/src/presentation/views/home_page/home_page.dart';
import 'package:rainbow1872/src/presentation/views/lesson_review_page/lesson_review_page.dart';
import 'package:rainbow1872/src/presentation/views/reservation_page/reservation_page.dart';
import 'package:rainbow1872/src/presentation/views/splash_page.dart';
import 'package:rainbow1872/src/presentation/views/store_state_page/store_state_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case "/" :
        return _getRoute(SplashPage());
      case "/HomePage" :
        return _getRoute(HomePage());
      case "/CalendarPage" :
        return _getRoute(CalendarPage());
      case "/ReservationPage" :
        return _getRoute(ReservationPage());
      case "/LessonReviewPage" :
        return _getRoute(LessonReviewPage(isMissing: true));
      case "/LessonReviewPageMissing" :
        return _getRoute(LessonReviewPage(isMissing: false));
      case "/StoreStatePage" :
        return _getRoute(StoreStatePage());
      default :
        return _getRoute(SplashPage());
    }
  }

  static Route<dynamic>? _getRoute(Widget view) {
    return GetPageRoute(page: () => view);
  }
}