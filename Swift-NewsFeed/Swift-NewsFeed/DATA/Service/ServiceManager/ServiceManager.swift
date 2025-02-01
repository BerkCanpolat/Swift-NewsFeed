//
//  ServiceManager.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import Foundation

struct PostModel: Decodable {
    let id: Int
    let title,body:String
}


protocol ServiceManagerProtocol {
    func testRequest(completin: @escaping(Result<News,Error>) -> Void)
}

class ServiceManager: ServiceManagerProtocol {
    
    static let shared = ServiceManager()
    
    private init() {}
    
    
    func testRequest(completin: @escaping (Result<News, any Error>) -> Void) {
        request(route: .topHeadlines(country: "us"), method: .get, completion: completin)
    }
    
    
    private func request<T:Codable>(route: Route, method: Method, parameters: [String:Any]? = nil, completion: @escaping(Result<T,Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data,Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? ""
                print("Response Json Data: \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("Request error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    
    
    private func handleResponse<T:Codable>(result: Result<Data,Error>?, completion: (Result<T,Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
            
        case .success(let data):
            let jsonDecode = JSONDecoder()

            do {
                 let decodedData = try jsonDecode.decode(T.self, from: data)
                completion(.success(decodedData))
                print("DATALARIM GELDİ LA GARDAŞ -------------------------------------------------------------------------------------")
                 } catch {
                    print("Decoding Hatası: \(error.localizedDescription)")
                    completion(.failure(AppError.errorDecoding))
            }

        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    
    private func createRequest(route: Route, method: Method, parameters: [String:Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        print("İLK URELE ------------------------------------------------------------------------------------------: \(url)")
        var urlRequest = URLRequest(url: url)
        print("İKİNCİ URELE ------------------------------------------------------------------------------------------: \(urlRequest)")
        urlRequest.addValue("Application/Json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponents = URLComponents(string: urlString)
                urlComponents?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                urlRequest.url = urlComponents?.url
            case .post, .delete, .patch:
                let jsonBody =  try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = jsonBody
            }
        }
        return urlRequest
    }
}


import Foundation

class NewsService {
    private let apiKey = "984763387f2844a7b48bccad0f7fabe0"
    private let baseURL = "https://newsapi.org/v2/top-headlines"
    
    // Create a URL session to fetch the data
    func fetchArticles(completion: @escaping (Result<[Articlee], Error>) -> Void) {
        let urlString = "\(baseURL)?country=us&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 400, userInfo: nil)))
                return
            }
            
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(newsResponse.articles ?? []))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}


import Foundation

// MARK: - Article Model

struct Articlee: Codable {
    let source: Sourcee?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source Model

struct Sourcee: Codable {
    let id: String?
    let name: String
}

// MARK: - Response Model

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Articlee]?
}
