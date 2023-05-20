import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReceiveOrderBody extends StatelessWidget {
  const ReceiveOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //image below
      children: [
        //image
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/Background1.png").image,
                  fit: BoxFit.cover)),
        ),
        
        Column(
          children: [
            Spacer(),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 451,
                decoration: BoxDecoration(
                  //border top left radius
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x7f9f9f9f),
                      blurRadius: 30,
                      offset: Offset(0, -4),
                    ),
                  ],
                  color: Color(0xfff8f8f8),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Center(
                        child: Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffd1d1d6),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                //outline

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  color: Color(0xffd1d1d6),
                                  size: 44,
                                )),
                            SizedBox(width: 12),
                            Container(
                              width: MediaQuery.of(context).size.width - 110,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Suwarni Ani",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Color(0xfffee7a2),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Domvet Payment",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Rp25.000,00",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "4.47 KM",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TITIK JEMPUT",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "RM Jaya Sujaya Makmur Abadi 88",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Jl. Raden Bagus Bege, No.15A, Pogung",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TITIK ANTAR",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Makmur Residence",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Blok F No.17, Kasihan, Bantul",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      Container(
                        width: MediaQuery.of(context).size.width - 48,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xff70cb88),
                            width: 1,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: Column(
                                    children: [
                                      Text(
                                        "ORDER DETAILS",
                                        style: TextStyle(
                                          color: Color(0xff9f9f9f),
                                          fontSize: 15,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              width: 72 / 312 * (MediaQuery.of(context).size.width - 48),
                                              child: Text(
                                                "1x",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              width: 88 / 312 * (MediaQuery.of(context).size.width - 48),
                                              child: Text(
                                                "Sego Tiwul",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              width: 72 / 312 * (MediaQuery.of(context).size.width - 48),
                                              child: Text(
                                                "Rp3.000",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'See Order Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff70cb88),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: 8),

                      AcceptDecline(),
                    ],
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class AcceptDecline extends StatelessWidget {
  const AcceptDecline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
      width: MediaQuery.of(context).size.width - 48,
      height: 44,
      child: ElevatedButton(
        onPressed: () {
          // emailController.clear();
          // passwordController.clear();
        },
        child: Text(
          'ACCEPT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xff70cb88),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    SizedBox(height: 8),
    Container(
        height: 44,
        width: MediaQuery.of(context).size.width - 48,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              height: 44,
              width: 74 /
                  (312) *
                  (MediaQuery.of(context).size.width - 48),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xff70cb88),
                  width: 1,
                ),
              ),
              child: Text(
                "04:59",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff70cb88),
                  fontSize: 15,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 9 /
                  (312) *
                  (MediaQuery.of(context).size.width - 48),
            ),
            Container(
              height: 44,
              width: 229 /
                  (312) *
                  (MediaQuery.of(context).size.width - 48),
              child: ElevatedButton(
                onPressed: () {
                  // emailController.clear();
                  // passwordController.clear();
                },
                child: Text(
                  'DECLINE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff70cb88),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: Color(0xff70cb88),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Color(0xfff8f8f8),
                ),
              ),
            ),
          ],
        ))
    ],);
  }
}
