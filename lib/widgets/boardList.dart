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
                left: 20,
                bottom: 50,
              ),
              child: FittedBox(child: Text(post)),
            ),
          ),
          LayoutBuilder(
            builder: (ctx, cons) => Container(
              alignment: Alignment.bottomLeft,
              width: cons.maxWidth,
              height: cons.maxHeight,
              padding: EdgeInsets.only(
                left: 20,
                bottom: 30,
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
            'assets/img/board/aman_raghav.jpg',
            'AMAN RAGHAV',
            'EVENT\'S DIRECTOR',
          ),
          SizedBox(
            width: 12,
          ),
          getBoardPic(
            'assets/img/board/shaswat_srivastava.jpg',
            'SHASWAT SRIVASTAVA',
            'PROJECT\'S DIRECTOR',
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
            'assets/img/board/debalok.jpg',
            'DEBALOK BANERJEE',
            'FINANCE HEAD',
          ),
        ],
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
