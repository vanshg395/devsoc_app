import 'package:flutter/material.dart';

class BoardList extends StatelessWidget {
  Widget getBoardPic(String path, String name, String post) {
    return Container(
      width: 200,
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LayoutBuilder(
                builder: (ctx, cons) => Container(
                  width: cons.maxWidth,
                  height: cons.maxHeight,
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          LayoutBuilder(
            builder: (ctx, cons) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.bottomLeft,
                width: cons.maxWidth,
                height: cons.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withAlpha(0),
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (ctx, cons) => Container(
              alignment: Alignment.bottomLeft,
              width: cons.maxWidth,
              height: cons.maxHeight,
              padding: EdgeInsets.only(
                left: 15,
                bottom: 40,
              ),
              child: FittedBox(
                child: Text(
                  post,
                  style: TextStyle(
                    fontFamily: 'SFProDisplayMed',
                    letterSpacing: 2,
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (ctx, cons) => Container(
              alignment: Alignment.bottomLeft,
              width: cons.maxWidth,
              height: cons.maxHeight,
              padding: EdgeInsets.only(
                left: 15,
                bottom: 20,
              ),
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        children: [
          getBoardPic(
            'assets/img/board/aryan_bhatnagar.jpg',
            'ARYAN BHATNAGAR',
            'CHAIR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/amulya.jpg',
            'AMULYA',
            'VICE CHAIR MANAGEMENT  ',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/angad_sharma.jpg',
            'ANGAD SHARMA',
            'VICE CHAIR TECHNICAL',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/animesh_ashish.jpg',
            'ANIMESH ASHISH',
            'SECRETARY-INTERNAL AFFAIRS',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/pritika_roy.jpg',
            'PRITIKA ROY',
            'OPERATIONS DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/aman_raghav.jpg',
            'AMAN RAGHAV',
            'EVENTS DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/akshat_pethiya.jpg',
            'AKSHAT PETHIYA',
            'SECRETARY-EXTERNAL AFFAIRS',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/tanya_sharma.jpg',
            'TANYA SHARMA',
            'HR DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/debalok.jpg',
            'DEBALOK BANERJEE',
            'FINANCE HEAD',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/shaswat_srivastava.jpg',
            'SHASWAT SRIVASTAVA',
            'PROJECTS DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/rachit_agarwal.jpg',
            'RACHIT AGGARWAL',
            'DESIGN & MEDIA DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/raghav_jhavar.jpg',
            'RAGHAV JHAVAR',
            'PUBLICITY & MARKETING DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/yash_meherotra.jpg',
            'YASH MEHEROTRA',
            'TECH ADVISOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/kunal_kumar.jpg',
            'KUNAL KUMAR',
            'LOGISTICS DIRECTOR',
          ),
        ],
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
