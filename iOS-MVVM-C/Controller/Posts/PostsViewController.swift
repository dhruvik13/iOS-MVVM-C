//
//  PostsViewController.swift
//  iOS-MVVM-C
//
//  Created by dhruvik.rao on 01/07/2021.
//

import UIKit

protocol PostsViewModelType {
    var title: String { get set }
    func fetchPosts()
}

class PostsViewController: BaseViewController<PostsViewModelType> {
    
    @IBOutlet weak var fetchPostsButton: UIButton! {
        didSet {
            fetchPostsButton.addTarget(self, action: #selector(callAPIToFetchPosts(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
    }
    
    @IBAction func callAPIToFetchPosts(_ sender: Any) {
        viewModel.fetchPosts()
    }
}

extension PostsViewController: PostsViewModelConsumer {
    func display(fetchedPots: Posts?) {
        guard let posts = fetchedPots else { return }
        let alert = UIAlertController(title: "message.title", message: posts.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
}
