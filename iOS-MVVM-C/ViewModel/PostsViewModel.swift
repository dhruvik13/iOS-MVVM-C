//
//  PostsViewModel.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 30/06/2021.
//

protocol PostsViewModelConsumer: AnyObject {
    func display(fetchedPots: Posts?)
}

class PostsViewModel: PostsViewModelType {
    
    var title: String = "Posts"
    
    private weak var consumer: PostsViewModelConsumer?
    private var targetType = APIFetchInteractor()
    
    init(consumer: PostsViewModelConsumer?,
         targetType: APIFetchInteractor = APIFetchInteractor()) {
        self.consumer = consumer
        self.targetType = targetType
    }
    
    func fetchPosts() {
        targetType.fetchPosts { [weak self] postResult in
            guaranteeMainThread {
                self?.consumer?.display(fetchedPots: (try? postResult.get()))
            }
        }
    }
}
