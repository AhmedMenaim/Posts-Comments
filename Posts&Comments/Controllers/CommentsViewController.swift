//
//  CommentsViewController.swift
//  Posts&Comments
//
//  Created by Crypto on 7/20/19.
//  Copyright © 2019 Crypto. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    var postsviewmodel = postsViewModel()
    var postId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comments"
    commentsTableView.register(UINib(nibName: "TitleCell" ,bundle: nil), forCellReuseIdentifier: "TitleCell")
    getComments ()
    // Do any additional setup after loading the view.
}


func getComments () {
    postsviewmodel.getComments(postId: postId!) { [weak self] in
        self!.commentsTableView.reloadData()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
}
extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsviewmodel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTableView.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleCell
        cell.lblTitle.text = postsviewmodel.comments[indexPath.row].title
        return cell
    }
    
    
}
