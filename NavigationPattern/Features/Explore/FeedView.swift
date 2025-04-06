//
//  FeedView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.navigator) private var navigator
    @Environment(ModalCoordinator.self) private var modalCoordinator
    
    var body: some View {
        List {
            Section(header: Text("추천 콘텐츠")) {
                ForEach(Content.samples.prefix(5)) { content in
                    Button(action: {
                        navigator(.tab(.explore(.detail(content))))
                    }) {
                        HStack {
                            Text(content.title)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
            
            Section {
                Button("검색 결과 보기") {
                    let query = Query(term: "Swift")
                    navigator(.tab(.explore(.searchResults(query))))
                }
                
                Button("알림 표시") {
                    let message = Message(
                        title: "새로운 알림",
                        body: "이것은 테스트 알림 메시지입니다."
                    )
                    modalCoordinator.presentModal(.notification(message))
                }
                
                Button("새 콘텐츠 만들기") {
                    modalCoordinator.presentModal(.newContent)
                }
                
                Button("프로필 설정으로 이동") {
                    navigator(.tab(.profile(.settings)))
                }
                
                Button("전체 화면 설정 보기") {
                    navigator(.fullScreen(.settings))
                }
            }
        }
        .navigationTitle("탐색")
    }
}
