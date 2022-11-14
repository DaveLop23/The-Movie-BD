//
//  MovieDetailVideoTableViewCell.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import UIKit
import youtube_ios_player_helper_swift

class MovieDetailVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var vwYTPlayer: YTPlayerView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwContainer.layer.cornerRadius = 10
        vwContainer.layer.borderColor = UIColor.clear.cgColor
        vwYTPlayer.layer.cornerRadius = 10
        vwYTPlayer.layer.borderColor = UIColor.clear.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(key:String?, name:String?) {
        DispatchQueue.main.async { [weak self] in
            guard let weak = self else {return}
            let videoId: String = key ?? ""
            let videoName: String = name ?? ""
            debugPrint(videoId)
            let playerVars = ["playsinline": 1, "autoplay": 1, "autohide": 1, "controls" : 1, "showinfo" : 0, "modestbranding" : 1, "rel" : 0]
            weak.vwYTPlayer.load(videoId: videoId , playerVars: playerVars)
            if videoId != "" {
                weak.vwContainer.isHidden = false
                weak.lblHeader.isHidden = false
            } else {
                weak.vwContainer.isHidden = true
                weak.lblHeader.isHidden = true
            }
            weak.lblHeader.text = String.MovieDetail.TitleAvances
            weak.lblTitle.text = videoName
        }
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView){
        DispatchQueue.main.async { [weak self] in
            guard let weak = self else {return}
            weak.vwYTPlayer.playVideo()
        }
    }
    
}
