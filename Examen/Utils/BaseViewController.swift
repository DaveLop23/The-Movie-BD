//
//  BaseViewController.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func alerta(mensaje: String?, handler: ((_ action: UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "The Movie BD", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: handler)
        alert.addAction(action)
        alert.view.tintColor = UIColor(named: "LightBlue")
      //  alert.view.tintColor = #colorLiteral(red: 0.00800000038, green: 0.5839999914, blue: 0.8309999704, alpha: 1)
        self.present(alert, animated: true)
    }
}

extension BaseViewController {
    
    func shadowView(view: UIView){
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 1
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
    }
    
    func shadowViewWOBorder(view: UIView){
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 1
        view.layer.cornerRadius = 8
    }


    
    func buttonElevation(button: UIButton){
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: -1, height: 1)
        button.layer.shadowRadius = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
    }
    
    func underLineLabel(label: UILabel){
        guard let text = label.text else {return}
        let attributedString  = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.underlineStyle : true])
        label.attributedText = attributedString
    }
    
    func underLineButton(button: UIButton){
        guard let text = button.titleLabel?.text else {return}
        let attributedString  = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.underlineStyle : true])
        button.setAttributedTitle(attributedString, for: .normal)
    }
}

extension BaseViewController {
    
    func navigationItemButtonBack(){
        let nav = self.navigationController?.navigationBar
        
        let yourBackImage = UIImage(named: "arrowshape.backward.fill")
        nav?.backIndicatorImage = yourBackImage
        nav?.backIndicatorTransitionMaskImage = yourBackImage
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "")
        imageView.image = image
        navigationItem.titleView = imageView
        
        nav?.isHidden = false
    }
        
    func navigationWhitItemButtonMenu() {
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(named: "LightBlue")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward.circle.fill"), style: .plain, target: self, action: #selector(dismis))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "")
        imageView.image = image
        navigationItem.titleView = imageView
        nav?.isHidden = false
    }
    
    func navigationWhitoutItemButtonMenu() {
        let nav = self.navigationController?.navigationBar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "")
        imageView.image = image
        navigationItem.titleView = imageView
        nav?.isHidden = false
    }
  
    @objc func dismis() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func back() {
        navigationController?.navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController{
   
    func changeFormatDateYYYYMMdd(dateString: String?) -> String {
        guard let textDate = dateString else {return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_MX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyyMMdd"
        if let date = dateFormatter.date(from:textDate) {
            return dateToString(date: date)
        }
        return dateString ?? ""
    }
    
    func changeFormatHR(dateString: String?) -> String {
        guard let textDate = dateString else {return ""}
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "es_MX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "HHmmss"
        if let date = dateFormatter.date(from:textDate) {
            return HRToString(date: date)
        }
        
        return dateString ?? ""
    }
    
    func HRToString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_MX")
        dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        
        return dateFormatter.string(from: date)
    }
    
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_MX")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy")
        
        return dateFormatter.string(from: date)
    }
}

