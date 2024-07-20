import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'doc_model.dart';
export 'doc_model.dart';

class DocWidget extends StatefulWidget {
  const DocWidget({super.key});

  @override
  State<DocWidget> createState() => _DocWidgetState();
}

class _DocWidgetState extends State<DocWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white, // Background color of the screen
        appBar: AppBar(
          backgroundColor: Colors.blue, // AppBar color
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0, -1),
            child: Text(
              'Doctors nearby',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 75, 0, 0),
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color of the container
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Dr. Smith',
                              style: GoogleFonts.readexPro(
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Text(
                            'Endocrinologist',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            '2 km Away',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text('Call'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                                minimumSize: Size(120, 40), // Button size
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 75, 0, 0),
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color of the container
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Name',
                              style: GoogleFonts.readexPro(
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Text(
                            'Specialization',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            '? km Away',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text('Call'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                                minimumSize: Size(120, 40), // Button size
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 40, 0, 0),
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color of the container
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Name',
                              style: GoogleFonts.readexPro(
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Text(
                            'Specialization',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            '? km Away',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text('Call'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                                minimumSize: Size(120, 40), // Button size
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 40, 0, 0),
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color of the container
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Name',
                              style: GoogleFonts.readexPro(
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Text(
                            'Specialization',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            '? km Away',
                            style: GoogleFonts.readexPro(
                              fontSize: 20,
                              letterSpacing: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text('Call'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                                minimumSize: Size(120, 40), // Button size
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
