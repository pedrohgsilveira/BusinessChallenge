//
//  CoreDataManager.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class CoreDataManager{
    
    private init(){
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            _channels = try context.fetch(Channel.fetchRequest())
            _posts = try context.fetch(Post.fetchRequest())
            
        }catch{
            fatalError("Perda de dados")
        }
    }
    
    class func shared() -> CoreDataManager {
        return sharedContextManager
    }
    
    private static var sharedContextManager: CoreDataManager = {
        let contextManager = CoreDataManager()
        return contextManager
    }()
    
    private let context: NSManagedObjectContext
    private var _channels: [Channel]
    private var _posts: [Post]
    private var delegates: [DataModifiedDelegate] = []
    public func addDelegate(newDelegate: DataModifiedDelegate){
        delegates.append(newDelegate)
    }
    
    public func notify(){
        for delegate in delegates {
            delegate.DataModified()
        }
    }
    
    public var channels:[Channel] {
        get {
            var copy:[Channel] = []
            copy.append(contentsOf: _channels)
            return copy
        }
    }
    
    public func addChannel(id: Int32, name:String) -> CoreDataStatus {
        
        let newChannel = NSEntityDescription.insertNewObject(forEntityName: "Channel", into: context) as! Channel
        newChannel.feed(id: id, name: name)
        _channels.append(newChannel)
        do{
            try context.save()
            notify()
        }catch{
            return CoreDataStatus(successful: false, description: "Não foi possivel criar um novo canal")
        }
        let response = CoreDataStatus(successful: true)
        response.channelIdentifier = newChannel
        return response
    }
    
    public func addPost(target: Channel, id: Int32, date: String, poster: String, title: String, body: String, isActive: Bool, tags: String, isModified: Bool) -> CoreDataStatus{
        
        let newPost = NSEntityDescription.insertNewObject(forEntityName: "Post", into: context) as! Post
        newPost.feed(id: id, date: date, poster: poster, title: title, body: body, isActive: isActive, tags: tags, isModified: isModified)
        target.addToPosts(newPost)
        _posts.append(newPost)
        do{
            try context.save()
            notify()
            return CoreDataStatus(successful: true)
        } catch {
            return CoreDataStatus(successful: false, description: "Não foi possivel criar um novo post")
        }
    }
    
    public func addNewPost(target: Channel, id: Int32, date: String, poster: String, title: String, body: String, isActive: Bool, tags: String, isModified: Bool) -> CoreDataStatus{
        
        let newPost = NSEntityDescription.insertNewObject(forEntityName: "Post", into: context) as! Post
        newPost.feed(id: id, date: date, poster: poster, title: title, body: body, isActive: isActive, tags: tags, isModified: isModified)
        target.addToPosts(newPost)
        _posts.append(newPost)
        do{
            try context.save()
            notify()
            return CoreDataStatus(successful: true)
        } catch {
            return CoreDataStatus(successful: false, description: "Não foi possivel criar um novo post")
        }
    }
    
    public func editPost(target: Post, newTitle: String, newBody: String) -> CoreDataStatus {
        
        if target.modifyData(newTitle: newTitle, newBody: newBody){
            target.isActive = true
            do{
                try context.save()
                return CoreDataStatus(successful: true)
            } catch {
                return CoreDataStatus(successful: false, description: "Não foi possivel editar o post")
            }
        }
        
        return CoreDataStatus(successful: false, description: "Não ocorreram modificações")
        
    }
    
    public func changePostStatus(target: Post, status: Bool) {
        target.isActive = status
    }

}
