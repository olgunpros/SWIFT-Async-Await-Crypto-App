import Foundation

class Webservice {
    func downloadCurrenciesAsync(url:URL) async throws -> [CryptoCurrency] {
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let currencies = try JSONDecoder().decode([CryptoCurrency].self, from: data)
        return currencies
    }
   /*
    func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrency]?, DownloaderError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let currencies = try JSONDecoder().decode([CryptoCurrency].self, from: data)
                completion(.success(currencies))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.dataParseError))
            }
        }.resume()
  
    }
    */
}

enum DownloaderError: Error {
    case badUrl
    case noData
    case dataParseError
}
