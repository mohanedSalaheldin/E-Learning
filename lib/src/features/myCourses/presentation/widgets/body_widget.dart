import '../../../../core/entities/my_courses_entity.dart';
import '../../../../core/errors/error_strings.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../../../../core/utils/widgets/loading_screen.dart';
import '../../../../core/utils/widgets/no_connection_screen.dart';
import '../../../../core/utils/widgets/server_error_screen.dart';
import '../../domain/entities/section_entity.dart';
import '../cubit/mycourses_cubit.dart';
import '../pages/course_lectures_screen.dart.dart';
import 'lecture_item_widget.dart';
import 'youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injector.dart' as di;

Widget buildBody({
  required CourseEntity courseEntity,
  required String currentSectionURL,
  required bool isChangeSection,
}) {
  return BlocProvider(
    create: (context) => di.sl<MycoursesCubit>()
      ..getAllSections(courseID: courseEntity.courseID),
    child: BlocConsumer<MycoursesCubit, MycoursesState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        List<SectionEntity> sectionsList = MycoursesCubit.get(context).sections;
        if (state is GetAllSectionsLoading) {
          return const LoadingScreen();
        }
        if (state is GetAllSectionsError) {
          if (state.msg == ErrorsString.noInternet) {
            return const NoConnectionScreen();
          } else {
            return const ServerErrorScreen();
          }
        }
        return OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Scaffold(
                body: MyYouTubeWidget(
                  url:
                      isChangeSection ? currentSectionURL : sectionsList[0].url,
                  courseID: courseEntity.courseID,
                ),
              );
            } else {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyYouTubeWidget(
                        url: isChangeSection
                            ? currentSectionURL
                            : sectionsList[0].url,
                        courseID: courseEntity.courseID,
                      ),
                      vericalGab(val: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courseEntity.courseName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 26,
                                  ),
                            ),
                            vericalGab(val: 10.0),
                            Text(
                              courseEntity.tag,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      vericalGab(val: 20.0),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildLectureItem(
                            context: context,
                            sectionEntity: sectionsList[index],
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => CourseLecturesScreen(
                                    courseEntity: courseEntity,
                                    isLectureChanged: true,
                                    sectionURL: MycoursesCubit.get(context)
                                        .sections[index]
                                        .url,
                                  ),
                                ),
                              );
                              // controller.dispose();
                            },
                          ),
                          separatorBuilder: (context, index) =>
                              vericalGab(val: 5.0),
                          itemCount: sectionsList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    ),
  );
}
