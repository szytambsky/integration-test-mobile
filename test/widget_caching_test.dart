import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/main.dart';
import 'package:flutter/material.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/services/photoService.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/views/home.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
        title: 'List of photos',
        debugShowCheckedModeBanner: false,
        home: MultiRepositoryProvider(
          providers: [
            // we should mock the service also https://www.youtube.com/watch?v=Ghqry5dtgH4&t=306s
            RepositoryProvider(create: (context) => PhotoService()),
          ],
          child: HomeScreen(),
        ));
  }

  void arrangeNewLaunchReturnsValuesWithDelay2Seconds() async {
    await Future.delayed(Duration(seconds: 2));
  }

  testWidgets('Title is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text("List of photos"), findsOneWidget);
  });

  testWidgets('Testing infinity scrolling with caching and pagination',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();
  });
}
