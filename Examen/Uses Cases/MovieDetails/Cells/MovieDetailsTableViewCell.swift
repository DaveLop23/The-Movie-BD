//
//  MovieDetailsTableViewCell.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenrer: UILabel!
    @IBOutlet weak var DateandRate: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblResume: UILabel!
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblDisponible: UILabel!
    @IBOutlet weak var lblTitleResume: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblHeader.text = String.MovieDetail.TitleDetalles
        imgPoster.layer.cornerRadius = 10
        imgPoster.layer.borderColor = UIColor.clear.cgColor
        vwContainer.layer.cornerRadius = 10
        vwContainer.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func config(dataDetails:[MovieDetailsResponse]?) {
        DispatchQueue.main.async { [weak self] in
            guard let weak = self else {return}
            if dataDetails?.count ?? 0 > 0 {
                let path = dataDetails?[0].posterPath
                let url = URL(string: "\(String.MovieDetail.urlPostr)\(path ?? "" )")
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    weak.imgPoster.image =  image
                }
                
                weak.lblDisponible.isHidden = true
                weak.lblTitle.text = dataDetails?[0].title
                weak.DateandRate.text = "\(dataDetails?[0].releaseDate ?? "")    \u{2B51} \(dataDetails?[0].voteAverage?.rounded() ?? 0.0)"
                weak.lblResume.text = dataDetails?[0].overview
                weak.lblSubtitle.text = dataDetails?[0].tagline
                let generos: String = dataDetails?[0].genres?[0].name ?? ""
                weak.lblGenrer.text = "\(String.MovieDetail.Genero) \(generos)"
                weak.lblTitleResume.text = String.MovieDetail.Resumen
                
            } else {
                let url = URL(string: "\(String.MovieDetail.urlPosterNoDisponible)")
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    weak.imgPoster.image =  image
                }
                weak.lblDisponible.isHidden = false
                weak.lblTitleResume.isHidden = true
                weak.lblTitle.text = ""
                weak.DateandRate.text = " "
                weak.lblResume.text = ""
                weak.lblSubtitle.text = ""
                let generos: String = ""
                weak.lblGenrer.text = ""
                
            }
        }
    }
    
}
