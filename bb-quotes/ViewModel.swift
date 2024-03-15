//
//  ViewModel.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/15.
//

import Foundation

@MainActor // 메인 스레드에서 동작함을 나타냄. UI업데이트 수행은 메인 스레드에서 동작해야 함
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: Quote, character: Character))
        case failed(error: Error)
    }
    
    // @Published 상태가 변경될 때마다 View에 업데이트를 알림
    // private(set) 외부에서 set하지 못하게 함
    @Published private(set) var status: Status = .notStarted
    
    private let controller: FetechController
    
    // 네트워크 통신 컨트롤러 초기화
    init(controller: FetechController) {
        self.controller = controller
    }
    
    func getData(for show: String) async {
        status = .fetching
        
        do { // do block 내에서 발생한 오류를
            let quote = try await controller.fetchQuote(from: show) // try: 오류가 발생할 수도 있는 함수 실행
            let character = try await controller.fetchCharacter(quote.character)
            status = .success(data: (quote, character))
        } catch { // catch 블럭에서 처리한다
            status = .failed(error: error)
        }
    }
}
