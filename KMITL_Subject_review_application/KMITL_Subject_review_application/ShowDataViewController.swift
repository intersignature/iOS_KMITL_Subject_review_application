//
//  ShowDataViewController.swift
//  KMITL_Subject_review_application
//
//  Created by Sirichai Binchai on 17/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import UIKit

struct Post: Decodable {
    let description: String
    let score: String
    let score_num: String
    let subject_id: String
    let timeStamp: String
    let title: String
    let uid: String
    let user_key: String
    
    init(json: [String:Any]) {
        description = json["description"] as? String ?? "-1"
        score = json["score"] as? String ?? "-1"
        score_num = json["score_num"] as? String ?? "-1"
        subject_id = json["subject_id"] as? String ?? "-1"
        timeStamp = json["timeStamp"] as? String ?? "-1"
        title = json["title"] as? String ?? "-1"
        uid = json["uid"] as? String ?? "-1"
        user_key = json["user_key"] as? String ?? "-1"
    }
}

class ShowDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonUrlString = "https://kmitlbackyard.firebaseio.com/post.json"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return  }
//                let post = Post(json: json)
//                print(post.description)
                let posts = try JSONDecoder().decode([String:Post].self, from: data)
                print(posts)
            } catch{ print(err!) }
            
            
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
