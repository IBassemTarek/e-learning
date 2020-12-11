//dependencies
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'search.dart';
//local
import 'package:x/lessons.dart';
import 'package:x/shared.dart';


void main() {
runApp(MyApp());

     
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(
          //TODO:make styles
        )

      ),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _height = MediaQuery.of(context).size.height ;
    // final _savingHeight = _height - MediaQuery.of(context).padding.top ;
    // final _HeightWithoutAppBar = _savingHeight - kToolbarHeight;
    // final _width =  MediaQuery.of(context).size.width ;
    ScreenUtil.init(
      context,
      designSize: Size(414, 854),
      allowFontScaling: false,
    );
    ScreenUtil().bottomBarHeight ;//Bottom safe zone distance, suitable for buttons with full screen
    ScreenUtil().statusBarHeight  ;//Status bar height , Notch will be higher Unit px
   
//(parent)flexable->fractionallysizedbox:heightfactor,widthfactor
//(childs)layoutbuilder (ctx,constraints)   .. any height and width -> constraints.maxheight*0.5  // maxheight is for parent size  
    return Scaffold(
      appBar: AppBar(
        title:Text('sdf'),
        actions: <Widget> [
          IconButton(icon:Icon(Icons.search),onPressed:(){
            showSearch(context:context,delegate:SearchIcon());
          })
        ]
      ),
      body: SafeArea(
              child: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "المستويات",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 36.0,
                          color: Colors.black),
                    ),
                  ),
                ),
                //wrap , expanded
                Container(
                  height: 374.h,
                  width: 414.w,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: activeLevelsData.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LeassonsScreen(index: i);
                          }));
                        },
                        child: CardLevel(
                          cardNo: activeLevelsData[i].cardNo,
                          cardColor: activeLevelsData[i].cardColor,
                          achievedSec: activeLevelsData[i].achievedSec,
                          achievedEx: activeLevelsData[i].achievedEx,
                          cardNoT: activeLevelsData[i].cardNoT,
                        ),
                      );
                    },
                  ),
                ),

                //late levels
                Container(
                  height: 354.h,
                  width: 414.w,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lateLevelsData.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LeassonsScreen(index: i);
                          }));
                        },
                        child: lateLevel(
                          secs: lateLevelsData[i].secs,
                          exs: lateLevelsData[i].exs,
                          levelNo: lateLevelsData[i].levelNo,
                        ),
                      );
                    },
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

class LateProp {
  String levelNo;
  int secs;
  int exs;

  LateProp({
    this.exs,
    this.secs,
    this.levelNo,
  });
}

class ActiveProp {
  int cardNo;
  Color cardColor;
  int achievedSec;
  int achievedEx;
  String cardNoT;
  ActiveProp(
      {this.achievedEx,
      this.achievedSec,
      this.cardColor,
      this.cardNo,
      this.cardNoT});
}

// ignore: must_be_immutable

//

Widget lateLevel({String levelNo, int secs, int exs}) {
  return Container(
    height: 118.h,
    width: 280.w,
    margin: const EdgeInsets.only(left: 65.0, right: 69.0, top: 26),
    child: DottedBorder(
      strokeWidth: 1.5,
      dashPattern: const <double>[15, 3],
      color: Color(0xBDBDDE).withOpacity(1),
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EasyRichText(
              "المستوي $levelNo",
              patternList: [
                EasyRichTextPattern(
                  targetString: 'المستوي ',
                  style: GoogleFonts.balooBhaijaan().copyWith(
                      fontSize: 14, color: Colors.black.withOpacity(0.5)),
                ),
                EasyRichTextPattern(
                  targetString: '$levelNo',
                  style: GoogleFonts.balooBhaijaan().copyWith(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            levelSamm(secs, 'درس'),
            levelSamm(exs, 'امتحانات')
          ],
        ),
      ),
    ),
  );
}

Row levelSamm(int data, String cat) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        cat,
        style: GoogleFonts.cairo().copyWith(
          fontSize: 14,
          color: Color(0x494955).withOpacity(0.61),
        ),
      ),
      Text(
        '$data',
        style: GoogleFonts.cairo().copyWith(
          fontSize: 14,
          color: Color(0x494955).withOpacity(0.61),
        ),
      ),
    ],
  );
}
