//
//  ContentView.swift
//  national-parks
//
//  Created by Paige Thompson on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var parks: [Park] = []

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(parks) { park in
                    Text(park.name)
                        .font(.title)
                }
            }
        }
        .onAppear(perform: {
            Task {
                await fetchParks()
                }
        })
    }
    
    private func fetchParks() async {

            print("On appear...")
            // Create a Task instance
                
                    // URL for the API endpoint
                    // 👋👋👋 Make sure to replace {YOUR_API_KEY} in the URL with your actual NPS API Key
                    // Pass in any state code you like for the stateCode parameter. For instance, stateCode=fl (Florida)
                    let url = URL(string: "https://developer.nps.gov/api/v1/parks?stateCode=wa&api_key=2QiL58A0mnnxiCSBEoQUiHulKxJDteJ2vX2o6z8B")!
                    
                    // Wrap in do/catch since URLSession async can throw errors
                    do {
                
                        // Perform an asynchronous data request using URLSession
                        let (data, _) = try await URLSession.shared.data(from: url)
                        
                        // Decode json data into ParksResponse type
                                    let parksResponse = try JSONDecoder().decode(ParksResponse.self, from: data)

                                    // Get the array of parks from the response
                                    let parks = parksResponse.data

                                    // Print the full name of each park in the array
                                    for park in parks {
                                        print(park.fullName)
                                    }

                        // TODO: Set the parks state property
                        self.parks = parks
                        
                    } catch {
                        print(error.localizedDescription)
                    }
        }
}

#Preview {
    ContentView()
}
