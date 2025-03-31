import 'package:flutter/material.dart';

class SearchMusicScreen extends StatefulWidget {
  const SearchMusicScreen({super.key});

  @override
  State<SearchMusicScreen> createState() => _SearchMusicScreenState();
}

class _SearchMusicScreenState extends State<SearchMusicScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  void _performSearch(String query) {
    // Simulated search results - replace with actual API call
    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = [
          'Song 1 - Artist 1',
          'Song 2 - Artist 2',
          'Song 3 - Artist 3',
          'Song 4 - Artist 4',
        ].where((song) => song.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Music'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for music...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: _performSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(_searchResults[index]),
                  onTap: () {
                    // Handle song selection
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
} 