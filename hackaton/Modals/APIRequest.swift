//
//  APIRequest.swift
//  hackaton
//
//  Created by mendy aouizerat  on 03/12/2020.
//

import Foundation



enum APIError:Error {
    case responseProblem
    case decodinProblem
    case otherProblem
    case encodingProblem
}


struct APIRequest: PKHUDAble {
    let resourceURL : URL
    
    init(endpoint: String ) {
        let resourceString = "https://corona-manager-api.herokuapp.com/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func login(_ logs: Logs , completion: @escaping(Result<Logs, APIError>) -> Void) {
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json" ,forHTTPHeaderField:"Content-Type")
             urlRequest.httpBody = try JSONEncoder().encode(logs)

            
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ data,response, _ in
                guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200,
                      let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do{
                    let userId = String(decoding: data! , as: UTF8.self)
                
                    completion(.success(Logs(id:userId)))
                }catch{
                    completion(.failure(.decodinProblem))
                }
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
    func scan(_ scannerLogs: ScannerLogs , completion: @escaping(Result<ScannerLogs, APIError>) -> Void) {
        do{
            var urlRequest = URLRequest(url: URL(string:"https://corona-manager-api.herokuapp.com/scan")!)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json" ,forHTTPHeaderField:"Content-Type")
             urlRequest.httpBody = try JSONEncoder().encode(scannerLogs)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ data,response, _ in
                guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200,
                      let _ = data else {
                    print(data)
                    completion(.failure(.responseProblem))
                    return
                }
                completion(.success(ScannerLogs(userId: "", locationId: "" ,date: Date())))
            }
            dataTask.resume()
        }catch{
            print("encodingprbl")
            completion(.failure(.encodingProblem))
        }
    }
}
