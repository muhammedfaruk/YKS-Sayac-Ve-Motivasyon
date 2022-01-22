//
//  GetLocalData.swift
//  yks-sinav-sayaci
//
//  Created by Muhammed Faruk Söğüt on 22.01.2022.
//

import Foundation


class GetLocalData {

    static let shared = GetLocalData()
    
    //find local file
    private func readLocalFile(fileName: String) -> Data?{
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                return jsonData
            }
        }catch{
            print(error)
        }
        return nil
    }
    
    // parse
    func parse (completion: @escaping (Result<[Quote], ErrorMessages>) -> Void){
        
        guard let jsonData = readLocalFile(fileName: "quote") else {completion(.failure(.ReadFileError))
            return}
        
        do {
            let decodedData = try JSONDecoder().decode([Quote].self, from: jsonData)
            
            completion(.success(decodedData))
            
        } catch  {
            completion(.failure(.DecodingError))
        }
        
    }
    
    
    enum ErrorMessages: String,Error {
        case ReadFileError = "Error when reading file"
        case DecodingError = "Error when decoding"
    }
    
    
}

