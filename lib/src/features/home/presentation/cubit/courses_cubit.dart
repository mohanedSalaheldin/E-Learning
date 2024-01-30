import '../../../allCourses/presentation/pages/all_courses_screen.dart';
import '../pages/home_screen/home_screen.dart';
import '../../../myCourses/presentation/pages/my_courses_screen.dart';
import '../../../settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  static CoursesCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    emit(CoursesNavBarChange());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const AllCoursesScreen(),
    const MyLearnScreen(),
    const SettingsScreen(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Courses',
      icon: Icon(
        Icons.school_rounded,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'My Learning',
      icon: Icon(
        Icons.menu_book_rounded,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(
        Icons.settings,
      ),
    ),
  ];
}
