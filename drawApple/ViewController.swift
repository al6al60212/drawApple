//
//  ViewController.swift
//  drawApple
//
//  Created by 董禾翊 on 2022/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var showLable: UILabel!
    @IBOutlet weak var numberLable: UILabel!
    var index = 0
    var show = Array(repeating: "", count: 4)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sliderControl.value = 1
        showLable.text = "⭐️"
        numberLable.text = "1"
    }

    @IBAction func segmentBtn(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        sliderControl.value = 1
        showLable.text = "⭐️"
        numberLable.text = "1"
    }
    
    @IBAction func numberSlider(_ sender: UISlider) {
        //讓slider四捨五入取整數
        sender.value = sender.value.rounded()
        //slider數值
        numberLable.text = "\(Int(sender.value))"
        
        //正方形
        var squareLable = ""
        for _ in 1...Int(sender.value){
            for _ in 1...Int(sender.value){
                squareLable += "⭐️"
            }
            squareLable += "\n"
        }
        show[0] = squareLable
        
        //三角形
        var triangleLable = ""
        for i in 1...Int(sender.value){
            for _ in 1...i{
                triangleLable += "⭐️"
                }
            triangleLable += "\n"
            }
        show[1] = triangleLable
        
        //金字塔
        let count = sliderControl.value
        var pyramidLable = ""
        for i in 1...Int(count){
            for _ in i..<Int(count){
                pyramidLable += "✨"
            }
            let appleCount = i * 2 - 1
            for _ in 1...appleCount{
                pyramidLable += "⭐️"
            }
            pyramidLable += "\n"
        }
        show[2] = pyramidLable
        
        //菱形
        var diamond = ""
        let count1 = Int(sliderControl.value)
        var greenApleCount = count1 - 1
        var redAppleCount = 1
        for i in 1...count1 * 2 - 1{
            for _ in 0..<greenApleCount{
                diamond += "✨"
            }
            for _ in 1...redAppleCount{
                diamond += "⭐️"
            }
            if i < count1 {
                greenApleCount -= 1
                redAppleCount += 2
            }else{
                greenApleCount += 1
                redAppleCount -= 2
            }
            diamond += "\n"
        }
        show[3] = diamond
        
        showLable.text = show[index]
    }
    
}

