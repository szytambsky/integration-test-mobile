import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/services/photoService.dart';
import 'package:mgr_flutter_anim_cache_pagin_list/views/home.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  print("*************** RUNNING MY TEST*****");

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

  // testWidgets('Integration test swipe by gesture', (WidgetTester tester) async {
  //   app.main();
  //   await tester.pumpAndSettle(const Duration(seconds: 3));

  //   final listFinder = find.byType(ListView);
  //   final itemFinder = find.byKey(const ValueKey('item_50'));
  //   await tester.dragUntilVisible(listFinder, itemFinder, Offset(0, -200),
  //       duration: Duration(seconds: 3));
  //   await tester.pumpAndSettle(const Duration(seconds: 3));
  //   await tester.dragUntilVisible(listFinder, itemFinder, Offset(0, -200),
  //       duration: Duration(seconds: 3));
  //   await tester.pumpAndSettle();
  //   await tester.dragUntilVisible(listFinder, itemFinder, Offset(0, -300),
  //       duration: Duration(seconds: 3));
  //   await tester.pumpAndSettle();
  // });

  testWidgets('Integration test', (WidgetTester tester) async {
    print('Integration test started');
    app.main();
    print('app.main(); started');
    await tester.pumpAndSettle(const Duration(seconds: 3));
    print('pumpAndSettle(const Duration(seconds: 3) started');
    //await tester.pumpWidget(createWidgetUnderTest());
    //await tester.pumpAndSettle(const Duration(seconds: 1));

    await binding.traceAction(
      () async {
        print('traceAction started');

        for (var i = 0; i < 22; i++) {
          await tester.drag(find.byType(ListView), Offset(0, -1200));
          await tester.pumpAndSettle(const Duration(seconds: 2));
        }

        //await tester.tapAt(const Offset(20, -20));

        //await tester.pump();
        WidgetsBinding.instance!.handlePointerEvent(
            PointerDownEvent(pointer: 0, position: Offset(20, 20)));
        WidgetsBinding.instance!.handlePointerEvent(
            PointerUpEvent(pointer: 0, position: Offset(20, 20)));

        await tester.pump();
        //await tester.pumpAndSettle(const Duration(seconds: 2));

        for (var i = 0; i < 22; i++) {
          await tester.drag(find.byType(ListView), Offset(0, -1200));
          await tester.pumpAndSettle(const Duration(seconds: 2));
        }
      },
      reportKey: 'scrolling_timeline',
    );
  });

  void dragTheListViewWith(
      double offset, int times, WidgetTester tester) async {
    for (var i = 0; i < times; i++) {
      await tester.drag(find.byType(ListView), Offset(0, offset));
      await tester.pumpAndSettle(const Duration(seconds: 2));
    }
  }

  // testWidgets('Title is displayed', (WidgetTester tester) async {
  //   await tester.pumpWidget(createWidgetUnderTest());
  //   await tester.pumpAndSettle(const Duration(seconds: 10));
  //   expect(find.text("List of photos"), findsOneWidget);
  // });

  // testWidgets('Testing infinity scrolling with caching and pagination',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(createWidgetUnderTest());
  //   await tester.pumpAndSettle(const Duration(seconds: 1));

  //   await tester.drag(find.byType(ListView), Offset(0, -30000));
  //   await tester.pump();
  //   await tester.pumpAndSettle();
  //   //await tester.pump();
  //   // final listFinder = find.byType(ListView);
  //   // final itemFinder = find.byKey(const ValueKey('item_8'));
  //   // await tester.dragUntilVisible(listFinder, itemFinder, Offset(0, 300));
  //   // await tester.dragUntilVisible(listFinder, itemFinder, Offset(0, 300));
  //   // await tester.dragUntilVisible(listFinder, itemFinder, Offset(0, 300));
  //   // await tester.pumpAndSettle();

  //   //srollUntilVisible(itemFinder, 300, scrollable: listFinder);
  //   //expect(itemFinder, findsOneWidget);
  //   // final gesture =
  //   //     await tester.startGesture(Offset(0, 300)); //Position of the scrollview

  //   // await gesture.moveBy(Offset(0, -300)); //How much to scroll by

  //   // await gesture.up();
  //   // await tester.pump();
  // });
}
