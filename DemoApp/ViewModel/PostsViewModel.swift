import SwiftUI
import Combine

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var currentPage = 1
    private var isFetching = false
    private let apiService = ApiService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        guard !isFetching else { return }
        isFetching = true
        apiService.fetchPosts(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                self.isFetching = false
            }, receiveValue: { newPosts in
                self.posts.append(contentsOf: newPosts)
                self.currentPage += 1
                // Perform heavy computation for each new post
                newPosts.forEach { post in
                    self.performHeavyComputation(on: post)
                }
            })
            .store(in: &cancellables)
    }

    func shouldLoadMore(currentItem item: Post) -> Bool {
        guard let lastItem = posts.last else {
            return false
        }
        return item.id == lastItem.id
    }

    private func performHeavyComputation(on post: Post) {
        DispatchQueue.global(qos: .userInitiated).async {
            let start = Date()
            // Simulate heavy computation
            Thread.sleep(forTimeInterval: 1)
            let end = Date()
            let duration = end.timeIntervalSince(start)
            let result = "Computed Result for \(post.title) in \(duration) seconds"
            print(result)  // Log the result to the console
        }
    }
}
