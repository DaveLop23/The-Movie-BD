//
//  HomeCollectionViewCell.swift
//  Examen
//
//  Created by David Lopez on 12/11/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDateandDate: UILabel!
    @IBOutlet weak var lblResume: UILabel!
    @IBOutlet weak var vwContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgPoster.layer.cornerRadius = 10
        imgPoster.layer.borderColor = UIColor.clear.cgColor
        vwContainer.layer.cornerRadius = 10
        vwContainer.layer.borderColor = UIColor.clear.cgColor
    }
    
    func configTop(responsePopularMoviesResponse:ResultsTop, cache:ImageCachePosters){
        let path = responsePopularMoviesResponse.posterPath
        let url = URL(string: "https://www.themoviedb.org/t/p/w1280/\(path ?? "")")
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.imgPoster.image =  image
        }
        self.lblTitle.text = responsePopularMoviesResponse.title
        self.lblDateandDate.text = "\(responsePopularMoviesResponse.releaseDate ?? "")  \u{2B51} \(responsePopularMoviesResponse.voteAverage ?? 0.0)"
        self.lblResume.text = responsePopularMoviesResponse.overview
    
    }

    func config(responsePopularMoviesResponse:Results, cache:ImageCachePosters){
        
        let path = responsePopularMoviesResponse.posterPath
        let url = URL(string: "https://www.themoviedb.org/t/p/w1280/\(path ?? "")")
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.imgPoster.image =  image
        }
        self.lblTitle.text = responsePopularMoviesResponse.title
        self.lblDateandDate.text = "\(responsePopularMoviesResponse.releaseDate ?? "")  \u{2B51} \(responsePopularMoviesResponse.voteAverage?.rounded() ?? 0.0)"
        self.lblResume.text = responsePopularMoviesResponse.overview
    }
}


