//
//  HttpRequester.swift
//  Reimagine
//
//  Created by Cameron Tuckear on 9/14/19.
//  Copyright © 2019 Cameron Tucker. All rights reserved.
//

import UIKit

struct HttpRequester {
    // MARK: - Make a POST request
    /// Makes and POST request
    /// - Parameter urlString: url string
    /// - Parameter params: dictionary of parameters
    func makePOSTRequest(urlString: String, params: [String: String]) -> [Flight] {
        var jsonData: [Flight] = []
        guard let url = URL(string: urlString), let httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        else {
            return []
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // add header
        request.addValue("/application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    let flights = try JSONDecoder().decode([Flight].self, from: data)
                    jsonData = flights
                    print(flights)
                } catch {
                    jsonData = []
                    print(error)
                }
            }
        }.resume()
        return jsonData
    }
    
    func makeGETHTTPRequest(urlString: String) throws  -> [Flight] {
        var jsonData: [Flight] = []
        guard let url = URL(string: urlString)
        else {
            return []
        }
        
        let session = URLSession.shared
        
        // semaphone - works in the background
        let semaphone = DispatchSemaphore(value: 0)
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    let flights = try JSONSerialization.jsonObject(with: data, options: [])
                    jsonData = try JSONDecoder().decode([Flight].self, from: data)
                    print(flights)
                } catch {
                    jsonData = []
                    print(error)
                }
                semaphone.signal()
            }
        }.resume()
        
        _ = semaphone.wait(timeout: .distantFuture)
        
        return jsonData
    }
}
