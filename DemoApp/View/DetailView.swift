//
//  DetailView.swift
//  DemoApp
//
//  Created by Apple on 28/05/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(post.title)
                .font(.largeTitle)
                .padding(.top, 0)
            Text(post.body).font(.subheadline)
            // Display more detailed information here
        }
        .padding()
        .navigationTitle("Post Details")
    }
}
