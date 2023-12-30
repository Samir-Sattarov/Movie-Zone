import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/presentation/screens/brand_detail_screen.dart';
import 'package:movie_zone/features/main/presentation/widget/brand_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie zone"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 82.h,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: 1,

                itemBuilder: (context, index) {
                  const logoUrl =
                      "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg";
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w , left: index == 0 ? 12.w:0 ),
                    child: Hero(
                      tag: logoUrl.hashCode,
                      child: BrandWidget(
                        imageForViewUrl:
                            "https://i.pinimg.com/564x/55/3f/6b/553f6b41975bf39b3022f43c9abc1ef3.jpg",
                        fullLogoUrl: logoUrl,
                        onTap: (p0) {
                          Navigator.push(
                            context,
                            BrandDetailScreen.route(logoUrl: p0),
                          );
                        },
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
