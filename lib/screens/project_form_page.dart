import 'package:flutter/material.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _organizationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _urlController = TextEditingController();
  String? _category;
  DateTime? _date;

  @override
  void dispose() {
    _nameController.dispose();
    _organizationController.dispose();
    _descriptionController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  String? _requiredText(String? value, {required String label, int maxLength = 80}) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return '$label wajib diisi.';
    if (text.length > maxLength) return '$label maksimal $maxLength karakter.';
    return null;
  }

  String? _validateUrl(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return null;
    final uri = Uri.tryParse(text);
    if (uri == null || !uri.hasAuthority || !['http', 'https'].contains(uri.scheme)) {
      return 'Masukkan URL lengkap yang diawali http:// atau https://.';
    }
    return null;
  }

  Future<void> _chooseDate() async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: DateTime(1980),
      lastDate: DateTime(now.year + 10),
      helpText: 'Pilih tanggal proyek',
    );
    if (selected != null) setState(() => _date = selected);
  }

  Future<void> _save() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate() || _date == null) return;

    final date = _date!;
    final dateText = '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/${date.year}';
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Proyek berhasil disimpan'),
        content: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _SummaryRow(label: 'Kategori', value: _category!),
            _SummaryRow(label: 'Nama', value: _nameController.text.trim()),
            _SummaryRow(label: 'Institusi', value: _organizationController.text.trim()),
            _SummaryRow(label: 'Tanggal', value: dateText),
            _SummaryRow(label: 'Deskripsi', value: _descriptionController.text.trim()),
            if (_urlController.text.trim().isNotEmpty)
              _SummaryRow(label: 'URL', value: _urlController.text.trim()),
          ],
        )),
        actions: [TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Tutup'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Proyek')),
      body: SafeArea(child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text('Catat pencapaian baru', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Lengkapi informasi di bawah ini. Kolom bertanda * wajib diisi.',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Kategori *', border: OutlineInputBorder(), prefixIcon: Icon(Icons.category_outlined)),
              items: const ['Edukasi', 'Pengalaman', 'Sertifikasi']
                  .map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
              validator: (value) => value == null ? 'Kategori wajib dipilih.' : null,
              onChanged: (value) => setState(() => _category = value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              textCapitalization: TextCapitalization.sentences,
              maxLength: 80,
              decoration: const InputDecoration(labelText: 'Nama proyek / posisi *', border: OutlineInputBorder(), prefixIcon: Icon(Icons.title)),
              validator: (value) => _requiredText(value, label: 'Nama proyek', maxLength: 80),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _organizationController,
              textCapitalization: TextCapitalization.words,
              maxLength: 80,
              decoration: const InputDecoration(labelText: 'Institusi / organisasi *', border: OutlineInputBorder(), prefixIcon: Icon(Icons.business_outlined)),
              validator: (value) => _requiredText(value, label: 'Institusi', maxLength: 80),
            ),
            const SizedBox(height: 8),
            FormField<DateTime>(
              validator: (value) => _date == null ? 'Tanggal wajib dipilih.' : null,
              builder: (field) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InkWell(
                  onTap: () async {
                    await _chooseDate();
                    field.didChange(_date);
                  },
                  borderRadius: BorderRadius.circular(4),
                  child: InputDecorator(
                    isEmpty: _date == null,
                    decoration: InputDecoration(
                      labelText: 'Tanggal *',
                      hintText: 'Pilih tanggal',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                      errorText: field.errorText,
                      suffixIcon: _date == null ? null : IconButton(
                        tooltip: 'Hapus tanggal', icon: const Icon(Icons.clear),
                        onPressed: () { setState(() => _date = null); field.didChange(null); },
                      ),
                    ),
                    child: Text(_date == null ? 'Pilih tanggal' :
                      '${_date!.day.toString().padLeft(2, '0')}/${_date!.month.toString().padLeft(2, '0')}/${_date!.year}',
                      style: _date == null ? TextStyle(color: Theme.of(context).hintColor) : null),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              textCapitalization: TextCapitalization.sentences,
              minLines: 3,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(labelText: 'Deskripsi *', alignLabelWithHint: true, border: OutlineInputBorder(), prefixIcon: Icon(Icons.notes)),
              validator: (value) => _requiredText(value, label: 'Deskripsi', maxLength: 300),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(labelText: 'URL proyek (opsional)', hintText: 'https://contoh.com', border: OutlineInputBorder(), prefixIcon: Icon(Icons.link)),
              validator: _validateUrl,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save_outlined),
              label: const Text('Simpan'),
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
            ),
          ]),
        ),
      )),
    );
  }

}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: RichText(text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        )),
      );
}
