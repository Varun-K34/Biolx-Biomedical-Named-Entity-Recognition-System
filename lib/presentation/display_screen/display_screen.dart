import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:Biolx/core/utils/size_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class DisplayScreen extends StatelessWidget {
  final List<Map<String, dynamic>> nerPredictions;
  final String summary;

  const DisplayScreen({
    Key? key,
    required this.nerPredictions,
    required this.summary,
  }) : super(key: key);

  void _copyToClipboard(BuildContext context) {
    String content = _tableToString(nerPredictions) + '\nSummary:\n$summary';
    FlutterClipboard.copy(content).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  void downloadTxtDocument(BuildContext context,
      List<Map<String, dynamic>> nerPredictions, String summary) async {
    final String content = '''
Table:
Entity Group | Word | Score | Start | End
${nerPredictions.map((prediction) => '${prediction['entity_group']} | ${prediction['word']} | ${prediction['score']} | ${prediction['start']} | ${prediction['end']}').join('\n')}

Summary:
$summary
''';

    // Get the device's temporary directory
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;

    // Create a file path for the text file
    final String filePath = '$tempPath/document.txt';

    // Write the content to the text file
    final File file = File(filePath);
    await file.writeAsString(content);

    // Show a message indicating that the document has been downloaded
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Download Complete'),
        content: Text('Document has been downloaded to your device.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('nerPredictions: $nerPredictions');
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              width: SizeUtils.width,
              height: SizeUtils.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.6, 0.9],
                  colors: [
                    Color(0xff132740),
                    Color(0xff000000),
                    Color(0xff020314),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 43),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Biomedical Overview",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                  ],
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        Color(0xFF64B5F6),
                                        Color(0xFF0D47A1),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(
                                        Rect.fromLTWH(0, 0, 200, 70)),
                                ),
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 21),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingTextStyle: TextStyle(color: Colors.white),
                            columns: [
                              DataColumn(label: Text('Entity Group')),
                              DataColumn(label: Text('Word')),
                              DataColumn(label: Text('Score')),
                              DataColumn(label: Text('Start')),
                              DataColumn(label: Text('End')),
                            ],
                            rows: nerPredictions
                                .map((prediction) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            prediction['entity_group']
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            prediction['word'].toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            prediction['score'].toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            prediction['start'].toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            prediction['end'].toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ))
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Summary:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              _copyToClipboard(context);
                            },
                            child: Container(
                              width: SizeUtils.width -
                                  36, // Adjust width as needed
                              child: Text(
                                summary,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                softWrap: true,
                                maxLines: null,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                60), // Increase the space between summary and buttons
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _copyToClipboard(context);
                    },
                    icon: Icon(
                      Icons.copy,
                      size: 30,
                    ),
                    label: Text(
                      "Copy",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      downloadTxtDocument(context, nerPredictions, summary);
                    },
                    icon: Icon(
                      Icons.download_rounded,
                      size: 35,
                    ),
                    label: Text(
                      "Download",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _tableToString(List<Map<String, dynamic>> data) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln('Entity Group | Word | Score | Start | End');
    for (var prediction in data) {
      buffer.writeln(
          '${prediction['entity_group']} | ${prediction['word']} | ${prediction['score']} | ${prediction['start']} | ${prediction['end']}');
    }
    return buffer.toString();
  }
}
