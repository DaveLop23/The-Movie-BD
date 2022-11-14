//
//  HomeViewController.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet var collectionViewPupular: UICollectionView!
    @IBOutlet var collectionViewUpcoming: UICollectionView!
    @IBOutlet var collectionViewTopRate: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var sgmOption: UISegmentedControl!
    
    var cacheGeneral = ImageCachePosters()
    
    var responsePopular: [MoviesResponse] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionViewPupular.reloadData()
            }
        }
    }
    
    var responseUpcoming: [MoviesResponse] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionViewUpcoming.reloadData()
            }
        }
    }
    
    var responseTopRated: [TopRateResponse] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionViewTopRate.reloadData()
            }
        }
    }
    
    let HomeCollectionViewCellId = "HomeCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPopularMovies()
        self.getUpcomingMovies()
        self.getTopRatedMovies()
        self.navegationBarSetup()
        self.collectionViewSetup()
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        sgmOption.setTitleTextAttributes(titleTextAttributes, for: .selected)
        sgmOption.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
    }
    
    func navegationBarSetup() {
        self.vwHeader.backgroundColor = UIColor(named: "NavBar")
        self.view.backgroundColor = UIColor(named: "DarkBlue")
        self.navigationWhitoutItemButtonMenu()
        self.navigationItem.hidesBackButton = true
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"),
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: #selector(rightHandAction))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "LightBlue")
    }
    
    func collectionViewSetup() {
        
        let nibCell = UINib(nibName: HomeCollectionViewCellId, bundle: nil)
        
        collectionViewPupular.register(nibCell, forCellWithReuseIdentifier: HomeCollectionViewCellId)
        self.collectionViewPupular.alwaysBounceVertical = true
        collectionViewPupular.delegate =  self
        collectionViewPupular.dataSource = self
        
        collectionViewUpcoming.register(nibCell, forCellWithReuseIdentifier: HomeCollectionViewCellId)
        self.collectionViewUpcoming.alwaysBounceVertical = true
        collectionViewUpcoming.delegate =  self
        collectionViewUpcoming.dataSource = self
        
        collectionViewTopRate.register(nibCell, forCellWithReuseIdentifier: HomeCollectionViewCellId)
        self.collectionViewTopRate.alwaysBounceVertical = true
        collectionViewTopRate.delegate =  self
        collectionViewTopRate.dataSource = self
    }
    
//    @objc
//    func rightHandAction() {
//        let vc = ProfileViewController()
//        vc.sessionId = self.idSession
//        vc.modalPresentationStyle = .popover
//        self.navigationController?.present(vc, animated: true)
//    }
//
    @IBAction func actionSegmenControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.collectionViewPupular.isHidden = false
            self.collectionViewUpcoming.isHidden = true
            self.collectionViewTopRate.isHidden = true
            self.lblTitle.text = "Populares"
            self.loadViewIfNeeded()
            self.collectionViewPupular.reloadData()
            
        case 1:
            
            self.collectionViewPupular.isHidden = true
            self.collectionViewUpcoming.isHidden = false
            self.collectionViewTopRate.isHidden = true
            self.lblTitle.text = "Proximos"
            self.loadViewIfNeeded()
            self.collectionViewUpcoming.reloadData()
            
        case 2:
            
            self.collectionViewPupular.isHidden = true
            self.collectionViewUpcoming.isHidden = true
            self.collectionViewTopRate.isHidden = false
            self.lblTitle.text = "Las mejores"
            self.loadViewIfNeeded()
            self.collectionViewTopRate.reloadData()
            
        default:
            
            print("Opcion incorrecta")
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewPupular {
            return responsePopular[0].results?.count ?? 0
        } else if collectionView == collectionViewUpcoming {
            return responseUpcoming[0].results?.count ?? 0 - 1
        } else if collectionView == collectionViewTopRate {
            return responseTopRated[0].results?.count ?? 0 - 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewPupular {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellId, for: indexPath) as? HomeCollectionViewCell{
                if  let dataMovie = self.responsePopular[0].results?[indexPath.row] ?? nil {
                    cell.config(responsePopularMoviesResponse: dataMovie, cache: cacheGeneral)
                }
                return cell
            }
            
        } else if collectionView == collectionViewUpcoming {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellId, for: indexPath) as? HomeCollectionViewCell{
                if  let dataMovie = self.responsePopular[0].results?[indexPath.row] ?? nil {
                    cell.config(responsePopularMoviesResponse: dataMovie, cache: cacheGeneral)
                }
                return cell
            }
            
        } else if collectionView == collectionViewTopRate {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCellId, for: indexPath) as? HomeCollectionViewCell{
                if  let dataMovie = self.responseTopRated[0].results?[indexPath.row] ?? nil {
                    cell.configTop(responsePopularMoviesResponse: dataMovie, cache: cacheGeneral)
                }
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionViewUpcoming || collectionView == collectionViewPupular {
            
            if let popular = self.responsePopular[0].results?[indexPath.row] {
                DispatchQueue.main.async {
                    let VC = MovieDetailsViewController()
                    let idMovie: String = "\(popular.id ?? 0)"
                    VC.idMovie = idMovie
                    self.navigationController?.pushViewController(VC, animated: true)
                }
            }
        } else if collectionView == collectionViewTopRate {
            if let topRate = self.responseTopRated[0].results?[indexPath.row] {
                DispatchQueue.main.async {
                    let VC = MovieDetailsViewController()
                    let idMovie: String = "\(topRate.id ?? 0)"
                    VC.idMovie = idMovie
                    self.navigationController?.pushViewController(VC, animated: true)
                }
            }
        }
        
    }
}
