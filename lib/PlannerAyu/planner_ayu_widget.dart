import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'planner_ayu_model.dart';
export 'planner_ayu_model.dart';

class PlannerAyuWidget extends StatefulWidget {
  const PlannerAyuWidget({super.key});

  @override
  State<PlannerAyuWidget> createState() => _PlannerAyuWidgetState();
}

class _PlannerAyuWidgetState extends State<PlannerAyuWidget> {
  late PlannerAyuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlannerAyuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Medication Planner',
            style: GoogleFonts.readexPro(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
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
              Align(
                alignment: AlignmentDirectional(5, -1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Background color of the container
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'January 2023',
                                    style: GoogleFonts.readexPro(
                                      letterSpacing: 0,
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.today_rounded,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Background color of the container
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (var day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'])
                                    Text(
                                      day,
                                      style: GoogleFonts.inter(
                                        color: Colors.black54,
                                        letterSpacing: 0,
                                        fontSize: 16,
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var day in List.generate(7, (index) => (index + 1).toString()))
                                      Text(
                                        day,
                                        style: GoogleFonts.inter(
                                          letterSpacing: 0,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var day in List.generate(7, (index) => (index + 8).toString()))
                                      Text(
                                        day,
                                        style: GoogleFonts.inter(
                                          letterSpacing: 0,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var day in List.generate(7, (index) => (index + 15).toString()))
                                      Text(
                                        day,
                                        style: GoogleFonts.inter(
                                          letterSpacing: 0,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var day in List.generate(7, (index) => (index + 22).toString()))
                                      Text(
                                        day,
                                        style: GoogleFonts.inter(
                                          letterSpacing: 0,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'Medicine Name',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Time',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Dosage',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        10, // Adjust this number based on the actual data
                            (index) => DataRow(
                          color: MaterialStateProperty.all(
                            index % 2 == 0 ? Colors.grey[100] : Colors.white,
                          ),
                          cells: [
                            DataCell(Text(
                              'Medicine ${index + 1}',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                letterSpacing: 0,
                              ),
                            )),
                            DataCell(Text(
                              'Time ${index + 1}',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                letterSpacing: 0,
                              ),
                            )),
                            DataCell(Text(
                              'Dosage ${index + 1}',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                letterSpacing: 0,
                              ),
                            )),
                          ],
                        ),
                      ),
                      columnSpacing: 20,
                      headingRowHeight: 56,
                      dataRowHeight: 48,
                      border: TableBorder.all(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
