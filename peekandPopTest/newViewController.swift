//
//  newViewController.swift
//  peekandPopTest
//
//  Created by Karthiik PS on 09/06/16.
//  Copyright © 2016 Karthiik PS. All rights reserved.
//

import UIKit

class newViewController: UIViewController
{
    
    @IBOutlet weak var bigImage: UIImageView!
    
    var imageObj : UIImage!
    
    
    override func viewDidLoad()
    {
        
        self.bigImage.image = imageObj
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        
        let likeAction = UIPreviewAction(title: "Like", style: .Default) {
            (action, viewController) -> Void in
            print("You liked the photo")
        }
        
        let deleteAction = UIPreviewAction(title: "Delete", style: .Destructive) { (action, viewController) -> Void in
            print("You deleted the photo")
        }
        
        return [likeAction, deleteAction]
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
