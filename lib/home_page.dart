import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EAFE),
        elevation: 0,
        title: Text(
          '',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.purple),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Olá Teste,',
                style: GoogleFonts.notoSerif(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                'Como você está se sentindo hoje?',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.purple,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.08),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _OptionBox(icon: Icons.sentiment_satisfied, label: 'Feliz', iconColor: Colors.green),
                          _OptionBox(icon: Icons.sentiment_neutral, label: 'Neutro', iconColor: Colors.blue),
                          _OptionBox(icon: Icons.sentiment_dissatisfied, label: 'Triste', iconColor: Colors.orange),
                          _OptionBox(icon: Icons.sentiment_very_dissatisfied, label: 'Irritado', iconColor: Colors.red),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.checklist, color: Colors.purple, size: 24),
                              SizedBox(width: 8),
                              Text(
                                'Lembretes',
                                style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ChecklistItem(title: 'Lembrete 1'),
                          ChecklistItem(title: 'Lembrete 2'),
                          ChecklistItem(title: 'Lembrete 3'),
                          ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Container(
                    //   height: 70,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black,
                    //     borderRadius: BorderRadius.circular(22),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withOpacity(0.5),
                    //         blurRadius: 8,
                    //         offset: Offset(0, 2),
                    //       ),
                    //     ],
                    //   ),
                    //   child: BottomNavigationBar(
                    //     backgroundColor: Colors.transparent,
                    //     elevation: 0,
                    //     showSelectedLabels: true,
                    //     showUnselectedLabels: true,
                    //     selectedFontSize: 12,
                    //     unselectedFontSize: 12,
                    //     selectedLabelStyle: GoogleFonts.notoSans(
                    //       textStyle: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     unselectedLabelStyle: GoogleFonts.notoSans(
                    //       textStyle: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         color: Colors.white.withOpacity(0.8),
                    //       ),
                    //     ),
                    //     items: [
                    //       BottomNavigationBarItem(
                    //         icon: Icon(Icons.home, color: Colors.white),
                    //         label: 'Início',
                    //       ),
                    //       BottomNavigationBarItem(
                    //         icon: Icon(Icons.person, color: Colors.white),
                    //         label: 'Perfil',
                    //       ),
                    //       BottomNavigationBarItem(
                    //         icon: Icon(Icons.more_horiz, color: Colors.white),
                    //         label: 'A definir',
                    //       ),
                    //     ],
                    //     currentIndex: 0,
                    //     selectedItemColor: Colors.white,
                    //     unselectedItemColor: Colors.white.withOpacity(0.8),
                    //     onTap: (index) {
                    //       // Handle navigation
                    //     },
                    //  ),
                    //),
                    SizedBox(height: 16),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        showSelectedLabels: true,
                        showUnselectedLabels: true,
                        selectedFontSize: 12,
                        unselectedFontSize: 12,
                        selectedLabelStyle: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        unselectedLabelStyle: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home, color: Colors.white),
                            label: 'Início',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person, color: Colors.white),
                            label: 'Perfil',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.more_horiz, color: Colors.white),
                            label: 'A definir',
                          ),
                        ],
                        currentIndex: 0,
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.white.withOpacity(0.8),
                        onTap: (index) {
                          // Handle navigation
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChecklistItem extends StatefulWidget {
  final String title;
  final IconData? icon;

  const ChecklistItem({required this.title, this.icon});

  @override
  State<ChecklistItem> createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: checked,
      activeColor: Colors.purple,
      onChanged: (val) {
        setState(() {
          checked = val ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      secondary: widget.icon != null ? Icon(widget.icon, color: Colors.purple) : null,
    );
  }
}

class _OptionBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _OptionBox({required this.icon, required this.label, this.iconColor = Colors.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 50),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}