//dependencies
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter_svg/flutter_svg.dart';
//local
import 'shared.dart';



  Widget customBorder ({bool done}){
    
    // Creating a custom path
    Path customPath = Path()
      ..moveTo(350.w, 2.h)
      ..lineTo(350.w, 32.h);


    return DottedBorder(
      customPath: (_) => customPath,
      color: done?Color(0x88C9F9).withOpacity(1):Color(0xC4C5C6).withOpacity(0.25),
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
height: 30.h,
        
      ),
    );
  }

// ignore: must_be_immutable
class LeassonsScreen extends StatelessWidget {
  int index;
  final examDone= false;
  LeassonsScreen({this.index});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 854),
      allowFontScaling: false,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
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
                              fontSize: 72.ssp,
                              color: Color(0x494955).withOpacity(1)),
                        ),
                      ),
                      Container(
                        width: 155.w,
                        height: 123.h,
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
                SizedBox(height: 48.h),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 13, right: 13),
                  child: DottedBorder(
                    strokeWidth: 1.5,
                    dashPattern: const <double>[15, 3],
                    color: Color(0xBDBDDE).withOpacity(1),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    padding:
                        EdgeInsets.only(right: 6, top: 24, left: 6, bottom: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                (MediaQuery.of(context).size.height - 180.w),
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: lessonsData.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                    return customBorder(done:lessonsData[index].done );
                                  },
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
customBorder(done:examDone ),
                          // exam
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '!',
                                style: GoogleFonts.keaniaOne().copyWith(
                                  fontSize: 24.ssp,
                                  color: Color(0xD8D8D8).withOpacity(1),
                                ),
                              ),
                              Container(
                                width: 329.w,
                                height: 190.h,
                                decoration: BoxDecoration(
                                  color: Color(0xFAFAFA).withOpacity(0.8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ListTile(
                                      trailing: Icon(
                                        Icons.circle,
                                        color: Color(0xF7F7F7).withOpacity(0.6),
                                        size: 18.ssp,
                                      ),
                                      title: Text(
                                        'الإمتحان الأول',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                          fontSize: 18.0.ssp,
                                          color: Color(0x0F87B3).withOpacity(1),
                                        ),
                                      ),
                                      subtitle: Text(
                                        'أساسيات برمجة , أو أي مسمي',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: ArabicFonts.Cairo,
                                            package: 'google_fonts_arabic',
                                            fontSize: 14.0.ssp,
                                            color:
                                                Color(0xA19A9A).withOpacity(1)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset("images/Frame4.svg",
                                            height: 105,
                                            width: 105,
                                            matchTextDirection: false),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'تفاصيل',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontFamily: ArabicFonts.Cairo,
                                                  package:
                                                      'google_fonts_arabic',
                                                  fontSize: 12.0.ssp,
                                                  color: Color(0x818181)
                                                      .withOpacity(1),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text("١٣ سؤال ",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ArabicFonts.Cairo,
                                                      package:
                                                          'google_fonts_arabic',
                                                      fontSize: 10.0.ssp,
                                                      color: Color(0x818181)
                                                          .withOpacity(1),
                                                    )),
                                                Icon(Icons.help_outline,
                                                    color: Color(0x87878B)
                                                        .withOpacity(1),
                                                    size: 12.ssp),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("٣٠ دقيقة",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          ArabicFonts.Cairo,
                                                      package:
                                                          'google_fonts_arabic',
                                                      fontSize: 10.0.ssp,
                                                      color: Color(0x818181)
                                                          .withOpacity(1),
                                                    )),
                                                Icon(Icons.schedule,
                                                    color: Color(0x87878B)
                                                        .withOpacity(1),
                                                    size: 12.ssp),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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
      done: true,
      operate: false,
      title: 'ما هي لغة فلاتر',
      subTitle: 'نص فرعي صغير'),
  LessonsDataModel(
      done: true,
      operate: false,
      title: 'ما هي لغة فلاتر',
      subTitle: 'نص فرعي صغير'),
  LessonsDataModel(
      done: false,
      operate: true,
      title: 'ما هي لغة فلاتر',
      subTitle: 'نص فرعي صغير'),
  LessonsDataModel(
      done: false,
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
      operate: false,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (() {
          if (done && !operate) {
            return Icon(Icons.check,
                color: Color(0xA8EEEE).withOpacity(1), size: 18.ssp);
          } else if (operate)
            return Icon(Icons.circle,
                color: Color(0xA8EEEE).withOpacity(1), size: 18.ssp);
          else {
            return Icon(Icons.maximize,
                color: Color(0xD8D8D8).withOpacity(1), size: 18.ssp);
          }
        })(),
        Container(
          width: (operate) ? 326.w : 286.w,
          height: 67.h,
          decoration: BoxDecoration(
            color: (() {
              if (done && !operate) {
                return Color(0xC5ECFA).withOpacity(0.8);
              } else if (operate)
                return Color(0x494955).withOpacity(1);
              else {
                return Color(0xFAFAFA).withOpacity(0.8); //FAFAFA
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
                child: Text(
                  "${index + 1}",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.keaniaOne().copyWith(
                    fontSize: operate ? 48.ssp : 36.ssp,
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
              Container(
                width: (operate) ? 286.w : 254.w,
                height: 67.h,
                child: ListTile(
                  trailing: Icon(
                    Icons.circle,
                    color: (() {
                      if (done && !operate) {
                        return Color(0x287EBF).withOpacity(0.2);
                      } else if (operate)
                        return Color(0xC4C4C4).withOpacity(0.11);
                      else {
                        return Color(0xF7F7F7).withOpacity(0.6);
                      }
                    })(),
                    size: 18.ssp,
                  ),
                  title: Text(title,
                      // 'ما هي لغة فلاتر',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 14.0.ssp,
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
                        fontSize: 12.0.ssp,
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
