//
//  ViewController.swift
//  Posts&Comments
//
//  Created by Crypto on 7/19/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    var postsviewmodel = postsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts"
        postsTableView.register(UINib(nibName: "TitleCell" ,bundle: nil), forCellReuseIdentifier: "TitleCell")
        getPosts ()
        // Do any additional setup after loading the view.
    }
    
    func getPosts () {
        postsviewmodel.getPosts { [weak self] in
            self!.postsTableView.reloadData()
        }
    }
    
}
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsviewmodel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleCell
        cell.lblTitle.text = postsviewmodel.posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let commentsViewController = storyboard.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        commentsViewController.postId = postsviewmodel.posts[indexPath.row].id
        //        commentsViewController.delegate = self
        self.navigationController?.pushViewController(commentsViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
}

