//
//  Service.swift
//  Spectate_Dyana
//
//  Created by Dyana Varghese on 26/02/22.
//

import Foundation

class Service {
    
    func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, ServiceError>, Int?) -> ()) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseUrl
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            let httpUrlResponse = response as? HTTPURLResponse
            guard error == nil  else {
                completion(.failure(.serverError(error: error)), httpUrlResponse?.statusCode)
                print(error?.localizedDescription  ?? "unknown error")
                return
            }
            guard response != nil, let data = data else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseObject = try decoder.decode(T.self, from: data)
                    completion(.success(responseObject), httpUrlResponse?.statusCode)
                } catch {
                    do {
                        let failureResponse = try JSONDecoder().decode(FailureResponse.self, from: data)
                        completion(.failure(.serverError(message: failureResponse.error)), httpUrlResponse?.statusCode)
                    } catch {
                        completion(.failure(.serverError(error: error)), httpUrlResponse?.statusCode)
                    }
                    
                }
            }
        }
        dataTask.resume()
    }
}

