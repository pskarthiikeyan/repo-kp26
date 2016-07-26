//
//  ViewController.swift
//  peekandPopTest
//
//  Created by Karthiik PS on 09/06/16.
//  Copyright © 2016 Karthiik PS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIViewControllerPreviewingDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let products = ["iPhone","Apple Watch","iPad","iPod"]
    
    let imageArray = [UIImage(named:"11"),UIImage(named:"22"),UIImage(named:"33"),UIImage(named:"44") ]
    
    override func viewDidLoad()
    {
        
        
        if(traitCollection.forceTouchCapability ==  .Available)
        {
            
            registerForPreviewingWithDelegate(self, sourceView: self.view)
            
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        
        return self.products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as! customCell
        
        cell.imgView?.image = imageArray[indexPath.row]
        
        cell.titleLabel?.text = products[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        
        
        self.performSegueWithIdentifier("showImage", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier == "showImage")
        {
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! newViewController
            
            vc.imageObj = self.imageArray[indexPath.row]
            vc.title = self.products[indexPath.row]
            
            
            
            
        }
        
        
        
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?)
    {
        
    }
    
    // MARK: UIViewControllerPreviewingDelegate methods
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        
        
        guard let indexPath = collectionView?.indexPathForItemAtPoint(location) else { return nil }
        
        print(indexPath.row)
        
        guard let cell = collectionView?.cellForItemAtIndexPath(indexPath) else { return nil }
        
        guard let newVC = storyboard?.instantiateViewControllerWithIdentifier("newViewController") as? newViewController else { return nil }
        
        let photo = imageArray[indexPath.row]
        newVC.imageObj = photo
        
        newVC.preferredContentSize = CGSize(width: 0.0, height: 500)
        
        previewingContext.sourceRect = cell.frame
        
        return newVC
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        showViewController(viewControllerToCommit, sender: self)
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
