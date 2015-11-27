//
//  AddEditVC.swift
//  grocery-images-cd
//
//  Created by ROHIT GUPTA on 11/25/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit
import CoreData

class AddEditVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {
    
    var item : Item? = nil
    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemNote: UITextField!
    @IBOutlet weak var itemQty: UITextField!
    @IBOutlet weak var imageHolder: UIImageView!
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if item != nil {
            itemName.text = item?.name
            itemNote.text = item?.note
            itemQty.text = item?.qty
            imageHolder.image = UIImage(data: (item?.image)!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addImage(sender: AnyObject) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        pickerController.allowsEditing = true
        
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func addImageFromCamera(sender: AnyObject) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.Camera
        pickerController.allowsEditing = true
        
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.imageHolder.image = image
        }


    @IBAction func saveTapped(sender: AnyObject) {
        
        if item != nil {
            editItem()
        } else {
            createNewItem()
        }
        
        dismissVC()
        
    }
    
    
    @IBAction func cancelTapped(sender: AnyObject) {
        
        dismissVC()
    }
    
    func dismissVC() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func createNewItem() {
        let entityDescription = NSEntityDescription.entityForName("Item", inManagedObjectContext: moc)
        
        let item = Item(entity: entityDescription!, insertIntoManagedObjectContext: moc)
        
        item.name = itemName.text
        item.note = itemNote.text
        item.qty = itemQty.text
        item.image = UIImagePNGRepresentation(imageHolder.image!)
        
        do {
            try moc.save()
        } catch {
            return
        }
        
        
    }
    
    func editItem(){
        
        item?.name = itemName.text
        item?.note = itemNote.text
        item?.qty = itemQty.text
        item!.image = UIImagePNGRepresentation(imageHolder.image!)
        
        do {
            try moc.save()
        } catch {
            return
        }
        
    }

}

