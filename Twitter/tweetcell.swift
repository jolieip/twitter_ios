//
//  tweetcell.swift
//  Twitter
//
//  Created by Jolie Ip Ying See on 09/10/2020.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class tweetcell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var bodyText: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBefavorited = !favorited
        if(toBefavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: true)
            } ,
            failure: {
                (error) in
                print("Favorite did not succeed \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: false)
            }
            , failure: { (error) in
                print("Unfavorite did not succeed \(error)")
            })
        }
        
    }
    
    var favorited: Bool = false
    var tweetId: Int = -1
    func setFavorite(_isFavorited: Bool) {
        favorited = _isFavorited
        if(favorited) {
            favoriteButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        
        else {
            favoriteButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBOutlet var retweet: UIButton!
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(_isRetweeted: true)
        }, failure: {
            (error) in
            print("Error is retweeting: \(error)")
        })
            
    }
    func setRetweeted(_isRetweeted: Bool) {
        if(_isRetweeted) {
            retweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweet.isEnabled = false
        }
        else {
            retweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweet.isEnabled = true
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

