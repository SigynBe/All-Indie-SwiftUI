//
//  CloudRepository.swift
//  IndieComics
//
//  Created by Gonzalo Ivan Santos Portales on 15/06/20.
//  Copyright © 2020 Rebeca Pacheco. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

// Ta tudo salvando na default, pq eu to fazendo uns testes
class CloudRepository {
    
    private let privateDataBase = CKContainer.init(identifier: "iCloud.com.dailycomics.HQChallenge").privateCloudDatabase
    private let publicDatabase = CKContainer.init(identifier: "iCloud.com.dailycomics.HQChallenge").publicCloudDatabase
    
    private let savedComic = "savedComic"
    private let excludedComic = "excludedComic"
    
    private let recordType = "Comic"
    
    private var data : [Comic] = []
    
    func fetchFormatedData() -> [String] {
        var formatedData : [String] = []
               
        for comic in data {
            formatedData.append(comic.title)
        }
        
        return formatedData
    }
    
    func getComic(title : String,completion: @escaping (Comic?,String?) -> ()){
        let predicate = NSPredicate(format: "title == %@", title)
        
        let query = CKQuery(recordType: recordType, predicate: predicate)
      
        publicDatabase.perform(query, inZoneWith: .default) { (comics, error) in
            let comic = self.recordToComic(record: comics![0])
    
            completion(comic,error?.localizedDescription)
        }
    }
    
    func saveComic(comic: Comic, zone : String = "savedComic",completion: @escaping (Comic?,String?) -> ()){
        //let savedComicsZone = CKRecordZone (zoneName: zone)
        //let record = CKRecord(recordType: recordType, zoneID: savedComicsZone.zoneID)
        let record = CKRecord(recordType: recordType)
        record["title"] = comic.title
        record["author"] = comic.author
        record["description"] = comic.description
        record["rating"] = comic.rating
        record["isSaved"] = comic.isSaved
        record["isLiked"] = comic.isLiked
        
        if let imageData = comic.cover!.jpegData(compressionQuality: 0.1) {
            do {
                let path = NSTemporaryDirectory()
                let url = URL(fileURLWithPath: path).appendingPathComponent("\(UUID().uuidString).png")
                try imageData.write(to: url)
                record["cover"] = CKAsset(fileURL: url)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        privateDataBase.save(record) { (savedRecord, error) in
            print("entrou no save")
            completion(comic,error?.localizedDescription)
        }
    }
    
    func fetchSavedComics(completion: @escaping ([Comic]?,String?) -> ()) {
        //let customZone = CKRecordZone(zoneName: savedComic)
      
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: recordType, predicate: predicate)
        
        privateDataBase.perform(query,inZoneWith: .default /*inZoneWith: customZone.zoneID*/) { records, error in
            var comics : [Comic] = []
            for record in records! {
                comics.append(self.recordToComic(record:record))
            }
        
            self.data = comics
            completion(comics,error?.localizedDescription)
        }
    }
    
    func fetchDataa(completion: @escaping ([Comic]?,String?) -> ()) {
        let query = CKQuery(recordType: recordType, predicate: NSPredicate(value: true))
         
        publicDatabase.perform(query, inZoneWith: .default) { (records, error) in
            print("entrou no fetch")
            print(records)
            
            var comics : [Comic] = []
            for record in records! {
                comics.append(self.recordToComic(record:record))
            }
        
            completion(comics,error?.localizedDescription)
        }
    }
    
    func editComic(comic : Comic,completion: @escaping (Comic?,String?) -> ()) {
        var recordToEdit: CKRecord!
        //let customZone = CKRecordZone(zoneName: savedComic)

        let predicate = NSPredicate(format: "title = %@", comic.title)
        let query = CKQuery(recordType: recordType, predicate: predicate)

        privateDataBase.perform(query, inZoneWith: .default/*customZone.zoneID*/) { queryResults, error in
            print("entrou no edit")
            if (error != nil) {
                print(error?.localizedDescription as Any)
            } else {
                if queryResults!.count > 0 {
                    recordToEdit = queryResults![0]
            
                    recordToEdit["isSaved"] = comic.isSaved
                    recordToEdit["isLiked"] = comic.isLiked

                    self.privateDataBase.save(recordToEdit) {
                        returnedRecord, error in
                        /*if error != nil {
                            print(error?.localizedDescription as Any)
                        } else {
                            print("conseguiu dar update")
                        }*/
                        completion(comic,error?.localizedDescription)
                    }
                } else {
                    print(error?.localizedDescription as Any)
                }
            }
        }
    }
    
    func removeComic(comic: Comic,completion: @escaping (Comic?,String?) -> ()) {
        //let customZone = CKRecordZone(zoneName: savedComic)

        let predicate = NSPredicate(format: "title == %@", comic.title)
        let query = CKQuery(recordType: recordType, predicate: predicate)

        privateDataBase.perform(query, inZoneWith: .default/*customZone.zoneID*/) { records, error in
            if records!.count > 0 {
                
                let recordToDelete = records?.first!
                self.privateDataBase.delete(withRecordID: recordToDelete!.recordID) { results, error in
                    print("entrou no delete")
                    /*if error != nil {
                        print(error?.localizedDescription as Any)
                    } else {
                        print("deletado")
                    }*/
                    completion(comic,error?.localizedDescription)
                }
            }
        }
    }
    
    func createZone() {
        
    }
    
    private func recordToComic(record: CKRecord) -> Comic {
        let file = record["cover"] as! CKAsset
        
        
        let data = NSData(contentsOf: file.fileURL!)
        
        var comic = Comic(id: UUID().uuidString)
        
        comic.title = record["title"] as! String
        comic.rating = record["rating"] as! Double
        comic.author = record["author"] as! String
        comic.description = record["description"] as! String
        comic.cover = UIImage(data: data! as Data)!
        comic.isLiked = record["isLiked"] as! Int != 0
        comic.isSaved = record["isSaved"] as! Int != 0
        
        return comic
    }

   /* func saveData(comic: Comic, completion: @escaping (Comic?) -> ()) {
        let record = CKRecord(recordType: "Comic")
        record["title"] = comic.title as CKRecordValue
        record["description"] = comic.description as CKRecordValue
         CKContainer.init(identifier: "iCloud.com.dailycomics.HQChallenge").publicCloudDatabase.save(record) { (newRecord, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let newRecord = newRecord else {
                completion(nil)
                return
            }
            print(newRecord.allKeys())
            completion(comic)
        }
    }*/
}

