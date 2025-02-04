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
    func getTopHeadlines(completin: @escaping(Result<News,Error>) -> Void)
    func fetBBCNews(completion: @escaping (Result<News, any Error>) -> Void)
    func getCategoriesBusiness(completion: @escaping (Result<News, any Error>) -> Void)
    func getCategoriesHealth(completion: @escaping (Result<News, any Error>) -> Void)
    func getCategoriesSciense(completion: @escaping (Result<News, any Error>) -> Void)
    func getCategoriesSports(completion: @escaping (Result<News, any Error>) -> Void)
    func getCategoriesGeneral(completion: @escaping (Result<News, any Error>) -> Void)
    func getSearchNews(search: String,completion: @escaping (Result<News, any Error>) -> Void)
}

class ServiceManager: ServiceManagerProtocol {
    
    
    
    static let shared = ServiceManager()
    
    private init() {}
    
    
    //MARK: - Request Api
    func getTopHeadlines(completin: @escaping (Result<News, any Error>) -> Void) {
        request(route: .topHeadlines(country: "us"), method: .get, completion: completin)
    }
    
    func fetBBCNews(completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .topHeadlinesSources(sources: "bbc-news"), method: .get, completion: completion)
    }
    
    func getCategoriesBusiness(completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .categoriesNews(category: "business"), method: .get, completion: completion)
    }
    
    func getCategoriesHealth(completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .categoriesNews(category: "health"), method: .get, completion: completion)
    }
    
    func getCategoriesSciense(completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .categoriesNews(category: "science"), method: .get, completion: completion)
    }
    
    func getCategoriesSports(completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .categoriesNews(category: "sports"), method: .get, completion: completion)
    }
    
    func getCategoriesGeneral(completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .categoriesNews(category: "general"), method: .get, completion: completion)
    }
    
    func getSearchNews(search: String,completion: @escaping (Result<News, any Error>) -> Void) {
        request(route: .searchNews(search: search), method: .get, completion: completion)
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
        var urlRequest = URLRequest(url: url)
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
