//
//  FetechController.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/13.
//

import Foundation

struct FetechController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    
    private let baseUrl = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQuote(from show: String) async throws -> Quote { // run in the background, throw an error
        let quoteURL = baseUrl.appending(path: "quotes/random") // 경로 추가
        var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
        let quoteQueryItem = URLQueryItem(name: "production", value: show.replacingOccurrences(of: " ", with: "+")) // 쿼리아이템 만들기, show 문자열에 포함된 공백을 "+"로 치환
        quoteComponents?.queryItems = [quoteQueryItem] // 만들어진 쿼리를 추가
        
        guard let fetchURL = quoteComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL) // 비동기로 네트워크 요청
        
        guard let response = response as? HTTPURLResponse, response.statusCode == // 받은 응답 확인
                200 else {
            throw NetworkError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data) // 받은 데이터 Quote객체로 디코딩
        
        return quote // Quote 객체 반환
    }
}
