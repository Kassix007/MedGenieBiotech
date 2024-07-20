import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'art_piece_page_model.dart';
export 'art_piece_page_model.dart';

class ArtPiecePageWidget extends StatefulWidget {
  const ArtPiecePageWidget({
    super.key,
    this.artPiece,
  });

  final dynamic artPiece;

  @override
  State<ArtPiecePageWidget> createState() => _ArtPiecePageWidgetState();
}

class _ArtPiecePageWidgetState extends State<ArtPiecePageWidget> {
  late ArtPiecePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtPiecePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Image',
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final favoritesElement = widget.artPiece['objectID'];
              // Perform your Firestore update here
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Image.network(
                        widget.artPiece['primaryImage'].toString(),
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Medicine name',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'name1',
                                    style: GoogleFonts.playfairDisplay(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Text(
                                'Dosage',
                                style: GoogleFonts.playfairDisplay(
                                  color: Color(0xFF1E2429),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  '2 per day',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Text(
                                'Time',
                                style: GoogleFonts.playfairDisplay(
                                  color: Color(0xFF1E2429),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  'after lunch',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Text(
                                'Content',
                                style: GoogleFonts.playfairDisplay(
                                  color: Color(0xFF1E2429),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  widget.artPiece['department'].toString(),
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Text(
                                'Quantity',
                                style: GoogleFonts.playfairDisplay(
                                  color: Color(0xFF1E2429),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Slider(
                                  activeColor: Color(0xFF1849D8),
                                  inactiveColor: Colors.grey[300],
                                  min: 0,
                                  max: 20,
                                  value: _model.sliderValue ??= 10,
                                  onChanged: (newValue) {
                                    newValue = double.parse(newValue.toStringAsFixed(2));
                                    setState(() => _model.sliderValue = newValue);
                                  },
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
            ),
            Container(
              width: double.infinity,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // Perform your Firestore update here
                    Navigator.of(context).pushNamed('MyCollection');
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 15,
                  ),
                  label: Text(
                    'Add to Collection',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), backgroundColor: Color(0xFF1849D8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
