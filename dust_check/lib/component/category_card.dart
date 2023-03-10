import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'main_stat.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        color: lightColor,
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0))),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    '종류별 통계',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              //scroll 하기 위해서는 list view 를 expanded를 꼭 해야한다.
              Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    children: List.generate(
                      20,
                      (index) => MainStat(
                          width: constraint.maxWidth / 3,
                          category: '미세먼지$index',
                          imgPath: 'asset/img/best.png',
                          level: '최고',
                          stat: '㎛'),
                    )),
              ),
            ],
          );
        }),
      ),
    );
  }
}