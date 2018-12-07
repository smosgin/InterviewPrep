//
//  NetworkService.swift
//  InterviewPrep
//
//  Created by Seth Mosgin on 12/6/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import Foundation

class NetworkService {
    let API_URL = "https://www.xeno-canto.org/api/2/recordings"
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func retrieveContents(searchTerm: String, completion: @escaping ([Xeno], String) -> Void) {
        dataTask?.cancel()
        var query = "oriole"
        if !searchTerm.isEmpty {
            query = searchTerm
        }
        var components = URLComponents(string: API_URL)
        components?.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        guard let url = components?.url else { return }
        print(url)
        
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            defer { self.dataTask = nil }
            
            if let error = error {
                completion([], error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print(data)
                do {
                    let serviceResponse = try JSONDecoder().decode(ServiceResponse.self, from: data)
                    completion(serviceResponse.recordings, "")
                } catch {
                    completion([], error.localizedDescription)
                }
            } else {
                print("another http code?")
                if let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                }
            }
            
            
        }
        dataTask?.resume()
    }
}
