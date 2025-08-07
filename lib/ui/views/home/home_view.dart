import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EAFE),
        elevation: 0,
        title: Text(
          '',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.purple),
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
                  textStyle: const TextStyle(
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
                  textStyle: const TextStyle(
                    color: Colors.purple,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          _OptionBox(
                            icon: Icons.sentiment_satisfied,
                            label: 'Feliz',
                            iconColor: Colors.green,
                            isSelected: viewModel.selectedMood == 0,
                            onTap: () => viewModel.onMoodSelected(0),
                          ),
                          _OptionBox(
                            icon: Icons.sentiment_neutral,
                            label: 'Neutro',
                            iconColor: Colors.blue,
                            isSelected: viewModel.selectedMood == 1,
                            onTap: () => viewModel.onMoodSelected(1),
                          ),
                          _OptionBox(
                            icon: Icons.sentiment_dissatisfied,
                            label: 'Triste',
                            iconColor: Colors.orange,
                            isSelected: viewModel.selectedMood == 2,
                            onTap: () => viewModel.onMoodSelected(2),
                          ),
                          _OptionBox(
                            icon: Icons.sentiment_very_dissatisfied,
                            label: 'Irritado',
                            iconColor: Colors.red,
                            isSelected: viewModel.selectedMood == 3,
                            onTap: () => viewModel.onMoodSelected(3),
                          ),
                        ],
                      ),
                    ),
                    _DayFeelingInput(viewModel: viewModel),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: AnimatedOpacity(
                        opacity: viewModel.showMoodMessage &&
                                viewModel.lastMoodMessage.isNotEmpty
                            ? 1.0
                            : 0.0,
                        duration: const Duration(milliseconds: 400),
                        child: Text(
                          viewModel.lastMoodMessage,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.checklist,
                                  color: Colors.purple, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'Lembretes',
                                style: GoogleFonts.notoSans(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.add_circle,
                                    color: Colors.purple, size: 28),
                                onPressed: () async {
                                  final controller = TextEditingController();
                                  final result = await showDialog<String>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Adicionar Lembrete'),
                                      content: TextField(
                                        controller: controller,
                                        autofocus: true,
                                        decoration: const InputDecoration(
                                          hintText: 'Digite seu lembrete',
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              context, controller.text),
                                          child: const Text('Adicionar'),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (result != null &&
                                      result.trim().isNotEmpty) {
                                    viewModel.addReminder(result.trim());
                                  }
                                },
                                tooltip: 'Adicionar lembrete',
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 350),
                            child: viewModel.reminders.isEmpty
                                ? Padding(
                                    key: const ValueKey('empty'),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: Text(
                                        'Nenhum lembrete adicionado.',
                                        style: GoogleFonts.poppins(
                                          color: Colors.purple.withOpacity(0.5),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    key: const ValueKey('list'),
                                    height: 220,
                                    child: Scrollbar(
                                      thumbVisibility: true,
                                      child: ListView.builder(
                                        itemCount: viewModel.reminders.length,
                                        itemBuilder: (context, index) {
                                          String reminder =
                                              viewModel.reminders[index];
                                          return AnimatedPadding(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: ChecklistItem(
                                              title: reminder,
                                              onEdit: () async {
                                                final controller =
                                                    TextEditingController(
                                                        text: reminder);
                                                final result =
                                                    await showDialog<String>(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        'Editar Lembrete'),
                                                    content: TextField(
                                                      controller: controller,
                                                      autofocus: true,
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  'Digite o lembrete'),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                            'Cancelar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                controller
                                                                    .text),
                                                        child: const Text(
                                                            'Salvar'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                                if (result != null &&
                                                    result.trim().isNotEmpty) {
                                                  viewModel.editReminder(
                                                      index, result.trim());
                                                }
                                              },
                                              onDelete: () {
                                                viewModel.deleteReminder(index);
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: BottomNavigationBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          showSelectedLabels: true,
                          showUnselectedLabels: true,
                          selectedFontSize: 12,
                          unselectedFontSize: 12,
                          selectedLabelStyle: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
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
                            if (index == 1) {
                              viewModel.navigateToProfile();
                            }
                          },
                        ),
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

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

// Os widgets _DayFeelingInput, ChecklistItem e _OptionBox devem ser copiados da HomePage e adaptados para receber o viewModel quando necessário.

class _DayFeelingInput extends StatefulWidget {
  final HomeViewModel viewModel;
  const _DayFeelingInput({required this.viewModel});

  @override
  State<_DayFeelingInput> createState() => _DayFeelingInputState();
}

class _DayFeelingInputState extends State<_DayFeelingInput> {
  bool expanded = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.viewModel.savedText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.purple.withOpacity(0.18),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = true;
              });
            },
            child: Row(
              children: [
                const Icon(Icons.edit_note, color: Colors.purple, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.viewModel.savedText != null &&
                            widget.viewModel.savedText!.isNotEmpty
                        ? widget.viewModel.savedText!
                        : 'Clique para escrever como você se sentiu hoje...',
                    style: GoogleFonts.poppins(
                      color: Colors.purple.withOpacity(
                          widget.viewModel.savedText != null &&
                                  widget.viewModel.savedText!.isNotEmpty
                              ? 1
                              : 0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: expanded ? null : 2,
                    overflow:
                        expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                ),
                if (!expanded)
                  const Icon(Icons.expand_more, color: Colors.purple),
              ],
            ),
          ),
          AnimatedCrossFade(
            crossFadeState:
                expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    maxLines: 4,
                    minLines: 2,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Descreva seu dia ou sentimentos...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            expanded = false;
                            _controller.text = widget.viewModel.savedText ?? '';
                          });
                        },
                        child: const Text('Cancelar'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          widget.viewModel
                              .saveDayFeeling(_controller.text.trim());
                          setState(() {
                            expanded = false;
                          });
                        },
                        child: const Text('Salvar',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChecklistItem extends StatefulWidget {
  final String title;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final IconData? icon;

  const ChecklistItem({
    required this.title,
    this.onEdit,
    this.onDelete,
    this.icon,
  });

  @override
  State<ChecklistItem> createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem>
    with SingleTickerProviderStateMixin {
  bool checked = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.05)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleChecked() {
    setState(() {
      checked = !checked;
      if (checked) {
        _controller.forward().then((_) => _controller.reverse());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: GestureDetector(
        onTap: _toggleChecked,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: checked
                ? Colors.purple.withOpacity(0.18)
                : Colors.purple.withOpacity(0.10),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: checked ? Colors.purple : Colors.purple.withOpacity(0.2),
              width: checked ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: checked
                    ? const Icon(Icons.check_circle,
                        color: Colors.purple,
                        size: 22,
                        key: ValueKey('checked'))
                    : Icon(Icons.radio_button_unchecked,
                        color: Colors.purple.withOpacity(0.5),
                        size: 22,
                        key: const ValueKey('unchecked')),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: checked ? Colors.black : Colors.purple,
                      decoration: checked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  child: Text(widget.title),
                ),
              ),
              if (widget.onEdit != null)
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.purple, size: 20),
                  onPressed: widget.onEdit,
                  tooltip: 'Editar',
                ),
              if (widget.onDelete != null)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: widget.onDelete,
                  tooltip: 'Excluir',
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionBox({
    required this.icon,
    required this.label,
    this.iconColor = Colors.purple,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.yellow.withOpacity(0.3)
            : Colors.yellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected ? iconColor : Colors.black.withOpacity(0.2),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          splashColor: iconColor.withOpacity(0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(icon, color: iconColor, size: 50),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
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
