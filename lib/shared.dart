//dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//local
import 'main.dart';

List<ActiveProp> activeLevelsData = [
  ActiveProp(
    cardNo: 1,
    cardColor: Color(0x594A7B),
    achievedSec: 15,
    achievedEx: 4,
    cardNoT: 'الأول',
  ),
  ActiveProp(
    cardNo: 2,
    cardColor: Color(0xFFC231),
    achievedSec: 10,
    achievedEx: 3,
    cardNoT: 'الثاني',
  ),
];

List<LateProp> lateLevelsData = [
  LateProp(levelNo: 'الثالث', secs: 15, exs: 4),
  LateProp(levelNo: 'الرابع', secs: 15, exs: 4)
];

// ignore: must_be_immutable
class CardLevel extends StatelessWidget {
  @required
  int cardNo;
  @required
  String cardNoT;
  @required
  Color cardColor;
  @required
  int achievedSec;
  @required
  int achievedEx;
  CardLevel(
      {this.achievedEx,
      this.achievedSec,
      this.cardColor,
      this.cardNo,
      this.cardNoT});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 4, left: 18),
      child: Center(
        child: Container(
          height: 154.h,
          width: 375.w,
          decoration: BoxDecoration(
            color: Color(0xFBFFFF).withOpacity(1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20.w),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "$cardNo",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.monoton().copyWith(
                    fontSize: 72,
                    color: Color(0x20D4D4).withOpacity(1),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 214.w,
                child: Row(
                  children: [
                    Container(
                        height: 140.h,
                        width: 193.w,
                        child: roundedRectBorderWidget(
                            levelNo: '$cardNoT',
                            achievedEx: achievedEx,
                            achievedSec: achievedSec,
                            cardColor: cardColor)),
                    SizedBox(width: 10),
                    Container(
                      height: 154.h,
                      width: 9.w,
                      decoration: BoxDecoration(
                          color: cardColor.withOpacity(1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget roundedRectBorderWidget(
    {String levelNo, Color cardColor, int achievedSec, int achievedEx}) {
  return DottedBorder(
    strokeWidth: 1.5,
    dashPattern: const <double>[15, 3],
    color: Color(0xBDBDDE).withOpacity(1),
    borderType: BorderType.RRect,
    radius: Radius.circular(10),
    padding: EdgeInsets.all(6),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BorderContent(
        levelNo: levelNo,
        cardColor: cardColor,
        achievedEx: achievedEx,
        achievedSec: achievedSec,
      ),
    ),
  );
}

// ignore: must_be_immutable
class BorderContent extends StatelessWidget {
  String levelNo;
  Color cardColor;
  int achievedSec;
  int achievedEx;
  BorderContent(
      {this.achievedEx, this.achievedSec, this.cardColor, this.levelNo});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EasyRichText(
          "المستوي $levelNo",
          patternList: [
            EasyRichTextPattern(
              targetString: 'المستوي ',
              style: GoogleFonts.balooBhaijaan().copyWith(
                fontSize: 22,
                color: cardColor.withOpacity(1),
              ),
            ),
            EasyRichTextPattern(
              targetString: '$levelNo',
              style: GoogleFonts.balooBhaijaan().copyWith(
                fontSize: 22,
                color: cardColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
        levelProperties(property: 'درس', total: 15, achieved: achievedSec),
        levelProperties(property: 'إمتحانات', total: 4, achieved: achievedEx),
      ],
    );
  }
}

Row levelProperties({String property, int total, int achieved}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        property,
        style: GoogleFonts.cairo().copyWith(
          fontSize: 14,
          color: Color(0x494955).withOpacity(0.61),
        ),
      ),
      EasyRichText(
        "$achieved  /$total",
        patternList: [
          EasyRichTextPattern(
            targetString: '/$total',
            style: GoogleFonts.cairo().copyWith(
              fontSize: 14,
              color: Color(0x494955).withOpacity(0.61),
            ),
          ),
          EasyRichTextPattern(
            targetString: '$achieved',
            style: GoogleFonts.cairo().copyWith(
              fontSize: 22,
              color: Color(0x494955).withOpacity(0.61),
            ),
          ),
        ],
      ),
    ],
  );
}
