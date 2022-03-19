//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Haonan Wang on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var reTweetButton: UIButton!
    
    var isFavorite:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    @IBAction func onLike(_ sender: Any) {
        let toBeFavorite = !isFavorite
        if(toBeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: self.tweetId, success: {
                self.setFavorite(true)
            }, failure: {(error) in
                print("like did not success: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.favoriteTweet(tweetId: self.tweetId, success: {
                self.setFavorite(false)
            }, failure: {(error) in
                print("undo like did not success: \(error)")
            })
        }
        
    }
    @IBAction func onRetweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: self.tweetId, success: {
            self.doRetweet(true)
        }, failure: {(error) in
            print("retweet failed \(error)")
        })
    }
    
    func setFavorite(_ isFavorite:Bool) {
        self.isFavorite = isFavorite
        if(isFavorite) {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func doRetweet(_ retweeted:Bool) {
        let retweet = retweeted
        if(retweet) {
            reTweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweetButton.isEnabled = false
        } else {
            reTweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweetButton.isEnabled = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
