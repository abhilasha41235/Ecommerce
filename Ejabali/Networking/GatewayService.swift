//
//  GatewayService.swift
//  Assignment
//
//  Created by Thapliyal, Abhilasha on 28/05/22.
//

import Foundation

public struct Utils {

    public static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}

public class GatewayService: NSObject, URLSessionDelegate {

    // MARK: - Properties

    /// The `URLSession` used in the service.
    private var session: URLSession?

    private static let jsonEncoder: JSONEncoder = {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(Utils.iso8601Formatter)
            return encoder
        }()

    private static let jsonDecoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Utils.iso8601Formatter)
            return decoder
        }()
    
    public init(session: URLSession = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)) {
        self.session = session
    }

    public func decode<T: Decodable>(from url: String, completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        self.apiGet(baseURL: url) { response in
            completionHandler(response)
        }
    }

    public func apiGet<T: Decodable>(baseURL: String? = nil, completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        let serviceResponse = ServiceResponse<T>()
        let baseURL: String? = baseURL
        
        let urlString = (baseURL ?? "")
        let urlComponents = URLComponents(string: urlString)

        guard let endpointURL = urlComponents?.url else {
            serviceResponse.data = nil
            completionHandler(serviceResponse)
            return
        }

        let request = URLRequest(url: endpointURL)
        sendExecute(request: request) { response in
            completionHandler(response)
        }
    }

    private func sendExecute<T: Decodable>(request: URLRequest, completionHandler: @escaping (ServiceResponse<T>) -> Void) {
        let serviceResponse = ServiceResponse<T>()
        let dataTask = session!.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            do {
                //If expecting a plain string...
                let expectedResultType = String(reflecting: type(of:serviceResponse.data))
                if (expectedResultType == "Swift.Optional<Swift.String>") {
                    serviceResponse.data = String(decoding: data, as: UTF8.self) as? T
                } else if (expectedResultType == "Swift.Optional<Foundation.Data>") {
                    serviceResponse.data = data as? T
                } else {
                    //If expecting anything other than a string, then try to parse as JSON=
                    let response = try GatewayService.jsonDecoder.decode(T.self, from: data)
                    serviceResponse.data = response as T
                }
                completionHandler(serviceResponse)
            } //catch {
                //serviceResponse.data = nil
                //completionHandler(serviceResponse)
                catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
            //}
        }
       
        
        dataTask.resume()
    }
}

