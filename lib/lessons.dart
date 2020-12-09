import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'shared.dart';

// ignore: must_be_immutable
class LeassonsScreen extends StatelessWidget {
  int index;
  LeassonsScreen({this.index});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 854),
      allowFontScaling: false,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: [
                //TODO:search "appbar"
                Container(
                  margin: const EdgeInsets.only(right: 41.0, left: 52),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "A",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lobster().copyWith(
                              fontSize: 72,
                              color: Color(0x494955).withOpacity(1)),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 115,
                        child: BorderContent(
                          levelNo: activeLevelsData[index].cardNoT,
                          cardColor: activeLevelsData[index].cardColor,
                          achievedEx: activeLevelsData[index].achievedEx,
                          achievedSec: activeLevelsData[index].achievedSec,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 13, right: 13),
                  child: DottedBorder(
                    strokeWidth: 1.5,
                    dashPattern: const <double>[15, 3],
                    color: Color(0xBDBDDE).withOpacity(1),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    padding: EdgeInsets.only(right: 6, top: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.height,
                        height: (MediaQuery.of(context).size.height),
                        child: ListView.separated(
                          itemCount: lessonsData.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 30,
                          ),
                          itemBuilder: (BuildContext context, int i) {
                            return SingleLesson(
                              done: lessonsData[i].done,
                              index: i,
                              operate: lessonsData[i].operate,
                              subTitle: lessonsData[i].subTitle,
                              title: lessonsData[i].title,
                            );
                          },
                        ),
                      ),

                      //   Column(
                      // children: [SingleLesson()],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LessonsDataModel {
  bool done;
  bool operate;
  String title;
  String subTitle;
  LessonsDataModel({this.done, this.operate, this.subTitle, this.title});
}

// ignore: non_constant_identifier_names
List<LessonsDataModel> lessonsData = [
  LessonsDataModel(
      done: true,
      operate: false,
      title: 'ما هي لغة فلاتر',
      subTitle: 'نص فرعي صغير'),
  LessonsDataModel(
      done: false,
      operate: false,
      title: 'ما هي لغة فلاتر',
      subTitle: 'نص فرعي صغير'),
  LessonsDataModel(
      done: false,
      operate: true,
      title: 'ما هي لغة فلاتر',
      subTitle: 'نص فرعي صغير')
];

// ignore: must_be_immutable
class SingleLesson extends StatelessWidget {
  bool done;
  bool operate;
  int index;
  String title;
  String subTitle;
  SingleLesson(
      {this.done, this.index, this.operate, this.subTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        (() {
          if (done && !operate) {
            return Icon(Icons.check,
                color: Color(0xA8EEEE).withOpacity(1), size: 18);
          } else if (operate)
            return Icon(Icons.circle,
                color: Color(0xA8EEEE).withOpacity(1), size: 18);
          else {
            return Icon(Icons.maximize,
                color: Color(0xD8D8D8).withOpacity(1), size: 18);
          }
        })(),
        SizedBox(
          width: (!operate) ? 67 : 27,
        ),
        Container(
          width: (operate) ? 326 : 286,
          height: 67,
          decoration: BoxDecoration(
            color: (() {
              if (done && !operate) {
                return Color(0xC5ECFA).withOpacity(0.8);
              } else if (operate)
                return Color(0x494955).withOpacity(1);
              else {
                return Color(0xD8D8D8).withOpacity(0.50);
              }
            })(),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                    "${index + 1}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.keaniaOne().copyWith(
                      fontSize: operate ? 48 : 36,
                      color: (() {
                        if (done && !operate) {
                          return Color(0x639AAE).withOpacity(1);
                        } else if (operate)
                          return Color(0xF7F7F7).withOpacity(1);
                        else {
                          return Color(0xD8D8D8).withOpacity(1);
                        }
                      })(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 88,
              ),
              Container(
                width: 155,
                height: 60,
                child: ListTile(
                  trailing: Icon(
                    Icons.circle,
                    color: operate
                        ? Color(0xC4C4C4).withOpacity(0.11)
                        : Color(0x287EBF).withOpacity(0.2),
                    size: 18,
                  ),
                  title: Text(title,
                      // 'ما هي لغة فلاتر',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 14.0,
                          color: operate
                              ? Colors.white
                              : Color(0x639AAE).withOpacity(1))),
                  subtitle: Text(
                    subTitle,
                    //  'نص فرعي صغير',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontSize: 12.0,
                        color: operate
                            ? Color(0xB7B7B7).withOpacity(1)
                            : Color(0x639AAE).withOpacity(0.9)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
