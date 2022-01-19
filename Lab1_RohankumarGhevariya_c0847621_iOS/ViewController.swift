//
//  ViewController.swift
//  Lab1_RohankumarGhevariya_c0847621_iOS
//
//  Created by Rohan Ghevariya on 2022-01-18.
//

import UIKit

class ViewController: UIViewController {
    
    var activeplayer = 1//Cross
    var gameState=[0,0,0,0,0,0,0,0,0]
    
    let winnigcombo=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameisActive=true
    @IBOutlet weak var lblresult: UILabel!
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1]==0 && gameisActive==true)
            
        {
            gameState[sender.tag-1]=activeplayer
            if(activeplayer == 1){
                sender.setImage(UIImage(named: "cross.png"),for: UIControl.State())
                            
                activeplayer=2
            }
            else
            {
                sender.setImage(UIImage(named: "nought.png"),for: UIControl.State())
                activeplayer=1
            }
        }
        for combination in winnigcombo {
            if gameState[combination[0]] !=  0 && gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                self.gameisActive=false
                if self.gameState[combination[0]] == 1
                {
                    //cross won
                
                    lblresult.text="CROSS HAS WON!"
                }
                else
                {
                    //nought won
                    
                    lblresult.text="NOUGHT HAS WON!"
                }
                lblresult.isHidden=false
            }
        
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
    }
    @objc func swiped(gesture: UISwipeGestureRecognizer) {
        let swipeGesture = gesture as UISwipeGestureRecognizer
        switch swipeGesture.direction {
        
        case UISwipeGestureRecognizer.Direction.right:
            lblresult.isHidden=true
            for i in 1...9
            {
                let button=view.viewWithTag(i) as! UIButton
                button.setImage(nil, for:UIControl.State())
            }
                    
            print("swipe right gesture")
        default:
            break
        }
    }


}

