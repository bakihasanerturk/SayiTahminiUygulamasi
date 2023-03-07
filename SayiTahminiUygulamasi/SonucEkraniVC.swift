//
//  SonucEkraniVC.swift
//  SayiTahminiUygulamasi
//
//  Created by Baki Hasan Ertürk on 7.03.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelSonuc: UILabel!
    
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç Ekranı"
        
        print(sonuc!)
        
        if sonuc! {
            labelSonuc.text = "KAZANDINIZ"
            imageViewIcon.image = UIImage.init(named: "gulen_surat")
        }else{
            labelSonuc.text = "KAYBETTİNİZ"
            imageViewIcon.image = UIImage.init(named: "uzgun_surat")
        }
    }
    
    @IBAction func tekrarOynaBTN(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
