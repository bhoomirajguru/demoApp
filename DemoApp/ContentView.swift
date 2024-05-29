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
                PostRowView(post: post)
                    .onAppear {
                        if post == viewModel.posts.last {
                            viewModel.fetchPosts()
                        }
                    }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

