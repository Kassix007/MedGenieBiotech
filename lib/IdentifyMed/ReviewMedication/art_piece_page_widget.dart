
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
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
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final artPiecePageUsersRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              'Image ',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Playfair Display',
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              ToggleIcon(
                onPressed: () async {
                  final favoritesElement = getJsonField(
                    widget!.artPiece,
                    r'''$.objectID''',
                    true,
                  );
                  final favoritesUpdate = artPiecePageUsersRecord.favorites
                      .contains(favoritesElement)
                      ? FieldValue.arrayRemove([favoritesElement])
                      : FieldValue.arrayUnion([favoritesElement]);
                  await artPiecePageUsersRecord.reference.update({
                    ...mapToFirestore(
                      {
                        'favorites': favoritesUpdate,
                      },
                    ),
                  });
                },
                value: artPiecePageUsersRecord.favorites.contains(getJsonField(
                  widget!.artPiece,
                  r'''$.objectID''',
                )),
                onIcon: Icon(
                  Icons.favorite,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 25,
                ),
                offIcon: Icon(
                  Icons.favorite_border,
                  color: FlutterFlowTheme.of(context).tertiary,
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
                              widget!.artPiece,
                              r'''$.primaryImage''',
                            ).toString(),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Medicine name',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                  fontFamily: 'Playfair Display',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 6, 0),
                                      child: Text(
                                        'name1',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                          fontFamily: 'Playfair Display',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
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
                                    color:
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  Text(
                                    'Dosage',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      '2 per day',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                        letterSpacing: 0,
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
                                    color:
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  Text(
                                    'Time',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      'after lunch',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                        letterSpacing: 0,
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
                                    color:
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  Text(
                                    'content',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget!.artPiece,
                                        r'''$.department''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                        letterSpacing: 0,
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
                                    color:
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  Text(
                                    'quantity',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.7,
                                    child: Slider(
                                      activeColor: Color(0xFF1849D8),
                                      inactiveColor:
                                      FlutterFlowTheme.of(context)
                                          .alternate,
                                      min: 0,
                                      max: 20,
                                      value: _model.sliderValue ??= 10,
                                      onChanged: (newValue) {
                                        newValue = double.parse(
                                            newValue.toStringAsFixed(2));
                                        setState(() =>
                                        _model.sliderValue = newValue);
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
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'favorites': FieldValue.arrayUnion([
                                getJsonField(
                                  widget!.artPiece,
                                  r'''$.objectID''',
                                )
                              ]),
                            },
                          ),
                        });

                        context.pushNamed('MyCollection');
                      },
                      text: 'Add to Collection',
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Playfair Display',
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6),
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