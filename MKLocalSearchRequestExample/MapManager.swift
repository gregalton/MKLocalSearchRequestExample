//
//  MapManager.swift
//  MKLocalSearchRequestExample
//
//  Created by Greg Alton on 3/28/24.
//

import MapKit
import Combine

class MapController: ObservableObject {
    @Published var searchResults: [MKMapItem] = []

    func search(query: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query

        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }

            DispatchQueue.main.async {
                self.searchResults = response.mapItems
            }
        }
    }
}

