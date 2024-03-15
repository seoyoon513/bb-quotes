//
//  QuoteView.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/15.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        // 블럭 내의 View가 스스로의 크기와 위치를 정하는 함수
        // 참고: https://medium.com/hcleedev/swift-geometryreader%EB%8A%94-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C-564896c6d6e0
        GeometryReader { geo in
            ZStack {
                Image("breakingbad")
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    Text("\"You either run from thins, or you face them, Mr. White.\"")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .cornerRadius(25)
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFill()
                        
                        Text("Jesse Pinkman")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                    .cornerRadius(80)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
