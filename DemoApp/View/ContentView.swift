//
//  ContentView.swift
//  DemoApp
//
//  Created by Apple on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: DetailView(post: post)) {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                    }
                    .onAppear {
                        if viewModel.shouldLoadMore(currentItem: post) {
                            viewModel.fetchPosts()
                        }
                    }
                }
            }
            .navigationTitle("Posts")
        }
    }
}

