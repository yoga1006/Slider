//
//  ViewController.swift
//  Slider
//
//  Created by Yoga on 2022/5/5.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var alpaca: UIImageView!
    @IBOutlet weak var grass: UIImageView!
    @IBOutlet weak var love: UIImageView!
    @IBOutlet weak var sun: UIImageView!
    
    func updateLocation(degress:CGFloat){
        
        love.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180*degress).translatedBy(x: 0, y: -200)
        // 讓愛心選轉且位移，因其移動上下故控制y值
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLocation(degress: 270)
        //愛心起始位置
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        //讓漸層的大小等於controllerview的大小
        gradientLayer.colors = [CGColor(red: 238/255, green: 203/255, blue: 173/255, alpha: 1),CGColor(red: 198/255, green: 226/255, blue: 255/255, alpha: 1),CGColor(red: 253/255, green: 245/255, blue: 230/255, alpha: 1)]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        //insertSubLayer置於最底層 如果直接用addsubview會加在頂層
    }

    @IBAction func move(_ sender: UISlider) {
        
        let speed = sender.value*0.5
        //移動的速度
        alpaca.frame.origin.x = CGFloat(100+speed)
        grass.frame.origin.x = CGFloat(533-speed)
        //羊駝跟草的移動位置，水平移動設定(+:左至右, -:右至左)
        updateLocation(degress: CGFloat(sender.value/2)+270)
        //愛心半圓形sender.value/2
        
        sun.alpha = CGFloat(sender.value/360)
        //太陽的透明度，alpha是1的時候會是完全清楚，因slider的value值最大為360，讓太陽慢慢浮現
      
    }
    

}

