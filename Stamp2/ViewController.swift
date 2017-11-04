//
//  ViewController.swift
//  Stamp2
//
//  Created by Maho Misumi on 2017/11/04.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var imageNameArray: [String] = ["hana", "hoshi", "onpu", "shitumon"]
    var imageIndex: Int = 0
    
    @IBOutlet var haikeiImagewiew: UIImageView!
    var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if imageIndex != 0 {
            
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.center = CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)

    }

    }
    
    @IBAction func selectedFirst(){
        imageIndex = 1
    }
    @IBAction func selectedSecond(){
        imageIndex = 2
    }
    @IBAction func selectedThird(){
        imageIndex = 3
    }
    @IBAction func selectedFourth(){
        imageIndex = 4
    }
    
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func selectedBackground(){
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWith Info: [String : Any]){
            
            let image = Info[UIImagePickerControllerOriginalImage] as? UIImage
            haikeiImagewiew.image = image
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        @IBAction func save() {
            let rect:CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
            UIGraphicsBeginImageContext(rect.size)
            self.view.layer.render(in: UIGraphicsGetImageFromCurrentImageContext() as! CGContext)
            UIGraphicsEndImageContext()
            
            UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
        }
    
    
    
}



