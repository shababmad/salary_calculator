import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  TextEditingController entererGrossSalary = TextEditingController();
  TextEditingController entererIncomeTax = TextEditingController();

  num? grossSalary;
  num? incomeTax;
  num _netSalary = 0;

  void _netSalaryFunction() {
    num grossSalary = num.parse(entererGrossSalary.text);
    num incomeTax = num.parse(entererIncomeTax.text);
    num deductions = ((incomeTax / 100) * grossSalary);
    _netSalary = grossSalary - deductions;

    setState(() {});
  }

  void _clearText() {
    entererGrossSalary.clear();
    entererIncomeTax.clear();
    _netSalary = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 58.h,
                color: const Color(0xff146C94),
                child: Center(
                  child: Text(
                    "Salary Calculator",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.93.h,
                  ),
                  Text(
                    "Gross Salary",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff595959),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: entererGrossSalary,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffD9D9D9).withOpacity(0.24),
                          hintText: "Enter Gross Salary",
                          contentPadding: const EdgeInsets.all(11),
                          hintStyle: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffABABAB),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff146C94),
                            width: 2,
                          )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: const Color(0xff146C94).withOpacity(0.28),
                            width: 1,
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 9.16.h,
                  ),
                  Text(
                    "Income Tax (%)",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff595959),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: entererIncomeTax,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffD9D9D9).withOpacity(0.24),
                          hintText: "0",
                          contentPadding: const EdgeInsets.all(11),
                          hintStyle: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffABABAB),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff146C94),
                            width: 2,
                          )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: const Color(0xff146C94).withOpacity(0.28),
                            width: 1,
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 41.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.sp),
                                  ),
                                  backgroundColor: const Color(0xff146C94)),
                              onPressed: () {
                                setState(() {
                                  _netSalaryFunction();
                                });
                              },
                              child: Expanded(
                                child: Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.circleCheck),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      "Calculate",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 41.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.sp),
                                  ),
                                  backgroundColor: const Color(0xff146C94)),
                              onPressed: _clearText,
                              child: Expanded(
                                child: Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.circleXmark),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      "Clear",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(
                    color: Color(0xffE1E1E1),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 41.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1)),
                                  backgroundColor: const Color(0xff146C94)),
                              onPressed: () {},
                              child: Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Net Salary",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 41.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  backgroundColor: const Color(0xff146C94)),
                              onPressed: () => true,
                              child: Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      "$_netSalary",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
              color: Color(0xff146C94),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 17.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleXmark,
                          color: Colors.white,
                          size: 32.sp,
                        ),
                        Text(
                          "Exit",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.share,
                          color: Colors.white,
                          size: 32.sp,
                        ),
                        Text(
                          "Share",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
