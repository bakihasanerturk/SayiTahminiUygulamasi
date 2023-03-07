//
//  TahminEkraniVC.swift
//  SayiTahminiUygulamasi
//
//  Created by Baki Hasan Ertürk on 7.03.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {
    
    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelOneri: UILabel!
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rastgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int(arc4random_uniform(100))
        
        print("Rasgele Sayı: \(rastgeleSayi!)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! SonucEkraniVC
            
            gidilecekVC.sonuc = gelenVeri
        }
    }
    
    @IBAction func tahminEtBTN(_ sender: UIButton) {
        
        labelOneri.isHidden = false
        kalanHak -= 1
        
        if let veri = textfieldGirdi.text {
            if let tahmin = Int(veri) {
                if kalanHak != 0 {
                    
                    if tahmin == rastgeleSayi! {
                        let sonuc = true
                        performSegue(withIdentifier: "tahmindenSonucaGecis", sender: sonuc)
                    }
                    if tahmin > rastgeleSayi! {
                        labelOneri.text = "Azalt"
                        labelKalanHak.text = "Kalan Tahmin Hakkınız: \(kalanHak)"
                    }
                    if tahmin < rastgeleSayi! {
                        labelOneri.text = "Arttır"
                        labelKalanHak.text = "Kalan Tahmin Hakkınız: \(kalanHak)"
                    }
                    
                }else{
                    let sonuc = false
                    performSegue(withIdentifier: "tahmindenSonucaGecis", sender: sonuc)
                }
                
                textfieldGirdi.text = ""
            }
        }
    }
}
