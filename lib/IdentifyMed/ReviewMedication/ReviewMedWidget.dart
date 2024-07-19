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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue,
                  ),
                ),
              ),
            ),
          );
        }

        final artPiecePageUsersRecord = snapshot.data!;

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
                  final favoritesElement = getJsonField(
                    widget.artPiece,
                    r'''$.objectID''',
                    true,
                  );
                  final favoritesUpdate = artPiecePageUsersRecord.favorites
                      .contains(favoritesElement)
                      ? FieldValue.arrayRemove([favoritesElement])
                      : FieldValue.arrayUnion([favoritesElement]);
                  await artPiecePageUsersRecord.reference.update({
                    'favorites': favoritesUpdate,
                  });
                },
                icon: Icon(
                  artPiecePageUsersRecord.favorites.contains(getJsonField(
                    widget.artPiece,
                    r'''$.objectID''',
                  ))
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: artPiecePageUsersRecord.favorites.contains(getJsonField(
                    widget.artPiece,
                    r'''$.objectID''',
                  ))
                      ? Colors.red
                      : Colors.black,
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
                            getJsonField(
                              widget.artPiece,
                              r'''$.primaryImage''',
                            ).toString(),
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
                                          fontSize: 20,
                                          color: Colors.black54,
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
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'Dosage',
                                    style: GoogleFonts.playfairDisplay(
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
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'Time',
                                    style: GoogleFonts.playfairDisplay(
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
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'content',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.department''',
                                      ).toString(),
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
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'quantity',
                                    style: GoogleFonts.playfairDisplay(
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
                        await currentUserReference!.update({
                          'favorites': FieldValue.arrayUnion([
                            getJsonField(
                              widget.artPiece,
                              r'''$.objectID''',
                            )
                          ]),
                        });

                        Navigator.of(context).pushNamed('MyCollection');
                      },
                      label: Text(
                        'Add to Collection',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 15,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(200, 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
