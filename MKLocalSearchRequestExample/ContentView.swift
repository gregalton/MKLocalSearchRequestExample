//
//  ContentView.swift
//  MKLocalSearchRequestExample
//
//  Created by Greg Alton on 3/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var mapController = MapController()
    @State private var query = ""

    var body: some View {
        NavigationStack {
            ListView(searchResults: mapController.searchResults)
                .searchable(text: $query)
                .onChange(of: query, { oldValue, newValue in

                    mapController.search(query: newValue)
                })
//                .onChange(of: query) { newValue in
//                    mapController.search(query: newValue)
//                }
                .navigationTitle("Search")
        }
    }
}

struct ListView: View {
    var searchResults: [MKMapItem]

    var body: some View {
        List(searchResults, id: \.self) { item in
            VStack(alignment: .leading) {
                Text(item.name ?? "Unknown")
                Text(item.placemark.title ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}


#Preview {
    ContentView()
}
